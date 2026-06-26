
SMODS.Joker{ --Roulette
    key = "roulette",
    config = {
        extra = {
            Percent = 0,
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'Roulette',
        ['text'] = {
            [1] = 'Takes {C:attention}15%{} of your {C:money}money{} and turns it into {X:red,C:white}XMult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Percent, ((G.GAME.dollars or 0)) * 0.15}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.Percent = (G.GAME.dollars) * 0.15
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars - card.ability.extra.Percent
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.Percent), colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    Xmult = card.ability.extra.Percent
                }
            }
        end
    end
}