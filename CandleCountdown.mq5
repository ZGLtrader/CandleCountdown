//+------------------------------------------------------------------+
//|                                                  SimpleClock.mq5 |
//|                                                   Abraão Moreira |
//|                                      abraaol.moreira@outlook.com |
//+------------------------------------------------------------------+
#property copyright "Abraão Moreira"
#property link      "abraaol.moreira@outlook.com"
#property version   "1.02"
#property indicator_chart_window

input color colorClock = clrGray; //Cor do relógio
input string font = "Arial";  //Fonte
input int fontSize = 10;  //Tamanho da fonte
enum style {
  comment = 0,      //Comment
  bigNumber = 1,    //Big number
  onPrice = 2,      //On Price    
};
input style swapStyle = comment;  //Tipo de exibição

ENUM_BASE_CORNER corner = CORNER_RIGHT_UPPER;
ENUM_ANCHOR_POINT Anchor = ANCHOR_RIGHT_UPPER;
string objName = "clock";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//| Create a label object                                            |
//+------------------------------------------------------------------+
int OnInit() {
  
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
  ArraySetAsSeries(close, true);
  string toShow;
  toShow = "     < " + TimeToString(time[0]+PeriodSeconds()-TimeCurrent(), TIME_SECONDS);
  if(swapStyle == comment){
    Comment(toShow);
  }else{
    if(swapStyle == bigNumber){
      ObjectCreate(0, objName, OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, objName, OBJPROP_COLOR, colorClock);
      ObjectSetInteger(0, objName, OBJPROP_FONTSIZE, fontSize);
      ObjectSetString(0, objName, OBJPROP_FONT, font);
      ObjectSetInteger(0, objName, OBJPROP_CORNER, corner);
      ObjectSetInteger(0, objName, OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0, objName, OBJPROP_YDISTANCE, 2);
      ObjectSetInteger(0, objName, OBJPROP_ANCHOR, Anchor);
      ObjectSetString(0, objName, OBJPROP_TEXT, 0, toShow);
    }else{
      if(swapStyle == onPrice){
        if(ObjectFind(0, objName) < 0){
          ObjectCreate(0, objName, OBJ_TEXT, 0, time[0], close[0]);
          ObjectSetInteger(0, objName, OBJPROP_COLOR, colorClock);
          ObjectSetInteger(0, objName, OBJPROP_FONTSIZE, fontSize);
          ObjectSetString(0, objName, OBJPROP_FONT, font);
          ObjectSetString(0, objName, OBJPROP_TEXT, 0, toShow); 
        }else{
          ObjectSetString(0, objName, OBJPROP_TEXT, 0, toShow); 
          ObjectMove(0, objName, 0, time[0], close[0]);
        }  
      }
    }
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
