
SMODS.Joker{ --Oops! All 1s
    key = "oopsall1s",
    config = {
        extra = {
            mod_probability0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Oops! All 1s',
        ['text'] = {
            [1] = 'Halves all listed probabilities {C:green}(ex: 1 in 3 -> 1 in 6){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            denominator = denominator * (2)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
        if context.reroll_shop  and not context.blueprint then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_oops" then 
                        return true
                    end
                end
            end)() then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Oops", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Oops = true
                        return true
                    end
                }))
            end
        end
        if context.selling_self  and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Oops1", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Oops1 = false
                    return true
                end
            }))
        end
    end
}