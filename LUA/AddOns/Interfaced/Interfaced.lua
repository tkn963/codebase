local INTERFACED, Interfaced = ...

BINDING_HEADER_INTERFACED = "Interfaced"
BINDING_NAME_TOGGLEBARTENDER = "Toggle Bartender Visibility"

local playerPositionX = -350
local playerPositionY = 100
local targetPositionX = 350
local targetPositionY = 100
local petPositionX = 59
local petPositionY = 52
local totemPositionX = 45
local totemPositionY = 48

local function round(num)
    return num + (2^52 + 2^51) - (2^52 + 2^51)
end

local function round2(num, dec)
    local power = 10^dec
    return math.floor(num * power) / power
end

local function Interfaced_SetUIPoints()
    local point, relativeTo, relativePoint, xOfs, yOfs = PlayerFrame:GetPoint()
    if ((not (round(xOfs) == playerPositionX)) or (not (round(yOfs) == playerPositionY))) then
        PlayerFrame:ClearAllPoints()
        PlayerFrame:SetPoint("CENTER", playerPositionX, playerPositionY)
    end

    local point, relativeTo, relativePoint, xOfs, yOfs = TargetFrame:GetPoint()
    if ((not (round(xOfs) == targetPositionX)) or (not (round(yOfs) == targetPositionY))) then
        TargetFrame:ClearAllPoints()
        TargetFrame:SetPoint("CENTER", targetPositionX, targetPositionY)
    end

    for i = 1, 4 do
        local frame = _G["PartyMemberFrame"..i]
        if (frame:IsVisible()) then
            frame:Hide()
        end
    end

    if (PetFrame) then
        local point, relativeTo, relativePoint, xOfs, yOfs = PetFrame:GetPoint()
        if ((not (round(xOfs) == petPositionX)) or (not (round(yOfs) == petPositionY))) then
            PetFrame:ClearAllPoints()
            PetFrame:SetPoint("CENTER", PlayerFrame, "CENTER", petPositionX, petPositionY)
        end
    end

    if (TotemFrame) then
        local point, relativeTo, relativePoint, xOfs, yOfs = TotemFrame:GetPoint()
        if ((not (round(xOfs) == totemPositionX)) or (not (round(yOfs) == totemPositionY))) then
            TotemFrame:ClearAllPoints()
            TotemFrame:SetPoint("CENTER", PlayerFrame, "CENTER", totemPositionX, totemPositionY)
        end
    end

    if (round2(CastingBarFrame:GetScale(), 2) ~= 0.64) then
        CastingBarFrame:SetScale(0.65)
    end

    local point, relativeTo, relativePoint, xOfs, yOfs = CastingBarFrame:GetPoint()
    if select(2, UnitClass("player")) == "DEATHKNIGHT" then
        if ((not (round(xOfs) == 75)) or (not (round(yOfs) == 60))) then
            CastingBarFrame:ClearAllPoints()
            CastingBarFrame:SetPoint("CENTER", PlayerFrame, "CENTER", 75, 60)
            CastingBarFrame.SetPoint = function() end
        end
    else
        if ((not (round(xOfs) == 75)) or (not (round(yOfs) == -40))) then
            CastingBarFrame:ClearAllPoints()
            CastingBarFrame:SetPoint("CENTER", PlayerFrame, "CENTER", 75, -40)
            CastingBarFrame.SetPoint = function() end
        end
    end

    if (CastingBarFrameBorder:GetTexture() ~= nil) then
        CastingBarFrameBorder:SetTexture(nil)
    end

    if (CastingBarFrameFlash:GetTexture() ~= nil) then
        CastingBarFrameFlash:SetTexture(nil)
    end
end

function Interfaced_ToggleBartenderVisibility()
    local visibility = Bartender4.Bar.barregistry["1"]:GetVisibilityOption("always")

    if (Bartender4.Bar.barregistry["1"]) then
        if (not Bartender4.Bar.barregistry["1"].disabled) then
            Bartender4.Bar.barregistry["1"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["2"]) then
        if (not Bartender4.Bar.barregistry["2"].disabled) then
            Bartender4.Bar.barregistry["2"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["3"]) then
        if (not Bartender4.Bar.barregistry["3"].disabled) then
            Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["4"]) then
        if (not Bartender4.Bar.barregistry["4"].disabled) then
            Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["5"]) then
        if (not Bartender4.Bar.barregistry["5"].disabled) then
            Bartender4.Bar.barregistry["5"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["6"]) then
        if (not Bartender4.Bar.barregistry["6"].disabled) then
            Bartender4.Bar.barregistry["6"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["7"]) then
        if (not Bartender4.Bar.barregistry["7"].disabled) then
            Bartender4.Bar.barregistry["7"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["8"]) then
        if (not Bartender4.Bar.barregistry["8"].disabled) then
            Bartender4.Bar.barregistry["8"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["9"]) then
        if (not Bartender4.Bar.barregistry["9"].disabled) then
            Bartender4.Bar.barregistry["9"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["10"]) then
        if (not Bartender4.Bar.barregistry["10"].disabled) then
            Bartender4.Bar.barregistry["10"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["BagBar"]) then
        if (not Bartender4.Bar.barregistry["BagBar"].disabled) then
            Bartender4.Bar.barregistry["BagBar"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["MicroMenu"]) then
        if (not Bartender4.Bar.barregistry["MicroMenu"].disabled) then
            Bartender4.Bar.barregistry["MicroMenu"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["PetBar"]) then
        if (not Bartender4.Bar.barregistry["PetBar"].disabled) then
            Bartender4.Bar.barregistry["PetBar"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["StanceBar"]) then
        if (not Bartender4.Bar.barregistry["StanceBar"].disabled) then
            Bartender4.Bar.barregistry["StanceBar"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["MultiCast"]) then
        if (not Bartender4.Bar.barregistry["MultiCast"].disabled) then
            Bartender4.Bar.barregistry["MultiCast"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["VehicleBar"]) then
        if (not Bartender4.Bar.barregistry["VehicleBar"].disabled) then
            Bartender4.Bar.barregistry["VehicleBar"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["Rep"]) then
        if (not Bartender4.Bar.barregistry["Rep"].disabled) then
            Bartender4.Bar.barregistry["Rep"]:SetVisibilityOption("always", not visibility)
        end
    end

    if (Bartender4.Bar.barregistry["XP"]) then
        if (not Bartender4.Bar.barregistry["XP"].disabled) then
            Bartender4.Bar.barregistry["XP"]:SetVisibilityOption("always", not visibility)
        end
    end
end

local uf = CreateFrame("FRAME")
local time = 0
uf:SetScript("OnUpdate", function(self, elapsed)
    time = time + elapsed
    if (time > 1) then
        Interfaced_SetUIPoints()
        time = 0
    end
end)

uf:RegisterEvent("PLAYER_ENTERING_WORLD")
uf:SetScript("OnEvent", function(self)
    Interfaced_SetUIPoints()
    MainMenuBarLeftEndCap:Hide()
    MainMenuBarRightEndCap:Hide()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    self:SetScript("OnEvent", nil)
end)
