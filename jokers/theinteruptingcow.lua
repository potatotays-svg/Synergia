
SMODS.Joker{ --The Interupting Cow
    key = "theinteruptingcow",
    config = {
        extra = {
            odds = 4,
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'The Interupting Cow',
        ['text'] = {
            [1] = 'Has a MOO! {C:green}#1# in #2# {} MOO! chance to give MOO! {C:money}$5{} MOO! every time MOO!',
            [2] = 'another joker is MOO! triggered during scoring.',
            [3] = '{C:hearts}WILL SOMEONE GET THAT COW OUT OF HERE!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_mycustom_theinteruptingcow') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.other_joker  then
            if true then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("mycustom_MOO!")
                        SMODS.calculate_effect({message = "MOO!"}, card)
                        return true
                    end,
                }))
                if SMODS.pseudorandom_probability(card, 'group_0_24ab710e', 1, card.ability.extra.odds, 'j_mycustom_theinteruptingcow', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 5
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }