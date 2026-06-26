
SMODS.Joker{ --Slot Machine
    key = "slotmachine",
    config = {
        extra = {
            Jackpot = 0,
            Fail = 0,
            odds = 3,
            scale0 = 1,
            rotation0 = 1,
            dollars0 = 150
        }
    },
    loc_txt = {
        ['name'] = 'Slot Machine',
        ['text'] = {
            [1] = 'This card has a {C:green}#3# in #4# {} chance to Ding every hand played.',
            [2] = 'If this card Dings 3 times in a row, gain {C:gold}$150{} {C:inactive}(Current Dings in a row: #1# {}'
            },
            ['unlock'] = {
                [1] = 'Unlocked by default.'
            }
        },
        pos = {
            x = 7,
            y = 1
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
            
            local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_mycustom_slotmachine') 
            return {vars = {card.ability.extra.Jackpot, card.ability.extra.Fail, new_numerator, new_denominator}}
        end,
        
        calculate = function(self, card, context)
            if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
                if true then
                    card.ability.extra.Fail = 1
                    if SMODS.pseudorandom_probability(card, 'group_0_2d74aca3', 1, card.ability.extra.odds, 'j_mycustom_slotmachine', false) then
                        card.ability.extra.Jackpot = (card.ability.extra.Jackpot) + 1
                        local target_card = context.other_card
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound("mycustom_Dun2")
                                
                                return true
                            end,
                        }))
                        card.ability.extra.Fail = 0
                        SMODS.calculate_effect({func = function()
                            card:juice_up(1, 1)
                            return true
                        end}, card)
                    end
                end
            end
            if context.after and context.cardarea == G.jokers  then
                if to_big((card.ability.extra.Jackpot or 0)) == to_big(3) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("mycustom_Slot Machine Win")
                            SMODS.calculate_effect({message = "Ding"}, card)
                            return true
                        end,
                    }))
                    return {
                        func = function()
                            card.ability.extra.Jackpot = 0
                            return true
                        end,
                        extra = {
                            
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars + 150
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(150), colour = G.C.MONEY})
                                return true
                            end,
                            colour = G.C.MONEY
                        }
                    }
                elseif to_big((card.ability.extra.Fail or 0)) == to_big(1) then
                    return {
                        func = function()
                            card.ability.extra.Jackpot = 0
                            return true
                        end,
                        message = "Fail"
                    }
                end
            end
        end
    }