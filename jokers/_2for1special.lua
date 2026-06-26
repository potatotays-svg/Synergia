
SMODS.Joker{ --2 For 1 Special
    key = "_2for1special",
    config = {
        extra = {
            BlindsSkipped = 0
        }
    },
    loc_txt = {
        ['name'] = '2 For 1 Special',
        ['text'] = {
            [1] = 'When a {C:attention}blind{} is skipped, creates two random {C:spectral}Spectral{} cards.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.BlindsSkipped}}
    end,
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            return {
                func = function()
                    
                    for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Spectral', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end
            }
        end
        if context.reroll_shop  then
            if ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_yourit" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_paycheck" then 
                        return true
                    end
                end
            end)()) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Skip", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Skip = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Skip", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Skip = false
                    return true
                end
            }))
        end
    end
}