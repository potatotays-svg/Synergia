
SMODS.Consumable {
    key = '3 of Swords',
    set = 'minor_archana',
    pos = { x = 7, y = 4 },
    config = { 
        extra = {
            _3sindeck = 0   
        } 
    },
    loc_txt = {
        name = '3 of Swords',
        text = {
            [1] = 'Draws {C:attention}1{} card to hand for every 3 in your deck',
            [2] = '{C:inactive}Currently #1# cards{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
    return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 3 then count = count + 1 end end; return count end)()}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if G.hand and #G.hand.cards > 0 then
            if G.hand and #G.hand.cards > 0 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 3 then count = count + 1 end end; return count end)()).." Cards Drawn", colour = G.C.BLUE})
                    SMODS.draw_cards((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 3 then count = count + 1 end end; return count end)())
                        return true
                    end
                }))
                delay(0.6)
            end
        end
    end,
    can_use = function(self, card)
        return (G.hand and #G.hand.cards > 0)
    end
}