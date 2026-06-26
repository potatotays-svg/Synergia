
SMODS.Joker{ --Jevil
    key = "jevil",
    config = {
        extra = {
            TimeMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jevil',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.05{} Mult when you do anything.',
            [2] = '{C:inactive}(Currently {}{X:red,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.TimeMult}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("mycustom_Jevil")
                    
                    return true
                end,
            }))
            return {
                func = function()
                    card.ability.extra.TimeMult = (card.ability.extra.TimeMult) + 0.05
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.TimeMult
            }
        end
    end
}