
SMODS.Joker{ --Jerry
    key = "jerry",
    config = {
        extra = {
            XChips = 1,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Jerry',
        ['text'] = {
            [1] = 'When a card is scored, has a {C:green}#2# in #3# {} chance',
            [2] = 'to destroy the card and gain {X:blue,C:white}X5{} Chips.',
            [3] = '{C:inactive}(Currently{} {X:blue,C:white}X#1# {} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_mycustom_jerry') 
        return {vars = {card.ability.extra.XChips, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_530ab449', 1, card.ability.extra.odds, 'j_mycustom_jerry', false) then
                    card.ability.extra.XChips = (card.ability.extra.XChips) + 5
                    
                end
                if SMODS.pseudorandom_probability(card, 'group_1_530ab449', 1, card.ability.extra.odds, 'j_mycustom_jerry', false) then
                    context.other_card.should_destroy = true
                    card.ability.extra.XChips = (card.ability.extra.XChips) + 5
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.XChips
            }
        end
        if context.reroll_shop  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_mycustom_tom" then 
                        return true
                    end
                end
            end)() then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Bird", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Bird = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Bird", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Bird = false
                    return true
                end
            }))
        end
    end
}