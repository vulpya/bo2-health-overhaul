// @Author: Vulpya
// @Version: 1.0.0

#include maps\mp\_utility;
#include common_scripts\utility;

#define MAX_HEALTH 150

init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for (;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawnLoop();
    }
}

onPlayerSpawnLoop()
{
    self endon("disconnect");
    level endon("game_ended");

    for (;;)
    {
        self waittill("spawned_player");

        self thread applyHealthTweaks();
    }
}

applyHealthTweaks()
{
    self endon("disconnect");
    level endon("game_ended");

    self.maxhealth = MAX_HEALTH;
    self.health = self.maxhealth;

    self iprintln("3-Hit Down: ^2ON");

    for (;;)
    {
        self waittill("player_revived");

        self.maxhealth = MAX_HEALTH;
        self.health = self.maxhealth;
    }
}