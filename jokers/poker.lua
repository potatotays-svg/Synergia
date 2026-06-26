
SMODS.Joker{ --Poker
    key = "poker",
    config = {
        extra = {
            xmult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Poker',
        ['text'] = {
            [1] = 'This Joker give {X:red,C:white}X10{} Mult if played poker hand is a {C:attention}#1#{}',
            [2] = '{C:inactive}(Changes after every played hand){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        return {vars = {localize((G.GAME.current_round.Poker_hand or 'High Card'), 'poker_hands')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.Poker_hand = 'High Card'
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands[G.GAME.current_round.Poker_hand]) then
                return {
                    Xmult = 10
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            local Poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if G.GAME.hands[handname].visible then
                    Poker_hands[#Poker_hands + 1] = handname
                end
            end
            if Poker_hands[1] then
                G.GAME.current_round.Poker_hand = pseudorandom_element(Poker_hands, pseudoseed('Poker' .. G.GAME.round_resets.ante))
            end
        end
        if context.reroll_shop  then
            if ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_duo" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_trio" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_tribe" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_order" then 
                        return true
                    end
                end
            end)() and (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_family" then 
                        return true
                    end
                end
            end)()) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:juice_up(0.3, 0.5)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Theory", colour = G.C.BLUE})
                        G.GAME.pool_flags.mycustom_Theory = true
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Theory", colour = G.C.BLUE})
                    G.GAME.pool_flags.mycustom_Theory = false
                    return true
                end
            }))
        end
    end
}