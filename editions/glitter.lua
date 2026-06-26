
SMODS.Edition {
    key = 'glitter',
    shader = 'booster',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        extra = {
            dollars0 = 3
        }
    },
    in_shop = true,
    weight = 5,
    extra_cost = 2,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Glitter',
        label = 'Glitter',
        text = {
            [1] = '{C:money}+$3{}'
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
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 3
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}