state("TOS", "TSFix")
{
	int BattleData : 0x6CD1DC;
	byte PlayerPartyCount: 0x6CD1DC, 0x934C;
	byte EnemyPartyCount: 0x6CD1DC, 0x934D;
	int BattleTimer: 0x6CD1DC, 0x90E4;
	int Player1HP: 0x6CD1DC, 0x132A8, 0x24;
	int Player2HP: 0x6CD1DC, 0x26E88, 0x24;
	int Player3HP: 0x6CD1DC, 0x3AA68, 0x24;
	int Player4HP: 0x6CD1DC, 0x4E648, 0x24;
	int Enemy1HP: 0x6CD1DC, 0x62228, 0x24;
	int Enemy2HP: 0x6CD1DC, 0x75E08, 0x24;
	int Enemy3HP: 0x6CD1DC, 0x899E8, 0x24;
	int Enemy4HP: 0x6CD1DC, 0x9D5C8, 0x24;
	int Enemy5HP: 0x6CD1DC, 0xB11A8, 0x24;
	int Enemy6HP: 0x6CD1DC, 0xC4D88, 0x24;
	int Enemy7HP: 0x6CD1DC, 0xD8968, 0x24;
	int Enemy8HP: 0x6CD1DC, 0xEC548, 0x24;
	int LoadActive: 0x70DD9C;
	byte LoadOrSave: 0x70D697;
	int MoviePlaying: 0x7128F8;
	int MovieFrame: 0x7128F4;
	byte288 TechMenuRAM: 0x70DDE4;
	byte SaveSlot: 0x182B108;
}
state("TOS", "SteamLatest")
{
	int BattleData : 0x6D2EDC;
	byte PlayerPartyCount: 0x6D2EDC, 0x934C;
	byte EnemyPartyCount: 0x6D2EDC, 0x934D;
	int BattleTimer: 0x6D2EDC, 0x90E4;
	int Player1HP: 0x6D2EDC, 0x132A8, 0x24;
	int Player2HP: 0x6D2EDC, 0x26E88, 0x24;
	int Player3HP: 0x6D2EDC, 0x3AA68, 0x24;
	int Player4HP: 0x6D2EDC, 0x4E648, 0x24;
	int Enemy1HP: 0x6D2EDC, 0x62228, 0x24;
	int Enemy2HP: 0x6D2EDC, 0x75E08, 0x24;
	int Enemy3HP: 0x6D2EDC, 0x899E8, 0x24;
	int Enemy4HP: 0x6D2EDC, 0x9D5C8, 0x24;
	int Enemy5HP: 0x6D2EDC, 0xB11A8, 0x24;
	int Enemy6HP: 0x6D2EDC, 0xC4D88, 0x24;
	int Enemy7HP: 0x6D2EDC, 0xD8968, 0x24;
	int Enemy8HP: 0x6D2EDC, 0xEC548, 0x24;
	int SavingOrLoading: 0x713A9C;
	byte LoadOrSave: 0x713397;
	int MoviePlaying: 0x7185F8;
	int MovieFrame: 0x7185F4;
	byte288 TechMenuRAM: 0x713AE4;
	byte SaveSlot: 0x4C6454;
}
startup
{
	print("Autosplitter loading....");

	// 1 enemy: mode, 1, LV, HP, TP, ATK, DEF, INT
	// 2+ enemies: mode, n, LV, HP, LV, HP, ...
	// 1 = kill, 2 = die to, 3 = either
	vars.splits = new List<Tuple<string, List<int>>> {
		// Bosses
		Tuple.Create("vidarr", new List<int> { 1, 1, 5, 4000, 30, 210, 21, 8}),
		Tuple.Create("exbelua", new List<int> { 1, 1, 5, 5000, 38, 190, 10, 43}),
		Tuple.Create("botta", new List<int> { 1, 3, 10, 4200, 7, 823, 7, 823}),
		Tuple.Create("ktugach", new List<int> { 1, 3, 12, 5000, 9, 1500, 9, 1500}),
		Tuple.Create("sheena1", new List<int> { 1, 2, 15, 1800, 16, 2000}),
		Tuple.Create("windmaster", new List<int> { 1, 1, 23, 10000, 220, 580, 85, 220}),
		Tuple.Create("iapyx", new List<int> { 1, 1, 25, 14000, 88, 690, 100, 140}),
		Tuple.Create("sheena2", new List<int> { 1, 2, 20, 4500, 20, 5500}),
		Tuple.Create("iubaris", new List<int> { 1, 1, 35, 16800, 1500, 860, 80, 150}),
		Tuple.Create("kvar", new List<int> { 1, 4, 25, 10000, 25, 5500, 25, 5500, 25, 5500}),
		Tuple.Create("magnius", new List<int> { 1, 3, 16, 8500, 14, 2300, 14, 2100}),
		Tuple.Create("kilia", new List<int> { 1, 1, 18, 10000, 400, 490, 65, 130}),
		Tuple.Create("adulocia", new List<int> { 1, 3, 20, 10000, 20, 2300, 20, 2300}),
		Tuple.Create("undine", new List<int> { 1, 1, 25, 13000, 320, 580, 88, 180}),
		Tuple.Create("remiel", new List<int> { 1, 1, 28, 16000, 258, 530, 112, 155}),
		Tuple.Create("kratos1", new List<int> { 3, 1, 30, 22500, 1500, 750, 150, 180}),
		Tuple.Create("yggy1", new List<int> { 2, 1, 60, 40000, 3000, 1800, 350, 320}),

		// Scrubs
		Tuple.Create("tutorial1", new List<int> { 1, 1, 1, 800, 0, 130, 0, 32}),
		Tuple.Create("tutorial2", new List<int> { 1, 2, 4, 320, 1, 800}),
		Tuple.Create("templerenegades", new List<int> { 1, 2, 3, 600, 3, 600}),
		Tuple.Create("golem1", new List<int> { 1, 1, 6, 1210, 0, 150, 12, 35}),
		Tuple.Create("golem2", new List<int> { 1, 1, 6, 1210, 0, 150, 12, 35}),
		Tuple.Create("golem3", new List<int> { 1, 1, 6, 1210, 0, 150, 12, 35}),
		Tuple.Create("iranchdesians", new List<int> { 1, 2, 5, 570, 5, 570}),
		Tuple.Create("trietdesians", new List<int> { 1, 3, 7, 700, 7, 700, 8, 830}),
		Tuple.Create("sylbaserenegades", new List<int> { 1, 2, 3, 600, 3, 600}),
		Tuple.Create("firesealscrubs", new List<int> { 1, 2, 8, 380, 8, 380}),
		Tuple.Create("asgardranch1", new List<int> { 1, 3, 17, 800, 17, 800, 17, 1600}),
		Tuple.Create("asgardranch2", new List<int> { 1, 4, 17, 1980, 18, 1990, 18, 1990, 18, 1710}),
		Tuple.Create("asgardranch3", new List<int> { 1, 2, 18, 1710, 18, 1710}),
		Tuple.Create("asgardranch4", new List<int> { 1, 2, 18, 1710, 18, 1710}),
		Tuple.Create("asgardranch5", new List<int> { 1, 2, 18, 2500, 18, 2500}),
		Tuple.Create("asgardranch6", new List<int> { 1, 2, 18, 2500, 18, 2500}),
		Tuple.Create("palmadesians", new List<int> { 1, 3, 7, 700, 7, 700, 10, 1250}),
		Tuple.Create("palmaranch1", new List<int> { 1, 3, 12, 1380, 14, 1480, 14, 1400}),
		Tuple.Create("palmaranch2", new List<int> { 1, 4, 12, 1380, 12, 1380, 14, 1480, 14, 1400}),
		Tuple.Create("palmaranch3", new List<int> { 1, 4, 12, 1380, 14, 1480, 14, 1480, 14, 1400}),
	};

	vars.splitsHit = new HashSet<string>();

	settings.Add("starton", true, "Start On...");
	settings.SetToolTip("starton", "The timer will not start if you try to start a run with dirty Tech Menu RAM (a run which would be invalid).");
	settings.Add("openingmovie", true, "Start on OP movie (use 2 seconds timer offset)", "starton");
	settings.SetToolTip("openingmovie", "Starts the timer when the opening movie starts playing (for NG runs). Must use 2 second timer offset to sync.");
	settings.Add("loadanyfile", false, "Start on Load File (any slot)", "starton");
	settings.SetToolTip("loadanyfile", "Starts the timer when you load ANY file. Use for NG+ runs.");
	settings.Add("loadslot", false, "Start on Load File (specific slot(s))", "starton");
	settings.SetToolTip("loadslot", "Starts the timer when you load a file slot selected under this option. Use for NG+ runs.");
	for(int slot=0;slot<100;slot++) {
		settings.Add("loadslot"+slot, false, "Slot "+(slot+1), "loadslot");
	}
	
	settings.Add("storybosses", true, "Story Bosses");
	settings.Add("vidarr", true, "Vidarr", "storybosses");
	settings.Add("exbelua", true, "Exbelua", "storybosses");
	settings.Add("botta", true, "Botta", "storybosses");
	settings.Add("ktugach", true, "Ktugach", "storybosses");
	settings.Add("sheena1", true, "Sheena 1 (Clumsy Assassin)", "storybosses");
	settings.Add("windmaster", true, "Windmaster", "storybosses");
	settings.Add("iapyx", true, "Iapyx", "storybosses");
	settings.Add("sheena2", true, "Sheena 2 (Resolute Assassin)", "storybosses");
	settings.Add("iubaris", true, "Iubaris", "storybosses");
	settings.Add("kvar", true, "Kvar", "storybosses");
	settings.Add("magnius", true, "Magnius", "storybosses");
	settings.Add("kilia", true, "Kilia", "storybosses");
	settings.Add("adulocia", true, "Adulocia", "storybosses");
	settings.Add("undine", true, "Undine", "storybosses");
	settings.Add("remiel", true, "Remiel", "storybosses");
	settings.Add("kratos1", true, "Kratos 1 (win or lose)", "storybosses");
	settings.Add("yggy1", true, "Yggdrasill 1 (lose)", "storybosses");

	settings.Add("scrubfights", false, "Scrub Fights");
	settings.Add("tutorial1", true, "Tutorial 1", "scrubfights");
	settings.Add("tutorial2", true, "Tutorial 2", "scrubfights");
	settings.Add("templerenegades", true, "Martel Temple Renegades", "scrubfights");
	settings.Add("golem1", true, "Martel Temple Golem 1", "scrubfights");
	settings.Add("golem2", true, "Martel Temple Golem 2", "scrubfights");
	settings.Add("golem3", true, "Martel Temple Golem 3", "scrubfights");
	settings.Add("iranchdesians", true, "Iselia Ranch Desians", "scrubfights");
	settings.Add("trietdesians", true, "Triet Desians", "scrubfights");
	settings.Add("sylbaserenegades", true, "Sylvarant Base Renegades", "scrubfights");
	settings.Add("firesealscrubs", true, "Fire Seal Elemental Scrubs", "scrubfights");
	settings.Add("asgardranch1", true, "Asgard Ranch 1 (first visit)", "scrubfights");
	settings.Add("asgardranch2", true, "Asgard Ranch 2 (second visit intro)", "scrubfights");
	settings.Add("asgardranch3", true, "Asgard Ranch 3 (B-Team fight 1)", "scrubfights");
	settings.Add("asgardranch4", true, "Asgard Ranch 4 (B-Team fight 2)", "scrubfights");
	settings.Add("asgardranch5", true, "Asgard Ranch 5 (B-Team fight 3)", "scrubfights");
	settings.Add("asgardranch6", true, "Asgard Ranch 6 (B-Team fight 4)", "scrubfights");
	settings.Add("palmadesians", true, "Palmacosta Desians", "scrubfights");
	settings.Add("palmaranch1", true, "Palma Ranch 1 (Purple Card)", "scrubfights");
	settings.Add("palmaranch2", true, "Palma Ranch 2 (Chocolat)", "scrubfights");
	settings.Add("palmaranch3", true, "Palma Ranch 3 (Pre-Magnius)", "scrubfights");
	
	vars.gameConnected = false;
	vars.timerJustStarted = false;
	vars.timerStartedSinceBoot = false;
	vars.processedCurrentFight = false;
	vars.timer_OnStart = (EventHandler)((s, e) =>
	{
		vars.timerJustStarted = true;
	});
	timer.OnStart += vars.timer_OnStart;
	
	print("Startup complete! CREDITS: Dabomstew");
	
}
shutdown
{
	try {
	timer.OnStart -= vars.timer_OnStart;
	} catch {}
	vars.gameConnected = false;
	vars.timerStartedSinceBoot = false;
	vars.processedCurrentFight = false;
}
init
{

	print("Game found!");
	print("module size: " + modules.First().ModuleMemorySize);
	vars.timerStartedSinceBoot = false;
	
	if (modules.First().ModuleMemorySize == 45060096) {
		print("Found and confirmed TSFix");
		version = "TSFix";
		vars.gameConnected = true;
	}
	else if (modules.First().ModuleMemorySize == 45084672) {
		print("Found and confirmed SteamLatest");
		version = "SteamLatest";
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
	vars.processedCurrentFight = false;
}
update
{
	if(!vars.gameConnected)
	{
		return false;
	}
	
	if(vars.timerJustStarted) {
		vars.splitsHit.Clear();
		vars.timerJustStarted = false;
		vars.timerStartedSinceBoot = true;
		vars.processedCurrentFight = false;
	}
}
split
{
	if(!vars.gameConnected || vars.timerJustStarted || !vars.timerStartedSinceBoot) {
		// don't try anything if our vars state might be dirty
		return false;
	}
	try {
		// are we in a battle?
		if(current.PlayerPartyCount > 0 && current.PlayerPartyCount < 5 && current.EnemyPartyCount > 0 && current.EnemyPartyCount < 9 && current.BattleTimer > 0 && current.BattleTimer < 21600000) {
			int mode = 0;
			if(current.Player1HP == 0 && current.Player2HP == 0 && current.Player3HP == 0 && current.Player4HP == 0) {
				mode = 2;
			}
			else {
				// all enemies dead?
				bool allEnemiesDead = true;
				var dictableCurrent = (IDictionary<string, object>)current;
				for(int enemy=1;enemy<=current.EnemyPartyCount;enemy++) {
					if((int)dictableCurrent["Enemy"+enemy+"HP"] > 0) {
						allEnemiesDead = false;
						break;
					}
				}
				if(allEnemiesDead) {
					mode = 1;
				}
			}

			if(mode != 0 && !vars.processedCurrentFight) {
				// read data
				Dictionary<string, int> battleData = new Dictionary<string, int>();
				battleData["enemyCount"] = current.EnemyPartyCount;
				for(int enemy=1;enemy<=current.EnemyPartyCount;enemy++) {
					System.IntPtr enemyPointer = (System.IntPtr) memory.ReadValue<int>((System.IntPtr) (current.BattleData + 0x62228 + 0x13BE0*(enemy-1)));
					battleData["enemy"+enemy+"Level"] = memory.ReadValue<byte>(enemyPointer + 0x1D);
					battleData["enemy"+enemy+"MaxHP"] = memory.ReadValue<int>(enemyPointer + 0x20);
					battleData["enemy"+enemy+"MaxTP"] = memory.ReadValue<ushort>(enemyPointer + 0x28);
					battleData["enemy"+enemy+"Slash"] = memory.ReadValue<ushort>(enemyPointer + 0x2C);
					battleData["enemy"+enemy+"Defense"] = memory.ReadValue<ushort>(enemyPointer + 0x30);
					battleData["enemy"+enemy+"INT"] = memory.ReadValue<ushort>(enemyPointer + 0x32);
					battleData["enemy"+enemy+"ACC"] = memory.ReadValue<ushort>(enemyPointer + 0x34);
					battleData["enemy"+enemy+"EVA"] = memory.ReadValue<ushort>(enemyPointer + 0x36);
					battleData["enemy"+enemy+"LUK"] = memory.ReadValue<byte>(enemyPointer + 0x38);
				}
				var battleInfoStr = "";
				foreach(KeyValuePair<string,int> data in battleData) {
					battleInfoStr += (data.Key+" = "+data.Value+", ");
				}
				print("Finished a fight: outcome = "+mode+", data = "+battleInfoStr);
				foreach(Tuple<string, List<int>> split in vars.splits) {
					if(settings[split.Item1] && !vars.splitsHit.Contains(split.Item1)) {
						if(split.Item2[0] != mode && split.Item2[0] != 3) {
							// wrong outcome
							continue;
						}
						if(split.Item2[1] != current.EnemyPartyCount) {
							// wrong party count
							continue;
						}
						bool passesAll = true;
						if(split.Item2[1] == 1) {
							// single enemy: check Level, HP, TP, Slash, Defense, INT
							if(split.Item2[2] != battleData["enemy1Level"] || split.Item2[3] != battleData["enemy1MaxHP"] || split.Item2[4] != battleData["enemy1MaxTP"]
							|| split.Item2[5] != battleData["enemy1Slash"] || split.Item2[6] != battleData["enemy1Defense"] || split.Item2[7] != battleData["enemy1INT"]) {
								   passesAll = false;
							}
						}
						else {
							for(int enemy=1;enemy<=split.Item2[1];enemy++) {
								if(split.Item2[enemy*2] != battleData["enemy"+enemy+"Level"] || split.Item2[enemy*2 + 1] != battleData["enemy"+enemy+"MaxHP"]) {
									passesAll = false;
									break;
								}
							}
						}

						if(passesAll) {
							print("Splitting for: "+split.Item1);
							vars.splitsHit.Add(split.Item1);
							vars.processedCurrentFight = true;
							return true;
						}
					}
				}
				vars.processedCurrentFight = true;
			}
			else if(mode == 0) {
				vars.processedCurrentFight = false;
			}

		}
		else {
			vars.processedCurrentFight = false;
		}
	}
	catch {
		vars.processedCurrentFight = false;
	}
}

start {
	var starting = false;

	if(settings["loadanyfile"] && current.LoadActive == 0x02 && current.LoadOrSave == 0x01) {
		starting = true;
	}
	else if(settings["loadslot"] && current.LoadActive == 0x02 && current.LoadOrSave == 0x01 && settings["loadslot"+current.SaveSlot]) {
		starting = true;
	}
	else if(settings["openingmovie"] && current.MoviePlaying == 0x01 && old.MovieFrame < current.MovieFrame && current.MovieFrame < 10) {
		starting = true;
	}
	

	if(starting) {
		for(int i=0;i<288;i++) {
			if(current.TechMenuRAM[i] != 0) {
				return false;
			}
		}
		return true;
	}
}
