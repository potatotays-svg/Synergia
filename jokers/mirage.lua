
SMODS.Joker{ --Mirage
    key = "mirage",
    config = {
        extra = {
            Bostersopened = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mirage',
        ['text'] = {
            [1] = 'Every {C:attention}5{} Booster packs opened, creates a random {C:spectral}Spectral{} card.',
            [2] = '{C:inactive}(Currently #1#){} {C:inactive}(Must have room.){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Bostersopened}}
    end,
    
    calculate = function(self, card, context)
        if context.open_booster  then
            if to_big((card.ability.extra.Bostersopened or 0)) == to_big(4) then
                return {
                    func = function()
                        card.ability.extra.Bostersopened = 0
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
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
                        end,
                        colour = G.C.SECONDARY_SET.Spectral
                    }
                }
            else
                return {
                    func = function()
                        card.ability.extra.Bostersopened = (card.ability.extra.Bostersopened) + 1
                        return true
                    end
                }
            end
        end
        if context.reroll_shop  and not context.blueprint then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_hallucination" then 
                        return true
                    end
                end
            end)() then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Illusion", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Illusion = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Illusion", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Illusion = false
                    return true
                end
            }))
        end
    end
}