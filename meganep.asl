state("NeptuniaVII", "SteamCurrent")
{
	int SaveBlock : 0x6F7F98;
	string64 Cutscene : 0x6F7F98, 0x348;
	int EnemyBookSize : 0x6F7F98, 0xA0278;
	byte TrueEndProgression : 0x6F7F98, 0x160;
	uint EventID : 0x6F7B08, 0x24, 0x10;
	uint DungeonID : 0x706A78, 0x10;
}
startup
{
	print("Autosplitter loading....");
	
	settings.Add("startnewgame", true, "Start on New Game");
	settings.SetToolTip("startnewgame", "Start on New Game select - use timer offset 1.43");
	
	settings.Add("startngplus", false, "Start on New Game Plus");
	settings.SetToolTip("startngplus", "Start on New Game Plus Zero Dimension title input - use timer offset 1.20");
	
	settings.Add("killenemies", true, "Kill Enemies");
	
	settings.Add("zdenemies", true, "ZD Neptunia Z Enemies", "killenemies");
	settings.Add("kill-110", false, "Argo Deus", "zdenemies");
	settings.Add("kill-120", true, "Hi-Metal Guarders", "zdenemies");
	settings.Add("kill-130", false, "Serpentis", "zdenemies");
	settings.Add("kill-140", false, "Mega Slaymon", "zdenemies");
	settings.Add("kill-150", false, "Uniceldos", "zdenemies");
	settings.Add("kill-160", true, "Giga Slaymon", "zdenemies");
	settings.Add("kill-170", true, "Dark Purple 1", "zdenemies");
	settings.Add("kill-180", true, "Gagamut", "zdenemies");
	settings.Add("kill-200", true, "Ancient Dragon", "zdenemies");
	settings.Add("kill-210", false, "Arfoire 1", "zdenemies");
	settings.Add("kill-220", true, "Arfoire 2", "zdenemies");
	settings.Add("kill-230", true, "Arfoire 3", "zdenemies");
	settings.Add("kill-240", true, "Ka'Hoole", "zdenemies");
	settings.Add("kill-250", true, "La Ignis", "zdenemies");
	settings.Add("kill-260", true, "Dark Purple 2", "zdenemies");
	
	settings.Add("hdenemies", true, "HD Neptunia G Enemies", "killenemies");
	settings.Add("kill-280", true, "(Nep) Arfoire 4", "hdenemies");
	settings.Add("kill-300", true, "(Nep) Warechu", "hdenemies");
	settings.Add("kill-310", true, "(Nep) Steamax", "hdenemies");
	settings.Add("kill-320", false, "(Nep) B-Sha 1", "hdenemies");
	settings.Add("kill-330", true, "(Nep) Warechu King", "hdenemies");
	settings.Add("kill-340", false, "(Noire) Hellish Turtle", "hdenemies");
	settings.Add("kill-350", true, "(Noire) Dark Unicorn", "hdenemies");
	settings.Add("kill-360", true, "(Noire) Demonic Law", "hdenemies");
	settings.Add("kill-370", false, "(Noire) Golvellia", "hdenemies");
	settings.Add("kill-380", true, "(Noire) K-Sha 1", "hdenemies");
	settings.Add("kill-390", true, "(Noire) M-Gear", "hdenemies");
	settings.Add("kill-400", true, "(Noire) K-Sha 2", "hdenemies");
	settings.Add("kill-410", false, "(Blanc) Delusion Rabbits", "hdenemies");
	settings.Add("kill-420", true, "(Blanc) Delusion Turtle", "hdenemies");
	settings.Add("kill-440", true, "(Blanc) Revile Wyrm", "hdenemies");
	settings.Add("kill-490", true, "(Blanc) C-Sha", "hdenemies");
	settings.Add("kill-500", false, "(Vert) Gun Ixion", "hdenemies");
	settings.Add("kill-510", false, "(Vert) Pandea Leos", "hdenemies");
	settings.Add("kill-770", false, "(Vert) Berserker Z", "hdenemies");
	settings.Add("kill-520", true, "(Vert) Sarveria", "hdenemies");
	settings.Add("kill-530", false, "(Vert) Big Nep", "hdenemies");
	settings.Add("kill-540-541", false, "(Vert) Dogoos", "hdenemies");
	settings.Add("kill-550", true, "(Vert) S-Sha", "hdenemies");
	settings.Add("kill-560", true, "Steamax 2", "hdenemies");
	settings.Add("kill-570", false, "Affimojas 1", "hdenemies");
	settings.Add("kill-580", true, "Affimojas 2", "hdenemies");
	
	settings.Add("heartenemies", true, "HD Neptunia H Enemies", "killenemies");
	settings.Add("kill-590", false, "B-Sha Rematch", "heartenemies");
	settings.Add("kill-600", false, "K-Sha Rematch", "heartenemies");
	settings.Add("kill-610", false, "C-Sha Rematch", "heartenemies");
	settings.Add("kill-620", false, "S-Sha Rematch", "heartenemies");
	settings.Add("kill-590-600-610-620", true, "All 4 Sha rematches", "heartenemies");
	settings.Add("kill-630", false, "Magic Owl", "heartenemies");
	settings.Add("kill-640", true, "Final Arfoire", "heartenemies");
	settings.Add("kill-780-781-782-783", true, "Corrupted CPUs", "heartenemies");
	settings.Add("kill-650", false, "Dark Green", "heartenemies");
	settings.Add("kill-680", false, "Dark Black (Hyper Route)", "heartenemies");
	settings.Add("kill-690", true, "Darkness Beast (Hyper Route)", "heartenemies");
	settings.Add("kill-660-661-662-663", false, "Fake CPUs (Heart Route)", "heartenemies");
	settings.Add("kill-670", false, "Dark White (Heart Route)", "heartenemies");
	//settings.Add("kill-700", false, "Dark Orange 1", "heartenemies");
	settings.Add("kill-710", false, "Arc Wyrm", "heartenemies");
	settings.Add("kill-720", false, "Dark Orange 2", "heartenemies");
	//settings.Add("kill-730", false, "Kurome", "heartenemies");
	
	
	// Cutscenes
	settings.Add("cutscenes", true, "Split with Cutscene (True End events not included)");
	settings.Add("Mystery Report 1", false, "Ruins 2 Cutscene", "cutscenes");
	settings.Add("A Parting", false, "Neptune back to Hyper cutscene", "cutscenes");
	settings.Add("Collected All Materials", false, "Killed both ZD minibosses", "cutscenes");
	settings.Add("New Monsters in the Station?!", true, "Cutscene after Noire quest done", "cutscenes");
	settings.Add("Lowee Successfully Defended", false, "Cutscene after Blanc 4 fights in a row", "cutscenes");
	settings.Add("Yet Another Mission", true, "Cutscene after Vert quests done", "cutscenes");
	
	// Endings
	settings.Add("Further Into Delusion", true, "Bad End End Timing (skip cs in Oratorio)");
	settings.Add("kill-700", false, "Good End End Timing (kill Dark Orange 1)");
	settings.Add("kill-730", true, "True End End Timing (kill Kurome)");
	
	// True End Progression
	settings.Add("trueend", true, "True End Progression");
	settings.Add("trueend-1", true, "Progression 0->1 (ZD arc dream)", "trueend");
	settings.Add("trueend-2", true, "Progression 1->2 (Now that I recall)", "trueend");
	settings.Add("trueend-3", false, "Progression 2->3 (Histy's Request 1)", "trueend");
	settings.Add("trueend-4", false, "Progression 3->4 (Histy's Request 2)", "trueend");
	settings.Add("trueend-5", true, "Progression 4->5 (Histoire's Dream)", "trueend");
	settings.Add("trueend-6", false, "Progression 5->6 (Noire's Dream)", "trueend");
	settings.Add("trueend-7", false, "Progression 6->7 (Blanc's Dream)", "trueend");
	settings.Add("trueend-8", true, "Progression 7->8 (Vert's Dream)", "trueend");
	
	// Enter Dungeons
	settings.Add("dungeons", true, "Enter Dungeons for the first time");
	settings.Add("dungeon-701", false, "Enter Smash Box Stadium", "dungeons");
	
	// Trigger Events
	settings.Add("events", true, "Split when Events Start");
	settings.Add("event-11010", false, "Start Neptune Story", "events");
	settings.Add("event-12010", false, "Start Noire Story", "events");
	settings.Add("event-13010", false, "Start Blanc Story", "events");
	settings.Add("event-14010", false, "Start Vert Story", "events");

	settings.Add("loadremoval", true, "Remove supported loads (optional plugin, experimental)");
	settings.SetToolTip("loadremoval", "Requires VII Speedrun Patch LoadTiming. Current coverage: battle-entry character waits and initial dungeon map waits before control. Without a working plugin, timing and autosplitting continue normally.");

	// Optional VIILT001 bridge. Never gate start/split on this plugin.
	vars.loadRoot = IntPtr.Zero;
	vars.loadNextScan = 0L;
	vars.loadSample = null;
	vars.loadFrequency = Stopwatch.Frequency;
	vars.loadNow = (Func<long>)(() => Stopwatch.GetTimestamp());
	vars.readLoadSample = (Func<long[]>)(() => null);
	vars.loadRemovalEnabled = (Func<bool>)(() => false);
	vars.loadLock = new object();
	vars.loadActive = false;
	vars.loadSampleRealTicks = 0L;
	vars.loadRemovedTicks = 0m;
	// Preserve the existing Game Time offset if the script is reloaded mid-run.
	var attachedTime = timer.CurrentTime;
	if (timer.CurrentPhase != TimerPhase.NotRunning && attachedTime.RealTime.HasValue && attachedTime.GameTime.HasValue)
		vars.loadRemovedTicks = Math.Max(0m, (decimal)(attachedTime.RealTime.Value - attachedTime.GameTime.Value).Ticks);
	vars.pollLoadTiming = (Action<bool, bool>)((count, pauseBoundary) =>
	{
		lock (vars.loadLock) {
			// Missing data drops the anchor, so recovery never deducts an unknown gap.
			long[] sample = vars.gameConnected && vars.loadRemovalEnabled() ? vars.readLoadSample() : null;
			long[] previous = vars.loadSample;
			long realTicks = (timer.CurrentTime.RealTime ?? TimeSpan.Zero).Ticks;
			if (sample != null && previous != null && count) {
				long delta = sample[1] - previous[1];
				long elapsed = sample[0] - previous[0];
				if (elapsed < 0 || delta < 0 || delta > elapsed) sample = null;
				else {
					decimal ticks = (decimal)delta * TimeSpan.TicksPerSecond / (long)vars.loadFrequency;
					// Clip only the manual-pause boundary. Per-poll clipping would
					// permanently lose time to QPC/Real Time sampling jitter.
					if (pauseBoundary) ticks = Math.Min(ticks, Math.Max(0L, realTicks - (long)vars.loadSampleRealTicks));
					vars.loadRemovedTicks += ticks;
				}
			}
			vars.loadSample = sample;
			vars.loadSampleRealTicks = realTicks;
			vars.loadActive = count && sample != null && sample[2] != 0;
		}
	});
	vars.resetLoadTiming = (Action)(() =>
	{
		lock (vars.loadLock) {
			vars.loadRemovedTicks = 0m;
			vars.loadSample = null;
			vars.loadActive = false;
			timer.IsGameTimePaused = false;
		}
	});

	vars.gameConnected = false;
	vars.timerJustStarted = false;
	vars.timerStartedSinceBoot = false;
	vars.cancelNextNGEvent = false;
	vars.timer_OnStart = (EventHandler)((s, e) =>
	{
		vars.timerJustStarted = true;
		vars.resetLoadTiming();
		vars.pollLoadTiming(false, false);
	});
	timer.OnStart += vars.timer_OnStart;
	vars.timer_OnLoadPause = (EventHandler)((sender, e) =>
	{
		// OnPause fires after RealTime is frozen; collect only the running prefix.
		vars.pollLoadTiming(true, true);
		lock (vars.loadLock) { vars.loadSample = null; vars.loadActive = false; }
	});
	vars.timer_OnLoadResume = (EventHandler)((sender, e) => vars.pollLoadTiming(false, false));
	timer.OnPause += vars.timer_OnLoadPause;
	timer.OnResume += vars.timer_OnLoadResume;

	// offsets that can't be in state
	vars.enemyBookData = 0xA027C;
	
	print("Startup complete! CREDITS: Dabomstew");
	
}
shutdown
{
	vars.loadActive = false;
	timer.IsGameTimePaused = false;
	vars.readLoadSample = (Func<long[]>)(() => null);
	vars.loadRemovalEnabled = (Func<bool>)(() => false);
	vars.loadRoot = IntPtr.Zero;
	vars.loadSample = null;
	try {
	timer.OnStart -= vars.timer_OnStart;
	timer.OnPause -= vars.timer_OnLoadPause;
	timer.OnResume -= vars.timer_OnLoadResume;
	} catch {}
	vars.gameConnected = false;
	vars.timerStartedSinceBoot = false;
	vars.cancelNextNGEvent = false;
}
init
{
	// startup receives ASLSettingsBuilder; only runtime actions receive its reader.
	// Capture the reader here so timer callbacks also see current setting values.
	vars.loadRemovalEnabled = (Func<bool>)(() => settings["loadremoval"]);

	vars.loadActive = false;
	timer.IsGameTimePaused = false;
	print("Game found!");
	print("module size: " + modules.First().ModuleMemorySize);
	vars.timerStartedSinceBoot = false;
	
	if (modules.First().ModuleMemorySize == 76976128) {
		print("Found and confirmed Steam Current Patch");
		version = "SteamCurrent";
		vars.gameConnected = true;
	}
	else {
		print("Unrecognized game version. Disabling functionality.");
		vars.gameConnected = false;
	}
	
	vars.cancelNextNGEvent = false;

	vars.loadRoot = IntPtr.Zero;
	vars.loadNextScan = 0L;
	vars.loadSample = null;
	// Capture this process only. exit/shutdown replace the delegate before reuse.
	vars.readLoadSample = (Func<long[]>)(() =>
	{
		try {
			Func<long, IntPtr> pointer = address => IntPtr.Size == 4
				? new IntPtr(unchecked((int)address)) : new IntPtr(address);
			if ((IntPtr)vars.loadRoot == IntPtr.Zero) {
				long now = vars.loadNow();
				if (now < (long)vars.loadNextScan) return null;
				vars.loadNextScan = now + (long)vars.loadFrequency;
				var proxy = game.ModulesWow64Safe().FirstOrDefault(m =>
					m.ModuleName.Equals("dinput8.dll", StringComparison.OrdinalIgnoreCase));
				if (proxy == null) return null;
				long begin = proxy.BaseAddress.ToInt64() & 0xffffffffL;
				long end = begin + proxy.ModuleMemorySize;
				var hits = new List<IntPtr>();
				// Skip discarded/no-access image pages instead of reading the whole DLL.
				for (long address = begin; address < end; ) {
					MemoryBasicInformation page;
					if (WinAPI.VirtualQueryEx(game.Handle, pointer(address), out page,
						(UIntPtr)System.Runtime.InteropServices.Marshal.SizeOf(typeof(MemoryBasicInformation))) == UIntPtr.Zero)
						return null;
					long stop = Math.Min(end, (page.BaseAddress.ToInt64() & 0xffffffffL) + (long)page.RegionSize);
					if (stop <= address) return null;
					if (page.State == MemPageState.MEM_COMMIT && ((uint)page.Protect & 0x101) == 0) {
						var scanner = new SignatureScanner(game, pointer(address), (int)(stop - address));
						hits.AddRange(scanner.ScanAll(new SigScanTarget("56 49 49 4C 54 30 30 31")).Take(2));
						if (hits.Count > 1) return null;
					}
					address = stop;
				}
				if (hits.Count != 1) return null;
				byte[] descriptor = memory.ReadBytes(hits[0], 24);
				if (descriptor == null || descriptor.Length != 24 ||
					BitConverter.ToUInt32(descriptor, 8) != 1 ||
					BitConverter.ToUInt32(descriptor, 12) != 24 ||
					BitConverter.ToUInt32(descriptor, 20) != 112) return null;
				long root = BitConverter.ToUInt32(descriptor, 16);
				if (root < begin || root > end - 112 || root % 8 != 0) return null;
				vars.loadRoot = pointer(root);
			}
			IntPtr state = (IntPtr)vars.loadRoot;
			for (int attempt = 0; attempt < 8; attempt++) {
				byte[] before = memory.ReadBytes(state, 4);
				if (before == null || before.Length != 4) break;
				uint sequence = BitConverter.ToUInt32(before, 0);
				if ((sequence & 1) != 0) continue;
				byte[] data = memory.ReadBytes(state, 112);
				long qpc = vars.loadNow();
				byte[] after = memory.ReadBytes(state, 4);
				if (data == null || data.Length != 112 || after == null || after.Length != 4) break;
				if (sequence != BitConverter.ToUInt32(data, 0) || sequence != BitConverter.ToUInt32(after, 0)) continue;
				// ABI 1: battle characters (1), initial dungeon map (2). Reject unknown bits.
				uint coverage = BitConverter.ToUInt32(data, 12);
				if (BitConverter.ToUInt32(data, 8) != 1 || coverage == 0 || (coverage & ~3u) != 0 ||
					BitConverter.ToUInt32(data, 36) != 0) return null;
				long frequency = BitConverter.ToInt64(data, 56);
				long completed = BitConverter.ToInt64(data, 64);
				long opened = BitConverter.ToInt64(data, 72);
				long observed = BitConverter.ToInt64(data, 80);
				uint reason = BitConverter.ToUInt32(data, 16);
				if (frequency <= 0 || frequency != (long)vars.loadFrequency || completed < 0 ||
					observed < 0 || qpc < observed || (reason & ~coverage) != 0 || (reason != 0) != (opened != 0)) return null;
				if (reason != 0 && (opened < 0 || opened > observed ||
					BitConverter.ToUInt32(data, 20) == 0 || BitConverter.ToUInt32(data, 32) != 1 ||
					qpc - observed > frequency / 2)) return null;
				return new long[] { qpc, checked(completed + (reason != 0 ? qpc - opened : 0)), reason };
			}
			// Bounded retries, then fail open; reacquire a lost image on a later poll.
			vars.loadRoot = IntPtr.Zero;
		} catch {
			vars.loadRoot = IntPtr.Zero;
		}
		return null;
	});
}
exit
{
	vars.loadActive = false;
	timer.IsGameTimePaused = false;
	vars.readLoadSample = (Func<long[]>)(() => null);
	vars.loadRemovalEnabled = (Func<bool>)(() => false);
	vars.loadRoot = IntPtr.Zero;
	vars.loadSample = null;
	vars.gameConnected = false;
	vars.timerStartedSinceBoot = false;
	vars.cancelNextNGEvent = false;
}
update
{
	if(!vars.gameConnected)
	{
		return false;
	}
	
	vars.pollLoadTiming(timer.CurrentPhase == TimerPhase.Running, false);

	// if we see a cutscene of Clear Data, null the next event id 1 timer start
	try {
		if(settings["startnewgame"] && settings["startngplus"] && current.Cutscene.Trim().Equals("Clear Data", StringComparison.InvariantCultureIgnoreCase)) {
			//print("Arming cancel next NG event");
			vars.cancelNextNGEvent = true;
		}
	}
	catch {}
	
	if(vars.timerJustStarted) {
		vars.slowRefresh = false;
		refreshRate = 60;
		vars.trueEndSplitsDone = new bool[256];
		
		// read initial kill values
		vars.initialKills = new int[5462]; // highest enemy id is 5461
		vars.killedInRun = new bool[5462];
		byte[] enemyBook = memory.ReadBytes((System.IntPtr) (current.SaveBlock + vars.enemyBookData), (int) (current.EnemyBookSize*8));
		for(int i = 0; i < current.EnemyBookSize; i++) {
			ushort enemyId = BitConverter.ToUInt16(enemyBook, i*8);
			vars.initialKills[enemyId] = BitConverter.ToInt32(enemyBook, i*8 + 4);
			//print("Seeded initial kills: "+enemyId+" = "+vars.initialKills[enemyId]);
		}
		vars.timerJustStarted = false;
		vars.timerStartedSinceBoot = true;
		
		vars.killAmountOverrides = new System.Collections.Generic.Dictionary<int, int>();
		vars.killAmountOverrides[120] = 3; // Hi-Metal Guarders
		vars.killAmountOverrides[410] = 3; // Delusion Rabbits
		
		vars.multiKillSplits = new System.Collections.Generic.Dictionary<string, int[]>();
		vars.multiKillSplits["kill-540-541"] = new int[] { 540, 541 };
		vars.multiKillSplits["kill-590-600-610-620"] = new int[] { 590, 600, 610, 620 };
		vars.multiKillSplits["kill-780-781-782-783"] = new int[] { 780, 781, 782, 783 };
		vars.multiKillSplits["kill-660-661-662-663"] = new int[] { 660, 661, 662, 663 };
		vars.multiKillSplitsHit = new System.Collections.Generic.HashSet<string>();
		
		vars.dungeonSplitsHit = new System.Collections.Generic.HashSet<uint>();
		vars.eventSplitsHit = new System.Collections.Generic.HashSet<uint>();
	}
    return true;
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
			if (!current.Cutscene.Equals(old.Cutscene) && settings[current.Cutscene.Trim()])
			{
				//print("Split for " + current.Cutscene + " Cutscene.");
				return true;
			}
		} catch {}
	}
	
	// split for events
	if (settings["events"])
	{
		try {
			//if (current.EventID != old.EventID) print("Saw event "+current.EventID);
			if (current.EventID != old.EventID && settings["event-"+current.EventID] && vars.eventSplitsHit.Add(current.EventID))
			{
				//print("Split for " + current.EventID + " Event.");
				return true;
			}
		} catch {}
	}
	
	// split for dungeons
	if(settings["dungeons"])
	{
		try {
			if (current.DungeonID != old.DungeonID && settings["dungeon-"+current.DungeonID] && vars.dungeonSplitsHit.Add(current.DungeonID))
			{
				//print("Split for " + current.DungeonID + " Dungeon.");
				return true;
			}
		} catch {}
	}
	
	// split for enemy kills
	byte[] enemyBook = memory.ReadBytes((System.IntPtr) (current.SaveBlock + vars.enemyBookData), (int) (current.EnemyBookSize*8));
	for(int i = 0; i < current.EnemyBookSize; i++) {
		ushort enemyID = BitConverter.ToUInt16(enemyBook, i*8);
		if (vars.killedInRun[enemyID]) continue;
		int kills = BitConverter.ToInt32(enemyBook, i*8 + 4) - vars.initialKills[enemyID];
		int threshold;
		if(!vars.killAmountOverrides.TryGetValue(enemyID, out threshold)) threshold = 1;
		if(kills >= threshold) {
			//print("Marking "+enemyID+" as killed: "+kills+" - "+vars.initialKills[enemyID]+" vs "+BitConverter.ToInt32(enemyBook, i*8 + 4));
			vars.killedInRun[enemyID] = true;
			if(settings["kill-"+enemyID]) {
				//print("Split for killing enemy "+enemyID+".");
				return true;
			}
		}
	}
	
	// multi enemy kill splits
	foreach(var splitKey in vars.multiKillSplits.Keys) {
		if(settings[splitKey] && !vars.multiKillSplitsHit.Contains(splitKey)) {
			bool allKilled = true;
			foreach(var enemyId in vars.multiKillSplits[splitKey]) {
				if(!vars.killedInRun[enemyId]) allKilled = false;
			}
			if (allKilled) {
				//print("Split for multiple kill: "+splitKey);
				vars.multiKillSplitsHit.Add(splitKey);
				return true;
			}
		}
	}
	
	// true end progression splits
	for(int prog = 1; prog <= current.TrueEndProgression; prog++) {
		if(settings["trueend-"+prog] && !vars.trueEndSplitsDone[prog]) {
			//print("Splitting for true end progression: "+prog);
			vars.trueEndSplitsDone[prog] = true;
			return true;
		}
	}
}
start
{
	// New Game
	if(settings["startnewgame"] && current.EventID == 1 && old.EventID != 1) {
		if(vars.cancelNextNGEvent) {
			vars.cancelNextNGEvent = false;
			return false;
		}
		return true;
	}
	
	// New Game Plus
	if(settings["startngplus"] && current.EventID == 10 && old.EventID != 10) {
		vars.cancelNextNGEvent = false;
		return true;
	}
}

onReset
{
	vars.resetLoadTiming();
}
isLoading
{
	// Interpolation only. gameTime below is the sole load-deduction authority.
	return vars.gameConnected && settings["loadremoval"] && vars.loadActive;
}
gameTime
{
	if (!timer.CurrentTime.RealTime.HasValue) return null;
	lock (vars.loadLock) {
		return timer.CurrentTime.RealTime.Value - TimeSpan.FromTicks((long)(decimal)vars.loadRemovedTicks);
	}
}
