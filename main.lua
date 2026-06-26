SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/rekoj.lua"))()
    assert(SMODS.load_file("jokers/lucky7.lua"))()
    assert(SMODS.load_file("jokers/theabyss.lua"))()
    assert(SMODS.load_file("jokers/stopswop.lua"))()
    assert(SMODS.load_file("jokers/jevil.lua"))()
    assert(SMODS.load_file("jokers/oopsall1s.lua"))()
    assert(SMODS.load_file("jokers/bluecard.lua"))()
    assert(SMODS.load_file("jokers/greencard.lua"))()
    assert(SMODS.load_file("jokers/pickyjoker.lua"))()
    assert(SMODS.load_file("jokers/yourit.lua"))()
    assert(SMODS.load_file("jokers/doublefornothing.lua"))()
    assert(SMODS.load_file("jokers/pi.lua"))()
    assert(SMODS.load_file("jokers/roulette.lua"))()
    assert(SMODS.load_file("jokers/theinteruptingcow.lua"))()
    assert(SMODS.load_file("jokers/consumed.lua"))()
    assert(SMODS.load_file("jokers/_67.lua"))()
    assert(SMODS.load_file("jokers/debitcard.lua"))()
    assert(SMODS.load_file("jokers/slotmachine.lua"))()
    assert(SMODS.load_file("jokers/handyjoker.lua"))()
    assert(SMODS.load_file("jokers/mirage.lua"))()
    assert(SMODS.load_file("jokers/quazy.lua"))()
    assert(SMODS.load_file("jokers/wherly.lua"))()
    assert(SMODS.load_file("jokers/robo.lua"))()
    assert(SMODS.load_file("jokers/paycheck.lua"))()
    assert(SMODS.load_file("jokers/isitreallyalllies.lua"))()
    assert(SMODS.load_file("jokers/sneakyjoker.lua"))()
    assert(SMODS.load_file("jokers/_2for1special.lua"))()
    assert(SMODS.load_file("jokers/patienceisavirtue.lua"))()
    assert(SMODS.load_file("jokers/wheelofwheels.lua"))()
    assert(SMODS.load_file("jokers/purpleguy.lua"))()
    assert(SMODS.load_file("jokers/jackofalltrades.lua"))()
    assert(SMODS.load_file("jokers/tom.lua"))()
    assert(SMODS.load_file("jokers/jerry.lua"))()
    assert(SMODS.load_file("jokers/poker.lua"))()
    assert(SMODS.load_file("jokers/operatingjoker.lua"))()
    assert(SMODS.load_file("jokers/potatofarmer.lua"))()
    assert(SMODS.load_file("jokers/potato.lua"))()
    assert(SMODS.load_file("jokers/thedream.lua"))()
    assert(SMODS.load_file("jokers/goldcard.lua"))()
    assert(SMODS.load_file("jokers/jingleingkeys.lua"))()
    assert(SMODS.load_file("jokers/wildcard.lua"))()
    assert(SMODS.load_file("jokers/oopsall7s.lua"))()
    assert(SMODS.load_file("jokers/jonkler.lua"))()
    assert(SMODS.load_file("jokers/don.lua"))()
    assert(SMODS.load_file("jokers/allfor1.lua"))()
    assert(SMODS.load_file("jokers/illusion.lua"))()
    assert(SMODS.load_file("jokers/thepeckers.lua"))()
    assert(SMODS.load_file("jokers/triggeredjoker.lua"))()
    assert(SMODS.load_file("jokers/theoryofpoker.lua"))()
    assert(SMODS.load_file("jokers/personalizedjoker.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/Energy.lua"))()
    assert(SMODS.load_file("consumables/ignus.lua"))()
    assert(SMODS.load_file("consumables/blank.lua"))()
    assert(SMODS.load_file("consumables/Harbinger.lua"))()
    assert(SMODS.load_file("consumables/Siphon.lua"))()
    assert(SMODS.load_file("consumables/transmute.lua"))()
    assert(SMODS.load_file("consumables/fabricate.lua"))()
    assert(SMODS.load_file("consumables/phantasm.lua"))()
    assert(SMODS.load_file("consumables/theseal.lua"))()
    assert(SMODS.load_file("consumables/synergia.lua"))()
    assert(SMODS.load_file("consumables/Ace of Cups.lua"))()
    assert(SMODS.load_file("consumables/King of Cups.lua"))()
    assert(SMODS.load_file("consumables/Queen of Cups.lua"))()
    assert(SMODS.load_file("consumables/knightofcups.lua"))()
    assert(SMODS.load_file("consumables/10 of Cups.lua"))()
    assert(SMODS.load_file("consumables/9 of Cups.lua"))()
    assert(SMODS.load_file("consumables/8 of Cups.lua"))()
    assert(SMODS.load_file("consumables/7 of Cups.lua"))()
    assert(SMODS.load_file("consumables/6 of Cups.lua"))()
    assert(SMODS.load_file("consumables/5 of Cups.lua"))()
    assert(SMODS.load_file("consumables/4 of Cups.lua"))()
    assert(SMODS.load_file("consumables/3 of Cups.lua"))()
    assert(SMODS.load_file("consumables/2 of Cups.lua"))()
    assert(SMODS.load_file("consumables/Ace of Wands.lua"))()
    assert(SMODS.load_file("consumables/King of Wands.lua"))()
    assert(SMODS.load_file("consumables/Queen of Wands.lua"))()
    assert(SMODS.load_file("consumables/Knight of Wands.lua"))()
    assert(SMODS.load_file("consumables/10 of Wands.lua"))()
    assert(SMODS.load_file("consumables/9 of Wands.lua"))()
    assert(SMODS.load_file("consumables/8 of Wands.lua"))()
    assert(SMODS.load_file("consumables/7 of Wands.lua"))()
    assert(SMODS.load_file("consumables/6 of Wands.lua"))()
    assert(SMODS.load_file("consumables/5 of Wands.lua"))()
    assert(SMODS.load_file("consumables/4 of Wands.lua"))()
    assert(SMODS.load_file("consumables/3 of Wands.lua"))()
    assert(SMODS.load_file("consumables/2 of Wands.lua"))()
    assert(SMODS.load_file("consumables/aceofswords.lua"))()
    assert(SMODS.load_file("consumables/King of Swords.lua"))()
    assert(SMODS.load_file("consumables/Queen of Swords.lua"))()
    assert(SMODS.load_file("consumables/Knight of Swords.lua"))()
    assert(SMODS.load_file("consumables/10 of Swords.lua"))()
    assert(SMODS.load_file("consumables/9 of Swords.lua"))()
    assert(SMODS.load_file("consumables/8 of Swords.lua"))()
    assert(SMODS.load_file("consumables/7 of Swords.lua"))()
    assert(SMODS.load_file("consumables/6 of Swords.lua"))()
    assert(SMODS.load_file("consumables/5 of Swords.lua"))()
    assert(SMODS.load_file("consumables/4 of Swords.lua"))()
    assert(SMODS.load_file("consumables/3 of Swords.lua"))()
    assert(SMODS.load_file("consumables/2 of Swords.lua"))()
    assert(SMODS.load_file("consumables/themagicaltree.lua"))()
