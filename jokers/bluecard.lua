
SMODS.Joker{ --Blue Card
    key = "bluecard",
    config = {
        extra = {
            Chip = 0
        }
    },
    loc_txt = {
        ['name'] = 'Blue Card',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+6{} Chips when any Booster Pack is skipped',
            [2] = '(Currently {C:blue}+#1#{} Chips)',
            [3] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Chip}}
    end,
    
    calculate = function(self, card, context)
        if context.skipping_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.Chip = (card.ability.extra.Chip) + 6
                    return true
                end,
                message = "+6 Chips"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Chip
            }
        end
    end
}