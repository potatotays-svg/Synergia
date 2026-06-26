
SMODS.Joker{ --Handy Joker
    key = "handyjoker",
    config = {
        extra = {
            Multtime = 1
        }
    },
    loc_txt = {
        ['name'] = 'Handy Joker',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X1.5{} Mult when hand is scored.',
            [2] = 'Resets at the end of round.',
            [3] = '{C:inactive}(Currently {}{X:red,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Multtime}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.Multtime = (card.ability.extra.Multtime) + 1.5
            return {
                Xmult = card.ability.extra.Multtime
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.Multtime = 1
                    return true
                end
            }
        end
    end
}