
SMODS.Joker{ --Wheel of Wheels
    key = "wheelofwheels",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Wheel of Wheels',
        ['text'] = {
            [1] = 'This Jokers will try to make sure you have at least one {C:tarot}Wheel of Fortune{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            if consumable.ability.set == "" then
                                table.insert(target_cards, consumable)
                            end
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
                    end}, card)
                end
                for i = 1, card.ability.extra.repetitions do
                    SMODS.calculate_effect({func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', key = 'c_wheel_of_fortune'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}