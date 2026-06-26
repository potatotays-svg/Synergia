
SMODS.Joker{ --Debit Card
    key = "debitcard",
    config = {
        extra = {
            debt_amount = '999999999999',
            Multiple = 0
        }
    },
    loc_txt = {
        ['name'] = 'Debit Card',
        ['text'] = {
            [1] = 'Go up to {C:hearts}-$infinity{} in debt.',
            [2] = 'If you have less than {C:money}$0{} by the end of {C:attention}every 8 Antes{}, instantly game over.',
            [3] = 'If you sell this card while in dept, instantly game over.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Multiple}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if (to_big(G.GAME.round_resets.ante) == to_big(8) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(16) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(24) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(32) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(40) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(48) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(56) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(64) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(72) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(80) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            elseif (to_big(G.GAME.round_resets.ante) == to_big(88) and to_big(G.GAME.dollars) < to_big(0)) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            end
        end
        if context.selling_self  then
            if to_big(G.GAME.dollars) < to_big(0) then
                return {
                    func = function()
                        
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                    end
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - 999999999999
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + 999999999999
    end
}