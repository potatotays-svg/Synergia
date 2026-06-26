
SMODS.Joker{ --Jack of all Trades
    key = "jackofalltrades",
    config = {
        extra = {
            xchips0 = 1.5,
            xmult0 = 1.5,
            dollars0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jack of all Trades',
        ['text'] = {
            [1] = 'This Joker gives {X:red,C:white}X1.5{} Mult, {X:blue,C:white}X1.5{} Chips and {C:money}$1{} for every {C:attention}Jack{} played.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                return {
                    x_chips = 1.5,
                    extra = {
                        Xmult = 1.5,
                        extra = {
                            
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars + 1
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                                return true
                            end,
                            colour = G.C.MONEY
                        }
                    }
                }
            end
        end
    end
}