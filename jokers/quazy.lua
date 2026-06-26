
SMODS.Joker{ --Quazy
    key = "quazy",
    config = {
        extra = {
            Steel = 0
        }
    },
    loc_txt = {
        ['name'] = 'Quazy',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+5{} Chips for every {C:attention}Steel{} card you Discard',
            [2] = '{C:inactive}(Currently{} {C:blue}+#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Steel}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    func = function()
                        card.ability.extra.Steel = (card.ability.extra.Steel) + 5
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Steel
            }
        end
        if context.reroll_shop  and not context.blueprint then
            if ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_wherly" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_robo" then 
                        return true
                    end
                end
            end)()) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Machine", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Machine = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Machine", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Machine = false
                    return true
                end
            }))
        end
    end
}