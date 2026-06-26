
SMODS.Joker{ --Tom
    key = "tom",
    config = {
        extra = {
            XMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Tom',
        ['text'] = {
            [1] = 'When a card is Discarded, destroys the card and gain {X:red,C:white}X1{} Mult.',
            [2] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.XMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.XMult
            }
        end
        if context.discard  then
            return {
                remove = true,
                message = "Destroyed!",
                extra = {
                    func = function()
                        card.ability.extra.XMult = (card.ability.extra.XMult) + 1
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
    end
}