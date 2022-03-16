# arma3HypothermiaScript
Hypothermia Script for Arma 3 when Player get inside cold water

This script is made for players have a consequence of getting into the water in Winter maps in Arma 3. 
In the SQF file itself, you will notice some numbers: 

on Line 13: 

	if ( x == 30) then {  

30 is the number in seconds that a person has to stay in water to get hypothermia. 

on Line 14 (it depends also on line 20): 

          for "_i" from 1 to 15 do { 
          	j = j + 1; 
		hintSilent parseText format [ "<t color='#0bf1ff' size='1.5'>You have hypothermia.</t>" ];
		addCamShake [2, 10, 10];
		playSound "Sound_2"; 
		if ( j == 15 ) then { x = 0 }; 
		uiSleep 20;

On line 14 the number "15" its the counter on how many times this loop will actually run. 
However it is not in seconds, because you have the effects of sound and client screen effects. 
So, on Line 20 you have "uiSleep 20;" wich refers on seconds, the gap between each loop. 
Now, it is simple math: 20 seconds is 1/3 of a minute. So if the loop runs 3 times, the effects of
hypothermia will last 1 minute, in the case of this script, will last 5 minutes. 

the rest: 

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
		uiSleep 1;"

If the player stays 20 seconds in the water, wich is not enough to get hypothermia as we set,
the script will move to the next phase, wich will turn the value of x to 0. 
Doing this, next time player enters water he will have to stay more 30 seconds to develop hypothermia. 

Finnaly, if " j==15 " then the player had hypothermia and its symptons for the defined period, it is
time for him to die.
So first, we have a hint saying he is going to die, after that he will get unconcious, and then finnaly die. 

On the part:

	for "_i" from 1 to 15 do { 
          	j = j + 1; 
		hintSilent parseText format [ "<t color='#0bf1ff' size='1.5'>You have hypothermia.</t>" ];
		addCamShake [2, 10, 10];
		playSound "Sound_2"; 
		if ( j == 15 ) then { x = 0 }; 
		uiSleep 20;

You will notice the code

	playSound "Sound_2"; 

The file needed for this sound is in this repository as "shiver.ogg".
Put this file inside your mission folder.
You must define the "Class CfgSounds" in the "description.ext" file 
on your mission folder. like this: 

	class CfgSounds
	{
	sounds[] = { Sound_2 };
	class Sound_2
	{
		name = "Sound_2";
		sound[] = { "shiver.ogg", 1, 1, 70 };	// filename, volume (0 = not hearable), pitch, distance (optional)
		titles[] = { 1, "" };
	};
	};

