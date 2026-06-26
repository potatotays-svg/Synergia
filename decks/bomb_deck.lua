
SMODS.Back {
    key = 'bomb_deck',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 5
        },
    },
    loc_txt = {
        name = 'Bomb Deck',
        text = {
            [1] = 'Start with The Dream',
            [2] = 'X5 Blind requirement'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_mycustom_thedream' })
                if new_joker then
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 5
                return true
            end
        }))
    end
}