end
--load the sets
assert(SMODS.load_file("consumables/sets.lua"))()
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/unstable.lua"))()
    assert(SMODS.load_file("enhancements/burnt.lua"))()
end

-- load the seals
if true then
    assert(SMODS.load_file("seals/pinkseal.lua"))()
    assert(SMODS.load_file("seals/yellowseal.lua"))()
    assert(SMODS.load_file("seals/spectralseal.lua"))()
    assert(SMODS.load_file("seals/sealseal.lua"))()
end

-- load the editions
if true then
    assert(SMODS.load_file("editions/glitter.lua"))()
    assert(SMODS.load_file("editions/monochrome.lua"))()
end

-- load the vouchers
if true then
    assert(SMODS.load_file("vouchers/backpack.lua"))()
    assert(SMODS.load_file("vouchers/extendo.lua"))()
    assert(SMODS.load_file("vouchers/out_of_stock.lua"))()
    assert(SMODS.load_file("vouchers/out_of_stock_plus.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/bomb_deck.lua"))()
    assert(SMODS.load_file("decks/time_travel_deck.lua"))()
    assert(SMODS.load_file("decks/unstable_deck.lua"))()
    assert(SMODS.load_file("decks/burnt_deck.lua"))()
    assert(SMODS.load_file("decks/spades_deck.lua"))()
    assert(SMODS.load_file("decks/hearts_deck.lua"))()
    assert(SMODS.load_file("decks/diamonds_deck.lua"))()
    assert(SMODS.load_file("decks/clubs_deck.lua"))()
