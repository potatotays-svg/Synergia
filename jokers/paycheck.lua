
SMODS.Joker{ --PayCheck
    key = "paycheck",
    config = {
        extra = {
            dollars0 = 15
        }
    },
    loc_txt = {
        ['name'] = 'PayCheck',
        ['text'] = {
            [1] = 'When {C:attention}blind{} is skipped, gives {C:money}$15{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 15
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(15), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}