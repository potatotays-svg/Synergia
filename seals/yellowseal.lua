
SMODS.Seal {
    key = 'yellowseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            Random = 1
        }
    },
    badge_colour = HEX('FFD700'),
    loc_txt = {
        name = 'Yellow Seal',
        label = 'Yellow Seal',
        text = {
            [1] = 'When this card is discarded, creates a random Joker',
            [2] = '{C:inactive}(Must have room){}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.seal.extra.Random}}
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            local created_joker = false
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker' })
                        if joker_card then
                            
                            
                        end
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            end
            return {
                message = created_joker and localize('k_plus_joker') or nil
            }
        end
    end
}