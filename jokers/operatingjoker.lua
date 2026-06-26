
SMODS.Joker{ --Operating Joker
    key = "operatingjoker",
    config = {
        extra = {
            xchips0 = 10,
            xmult0 = 10,
            mult0 = 69,
            chips0 = 420,
            odds = 2,
            dollars0 = 20,
            card_draw0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Operating Joker',
        ['text'] = {
            [1] = 'The effects of this Joker is dependant on your OS',
            [2] = 'Gives {X:blue,C:white}X10{} Chips if you are on Windows',
            [3] = 'Gives {X:red,C:white}X10{} Mult if you are on Linux',
            [4] = 'Has a {C:green}#1# in #2# {}chance to give {C:money}$20{} when a Blind is selected if you are on Android',
            [5] = 'Draws an extra {C:attention}2{} cards when a hand is drawn if you are on iOS'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_mycustom_operatingjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if love.system.getOS() == "Windows" then
                return {
                    x_chips = 10
                }
            elseif love.system.getOS() == "Linux" then
                return {
                    Xmult = 10
                }
            elseif (not (love.system.getOS() == "Windows") and not (love.system.getOS() == "Linux") and not (love.system.getOS() == "Android") and not (love.system.getOS() == "iOS")) then
                return {
                    mult = 69,
                    extra = {
                        chips = 420,
                        colour = G.C.CHIPS
                    }
                }
            end
        end
        if context.setting_blind  then
            if love.system.getOS() == "Android" then
                if SMODS.pseudorandom_probability(card, 'group_0_8adc7044', 1, card.ability.extra.odds, 'j_mycustom_operatingjoker', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 20
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(20), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
            if context.hand_drawn  then
                if love.system.getOS() == "iOS" then
                    if G.hand and #G.hand.cards > 0 then
                        SMODS.draw_cards(2)
                    end
                    return {
                        message = "+"..tostring(2).." Cards Drawn"
                    }
                end
            end
        end
    }