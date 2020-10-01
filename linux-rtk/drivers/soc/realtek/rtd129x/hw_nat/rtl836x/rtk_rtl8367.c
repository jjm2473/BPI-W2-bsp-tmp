#include <linux/kernel.h>
#include <linux/ioport.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/slab.h>
#include <linux/init.h>
#include <linux/jiffies.h>
#include <linux/interrupt.h>
#include <linux/wait.h>
#include <asm/io.h>
#include <linux/proc_fs.h>

#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/of_irq.h>
#include <linux/of_platform.h>
#include <linux/of_gpio.h>

#include <linux/platform_device.h>
#include <linux/clk.h>
#include <linux/reset.h>

#include "rtk_rtl8367.h"
#include "rtk_switch.h"
#include "l2.h"
#include "interrupt.h"
#include "rtk_error.h"
#include "vlan.h"
#include "rtl8367c_asicdrv_port.h"
#include "port.h"
#include "rtk_types.h"
#include "smi.h"
#include "led.h"

extern void rtl836x_proc_init(void);
#ifdef FORCE_PROBE_RTL8370B
static void rtl836x_init_led(void);
#endif
static unsigned int rtl836x_irq;
static void *irq_dev_id = (void *)&rtl836x_irq;
static struct work_struct rtl836x_work;

static void init_mdio_gpio_mode(void)
{
    gpio_request(MDC_GPIO, "rtl836x_mdc");
    //gpio_export(MDC_GPIO, true);

    gpio_request(MDIO_GPIO, "rtl836x_mdio");
    //gpio_export(MDIO_GPIO, true);

    gpio_direction_output(MDC_GPIO, 0);
    gpio_direction_output(MDIO_GPIO, 1);

    return;
}

static void rtl836x_work_func(struct work_struct *work)
{
    unsigned int mask = 0x0;
    rtk_int_status_t statusMask;
    rtk_int_status_t clearMask;

    memset(&statusMask, 0x0, sizeof(rtk_int_status_t));
    memset(&clearMask, 0x0, sizeof(rtk_int_status_t));

    rtk_int_status_get(&statusMask);

    if( statusMask.value[0] & (0x1 << INT_TYPE_LINK_STATUS) ) {
        mask = mask | (0x1 << INT_TYPE_LINK_STATUS);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_METER_EXCEED) ) {
        mask = mask | (0x1 << INT_TYPE_METER_EXCEED);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_LEARN_LIMIT) ) {
        mask = mask | (0x1 << INT_TYPE_LEARN_LIMIT);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_LINK_SPEED) ) {
        mask = mask | (0x1 << INT_TYPE_LINK_SPEED);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_CONGEST) ) {
        mask = mask | (0x1 << INT_TYPE_CONGEST);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_GREEN_FEATURE) ) {
        mask = mask | (0x1 << INT_TYPE_GREEN_FEATURE);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_LOOP_DETECT) ) {
        mask = mask | (0x1 << INT_TYPE_LOOP_DETECT);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_8051) ) {
        mask = mask | (0x1 << INT_TYPE_8051);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_CABLE_DIAG) ) {
        mask = mask | (0x1 << INT_TYPE_CABLE_DIAG);
    }

    if( statusMask.value[0] & (0x1 << INT_TYPE_ACL) ) {
        mask = mask | (0x1 << INT_TYPE_ACL);
    }

    clearMask.value[0] = mask;
    rtk_int_status_set(&clearMask);
}

static irqreturn_t rtl836x_gpio_isr(int irq, void *data)
{
    schedule_work(&rtl836x_work);

    return IRQ_HANDLED;
}


static void init_gpio_irq(void)
{
    if (gpio_request(IRQ_GPIO, "rtl836x_irq")) {
        printk(KERN_ERR "Request gpio(%d) fail", IRQ_GPIO);
    } else {
        gpio_export(IRQ_GPIO, true);
        gpio_direction_input(IRQ_GPIO);
    }

    rtl836x_irq = gpio_to_irq(IRQ_GPIO);

    if (!rtl836x_irq) {
        printk(KERN_ERR "Fail to get rtl836x_irq\n");
    } else {
        printk(KERN_INFO "irq_num(%u)\n", rtl836x_irq);
    }

    irq_set_irq_type(rtl836x_irq, IRQ_TYPE_LEVEL_HIGH);
    if(request_irq(rtl836x_irq, rtl836x_gpio_isr, IRQF_SHARED, "rtl836x_irq", irq_dev_id)) {
        printk(KERN_ERR "register IRQ %d fail ", rtl836x_irq);
    }
}

static void init_interrupt(void)
{
    if( rtk_int_polarity_set(INT_POLAR_HIGH) != RT_ERR_OK )
        printk(KERN_ERR "Set polarity fail.\n");

    if( rtk_int_control_set(INT_TYPE_LINK_STATUS, ENABLED) != RT_ERR_OK )
        printk(KERN_ERR "Set interrupt control - INT_TYPE_LINK_STATUS fail.\n");

    INIT_WORK(&rtl836x_work, rtl836x_work_func);
}

