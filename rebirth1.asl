state("NeptuniaRebirth1", "SteamCurrent")
{
	int SaveBlock : 0x458D98;
	int Credits : 0x458D98, 0xF92C;
	string64 Cutscene : 0x458D98, 0xEEC;
	byte PlaneptuneShares : 0x458D98, 0xF1C;
	byte LeanboxShares : 0x458D98, 0xF20;
	byte LastationShares : 0x458D98, 0xF24;
	byte LoweeShares : 0x458D98, 0xF28;
	byte OthersShares : 0x458D98, 0xF2C;
	int EnemyBookSize : 0x458D98, 0xB4DFC;
	int InventorySize : 0x458D98, 0xCA46;
}
state("NeptuniaRebirth1", "SteamColosseum")
{
	int SaveBlock : 0x39FA84;
	int Credits : 0x39FA84, 0xF92C;
	string64 Cutscene : 0x39FA84, 0xEEC;
	byte PlaneptuneShares : 0x39FA84, 0xF1C;
	byte LeanboxShares : 0x39FA84, 0xF20;
	byte LastationShares : 0x39FA84, 0xF24;
	byte LoweeShares : 0x39FA84, 0xF28;
	byte OthersShares : 0x39FA84, 0xF2C;
	int EnemyBookSize : 0x39FA84, 0xB4DFC;
	int InventorySize : 0x39FA84, 0xCA46;
}
state("NeptuniaRebirth1", "GoG")
{
	int SaveBlock : 0x39A968;
	int Credits : 0x39A968, 0xF92C;
	string64 Cutscene : 0x39A968, 0xEEC;
	byte PlaneptuneShares : 0x39A968, 0xF1C;
	byte LeanboxShares : 0x39A968, 0xF20;
	byte LastationShares : 0x39A968, 0xF24;
	byte LoweeShares : 0x39A968, 0xF28;
	byte OthersShares : 0x39A968, 0xF2C;
	int EnemyBookSize : 0x39A968, 0xB4DFC;
	int InventorySize : 0x39A968, 0xCA46;
}
startup
{
	print("Autosplitter loading....");
	
	settings.Add("startnewgame", true, "Start on New Game");
	settings.SetToolTip("startnewgame", "Start on New Game select - use timer offset 0.33");
	
	settings.Add("startngplus", false, "Start on New Game Plus");
	settings.SetToolTip("startngplus", "Start on New Game Plus file load - use timer offset 0.05");
	
	settings.Add("killenemies", true, "Kill Enemies");

	settings.Add("arfdeath", true, "True Arfoire (Normal)", "killenemies");
	settings.SetToolTip("arfdeath", "End Split, times on last boss hit.");
	settings.Add("arfdeathtrue", true, "True Arfoire 2nd phase (True)", "killenemies");
	settings.SetToolTip("arfdeathtrue", "End Split, times on last boss hit.");
	
	settings.Add("items", true, "Split when acquiring certain items");

	settings.Add("ngnodlcitems", true, "Acquire 3 Herb, 3 DMJ, 2 Yellow Petal", "items");
	settings.Add("mgos", true, "Acquire 2 Mysterious Glowing Object", "items");
	
	settings.Add("slowrefreshonitems", false, "Slow Refresh Rate w/ Items");
	settings.SetToolTip("slowrefreshonitems", "Slow down the refresh rate while inventory-related splits are being tested to reduce CPU usage.");
	
	// Shares
	settings.Add("shares", true, "Split with Shares");
	
	settings.Add("all20", false, "All Nations 20% Shares", "shares");
	settings.SetToolTip("all20", "Split when all nations have 20% shares and Others has 0%.");

	// Credits
	settings.Add("credits", true, "Split when acquiring Credits (NG No DLC)");

	settings.Add("credits1", false, "Split on 6750 or more Credits", "credits");
	settings.Add("credits2", false, "Split on 10750 or more Credits", "credits");
	settings.SetToolTip("credits2", "Only fires after defeating Black Heart.");
	
	
	// Cutscenes
	settings.Add("cutscenes", true, "Split with Cutscene");

	settings.Add("endchs", true, "End Chapter Splits", "cutscenes");
	settings.Add("Chapter 2: Histoire And Arfoire", true, "End Chapter 1", "endchs");
	settings.Add("Chapter 3: Off To Leanbox", true, "End Chapter 2", "endchs");
	settings.Add("Chapter 4: Off To Lowee", true, "End Chapter 3", "endchs");
	settings.Add("Chapter 5: Lastation...Again", true, "End Chapter 4", "endchs");
	settings.Add("Chapter 6: 128th Where's Histy Summit", true, "End Chapter 5", "endchs");
	settings.Add("Chapter 7: Not Quite What I Imagined...", true, "End Chapter 6", "endchs");
	settings.Add("Chapter 8: Arfoire Of Celestia", true, "End Chapter 7", "endchs");
	
	
	// Chapter 1
	settings.Add("ch1", true, "Chapter 1", "cutscenes");
	settings.Add("Chapter 1: Planeptune", false, "Enter Planeptune (NG+ menuing split)", "ch1");
	settings.Add("Chapter 1: My First Victory", false, "Defeat the Dogoos", "ch1");
	settings.Add("Chapter 1: Rescue Compa!", true, "Defeat Guard Vermin 1", "ch1");
	settings.Add("Chapter 1: Iffy", true, "Defeat Guard Vermin 2", "ch1");
	settings.Add("Chapter 1: The Mysterious Lady", false, "Defeat the 4 Scrubs", "ch1");
	settings.Add("Chapter 1: Cheat?!", false, "Defeat/Lose to ??? 1", "ch1");
	settings.Add("Chapter 1: The Key Fragment", true, "Defeat ??? for real", "ch1");

	// Chapter 2
	settings.Add("ch2", true, "Chapter 2", "cutscenes");
	settings.Add("Chapter 2: Black Heart Strikes", true, "Defeat Hraesvelgr", "ch2");
	settings.Add("Chapter 2: Meeting With Noire", true, "Defeat Black Heart", "ch2");
	settings.Add("Chapter 2: Pudding Loss", true, "Defeat Boss Lizard", "ch2");
	settings.Add("Chapter 2: Another Work Offer", true, "Defeat Slash Dog", "ch2");
	settings.Add("Chapter 2: Where's The Key Fragment?", false, "Defeat the Avenir Scrubs", "ch2");
	settings.Add("Chapter 2: Break The Air", true, "Defeat R4i-SDHC", "ch2");
	settings.Add("Chapter 2: Neptune's Identity", true, "Defeat Killachine", "ch2");

	// Chapter 3
	settings.Add("ch3", true, "Chapter 3", "cutscenes");
	settings.Add("Chapter 3: The Shadow Of Conversation", true, "Defeat the Healing Scrubs", "ch3");
	settings.Add("Chapter 3: Gathered The Materials", true, "Defeat Forest Whale", "ch3");
	settings.Add("Chapter 3: The Culprit's Image", false, "Enter Halo Mountain (NG grind split)", "ch3");
	settings.Add("Chapter 3: Arfoire's True Power", true, "Defeat Arfoire phase 1", "ch3");
	settings.Add("Chapter 3: I Have My Power Back!", false, "Defeat/Lose to Fake Green Heart", "ch3");
	settings.Add("Chapter 3: Leanbox's Key Fragment", true, "Defeat Arfoire phase 2", "ch3");

	// Chapter 4
	settings.Add("ch4", true, "Chapter 4", "cutscenes");
	settings.Add("Chapter 4: Meeting CC2", true, "Defeat Ancient Dragon", "ch4");
	settings.Add("Chapter 4: Trash That Piece Of Junk!", false, "Defeat Killachine Mk-2", "ch4");
	settings.Add("Chapter 4: Timespace Traveler Hast Cometh!", false, "Defeat Killachine Mk-3", "ch4");
	settings.Add("Chapter 4: Ganache's Trap", true, "Defeat Killachine 1.01", "ch4");
	settings.Add("Chapter 4: Stopped", true, "Defeat the Jammers", "ch4");
	settings.Add("Chapter 4: Let's Run", false, "Defeat Arfoire's Scrubs", "ch4");
	settings.Add("Chapter 4: A Questionable Win", true, "Defeat Fake White Heart", "ch4");

	// Chapter 5
	settings.Add("ch5", true, "Chapter 5", "cutscenes");
	settings.Add("Chapter 5: Force By Numbers", true, "Defeat the Ancient Golems", "ch5");
	settings.Add("Chapter 5: Hard Breaker", true, "Defeat Panzer", "ch5");
	settings.Add("Chapter 5: Marvy To The Rescue!", false, "Defeat/Lose to CPU Breaker 1", "ch5");
	settings.Add("Chapter 5: Noire's Power...", true, "Defeat CPU Breaker for real", "ch5");

	// Chapter 6
	settings.Add("ch6", true, "Chapter 6", "cutscenes");
	settings.Add("Chapter 6: IF And Compa's Plan", false, "Defeat/Lose to Arfoire + CPU Killer", "ch6");
	settings.Add("Chapter 6: Defeat The Overlord", true, "Defeat Momus 1", "ch6");

	// Chapter 7
	settings.Add("ch7", true, "Chapter 7", "cutscenes");
	settings.Add("Chapter 7: Stress Reliever", false, "Defeat Fake Purple Heart 1", "ch7");
	settings.Add("Chapter 7: Planeptune's Legendary Weapon", true, "Defeat Fake Purple Heart 2", "ch7");
	settings.Add("Chapter 7: Peril Of The Main", false, "Defeat Fake Black Heart 1", "ch7");
	settings.Add("Chapter 7: Legendary Junk?", true, "Defeat Fake Black Heart 2", "ch7");
	settings.Add("Chapter 7: Fake Green Heart Defeated", true, "Defeat Fake Green Heart", "ch7");
	settings.Add("Chapter 7: The State Of The Legendary Weapon", true, "Defeat Fake White Heart", "ch7");
	settings.Add("Chapter 7: Neptune Awakens", false, "Defeat Momus 2", "ch7");
	settings.Add("Chapter 7: Momus Destroyed", true, "Defeat Momus 3", "ch7");


	// Chapter 8
	settings.Add("ch8", true, "Chapter 8", "cutscenes");
	settings.Add("Chapter 8: The True Arfoire", true, "Defeat Arfoire phase 1", "ch8");
	settings.Add("A Happy Ending With Everyone", false, "Defeat Arfoire phase 2 (True End route)", "ch8");
	
	vars.gameConnected = false;
	vars.timerJustStarted = false;
	vars.timerStartedSinceBoot = false;
	vars.timer_OnStart = (EventHandler)((s, e) =>
	{
		vars.timerJustStarted = true;
	});
	timer.OnStart += vars.timer_OnStart;

	// offsets that can't be in state
	vars.enemyBookData = 0xB4E00;
	vars.inventoryData = 0xCA4A;
	
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
	
	if (modules.First().ModuleMemorySize == 8708096) {
		print("Found and confirmed GoG Version");
		version = "GoG";
		vars.gameConnected = true;
	}
	else if (modules.First().ModuleMemorySize == 9662464) {
		print("Found and confirmed Steam Version 04.15.2019 Patch");
		version = "SteamCurrent";
		vars.gameConnected = true;
	}
	else if (modules.First().ModuleMemorySize == 8732672) {
		print("Found and confirmed Steam Version 02.07.2015 Patch (Colosseum Glitch)");
		version = "SteamColosseum";
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

		vars.ngNoDLCItemsSplit = false;
		vars.mgosSplit = false;
		
		vars.arfSplitNormal = false;
		vars.arfSplitTrue = false;
		
		vars.allSharesSplit = false;
		
		vars.firstCreditsSplit = false;
		vars.secondCreditsSplit = false;
		vars.beatenBlackHeart = false;

		// count item splits
		vars.itemSplitsActive += settings["ngnodlcitems"] ? 1 : 0;
		vars.itemSplitsActive += settings["mgos"] ? 1 : 0;
		
		// count enemy splits
		vars.enemySplitsActive += settings["arfdeath"] ? 1 : 0;
		vars.enemySplitsActive += settings["arfdeathtrue"] ? 1 : 0;
		
		// read initial kill values
		vars.initialKills = new short[6089]; // highest enemy id (incl. DLC) is 6088
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

	try {
		if(current.Cutscene.Equals("Chapter 2: Meeting With Noire") && settings["credits2"]) {
			vars.beatenBlackHeart = true;
		}
	} catch {}

	// split for cutscene
	if (settings["cutscenes"])
	{
		try {
			if (!current.Cutscene.Equals(old.Cutscene) && settings[current.Cutscene])
			{
				print("Split for " + current.Cutscene + " Cutscene.");
				return true;
			}
		} catch {}
	}
	
	// split for shares
	if(settings["shares"])
	{
		if(settings["all20"] && !vars.allSharesSplit && current.PlaneptuneShares >= 20 && current.LastationShares >= 20 && current.LeanboxShares >= 20 && current.LoweeShares >= 20 && current.OthersShares == 0) {
			vars.allSharesSplit = true;
			print("Split for all shares >= 20% and others = 0%");
			return true;
		}
	}

	// split for credits
	if(settings["credits1"] && !vars.firstCreditsSplit && current.Credits >= 6750) {
		vars.firstCreditsSplit = true;
		print("Split for Credits >= 6750");
		return true;
	}

	if(settings["credits2"] && !vars.secondCreditsSplit && vars.beatenBlackHeart && current.Credits >= 10750) {
		vars.secondCreditsSplit = true;
		print("Split for Credits >= 10750");
		return true;
	}
	
	// split for enemy kills
	if(vars.enemySplitsHit < vars.enemySplitsActive) {
		byte[] enemyBook = memory.ReadBytes((System.IntPtr) (current.SaveBlock + vars.enemyBookData), (int) (current.EnemyBookSize*8));
		for(int i = 0; i < current.EnemyBookSize; i++) {
			short enemyID = BitConverter.ToInt16(enemyBook, i*8);
			int kills = BitConverter.ToInt16(enemyBook, i*8 + 4) - vars.initialKills[enemyID];
			if(settings["arfdeath"] && !vars.arfSplitNormal && enemyID == 1056 && kills > 0) {
				vars.arfSplitNormal = true;
				vars.enemySplitsHit++;
				print("Split for Normal End True Arfoire");
				return true;
			}
			if(settings["arfdeathtrue"] && !vars.arfSplitTrue && enemyID == 1059 && kills > 0) {
				vars.arfSplitTrue = true;
				vars.enemySplitsHit++;
				print("Split for True End True Arfoire ph2");
				return true;
			}
		}
	}
	
	// Acquire Items

	if(vars.itemSplitsHit < vars.itemSplitsActive) {
		if(settings["slowrefreshonitems"] && !vars.slowRefresh) {
			refreshRate = 20;
			vars.slowRefresh = true;
		}
		int ngNoDLCItemCount = 0;
		byte[] inventory = memory.ReadBytes((System.IntPtr) (current.SaveBlock + vars.inventoryData), (int) (current.InventorySize*4));
		for(int i = 0; i < current.InventorySize; i++) {
			short itemID = BitConverter.ToInt16(inventory, i*4);
			byte amount = inventory[i*4 + 2];
			if(settings["ngnodlcitems"] && !vars.ngNoDLCItemsSplit && (itemID == 1601 || itemID == 1910) && amount >= 3) {
				ngNoDLCItemCount++;
				continue;
			}
			if(settings["ngnodlcitems"] && !vars.ngNoDLCItemsSplit && itemID == 1748 && amount >= 2) {
				ngNoDLCItemCount++;
				continue;
			}
			if(settings["mgos"] && !vars.mgosSplit && itemID == 1759 && amount >= 2) {
				vars.mgosSplit = true;
				vars.itemSplitsHit++;
				print("Split for 2 MGOs");
				return true;
			}
		}
		
		if(ngNoDLCItemCount == 3 && settings["ngnodlcitems"] && !vars.ngNoDLCItemsSplit) {
			vars.ngNoDLCItemsSplit = true;
			vars.itemSplitsHit++;
			print("Split for Ch1 NG No DLC items");
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
	if (settings["startngplus"] && (current.Cutscene != null && (current.Cutscene.Equals("Normal End") || current.Cutscene.Equals("Happy Ending"))))
	{
		return true;
	}
}
