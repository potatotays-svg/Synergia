
SMODS.Joker{ --Rekoj
    key = "rekoj",
    config = {
        extra = {
            chips0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Rekoj',
        ['text'] = {
            [1] = 'This Joker gives {C:blue}+4{} chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 4
            }
        end
        if context.reroll_shop  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_joker" then 
                        return true
                    end
                end
            end)() then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Joke", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Joke = true
                        return true
                    end
                }))
            end
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Joke", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Joke = false
                    return true
                end
            }))
        end
    end
}