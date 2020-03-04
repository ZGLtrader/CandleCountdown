//+------------------------------------------------------------------+
//|                                                  SimpleClock.mq5 |
//|                                                   Abraão Moreira |
//|                                      abraaol.moreira@outlook.com |
//+------------------------------------------------------------------+
#property copyright "Abraão Moreira"
#property link      "abraaol.moreira@outlook.com"
#property version   "1.01"
#property indicator_chart_window

input color colorClock = clrGray;
input int fontSize = 20;
enum style {
  comment = 0,    //Comment
  bigNumber = 1,  //Big number
};
input style swapStyle = bigNumber;  //Tipo de exibição

ENUM_BASE_CORNER corner = CORNER_RIGHT_UPPER;
ENUM_ANCHOR_POINT Anchor = ANCHOR_RIGHT_UPPER;
string objName = "clock";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit() {
  if(swapStyle == bigNumber){
    ObjectCreate(0, objName, OBJ_LABEL, 0, 0, 0);
    ObjectSetInteger(0, objName, OBJPROP_COLOR, colorClock);
    ObjectSetInteger(0, objName, OBJPROP_FONTSIZE, fontSize);
    ObjectSetInteger(0, objName, OBJPROP_CORNER, corner);
    ObjectSetInteger(0, objName, OBJPROP_XDISTANCE, 10);
    ObjectSetInteger(0, objName, OBJPROP_YDISTANCE, 2);
    ObjectSetInteger(0, objName, OBJPROP_ANCHOR, Anchor);
  }
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
  ArraySetAsSeries(time, true);
  string toShow;
  toShow = TimeToString(time[0]+PeriodSeconds()-TimeCurrent(), TIME_SECONDS);
  switch (swapStyle){
  case comment:
    Comment(toShow);
  case bigNumber:
    ObjectSetString(0, objName, OBJPROP_TEXT, 0, toShow);
  }
  return(rates_total);
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
