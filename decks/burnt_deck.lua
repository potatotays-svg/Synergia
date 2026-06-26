
SMODS.Back {
    key = 'burnt_deck',
    pos = { x = 3, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Burnt Deck',
        text = {
            [1] = 'All cards start with the',
            [2] = '{C:enhanced}Burnt Enhancement{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    v:set_ability(G.P_CENTERS['m_mycustom_burnt'])
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}