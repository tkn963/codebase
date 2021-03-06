--[[
Jamba - Jafula's Awesome Multi-Boxer Assistant
Copyright 2008 - 2010 Michael "Jafula" Miller
All Rights Reserved
http://wow.jafula.com/addons/jamba/
jamba at jafula dot com
]]--

local L = LibStub("AceLocale-3.0"):NewLocale( "Jamba-Toon", "koKR" )
if L then
L["Slash Commands"] = true
L["Toon: Warnings"] = true
L["Push Settings"] = true
L["Push the toon settings to all characters in the team."] = true
L["Settings received from A."] = function( characterName )
    return string.format( "Settings received from %s.", characterName )
end
L["Toon"] = true
L[": "] = true
L["I'm Attacked!"] = true
L["Not Targeting!"] = true
L["Not Focus!"] = true
L["Low Health!"] = true
L["Low Mana!"] = true
L["Merchant"] = true
L["Auto Repair"] = true
L["Auto Repair With Guild Funds"] = true
L["Send Request Message Area"] = true
L["Requests"] = true
L["Auto Deny Duels"] = true
L["Auto Deny Guild Invites"] = true
L["Auto Accept Resurrect Request"] = true
L["Send Request Message Area"] = true
L["Combat"] = true
L["Health / Mana"] = true
L["Bag Space"] = true
L["Bags Full!"] = true
L["Warn If All Regular Bags Are Full"] = true
L["Bags Full Message"] = true    
L["Warn If Hit First Time In Combat (Slave)"] = true
L["Hit First Time Message"] = true
L["Warn If Target Not Master On Combat (Slave)"] = true
L["Warn Target Not Master Message"] = true
L["Warn If Focus Not Master On Combat (Slave)"] = true
L["Warn Focus Not Master Message"] = true
L["Warn If My Health Drops Below"] = true
L["Health Amount - Percentage Allowed Before Warning"] = true
L["Warn Health Drop Message"] = true
L["Warn If My Mana Drops Below"] = true
L["Mana Amount - Percentage Allowed Before Warning"] = true
L["Warn Mana Drop Message"] = true
L["Send Warning Area"]  = true
L["I refused a guild invite to: X from: Y"] = function( guild, inviter )
    return string.format( "I refused a guild invite to: %s from: %s", guild, inviter )
end
L["I refused a duel from: X"] = function( challenger )
    return string.format( "I refused a duel from: %s", challenger )
end
L["I do not have enough money to repair all my items."] = true
L["Repairing cost me: X"] = function( costString )
    return string.format( "Repairing cost me: %s", costString )
end
L["I am inactive!"] = true
L["Warn If Toon Goes Inactive (PVP)"] = true
L["Inactive Message"] = true
-- Brgin special.
-- This is the inactive buff - you need to make sure it is localized correctly.
-- http://www.wowhead.com/spell=43681
L["Inactive"] = true
-- End special.
L["Currency"] = true
L["Show Currency"] = true
L["Show the current toon the currency values for all members in the team."] = true
L["Blizzard Tooltip"] = true
L["Blizzard Dialog Background"] = true
L["Curr"] = true
L["Jamba Currency"] = true
L["Update"] = true
L["Gold"] = true
L["Include Gold In Guild Bank"] = true
L["Total"] = true
L["Guild"] = true
L["Emblem of Frost"] = true
L["EoF"] = true
L["Emblem of Triumph"] = true
L["EoT"] = true
L["Emblem of Conquest"] = true
L["EoC"] = true
L["Emblem of Valor"] = true
L["EoV"] = true
L["Emblem of Heroism"] = true
L["EoH"] = true
L["Honor Points"] = true
L["HP"] = true
L["Arena Points"] = true
L["AP"] = true
L[" ("] = true
L[")"] = true
L["Currency Selection"] = true
L["Scale"] = true
L["Transparency"] = true
L["Border Style"] = true
L["Border Colour"] = true
L["Background"] = true
L["Background Colour"] = true
L["Appearance & Layout"] = true
L["Space For Name"] = true
L["Space For Gold"] = true
L["Space For Points"] = true
L["Space Between Values"] = true
L["Lock Currency List (enables mouse click-through)"] = true
L["Open Currency List On Start Up (Master Only)"] = true
L["Currency"] = true
L["Show Currency"] = true
L["Show the current toon the currency values for all members in the team."] = true
L["Blizzard Tooltip"] = true
L["Blizzard Dialog Background"] = true
L["Curr"] = true
L["Jamba Currency"] = true
L["Update"] = true
L["Gold"] = true
L["Include Gold In Guild Bank"] = true
L["Total"] = true
L["Guild"] = true
L["Emblem of Frost"] = true
L["EoF"] = true
L["Emblem of Triumph"] = true
L["EoT"] = true
L["Emblem of Conquest"] = true
L["EoC"] = true
L["Emblem of Valor"] = true
L["EoV"] = true
L["Emblem of Heroism"] = true
L["EoH"] = true
L["Honor Points"] = true
L["HP"] = true
L["Arena Points"] = true
L["AP"] = true
L[" ("] = true
L[")"] = true
L["Currency Selection"] = true
L["Scale"] = true
L["Transparency"] = true
L["Border Style"] = true
L["Border Colour"] = true
L["Background"] = true
L["Background Colour"] = true
L["Appearance & Layout"] = true
L["Space For Name"] = true
L["Space For Gold"] = true
L["Space For Points"] = true
L["Space Between Values"] = true
L["Lock Currency List (enables mouse click-through)"] = true
L["Open Currency List On Start Up (Master Only)"] = true
end
