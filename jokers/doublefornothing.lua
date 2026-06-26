
SMODS.Joker{ --Double for Nothing
    key = "doublefornothing",
    config = {
        extra = {
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Double for Nothing',
        ['text'] = {
            [1] = 'If you have less than {C:money}$5{} at the end of round, doubles money.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(G.GAME.dollars) < to_big(5) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars * 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}