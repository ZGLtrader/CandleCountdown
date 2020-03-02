//+------------------------------------------------------------------+
//|                                                  SimpleClock.mq5 |
//|                                                   Abraão Moreira |
//|                                      abraaol.moreira@outlook.com |
//+------------------------------------------------------------------+
#property copyright "Abraão Moreira"
#property link      "abraaol.moreira@outlook.com"
#property version   "1.00"
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit() {
  EventSetTimer(PeriodSeconds());
//--- indicator buffers mapping

//---
  return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[]) {
//---
  ArraySetAsSeries(time, true);
  string toShow;
  toShow = TimeToString(time[0]+PeriodSeconds()-TimeCurrent(), TIME_SECONDS);
  Comment(toShow);
//--- return value of prev_calculated for next call
  return(rates_total);
}
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer() {
  //Countdown();
  /*TimeCurrent(timeCurrent);
  int periodSec = PeriodSeconds();
  if(periodSec < 3600) {
    if(timeCurrent.min % (periodSec/3600) == 0) {
      Countdown();
    }else{
      
    }
    
  }
*/
//Comment(StructToTime(timeCurrent));
}
void Countdown(){
  
  for(int i = PeriodSeconds(); i >= 0; i--){
    Print(i);
  }
}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam) {
//---

}
//+------------------------------------------------------------------+
