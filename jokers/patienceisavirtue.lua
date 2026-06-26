
SMODS.Joker{ --Patience is a Virtue
    key = "patienceisavirtue",
    config = {
        extra = {
            xmult0 = 10,
            xmult = 5,
            xchips0 = 1.5,
            chips0 = 25
        }
    },
    loc_txt = {
        ['name'] = 'Patience is a Virtue',
        ['text'] = {
            [1] = 'This Joker is better the slower your game speed is.',
            [2] = '{X:red,C:white}X10{} Mult if game speed is at X0.5',
            [3] = '{X:red,C:white}X5{} Mult if game speed is at X1',
            [4] = '{X:chips,C:white}X1.5{} Chips if game speed is at X2',
            [5] = '{C:blue}+25{} Chips if game speed is at X4'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.SETTINGS.GAMESPEED) == to_big(0.5) then
                return {
                    Xmult = 10
                }
            elseif to_big(G.SETTINGS.GAMESPEED) == to_big(1) then
                return {
                    Xmult = 5
                }
            elseif to_big(G.SETTINGS.GAMESPEED) == to_big(2) then
                return {
                    x_chips = 1.5
                }
            elseif to_big(G.SETTINGS.GAMESPEED) == to_big(4) then
                return {
                    chips = 25
                }
            end
        end
        if context.reroll_shop  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_operatingjoker" then 
                        return true
                    end
                end
            end)() then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Personal", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Personal = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Personal", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Personal = false
                    return true
                end
            }))
        end
    end
}