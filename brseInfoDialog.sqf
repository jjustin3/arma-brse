disableSerialization;
_display = findDisplay 2055;

_textPlayersAlive = _display displayCtrl 1000;
_textPlayersAlive ctrlSetText format["       %1 Alive", MyPlayersCount];

_textHP = _display displayCtrl 1001;
playerDmg = damage player * 100;
playerDmg = floor (100 - playerDmg);
_textHP ctrlSetText format["       HP: %1", playerDmg];

// TODO* add exp time
_textTime = _display displayCtrl 1002;
_minutes = floor (ZoneExpirationTime / 60);
_seconds = ZoneExpirationTime - (_minutes * 60);
_textTime ctrlSetText format["       %1:%2 Remaining", _minutes, _seconds];
