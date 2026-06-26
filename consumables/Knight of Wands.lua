
SMODS.Consumable {
    key = 'Knight of Wands',
    set = 'minor_archana',
    pos = { x = 6, y = 2 },
    config = { 
        extra = {
            jacksindeck = 0   
        } 
    },
    loc_txt = {
        name = 'Knight of Wands',
        text = {
            [1] = 'Adds {C:blue}+5{} Chips for every {C:attention}Jack{} is your Deck to {C:attention}1{} selected card.',
            [2] = '{C:inactive}(Currently{} {C:blue}#1#{} {C:inactive}Chips){}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
    return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 11 then count = count + 1 end end; return count end)()) * 5}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if to_big(#G.hand.highlighted) == to_big(1) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i].ability.perma_bonus = G.hand.highlighted[i].ability.perma_bonus or 0
                    G.hand.highlighted[i].ability.perma_bonus = G.hand.highlighted[i].ability.perma_bonus + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 11 then count = count + 1 end end; return count end)()) * 5
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) == to_big(1))
    end
}