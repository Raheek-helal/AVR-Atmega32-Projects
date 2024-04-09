#define BIT_SET(REG,POS)	REG |= (1 << POS) 
#define BIT_CLR(REG,POS) 	REG &= ~(1 << POS)
#define BIT_TOG(REG,POS) 	REG ^= (1 << POS)

#define LED_DDR  DDRB
#define LED_PORT PORTB

/*****************************    NEW DATATYPES     *************************/
typedef enum LED_num_e
{
	LED_ONE,
	LED_TWO,
	LED_THREE,
	LED_FOUR,
	LED_MAX
}LED_num;

typedef enum LED_state_e
{
	LED_Off,
	LED_On
}LED_state;


/***************************** FUNCTIONS PROTOTYPES ************************/
void LED_init(void);
void LED_ON(LED_num led);
void LED_OFF(LED_num led);
void LED_FLIP(LED_num led);
LED_state LED_CHECK(LED_num led);
/*****************************     PROTOTYPES END    ************************/