#define RETRY_COUNT 5
static void rtl_rgmii_init(void)
{
    int retry_count;

    /* Set extension RGMIIPORT to RGMII with Force mode, 1000M, Full-duplex, enable TX&RX pause*/
    rtk_mode_ext_t mode;
    rtk_port_mac_ability_t mac_cfg;
    rtk_api_ret_t ret;

    mac_cfg.forcemode = MAC_FORCE;
    mac_cfg.speed = PORT_SPEED_1000M;
    mac_cfg.duplex = FULL_DUPLEX;
    mac_cfg.link = PORT_LINKUP;
    mac_cfg.nway = DISABLED;
    mac_cfg.txpause = ENABLED;
    mac_cfg.rxpause = ENABLED;

//    if ((ret = rtk_port_macForceLinkExt_set(EXT_PORT0, mode, &mac_cfg)) != RT_ERR_OK)
//        pr_err("rtl836x RGMII init fail, ret = %d\n", ret);

    
//    if ((ret = rtk_port_rgmiiDelayExt_set(EXT_PORT0, 0, 0)) != RT_ERR_OK)
//        pr_err("rtl836x RGMII init delay fail, ret = %d\n", ret);

    if(RGMIIPORT == EXT_PORT0)
    {
        retry_count = RETRY_COUNT;
        mode = MODE_EXT_RGMII;
        while(retry_count){
            if((ret = rtk_port_macForceLinkExt_set(EXT_PORT0, mode,&mac_cfg)) == RT_ERR_OK){
                pr_err("Enable EXT_PORT0 successfully, ret = %d\n", ret);
                break;
            }

            pr_err("Enable EXT_PORT0 fail, ret = %d\n", ret);
            retry_count--;
            CLK_DURATION(DELAY);
        }

        retry_count = RETRY_COUNT;
        mode = MODE_EXT_DISABLE;
        while(retry_count){
            if((ret = rtk_port_macForceLinkExt_set(EXT_PORT1, mode,&mac_cfg)) == RT_ERR_OK){
                pr_err("Disable EXT_PORT1 successfully, ret = %d\n", ret);
                break;
            }

            pr_err("Enable EXT_PORT1 fail, ret = %d\n", ret);
            retry_count--;
            CLK_DURATION(DELAY);
        }
    }
    else if(RGMIIPORT == EXT_PORT1) 
    {
        retry_count = RETRY_COUNT;
        mode = MODE_EXT_RGMII;
        while(retry_count){
            if((ret = rtk_port_macForceLinkExt_set(EXT_PORT1, mode,&mac_cfg)) == RT_ERR_OK){
                pr_err("Enable EXT_PORT1 successfully, ret = %d\n", ret);
                break;
            }

            pr_err("Enable EXT_PORT1 fail, ret = %d\n", ret);
            retry_count--;
            CLK_DURATION(DELAY);
        }

        retry_count = RETRY_COUNT;
        mode = MODE_EXT_DISABLE;
        while(retry_count){
            if((ret = rtk_port_macForceLinkExt_set(EXT_PORT0, mode,&mac_cfg)) == RT_ERR_OK){
                pr_err("Disable EXT_PORT0 successfully, ret = %d\n", ret);
                break;
            }

            pr_err("Enable EXT_PORT0 fail, ret = %d\n", ret);
            retry_count--;
            CLK_DURATION(DELAY);
        }
    }
    
    CLK_DURATION(DELAY);
    retry_count = RETRY_COUNT;
    while(retry_count){
        if ((ret = rtk_port_rgmiiDelayExt_set(RGMIIPORT, 0, 0)) == RT_ERR_OK){
            break;
        }

        pr_err("rtl836x RGMII init delay fail, ret = %d\n", ret);
        retry_count--;
        CLK_DURATION(DELAY);
    }

}

#ifdef FORCE_PROBE_RTL8370B
static void rtl836x_init_led()
{
	rtk_portmask_t pmask;
	rtk_led_ability_t ability;

	RTK_PORTMASK_CLEAR(pmask);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT0);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT1);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT2);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT3);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT4);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT5);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT6);
	RTK_PORTMASK_PORT_SET(pmask, UTP_PORT7);

	rtk_switch_init();
	rtk_led_OutputEnable_set(1);
	rtk_led_operation_set(LED_OP_SERIAL);
	rtk_led_serialModePortmask_set(SERIAL_LED_0_2, &pmask);

	rtk_led_groupConfig_set(LED_GROUP_0, LED_CONFIG_ACT);

	ability.link_10m = 1;
	ability.link_100m = 1;
	ability.link_500m = 0;
	ability.link_1000m = 0;
	ability.act_rx = 0;
	ability.act_tx = 0;
	rtk_led_groupAbility_set(LED_GROUP_2, &ability);
	smi_write(0x1b3a, 0x3fff);
}
#endif

int rtl836x_init(void)
{
    int retry_count = 10;

    printk(KERN_INFO "rtl836x_init .....\n");

    init_mdio_gpio_mode();

    init_gpio_irq();

    rtl836x_proc_init();

    while(retry_count) {
        if( rtk_switch_init() == RT_ERR_OK ){
            break;
        }

        printk(KERN_ERR "rtk_switch_init fail.\n");
        retry_count--;
        CLK_DURATION(DELAY);
    }

    init_interrupt();
    //rtk_l2_init();
    rtl_rgmii_init();
    schedule_work(&rtl836x_work);
#ifdef FORCE_PROBE_RTL8370B
	rtl836x_init_led();
#endif
    return 0;
}
EXPORT_SYMBOL(rtl836x_init);


