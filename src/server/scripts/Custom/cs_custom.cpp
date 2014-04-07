#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "MapManager.h"
#include "Chat.h"
#include "Group.h"
#include "Language.h"
#include "InstanceSaveMgr.h"
#include "InstanceScript.h"
#include "Player.h"

class custom_commandscript : public CommandScript
{
public:
    custom_commandscript() : CommandScript("custom_commandscript") { }

    ChatCommand* GetCommands() const OVERRIDE
    {

        static ChatCommand commandTable[] =
        {
			{ "flyme",           rbac::RBAC_PERM_COMMAND_FLYME,      true, HandleFlyMECommand,                   "", NULL },
			{ "unbindme",           rbac::RBAC_PERM_COMMAND_UNBINDME,      true, HandleUnbindMECommand,                   "", NULL },
			{ "morphme",           rbac::RBAC_PERM_COMMAND_MORPHME,      true, HandleMorphMECommand,                   "", NULL },
            { NULL,             0,                  false, NULL,                               "", NULL }
        };
        return commandTable;
    }

	static bool HandleFlyMECommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;

		Player* target = handler->GetSession()->GetPlayer();

        WorldPacket data(12);
        if (strncmp(args, "on", 3) == 0)
            data.SetOpcode(SMSG_MOVE_SET_CAN_FLY);
        else if (strncmp(args, "off", 4) == 0)
            data.SetOpcode(SMSG_MOVE_UNSET_CAN_FLY);
        else
        {
            handler->SendSysMessage(LANG_USE_BOL);
            return false;
        }
        data.append(target->GetPackGUID());
        data << uint32(0);                                      // unknown
        target->SendMessageToSet(&data, true);
        handler->PSendSysMessage(LANG_COMMAND_FLYMODE_STATUS, handler->GetNameLink(target).c_str(), args);
        return true;
    }
	static std::string GetTimeString(uint64 time)
	{
		uint64 days = time / DAY, hours = (time % DAY) / HOUR, minute = (time % HOUR) / MINUTE;
		std::ostringstream ss;
		if (days)
			ss << days << "d ";
		if (hours)
			ss << hours << "h ";
		ss << minute << 'm';
		return ss.str();
	}
	static bool HandleUnbindMECommand(ChatHandler* handler, char const* args)
    {
        if (!*args)
            return false;


		Player* player = handler->GetSession()->GetPlayer();

        char* map = strtok((char*)args, " ");
        char* pDiff = strtok(NULL, " ");
        int8 diff = -1;
        if (pDiff)
            diff = atoi(pDiff);
        uint16 counter = 0;
        uint16 MapId = 0;

        if (strcmp(map, "all"))
        {
            MapId = uint16(atoi(map));
            if (!MapId)
                return false;
        }

        for (uint8 i = 0; i < MAX_DIFFICULTY; ++i)
        {
            Player::BoundInstancesMap &binds = player->GetBoundInstances(Difficulty(i));
            for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
            {
                InstanceSave* save = itr->second.save;
                if (itr->first != player->GetMapId() && (!MapId || MapId == itr->first) && (diff == -1 || diff == save->GetDifficulty()))
                {
                    std::string timeleft = GetTimeString(save->GetResetTime() - time(NULL));
                    handler->PSendSysMessage("unbinding map: %d inst: %d perm: %s diff: %d canReset: %s TTR: %s", itr->first, save->GetInstanceId(), itr->second.perm ? "yes" : "no", save->GetDifficulty(), save->CanReset() ? "yes" : "no", timeleft.c_str());
                    player->UnbindInstance(itr, Difficulty(i));
                    counter++;
                }
                else
                    ++itr;
            }
        }
        handler->PSendSysMessage("instances unbound: %d", counter);

        return true;
    }

	static bool HandleMorphMECommand(ChatHandler* handler, const char* args)
    {
        if (!*args)
            return false;

        uint16 display_id = (uint16)atoi((char*)args);

		Unit* target = handler->GetSession()->GetPlayer();

        // check online security
        if (target->GetTypeId() == TYPEID_PLAYER && handler->HasLowerSecurity(target->ToPlayer(), 0))
            return false;

        target->SetDisplayId(display_id);

        return true;
    }
};





void AddSC_custom_commandscript()
{
    new custom_commandscript();
}