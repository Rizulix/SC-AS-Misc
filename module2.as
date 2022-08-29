// ERROR: Angelscript: [directory]/module2.as (0, 0) : Invalid #pragma directive
// #pragma once

void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor('Rizulix');
	g_Module.ScriptInfo.SetContactInfo('https://discord.gg/svencoop');
}

// ERROR: Angelscript: Error while validating module 'Module 2': Can't have imported functions!!
// import void Spawn() from 'MapModule'; // svencoop/scripts/maps/stadium/env_te.as -> void Spawn()

external shared void HelloWorld();
CClientCommand _a('hello', 'Hello command', function(const CCommand@ args) {
	g_Game.AlertMessage(at_console, '[Module 2]: ".hello" command!\n');
	HelloWorld();
});

external shared enum MyEnum;
external shared funcdef int callback(int, int);
external shared void PrintOperation(int, int, callback@);
CClientCommand _b('operations', 'Operations command', function(const CCommand@ args) {
	g_Game.AlertMessage(at_console, '[Module 2]: ".hello" command!\n');
	PrintOperation(DIGIT_3, DIGIT_2, function(int a, int b) { return a + b; });
	PrintOperation(DIGIT_3, DIGIT_2, function(int a, int b) { return a - b; });
	PrintOperation(DIGIT_3, DIGIT_2, function(int a, int b) { return a * b; });
	PrintOperation(DIGIT_3, DIGIT_2, function(int a, int b) { return a ** b; });
});

CClientCommand _c('catch', 'Catch command', function(const CCommand@ args) {
	g_Game.AlertMessage(at_console, '[Module 2]: ".catch" command!\n');
	CBaseEntity@ pEntity = g_EntityFuncs.Instance(Math.RandomLong(-1, g_Engine.maxClients + 5));
	try {
		// Angelscript: Message: Null pointer access
		g_Game.AlertMessage(at_console, '[Module 2]: Classname:%1!\n', pEntity.GetClassname());
	} catch {
		g_Game.AlertMessage(at_console, '[Module 2]: You naughty boy!\n');
	}
});

CClientCommand _d('compiled', 'Compiled command', function(const CCommand@ args) {
	g_Game.AlertMessage(at_console, '[Module 2]: ".compiled" command!\n');
#if SERVER
	g_Game.AlertMessage(at_console, '[Module 2]: #if SERVER... OK!\n');
#endif
#if CLIENT
	g_Game.AlertMessage(at_console, '[Module 2]: #if CLIENT... OK!\n');
#endif
#if WIN32
	g_Game.AlertMessage(at_console, '[Module 2]: #if WIN32... OK!\n');
#endif
});

/* IDK if this is achievable:
// VANILLA: defined with SvenMod or SMTH
// METAHOOK: defined with MetaHookSv or SMTH

#if VANILLA
external shared int IsMetaPlayer(edict_t@);
#endif
CClientCommand _e('meta_player', "I'm MetaPlayer?", function(const CCommand@ args) {
	CBasePlayer pPlayer = g_ConCommandSystem.GetCurrentPlayer();

	bool bIsMetaPlayer = false;
#if VANILLA
	bIsMetaPlayer = IsMetaPlayer(pPlayer.edict());
#endif
#if METAHOOK
	bIsMetaPlayer = g_MetaHook.IsMetaPlayer(pPlayer.edict());
#endif
	// Do something knowing the player uses MetaHook or no...
});
*/


