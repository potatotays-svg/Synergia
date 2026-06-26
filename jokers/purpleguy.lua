
SMODS.Joker{ --Purple Guy
    key = "purpleguy",
    config = {
        extra = {
            Deaths = 0,
            Modify = 0,
            currentante = 0,
            dollars0 = 15
        }
    },
    loc_txt = {
        ['name'] = 'Purple Guy',
        ['text'] = {
            [1] = 'Prevents death up to five times.',
            [2] = 'Each prevented death gives {C:attention}$15{} and increases',
            [3] = 'all future {C:attention}Blind{} requirements by {X:red,C:white}X1.2{}',
            [4] = '{C:inactive}Does not work on Ante 8 Boss Blind{}',
            [5] = '{C:inactive}(Saves used; #1#){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Deaths, card.ability.extra.Modify, (G.GAME.round_resets.ante or 0)}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
            if (to_big((card.ability.extra.Deaths or 0)) < to_big(5) or to_big(G.GAME.round_resets.ante) ~= to_big(8) and G.GAME.blind.boss) then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                            card.ability.extra.Deaths = (card.ability.extra.Deaths) + 1
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.Modify = (card.ability.extra.Modify) + 1.2
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = G.GAME.dollars + 15
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(15), colour = G.C.MONEY})
                                    return true
                                end,
                                colour = G.C.MONEY
                            }
                        }
                    }
                }
            end
        end
        if context.first_hand_drawn  and not context.blueprint then
            if not (to_big((card.ability.extra.Deaths or 0)) == to_big(0)) then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.Modify).." Blind Size", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.Modify
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            end
        end
    end
}