//+------------------------------------------------------------------+
//|                                                       RSI EA.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
input int RSI_period = 14;
input double RSI_Overbought = 70;
input double RSI_Oversold = 30;


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   if(OrdersTotal()==0)
     {
      double rsi = iRSI(NULL,0,RSI_period,PRICE_CLOSE,0);
      if(rsi<RSI_Overbought)
        {
         int ticketsell = OrderSend(Symbol(),OP_SELL,0.03,Bid,0,Bid+500*Point(),Bid-500*Point(),"Sell",1234,0,clrNONE);


        }
      else
         if(rsi > RSI_Oversold)
           {

            int ticketbuy = OrderSend(Symbol(),OP_BUY,0.01,Ask,0,Ask+500*Point(),Ask-500*Point(),"bey",1234,0,clrAliceBlue);

           }
     }

  }
//+------------------------------------------------------------------+
