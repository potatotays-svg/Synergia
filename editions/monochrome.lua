
SMODS.Shader({ key = 'monochrome', path = 'monochrome.fs' })

SMODS.Edition {
    key = 'monochrome',
    shader = 'monochrome',
    config = {
        extra = {
            xchips0 = 1.5
        }
    },
    in_shop = true,
    weight = 5,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Monochrome',
        label = 'Monochrome',
        text = {
            [1] = '{X:blue,C:white}X1.5{} Chips'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) then
            return {
                x_chips = 1.5
            }
        end
    end
}