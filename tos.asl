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
}
startup
{
	print("Autosplitter loading....");

	// 1 enemy: mode, 1, LV, HP, TP, ATK, DEF, INT
	// 2+ enemies: mode, n, LV, HP, LV, HP, ...
	// 1 = kill, 2 = die to, 3 = either
	vars.splits = new List<Tuple<string, List<int>>> {
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
	};

	vars.splitsHit = new HashSet<string>();

	settings.Add("starton", true, "Start On...");
	settings.Add("loadfile", false, "Start on Load File", "starton");
	settings.SetToolTip("loadfile", "Starts the timer when you load ANY file. Use for NG+ runs.");
	settings.Add("openingmovie", true, "Start on OP movie (use 2 seconds timer offset)", "starton");
	settings.SetToolTip("openingmovie", "Starts the timer when the opening movie starts playing (for NG runs). Must use 2 second timer offset to sync.");
	settings.Add("disablestartdirty", true, "Disable Timer Start if Tech Menu RAM is dirty", "openingmovie");
	settings.SetToolTip("disablestartdirty", "If you use this and try to start a run with dirty Tech Menu RAM, the timer will fail to start to signal to you that the run is invalid.");

	
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
	if(settings["loadfile"] && current.LoadActive == 0x02 && current.LoadOrSave == 0x01) {
		return true;
	}
	if(settings["openingmovie"] && current.MoviePlaying == 0x01 && old.MovieFrame < current.MovieFrame && current.MovieFrame < 10) {
		if(settings["disablestartdirty"]) {
			for(int i=0;i<288;i++) {
				if(current.TechMenuRAM[i] != 0) {
					return false;
				}
			}
		}
		return true;
	}
}
