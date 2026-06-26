
SMODS.Joker{ --Wherly
    key = "wherly",
    config = {
        extra = {
            Gold = 0
        }
    },
    loc_txt = {
        ['name'] = 'Wherly',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+5{} Chips for every {C:attention}Gold{} card you Discard',
            [2] = '{C:inactive}(Currently{} {C:blue}+#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
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
        
        return {vars = {card.ability.extra.Gold}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                return {
                    func = function()
                        card.ability.extra.Gold = (card.ability.extra.Gold) + 5
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Gold
            }
        end
    end
}