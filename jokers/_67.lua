
SMODS.Joker{ --67
    key = "_67",
    config = {
        extra = {
            Pain = 6,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = '67',
        ['text'] = {
            [1] = 'This Joker gives {C:red}X6 or X7{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_mycustom__67')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_mycustom__67')
        return {vars = {card.ability.extra.Pain, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_95d3f685', 1, card.ability.extra.odds, 'j_mycustom__67', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.Pain = 7
                        return true
                    end}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_441da0ba', 1, card.ability.extra.odds, 'j_mycustom__67', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.Pain = 6
                        return true
                    end}, card)
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.Pain
            }
        end
    end
}