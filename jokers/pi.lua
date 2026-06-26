
SMODS.Joker{ --Pi
    key = "pi",
    config = {
        extra = {
            xmult0 = 3.14159
        }
    },
    loc_txt = {
        ['name'] = 'Pi',
        ['text'] = {
            [1] = 'This Joker gives {X:red,C:white}X 3.14159{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 3.14159
            }
        end
    end
}