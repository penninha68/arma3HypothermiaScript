//HYPOTHERMIA-v1.01//

Private _Target = Player; 
x = 0; 
j = 0; 
waitUntil { alive _Target };
while { alive _Target } do {
		Private _isWater = surfaceIsWater position _Target;
		if ( _isWater == true) then {
			if (x > 0 and j < 1) then {hintSilent parseText format [ "<t color='#0bf1ff' size='1.5'>Water is too cold! Leave it or you will get hypothermia.</t>" ];}; 
			x = x + 1;
			if ( x == 30) then {			
				for "_i" from 1 to 15 do {  
					j = j + 1; 
					hintSilent parseText format [ "<t color='#0bf1ff' size='1.5'>You have hypothermia.</t>" ];
					addCamShake [2, 10, 10];
					playSound "Sound_2"; 
					if ( j == 15 ) then { x = 0 }; 
					uiSleep 20; 		
				}; 
			};
		};
		if ( _isWater == false) then {
			x = 0; 
		};
			
		if ( j == 15 ) then { 
			hintSilent parseText format [ "<t color='#0bf1ff' size='1.5'>You will die of hypothermia.</t>" ];
			uiSleep 10;
			_Target setUnconscious true;  
			uiSleep 20; 
			_Target setDammage 100; 
		}; 
		uiSleep 1; 
}; 

