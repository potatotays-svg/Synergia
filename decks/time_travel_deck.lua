
SMODS.Back {
    key = 'time_travel_deck',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            ante_value0 = 4
        },
    },
    loc_txt = {
        name = 'Time Travel Deck',
        text = {
            [1] = 'Start at Ante 4.',
            [2] = 'Start with Icecream, Popcorn and {C:money}$50{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        local mod = 4 - G.GAME.round_resets.ante
        G.E_MANAGER:add_event(Event({
            func = function()
                ease_ante(mod)
                G.GAME.round_resets.blind_ante = 4
                return true
            end,
        }))
        G.GAME.starting_params.dollars = 50
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_ice_cream' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_popcorn' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}