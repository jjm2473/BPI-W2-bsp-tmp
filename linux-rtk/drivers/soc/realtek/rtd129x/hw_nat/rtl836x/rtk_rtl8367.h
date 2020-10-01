#define RGMIIPORT EXT_PORT0 /*gib4=EXT_PORT0, gib8=EXT_PORT1*/
#define LANPORTNUM  5       /*gib4=5,  gib8=8*/
#define MDC_GPIO    41      /*gib4=41, gib8=85*/
#define MDIO_GPIO   40      /*gib4=40, gib8=86*/
#define IRQ_GPIO    4

int rtl836x_init(void);
