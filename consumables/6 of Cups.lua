
SMODS.Consumable {
    key = '6 of Cups',
    set = 'minor_archana',
    pos = { x = 8, y = 1 },
    config = { 
        extra = {
            _6sindeck = 0   
        } 
    },
    loc_txt = {
        name = '6 of Cups',
        text = {
            [1] = 'Gives {C:money}$2{} for every {C:attention}6{} in your deck',
            [2] = '{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
    return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 6 then count = count + 1 end end; return count end)()) * 2}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
            local target_dollars = G.GAME.dollars + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 6 then count = count + 1 end end; return count end)()) * 2
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 6 then count = count + 1 end end; return count end)()) * 2).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}