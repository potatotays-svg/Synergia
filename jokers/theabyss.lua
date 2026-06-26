
SMODS.Joker{ --The Abyss
    key = "theabyss",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Abyss',
        ['text'] = {
            [1] = 'Destroys a random {C:attention}consumable{} and creates a new one.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if to_big(#G.consumeables.cards) > to_big(0) then
                return {
                    func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            table.insert(target_cards, consumable)
                        end
                        if #target_cards > 0 then
                            local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    card_to_destroy:start_dissolve()
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            for i = 1, 1 do
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        play_sound('timpani')
                                        local sets = {'Tarot', 'Planet', 'Spectral'}
                                        local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                        SMODS.add_card({ set = random_set, })                            
                                        card:juice_up(0.3, 0.5)
                                        return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                            end
                            return true
                        end,
                        colour = G.C.PURPLE
                    }
                }
            end
        end
    end
}