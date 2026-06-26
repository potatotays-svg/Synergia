
SMODS.Joker{ --Picky Joker
    key = "pickyjoker",
    config = {
        extra = {
            Done = 0,
            currentseconds = 0,
            repetitions0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Picky Joker',
        ['text'] = {
            [1] = 'This Joker picks {C:attention}1{} random card to',
            [2] = 'retrigger {C:attention}2{} additional times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        
        return {vars = {card.ability.extra.Done, (os.date("*t", os.time()).sec) * 0.1}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[card.ability.extra.Done] then
                return {
                    repetitions = 2,
                    message = "Retrigger"
                }
            end
        end
        if context.reroll_shop  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_hanging_chad" then 
                        return true
                    end
                end
            end)() then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Retrigger", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Retrigger = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Retrigger", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Retrigger = false
                    return true
                end
            }))
        end
        if context.before and context.cardarea == G.jokers  then
            local Done_value = card.ability.extra.Done
            return {
                func = function()
                    card.ability.extra.Done = (os.date("*t", os.time()).sec) * 0.1
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Done = math.ceil(card.ability.extra.Done)
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
}