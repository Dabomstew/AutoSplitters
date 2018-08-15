state("NeptuniaRebirth3", "SteamCurrent")
{
	int SaveBlock : 0x4DD038;
	string64 Cutscene : 0x4DD038, 0xEEC;
	int EnemyBookSize : 0x4DD038, 0xB4B80;
	int InventorySize : 0x4DD038, 0xC7CC;
}
state("NeptuniaRebirth3", "GoG")
{
	int SaveBlock : 0x4D7DB8;
	string64 Cutscene : 0x4D7DB8, 0xEEC;
	int EnemyBookSize : 0x4D7DB8, 0xB4B80;
	int InventorySize : 0x4D7DB8, 0xC7CC;
}
startup
{
	print("Autosplitter loading....");
	
	settings.Add("startnewgame", true, "Start on New Game");
	settings.SetToolTip("startnewgame", "Start on New Game select - use timer offset 0.33");
	
	settings.Add("startngplus", false, "Start on New Game Plus");
	settings.SetToolTip("startngplus", "Start on New Game Plus file load - use timer offset 0.05");
	
	settings.Add("killenemies", true, "Kill Enemies");

	settings.Add("yellowheart", true, "Yellow Heart 3 (Normal End Final Boss)", "killenemies");
	settings.SetToolTip("yellowheart", "End Split, times on last boss hit.");
	settings.Add("eggplant", true, "Eggplant Arfoire (True End Requirement)", "killenemies");
	settings.Add("fakes", true, "Three Fake CPUs (Good/True Chapter 9)", "killenemies");
	settings.SetToolTip("fakes", "Kill the three Fake CPUs. No cutscene after them.");
	settings.Add("goodrei", true, "Rei Ryghts (Good End Final Boss)", "killenemies");
	settings.SetToolTip("goodrei", "End Split, times on last boss hit.");
	settings.Add("truerei", true, "Rei Ryghts phase 2 (True End Final Boss)", "killenemies");
	settings.SetToolTip("truerei", "End Split, times on last boss hit.");
	
	settings.Add("items", true, "Split when acquiring certain items");

	settings.Add("c5goodend", false, "Acquire the 3 Good End items in Chapter 5", "items");
	settings.Add("c6goodend", false, "Acquire all 5 Good End items", "items");
	
	settings.Add("slowrefreshonitems", false, "Slow Refresh Rate w/ Items");
	settings.SetToolTip("slowrefreshonitems", "Slow down the refresh rate while inventory-related splits are being tested to reduce CPU usage.");
	
	
	// Cutscenes
	settings.Add("cutscenes", true, "Split with Cutscene");

	settings.Add("endchs", true, "End Chapter Splits", "cutscenes");
	settings.Add("Chapter 1 - It's Raining Neps", true, "End Prologue", "endchs");
	settings.Add("Chapter 2 - Plutia's Narration", true, "End Chapter 1", "endchs");
	settings.Add("Chapter 3 - Neptune's Narration", true, "End Chapter 2", "endchs");
	settings.Add("Chapter 4 - Adults Only", true, "End Chapter 3", "endchs");
	settings.Add("Chapter 5 - We're in a Bind", true, "End Chapter 4", "endchs");
	settings.Add("Chapter 6 - Let's Reflect", true, "End Chapter 5", "endchs");
	settings.Add("Chapter 7 - 10 Years Later...", true, "End Chapter 6", "endchs");
	settings.Add("Chapter 8 - P-ko Rescue Mission...Go!", true, "End Chapter 7", "endchs");
	settings.Add("Chapter 9 - The Seven Sages Disband", true, "End Chapter 8", "endchs");
	settings.Add("Chapter 10 - Destroy The World", true, "End Chapter 9", "endchs");

	// Prologue
	settings.Add("prologue", true, "Prologue", "cutscenes");
	settings.Add("Prologue - State of Gamindustri", false, "Defeat/Lose to the 3 CPUs", "prologue");
	settings.Add("Prologue - Back to Normal Bormal", true, "Defeat Bahamut", "prologue");
	settings.Add("Prologue - Let's Visit Our Friends!", false, "Complete Dogoos Quest", "prologue");
	
	
	// Chapter 1
	settings.Add("ch1", true, "Chapter 1", "cutscenes");
	settings.Add("Chapter 1 - To Become a CPU", false, "Complete Jellies Quest", "ch1");
	settings.Add("Chapter 1 - Bad Plutia!", true, "Defeat Arfoire (real battle)", "ch1");

	// Chapter 2
	settings.Add("ch2", true, "Chapter 2", "cutscenes");
	settings.Add("Chapter 2 - Carry Me, Neppy...", true, "Defeat Lizard Guard", "ch2");
	settings.Add("Chapter 2 - I'll Crush Everyone!", false, "Complete Demon Treasure quest", "ch2");
	settings.Add("Chapter 2 - Let's Go Home", true, "Defeat Copypaste", "ch2");

	// Chapter 3
	settings.Add("ch3", true, "Chapter 3", "cutscenes");
	settings.Add("Chapter 3 - Captured by Mr. Badd", true, "Defeat Blanc", "ch3");
	settings.Add("Chapter 3 - That Wraps It Up Nicely", true, "Defeat Mr. Badd", "ch3");

	// Chapter 4
	settings.Add("ch4", true, "Chapter 4", "cutscenes");
	settings.Add("Chapter 4 - Leanbox Was a False Alarm", true, "Complete Tank quest", "ch4");
	settings.Add("Chapter 4 - The Seven Sages Go Wild?!", true, "Defeat Vert and Nepgear", "ch4");
	settings.Add("Chapter 4 - Complaining to a Hacker", true, "Defeat Copypaste and Arfoire", "ch4");

	// Chapter 5
	settings.Add("ch5", true, "Chapter 5", "cutscenes");
	settings.Add("Chapter 5 - Stalling", true, "Defeat Anonydeath", "ch5");
	settings.Add("Chapter 5 - COPYPASTE!!!!!", true, "Defeat Copypaste", "ch5");
	settings.Add("Chapter 5 - Who's Responsible?", false, "Defeat the 3 Creatures", "ch5");
	settings.Add("Chapter 5 - Mr. Badd Flees", true, "Defeat Mr. Badd", "ch5");
	settings.Add("Chapter 5 - Iffy's Trauma", true, "Defeat Arfoire", "ch5");

	// Chapter 6
	settings.Add("ch6", true, "Chapter 6", "cutscenes");
	settings.Add("Chapter 6 - Anonydeath is Close", true, "Complete Greeting (Kupokitty) quest", "ch6");
	settings.Add("Chapter 6 - Anonydeath Escapes", true, "Complete Detestable (Ghosts) quest", "ch6");
	settings.Add("Chapter 6 - The Creatures' True Forms", true, "Defeat Mr. Badd", "ch6");
	settings.Add("Chapter 6 - Yellow Heart Does Her Best", true, "Defeat Yellow Heart", "ch6");

	// Chapter 7
	settings.Add("ch7", true, "Chapter 7", "cutscenes");
	settings.Add("Chapter 7 - Shall We Call It a Day?", true, "Defeat the Renegades", "ch7");
	settings.Add("Chapter 7 - IF Captured", true, "Complete Flame Fenrir quest", "ch7");
	settings.Add("Chapter 7 - Yellow Heart's Power", true, "Defeat Warechu", "ch7");
	settings.Add("Chapter 7 - Breaking the Machine", true, "Defeat Anonydeath", "ch7");
	settings.Add("Chapter 7 - Her True Form...Is Peashy?!", true, "Defeat Yellow Heart", "ch7");

	// Chapter 8
	settings.Add("ch8", true, "Chapter 8", "cutscenes");
	settings.Add("Chapter 8 - Mr. Badd's Info", true, "Defeat Mr. Badd (Good/True)", "ch8");
	settings.Add("Chapter 8 - The Five-item Set Thingy!", true, "Defeat Yellow Heart (Good/True)", "ch8");

	// Chapter 9
	settings.Add("ch9", true, "Chapter 9", "cutscenes");
	settings.Add("Chapter 9 - Rei Changes!", false, "Complete Kingly (Crowns) quest", "ch9");
	settings.Add("Chapter 9 - Who Did This?!", true, "Defeat Fake Purple Heart", "ch9");
	settings.Add("Chapter 9 - Anonydeath's Loyalty", true, "Defeat the Fake Noires", "ch9");
	settings.Add("Chapter 9 - Gettin' All Crazy Here", true, "Defeat UD Rei", "ch9");

	// Chapter 10
	settings.Add("ch10", true, "Chapter 10", "cutscenes");
	settings.Add("Chapter 10 - Fake Plutia Defeated", true, "Defeat Fake Iris Heart (True)", "ch10");
	settings.Add("Chapter 10 - The Final Battle", true, "Defeat HD Rei Phase 1 (True)", "ch10");
	
	vars.gameConnected = false;
	vars.timerJustStarted = false;
	vars.timerStartedSinceBoot = false;
	vars.timer_OnStart = (EventHandler)((s, e) =>
	{
		vars.timerJustStarted = true;
	});
	timer.OnStart += vars.timer_OnStart;

	// offsets that can't be in state
	vars.enemyBookData = 0xB4B84;
	vars.inventoryData = 0xC7D0;
	
	print("Startup complete! CREDITS: Dabomstew, Marenthyu");
	
}
shutdown
{
	try {
	timer.OnStart -= vars.timer_OnStart;
	} catch {}
	vars.gameConnected = false;
	vars.timerStartedSinceBoot = false;
}
init
{

	print("Game found!");
	print("module size: " + modules.First().ModuleMemorySize);
	vars.timerStartedSinceBoot = false;
	
	if (modules.First().ModuleMemorySize == 11243520) {
		print("Found and confirmed GoG Version");
		version = "GoG";
		vars.gameConnected = true;
	}
	else if (modules.First().ModuleMemorySize == 11264000) {
		print("Found and confirmed Steam Version 05.22.2018 Patch");
		version = "SteamCurrent";
		vars.gameConnected = true;
	}
	else {
		print("Unrecognized game version. Disabling functionality.");
		vars.gameConnected = false;
	}
}
exit
{
	vars.gameConnected = false;
	vars.timerStartedSinceBoot = false;
}
update
{
	if(!vars.gameConnected)
	{
		return false;
	}
	
	if(vars.timerJustStarted) {
		vars.slowRefresh = false;
		refreshRate = 60;
		vars.itemSplitsHit = 0;
		vars.itemSplitsActive = 0;
		vars.enemySplitsHit = 0;
		vars.enemySplitsActive = 0;
		vars.cutsceneSplitsHit = new HashSet<string>();
		
		vars.c5geSplit = false;
		vars.c6geSplit = false;

		vars.yhSplit = false;
		vars.eggplantSplit = false;
		vars.fakesSplit = false;
		vars.goodReiSplit = false;
		vars.trueReiSplit = false;

		// count item splits
		vars.itemSplitsActive += settings["c5goodend"] ? 1 : 0;
		vars.itemSplitsActive += settings["c6goodend"] ? 1 : 0;
		
		// count enemy splits
		vars.enemySplitsActive += settings["yellowheart"] ? 1 : 0;
		vars.enemySplitsActive += settings["eggplant"] ? 1 : 0;
		vars.enemySplitsActive += settings["fakes"] ? 1 : 0;
		vars.enemySplitsActive += settings["goodrei"] ? 1 : 0;
		vars.enemySplitsActive += settings["truerei"] ? 1 : 0;
		
		// read initial kill values
		vars.initialKills = new short[10000]; // highest enemy id is ??, just assuming 9999 for now
		byte[] enemyBook = memory.ReadBytes((System.IntPtr) (current.SaveBlock + vars.enemyBookData), (int) (current.EnemyBookSize*8));
		for(int i = 0; i < current.EnemyBookSize; i++) {
			vars.initialKills[BitConverter.ToInt16(enemyBook, i*8)] = BitConverter.ToInt16(enemyBook, i*8 + 4);
		}
		vars.timerJustStarted = false;
		vars.timerStartedSinceBoot = true;
	}
}
split
{
	if(!vars.gameConnected || vars.timerJustStarted || !vars.timerStartedSinceBoot) {
		// don't try anything if our vars state might be dirty
		return false;
	}

	// split for cutscene
	if (settings["cutscenes"])
	{
		try {
			if(!current.Cutscene.Equals(old.Cutscene)) {
				print("Cutscene changed to: "+current.Cutscene);
			}
		} catch {}
		try {
			if (!current.Cutscene.Equals(old.Cutscene) && settings[current.Cutscene] && !vars.cutsceneSplitsHit.Contains(current.Cutscene.ToString()))
			{
				print("Split for " + current.Cutscene + " Cutscene.");
				vars.cutsceneSplitsHit.Add(current.Cutscene.ToString());
				return true;
			}
		} catch {}
	}
	
	// split for enemy kills
	if(vars.enemySplitsHit < vars.enemySplitsActive) {
		byte[] enemyBook = memory.ReadBytes((System.IntPtr) (current.SaveBlock + vars.enemyBookData), (int) (current.EnemyBookSize*8));
		int fakesKilled = 0;
		for(int i = 0; i < current.EnemyBookSize; i++) {
			short enemyID = BitConverter.ToInt16(enemyBook, i*8);
			int kills = BitConverter.ToInt16(enemyBook, i*8 + 4) - vars.initialKills[enemyID];
			if(settings["yellowheart"] && !vars.yhSplit && enemyID == 1033 && kills > 0) {
				vars.yhSplit = true;
				vars.enemySplitsHit++;
				print("Split for Normal End Yellow Heart 3");
				return true;
			}
			if(settings["eggplant"] && !vars.eggplantSplit && enemyID == 1047 && kills > 0) {
				vars.eggplantSplit = true;
				vars.enemySplitsHit++;
				print("Split for Eggplant Arfoire");
				return true;
			}
			if(settings["goodrei"] && !vars.goodReiSplit && enemyID == 1043 && kills > 0) {
				vars.goodReiSplit = true;
				vars.enemySplitsHit++;
				print("Split for Good End Final Rei");
				return true;
			}
			if(settings["truerei"] && !vars.trueReiSplit && enemyID == 1042 && kills > 0) {
				vars.trueReiSplit = true;
				vars.enemySplitsHit++;
				print("Split for True End Final Rei");
				return true;
			}
			if(enemyID >= 1035 && enemyID <= 1037 && kills > 0) {
				fakesKilled++;
			}
		}
		if(settings["fakes"] && !vars.fakesSplit && fakesKilled == 3) {
			vars.fakesSplit = true;
			vars.enemySplitsHit++;
			print("Split for the 3 Fake CPUs");
			return true;
		}
	}
	
	// Acquire Items

	if(vars.itemSplitsHit < vars.itemSplitsActive) {
		if(settings["slowrefreshonitems"] && !vars.slowRefresh) {
			refreshRate = 20;
			vars.slowRefresh = true;
		}
		int c5geItems = 0;
		int c6geItems = 0;
		byte[] inventory = memory.ReadBytes((System.IntPtr) (current.SaveBlock + vars.inventoryData), (int) (current.InventorySize*4));
		for(int i = 0; i < current.InventorySize; i++) {
			short itemID = BitConverter.ToInt16(inventory, i*4);
			byte amount = inventory[i*4 + 2];
			if(itemID >= 203 && itemID <= 210 && amount > 0) {
				c6geItems++;
				if(itemID < 206) {
					c5geItems++;
				}
			}
		}

		if(settings["c5goodend"] && !vars.c5geSplit && c5geItems == 3) {
			vars.c5geSplit = true;
			vars.itemSplitsHit++;
			print("Split for Chapter 5 Good End items");
			return true;
		}

		if(settings["c6goodend"] && !vars.c6geSplit && c6geItems == 5) {
			vars.c6geSplit = true;
			vars.itemSplitsHit++;
			print("Split for All Good End items");
			return true;
		}
		
	}
	else if(vars.slowRefresh) {
		vars.slowRefresh = false;
		refreshRate = 60;
	}
}
start
{
	// New Game
	if (settings["startnewgame"] && (current.Cutscene != null && current.Cutscene.Equals("New Game")))
	{
		return true;
	}
	if (settings["startngplus"] && current.Cutscene != null && current.Cutscene.Equals("After Choosing NG+"))
	{
		return true;
	}
}
