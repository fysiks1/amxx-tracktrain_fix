#include <amxmodx>
#include <hamsandwich>

#define PLUGIN "tracktrain_fix"
#define VERSION "1.1"
#define AUTHOR "Vet(3TT3V)"

#define CLASS_PATH "path_track"

public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR)

	RegisterHam(Ham_DOD_RoundRespawnEnt, CLASS_PATH, "HAM_pathRS_ent", 0)
	RegisterHam(Ham_DOD_RoundRespawn, CLASS_PATH, "HAM_pathRS", 0)

	return PLUGIN_CONTINUE
}

public HAM_pathRS_ent(ent)
{
	//console_print(0, "path RSpawn_ent %d", ent)
	//return HAM_SUPERCEDE
	return HAM_IGNORED
}

public HAM_pathRS(ent)
{
	//console_print(0, "path RSpawn %d", ent)
	return HAM_SUPERCEDE
	//return HAM_IGNORED
}

/*
	Notes:
 	If either ONE or BOTH are superceded, the tracktrain works.
	Ham_DOD_RoundRespawnEnt is called 1st, BEFORE Ham_DOD_RoundRespawn.
	If Ham_DOD_RoundRespawnEnt is superceded, Ham_DOD_RoundRespawn isn't called.
	Thus, I assume Ham_DOD_RoundRespawn is called by Ham_DOD_RoundRespawnEnt.
	So I'd recommend superceding Ham_DOD_RoundRespawn so at least if anything else is
	done within Ham_DOD_RoundRespawnEnt, is still gets caried out.
*/