
SMODS.Joker{ --Theory of Poker
    key = "theoryofpoker",
    config = {
        extra = {
            NumberOfHands = 0
        }
    },
    loc_txt = {
        ['name'] = 'Theory of Poker',
        ['text'] = {
            [1] = 'This Joker increases the noumber of {C:dark_edition}Joker slots{} by the amount of different poker hands in played hand',
            [2] = '{C:inactive}Can only appear if you have The Duo, The Trio, The tribe, The Order, The Family, and Poker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "mycustom_synergy",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokerssynergywild"] = true },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.mycustom_Theory
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_mycustom_poker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_poker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_duo"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_duo\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_trio"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_trio\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_3 = G.P_CENTERS["j_tribe"]
        if info_queue_3 then
            info_queue[#info_queue + 1] = info_queue_3
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_tribe\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_4 = G.P_CENTERS["j_order"]
        if info_queue_4 then
            info_queue[#info_queue + 1] = info_queue_4
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_order\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_5 = G.P_CENTERS["j_family"]
        if info_queue_5 then
            info_queue[#info_queue + 1] = info_queue_5
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_family\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.NumberOfHands}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["High Card"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Pair"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Two Pair"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Three of a Kind"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Straight"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Flush"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Full House"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Four of a Kind"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Five of a Kind"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Straight Flush"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Flush House"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
            if next(context.poker_hands["Flush Five"]) then
                card.ability.extra.NumberOfHands = (card.ability.extra.NumberOfHands) + 1
            end
        end
        if context.after and context.cardarea == G.jokers  then
            local NumberOfHands_value = card.ability.extra.NumberOfHands
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(NumberOfHands_value).." Joker Slot", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + NumberOfHands_value
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.NumberOfHands = 0
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
}