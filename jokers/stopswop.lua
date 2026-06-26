
SMODS.Joker{ --Stop & Swop
    key = "stopswop",
    config = {
        extra = {
            OriginalDiscards = 0,
            OriginalHands = 0,
            basediscardsperround = 0,
            basehandsperround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Stop & Swop',
        ['text'] = {
            [1] = 'When this Joker is sold, Swaps {C:spectral}Hands{} and {C:rare}Discards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.OriginalDiscards, card.ability.extra.OriginalHands, (G.GAME.round_resets.discards or 0), (G.GAME.round_resets.hands or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.OriginalDiscards = G.GAME.round_resets.discards
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.OriginalHands = G.GAME.round_resets.hands
                        return true
                    end,
                    colour = G.C.BLUE,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.OriginalDiscards).." Hands", colour = G.C.BLUE})
                            
                            G.GAME.round_resets.hands = card.ability.extra.OriginalDiscards
                            ease_hands_played(card.ability.extra.OriginalDiscards - G.GAME.current_round.hands_left)
                            
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            
                            func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.OriginalHands).." Discards", colour = G.C.BLUE})
                                
                                G.GAME.round_resets.discards = card.ability.extra.OriginalHands
                                ease_discard(card.ability.extra.OriginalHands - G.GAME.current_round.discards_left)
                                
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                }
            }
        end
    end
}