
SMODS.Joker{ --Green Card
    key = "greencard",
    config = {
        extra = {
            Dolars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Green Card',
        ['text'] = {
            [1] = 'This Joker gains {C:money}+$1{} when any Booster Pack is skipped',
            [2] = 'Money given at end of round',
            [3] = '(Currently {C:money}+$#1#{})',
            [4] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Dolars}}
    end,
    
    calculate = function(self, card, context)
        if context.skipping_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.Dolars = (card.ability.extra.Dolars) + 1
                    return true
                end,
                message = "+$1"
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.Dolars
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.Dolars), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}