
SMODS.Joker{ --Is it Really all Lies?
    key = "isitreallyalllies",
    config = {
        extra = {
            xchips0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Is it Really all Lies?',
        ['text'] = {
            [1] = 'This Joker gives {X:blue,C:white}X2{} Chips when a card with a {C:attention}Seal{} seal is scored.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Mycustom_sealseal" then
                return {
                    x_chips = 2
                }
            end
        end
    end
}