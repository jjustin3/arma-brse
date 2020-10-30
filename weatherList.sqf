disableSerialization;
_display = findDisplay 2025;

_listBoxWeather = _display displayCtrl 1500;
_listBoxWeather lbAdd "Sunny";
_listBoxWeather lbAdd "Fog";
_listBoxWeather lbAdd "Rain";
_listBoxWeather lbAdd "Overcast";
_listBoxWeather lbAdd "Random";
_listBoxWeather lbAdd "Variable";
_listBoxWeather lbSetCurSel 0;

_listBoxAI = _display displayCtrl 1501;
_listBoxAI lbAdd "180 players";
_listBoxAI lbAdd "120 players";
_listBoxAI lbAdd "100 players";
_listBoxAI lbAdd "60 players";
_listBoxAI lbAdd "45 players";
_listBoxAI lbAdd "30 players";
_listBoxAI lbSetCurSel 3;

_listBoxTime = _display displayCtrl 1502;
_listBoxTime lbAdd "Evening";
_listBoxTime lbAdd "Morning";
_listBoxTime lbAdd "Day";
_listBoxTime lbAdd "Night";
_listBoxTime lbAdd "Random";
_listBoxTime lbAdd "Variable";
_listBoxTime lbSetCurSel 0;

_listBoxTime = _display displayCtrl 1503;
_listBoxTime lbAdd "Super AI";
_listBoxTime lbAdd "Expert";
_listBoxTime lbAdd "Veteran";
_listBoxTime lbAdd "Recruit";
_listBoxTime lbAdd "Mixed";
_listBoxTime lbSetCurSel 1;

_listExtTime = _display displayCtrl 1515;
_listExtTime lbAdd "Average (30 min)";
_listExtTime lbAdd "Extended (40 min)";
_listExtTime lbAdd "Long (60 min)";
_listExtTime lbAdd "Overlong (90 min)";
_listExtTime lbSetCurSel 0;


_checkBoxFatigue = _display displayCtrl 1504;
_checkBoxFatigue cbSetChecked true;

_checkBoxHUD = _display displayCtrl 1508;
_checkBoxHUD cbSetChecked true;

_checkAiZonePlacement = _display displayCtrl 1523;
_checkAiZonePlacement cbSetChecked true;

"LoadingScreen" cutFadeOut 0.3;