end



assert(SMODS.load_file("rarities.lua"))()


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
--load sounds
assert(SMODS.load_file("sounds.lua"))()
SMODS.ObjectType({
    key = "mycustom_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "mycustom_mycustom_jokers",
    cards = {
        ["j_mycustom_rekoj"] = true,
        ["j_mycustom_lucky7"] = true,
        ["j_mycustom_theabyss"] = true,
        ["j_mycustom_stopswop"] = true,
        ["j_mycustom_jevil"] = true,
        ["j_mycustom_oopsall1s"] = true,
        ["j_mycustom_bluecard"] = true,
        ["j_mycustom_greencard"] = true,
        ["j_mycustom_pickyjoker"] = true,
        ["j_mycustom_yourit"] = true,
        ["j_mycustom_doublefornothing"] = true,
        ["j_mycustom_pi"] = true,
        ["j_mycustom_roulette"] = true,
        ["j_mycustom_theinteruptingcow"] = true,
        ["j_mycustom_consumed"] = true,
        ["j_mycustom__67"] = true,
        ["j_mycustom_debitcard"] = true,
        ["j_mycustom_slotmachine"] = true,
        ["j_mycustom_handyjoker"] = true,
        ["j_mycustom_mirage"] = true,
        ["j_mycustom_quazy"] = true,
        ["j_mycustom_wherly"] = true,
        ["j_mycustom_robo"] = true,
        ["j_mycustom_paycheck"] = true,
        ["j_mycustom_isitreallyalllies"] = true,
        ["j_mycustom_sneakyjoker"] = true,
        ["j_mycustom__2for1special"] = true,
        ["j_mycustom_patienceisavirtue"] = true,
        ["j_mycustom_wheelofwheels"] = true,
        ["j_mycustom_purpleguy"] = true,
        ["j_mycustom_jackofalltrades"] = true,
        ["j_mycustom_tom"] = true,
        ["j_mycustom_jerry"] = true,
        ["j_mycustom_poker"] = true,
        ["j_mycustom_operatingjoker"] = true,
        ["j_mycustom_potatofarmer"] = true
    },
})

SMODS.ObjectType({
    key = "mycustom_mycustom_jokerspotato",
    cards = {
        ["j_mycustom_potato"] = true
    },
})

SMODS.ObjectType({
    key = "mycustom_mycustom_jokerslegendary",
    cards = {
        ["j_mycustom_thedream"] = true,
        ["j_mycustom_goldcard"] = true,
        ["j_mycustom_jingleingkeys"] = true
    },
})

SMODS.ObjectType({
    key = "mycustom_mycustom_jokerssynergywild",
    cards = {
        ["j_mycustom_wildcard"] = true,
        ["j_mycustom_theoryofpoker"] = true
    },
})

SMODS.ObjectType({
    key = "mycustom_mycustom_jokerssynergy",
    cards = {
        ["j_mycustom_oopsall7s"] = true,
        ["j_mycustom_jonkler"] = true,
        ["j_mycustom_don"] = true,
        ["j_mycustom_allfor1"] = true,
        ["j_mycustom_illusion"] = true,
        ["j_mycustom_thepeckers"] = true,
        ["j_mycustom_triggeredjoker"] = true,
        ["j_mycustom_personalizedjoker"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end