
SMODS.Joker{ --Gold Card
    key = "goldcard",
    config = {
        extra = {
            XMult = 1,
            Xchips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gold Card',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X5{} Mult and {X:blue,C:white}X5{} Chips whenever',
            [2] = 'a {C:attention}Booster Pack{} is opened, {X:red,C:white}X10 {} Mult and {X:blue,C:white}X10{} Chips when a',
            [3] = '{C:attention}Booster Pack{} is skipped, and {X:red,C:white}X3{} Mult and {X:blue,C:white}X3{} Chips when a',
            [4] = '{C:attention}Booster Pack{} is exited.',
            [5] = '{C:inactive}(Currently {X:red,C:white} X#1# {}{} {C:inactive}Mult and{} {X:blue,C:white}X#2# {} {C:inactive}Chips.){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokerslegendary"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' 
            or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.XMult, card.ability.extra.Xchips}}
    end,
    
    calculate = function(self, card, context)
        if context.open_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.XMult = (card.ability.extra.XMult) + 5
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Xchips = (card.ability.extra.Xchips) + 5
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.skipping_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.XMult = (card.ability.extra.XMult) + 10
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Xchips = (card.ability.extra.Xchips) + 10
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.ending_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.XMult = (card.ability.extra.XMult) + 3
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Xchips = (card.ability.extra.Xchips) + 3
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.XMult,
                extra = {
                    x_chips = card.ability.extra.Xchips,
                    colour = G.C.DARK_EDITION
                }
            }
        end
        if context.reroll_shop  and not context.blueprint then
            if ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_bluecard" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_greencard" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_red_card" then 
                        return true
                    end
                end
            end)()) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Wild", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Wild = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Wild", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Wild = false
                    return true
                end
            }))
        end
    end
}