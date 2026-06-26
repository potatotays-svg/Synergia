
SMODS.Joker{ --Sneaky Joker
    key = "sneakyjoker",
    config = {
        extra = {
            card_draw0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Sneaky Joker',
        ['text'] = {
            [1] = 'Draws {C:attention}3{} extra cards on',
            [2] = 'the first hand of each round.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(3)
            end
            return {
                message = "+"..tostring(3).." Cards Drawn"
            }
        end
    end
}