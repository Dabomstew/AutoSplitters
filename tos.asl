state("TOS", "TSFix")
{
	int BattleData : 0x6CD1DC;
	byte PlayerPartyCount: 0x6CD1DC, 0x934C;
	byte EnemyPartyCount: 0x6CD1DC, 0x934D;
	int BattleTimer: 0x6CD1DC, 0x90E4;
	int BattleTimerFull: 0x6CD1DC, 0x90E0;
	byte BattleFadingOut: 0x6CD1DC, 0x93B3;
	int Player1HP: 0x6CD1DC, 0x132A8, 0x24;
	int Player2HP: 0x6CD1DC, 0x26E88, 0x24;
	int Player3HP: 0x6CD1DC, 0x3AA68, 0x24;
	int Player4HP: 0x6CD1DC, 0x4E648, 0x24;
	byte Enemy1Level: 0x6CD1DC, 0x62228, 0x1D;
	int Enemy1MaxHP: 0x6CD1DC, 0x62228, 0x20;
	int Enemy1HP: 0x6CD1DC, 0x62228, 0x24;
	ushort Enemy1Def: 0x6CD1DC, 0x62228, 0x30;
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
	int BattleTimerFull: 0x6D2EDC, 0x90E0;
	byte BattleFadingOut: 0x6D2EDC, 0x93B3;
	int Player1HP: 0x6D2EDC, 0x132A8, 0x24;
	int Player2HP: 0x6D2EDC, 0x26E88, 0x24;
	int Player3HP: 0x6D2EDC, 0x3AA68, 0x24;
	int Player4HP: 0x6D2EDC, 0x4E648, 0x24;
	byte Enemy1Level: 0x6D2EDC, 0x62228, 0x1D;
	int Enemy1MaxHP: 0x6D2EDC, 0x62228, 0x20;
	int Enemy1HP: 0x6D2EDC, 0x62228, 0x24;
	ushort Enemy1Def: 0x6D2EDC, 0x62228, 0x30;
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
		Tuple.Create("pronyma1", new List<int> { 1, 1, 30, 18000, 750, 1150, 150, 180}),
		Tuple.Create("convicts", new List<int> { 1, 3, 28, 6300, 28, 6300, 28, 6300}),
		Tuple.Create("regal", new List<int> { 1, 1, 30, 12000, 320, 800, 120, 95}),
		Tuple.Create("minedoor", new List<int> { 1, 8, 30, 12000, 30, 8000, 30, 8000, 30, 8000, 30, 8000, 30, 5500, 30, 3000, 30, 3000}),
		Tuple.Create("volt", new List<int> { 1, 1, 35, 24000, 240, 950, 180, 200}),
		Tuple.Create("yuanbotta", new List<int> { 1, 2, 38, 16000, 36, 12000}),
		Tuple.Create("dragons", new List<int> { 1, 3, 37, 18000, 36, 12000, 36, 12000}),
		Tuple.Create("gnome", new List<int> { 1, 1, 40, 28000, 682, 1100, 255, 279}),
		Tuple.Create("celsius", new List<int> { 1, 2, 45, 18000, 42, 12000}),
		Tuple.Create("latesylph", new List<int> {1, 3, 49, 13000, 48, 12000, 47, 10000}),
		Tuple.Create("rodyle", new List<int> { 1, 1, 44, 35000, 500, 1350, 210, 240}),
		Tuple.Create("colosseum", new List<int> {1, 3, 50, 5230, 50, 5230, 28, 1980}),
		Tuple.Create("shadow", new List<int> { 1, 1, 48, 30000, 800, 1520, 232, 231}),
		Tuple.Create("lateefreet", new List<int> { 1, 1, 47, 30000, 850, 1200, 260, 210}),
		Tuple.Create("lunaaska", new List<int> { 1, 2, 50, 18000, 50, 19650}),
		Tuple.Create("forcystus", new List<int> {1, 3, 50, 20000, 50, 6000, 50, 6000}),
		Tuple.Create("plantix", new List<int> { 1, 1, 52, 36000, 250, 1300, 310, 100}),
		Tuple.Create("kratos2", new List<int> { 3, 1, 62, 25000, 980, 1200, 400, 320}),
		Tuple.Create("gatekeeper", new List<int> {1, 3, 60, 18000, 58, 7480, 58, 7480}),
		Tuple.Create("pronyma2", new List<int> {1, 3, 60, 32000, 58, 11000, 58, 11000}),
		Tuple.Create("yggy3", new List<int> { 1, 1, 60, 40000, 3000, 1800, 380, 320}),
		Tuple.Create("kratos3", new List<int> { 1, 1, 62, 12000, 1400, 1050, 320, 265}),
		Tuple.Create("origin", new List<int> { 1, 1, 65, 40000, 800, 1450, 350, 250}),
		Tuple.Create("darkdragon", new List<int> { 1, 1, 71, 19000, 0, 1250, 48, 420}),
		Tuple.Create("mithos1", new List<int> { 1, 1, 66, 55000, 5000, 2000, 410, 300}),
		Tuple.Create("mithos2", new List<int> { 1, 1, 66, 60000, 1500, 2150, 265, 300}),
  
		// Scrubs
		Tuple.Create("tutorial1", new List<int> { 1, 1, 1, 800, 0, 130, 0, 32}),
		Tuple.Create("tutorial2", new List<int> { 1, 2, 4, 320, 1, 800}),
		Tuple.Create("templerenegades", new List<int> { 1, 2, 3, 600, 3, 600}),
		Tuple.Create("golem1", new List<int> { 1, 1, 6, 1210, 0, 150, 12, 35}),
		Tuple.Create("golem2", new List<int> { 1, 1, 6, 1210, 0, 150, 12, 35}),
		Tuple.Create("golem3", new List<int> { 1, 1, 6, 1210, 0, 150, 12, 35}),
		Tuple.Create("outsideiranch", new List<int> { 1, 2, 5, 570, 5, 570}),
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
		Tuple.Create("bridgepapals", new List<int> { 1, 3, 24, 4900, 24, 4900, 24, 4900}),
		Tuple.Create("forestpapals", new List<int> { 1, 3, 30, 5100, 30, 5100, 30, 5100}),
		Tuple.Create("ozettepapals", new List<int> { 1, 3, 35, 6900, 33, 6400, 33, 6400}),
		Tuple.Create("tethebase1", new List<int> {1, 3, 35, 3800, 35, 3800, 36, 4800}),
		Tuple.Create("tethebase2", new List<int> {1, 3, 35, 2900, 35, 2900, 36, 4800}),
		Tuple.Create("tethebase3", new List<int> {1, 3, 35, 5000, 35, 5000, 36, 4800}),
		Tuple.Create("penguinists", new List<int> { 1, 4, 38, 3680, 38, 3680, 38, 3680, 38, 3680}),
		Tuple.Create("gatepapals", new List<int> {1, 3, 45, 9400, 40, 7900, 40, 7900}),
		Tuple.Create("rodyledragons", new List<int> {1, 3, 44, 8000, 44, 8000, 44, 8000}),
		Tuple.Create("iseliaranch", new List<int> { 1, 4, 49, 4850, 49, 4850, 51, 4800, 49, 4350}),
		Tuple.Create("altessaangels", new List<int> {1, 3, 58, 7480, 58, 7480, 60, 8130}),
		Tuple.Create("tosangels", new List<int> {1, 2, 58, 7480, 58, 7480}),
		Tuple.Create("tosplants1", new List<int> {1, 2, 57, 7200, 57, 7200}),
		Tuple.Create("tosplants2", new List<int> {1, 2, 57, 7200, 57, 7200}),
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
	settings.Add("pronyma1", true, "Pronyma 1", "storybosses");
	settings.Add("convicts", true, "Convicts (Sewers)", "storybosses");
	settings.Add("regal", true, "Regal", "storybosses");
	settings.Add("minedoor", true, "Mine Door", "storybosses");
	settings.Add("volt", true, "Volt", "storybosses");
	settings.Add("yuanbotta", true, "Yuan & Botta", "storybosses");
	settings.Add("dragons", true, "Dragons (Nest)", "storybosses");
	settings.Add("gnome", true, "Gnome", "storybosses");
	settings.Add("celsius", true, "Celsius & Fenrir", "storybosses");
	settings.Add("latesylph", true, "Sylph (Non-Early)", "storybosses");
	settings.Add("rodyle", true, "Rodyle", "storybosses");
	settings.Add("colosseum", true, "Colosseum 1v3", "storybosses");
	settings.Add("shadow", true, "Shadow", "storybosses");
	settings.Add("lateefreet", true, "Efreet (Non-Early)", "storybosses");
	settings.Add("lunaaska", true, "Luna & Aska", "storybosses");
	settings.Add("forcystus", true, "Forcystus (& Exbones)", "storybosses");
	settings.Add("plantix", true, "Plantix", "storybosses");
	settings.Add("kratos2", true, "Kratos 2 (win or lose)", "storybosses");
	settings.Add("yggy2", true, "Yggdrasill 2 (1 min or 20k damage)", "storybosses");
	settings.Add("gatekeeper", true, "Gatekeeper", "storybosses");
	settings.Add("pronyma2", true, "Pronyma 2 (& Iduns)", "storybosses");
	settings.Add("yggy3", true, "Yggdrasill 3 (win)", "storybosses");
	settings.Add("kratos3", true, "Kratos 3 (win)", "storybosses");
	settings.Add("origin", true, "Origin", "storybosses");
	settings.Add("darkdragon", true, "Dark Dragon", "storybosses");
	settings.Add("mithos1", true, "Mithos 1", "storybosses");
	settings.Add("mithos2", true, "Mithos 2", "storybosses");

	settings.Add("scrubfights", false, "Scrub Fights");
	settings.Add("tutorial1", true, "Tutorial 1", "scrubfights");
	settings.Add("tutorial2", true, "Tutorial 2", "scrubfights");
	settings.Add("templerenegades", true, "Martel Temple Renegades", "scrubfights");
	settings.Add("golem1", true, "Martel Temple Golem 1", "scrubfights");
	settings.Add("golem2", true, "Martel Temple Golem 2", "scrubfights");
	settings.Add("golem3", true, "Martel Temple Golem 3", "scrubfights");
	settings.Add("outsideiranch", true, "Outside Iselia Ranch Desians", "scrubfights");
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
	settings.Add("bridgepapals", true, "Papal Knights (Tethealla Bridge)", "scrubfights");
	settings.Add("forestpapals", true, "Papal Knights (Gaoracchia Forest)", "scrubfights");
	settings.Add("ozettepapals", true, "Papal Knights (Ozette)", "scrubfights");
	settings.Add("tethebase1", true, "Tethealla Base Password 1", "scrubfights");
	settings.Add("tethebase2", true, "Tethealla Base Password 2", "scrubfights");
	settings.Add("tethebase3", true, "Tethealla Base Password 3", "scrubfights");
	settings.Add("penguinists", true, "Penguinists (only if you kill them)", "scrubfights");
	settings.Add("gatepapals", true, "Papal Knights (Otherworldly Gate)", "scrubfights");
	settings.Add("rodyledragons", true, "Baby Dragons (after Rodyle)", "scrubfights");
	settings.Add("iseliaranch", true, "Iselia Ranch Scrubs (inside)", "scrubfights");
	settings.Add("altessaangels", true, "Angels (Night at Altessa's)", "scrubfights");
	settings.Add("tosangels", true, "Tower of Salvation Angels (Regal's Trap)", "scrubfights");
	settings.Add("tosplants1", true, "Tower of Salvation Plants 1 (Raine's Trap)", "scrubfights");
	settings.Add("tosplants2", true, "Tower of Salvation Plants 2 (Raine's Trap)", "scrubfights");

	
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
			var allDead = current.Player1HP == 0 && current.Player2HP == 0 && current.Player3HP == 0 && current.Player4HP == 0;
			// yggdrasill unwinnable fight mode?
			if((settings["yggy1"] || settings["yggy2"]) && !vars.processedCurrentFight && current.EnemyPartyCount == 1 && current.Enemy1Level == 60 && current.Enemy1MaxHP == 40000 && current.Enemy1Def == 350) {
				// yggy 1 or 2 being fought
				if(settings["yggy1"] && !vars.splitsHit.contains("yggy1") && allDead) {
					// end of yggy 1 by party wipe
					vars.splitsHit.Add("yggy1");
					vars.processedCurrentFight = true;
					return true;
				}
				else if(current.BattleFadingOut & 0x20 != 0x00) {
					// Timeout or damage amount hit, can be either fight
					if(settings["yggy1"] && !vars.splitsHit.contains("yggy1")) {
						vars.splitsHit.Add("yggy1");
						vars.processedCurrentFight = true;
						return true;
					}
					else if(settings["yggy2"] && !vars.splitsHit.contains("yggy2")) {
						vars.splitsHit.Add("yggy2");
						vars.processedCurrentFight = true;
						return true;
					}
				}
			}
			int mode = 0;
			if(allDead) {
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
					System.IntPtr enemyPointer2 = (System.IntPtr) memory.ReadValue<int>((System.IntPtr) (current.BattleData + 0x62240 + 0x13BE0*(enemy-1)));
					battleData["enemy"+enemy+"EXP"] = memory.ReadValue<int>(enemyPointer2 + 0x70);
					battleData["enemy"+enemy+"Gald"] = memory.ReadValue<int>(enemyPointer2 + 0x74);
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
