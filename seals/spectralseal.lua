
SMODS.Seal {
    key = 'spectralseal',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            discardsusedthisround = 0,
            Handsplayed = 0
        }
    },
    badge_colour = HEX('1E90FF'),
    loc_txt = {
        name = 'Spectral Seal',
        label = 'Spectral Seal',
        text = {
            [1] = 'Creates a random {C:spectral}Spectral{} card if card is part',
            [2] = 'of the 3rd {C:hearts}Discard{} this round'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.seal.extra.Handsplayed, (G.GAME.current_round.discards_used or 0)}}
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card and to_big(G.GAME.current_round.discards_used) == to_big(2) then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Spectral', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end
            }
        end
    end
}