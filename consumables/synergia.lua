
SMODS.Consumable {
    key = 'synergia',
    set = 'Spectral',
    pos = { x = 9, y = 0 },
    config = { 
        extra = {
            freejokerslots = 0,
            dollars0 = -10   
        } 
    },
    loc_txt = {
        name = 'Synergia',
        text = {
            [1] = 'Creates a random {C:legendary}Synergy{} {C:attention}Joker{}',
            [2] = 'Sets money to {C:hearts}$-10{}',
            [3] = '{C:inactive}(Must have room){}',
            [4] = '{C:inactive}(Cannot create WildCard or Theory of Poker)'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if to_big(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))) > to_big(0) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Oops", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Oops = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Joke", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Joke = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Machine", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Machine = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Skip", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Skip = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Illusion", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Illusion = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Bird", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Bird = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Retrigger", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Retrigger = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Personal", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Personal = true
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'mycustom_mycustom_jokerssynergy' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = -10
                    local dollar_value = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(-10).." $", colour = G.C.RED})
                    ease_dollars(dollar_value, true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Oops", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Oops = false
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Joke", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Joke = false
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Machine", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Machine = false
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Skip", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Skip = false
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Illusion", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Illusion = false
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Bird", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Bird = false
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Retrigger", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Retrigger = false
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Personal", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Personal = false
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (to_big(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))) > to_big(0))
    end
}