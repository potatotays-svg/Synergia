
SMODS.Joker{ --Personalized Joker
    key = "personalizedjoker",
    config = {
        extra = {
            xchips0 = 15,
            xchips = 8,
            xchips2 = 2,
            chips0 = 50,
            xmult0 = 15,
            xmult = 8,
            xchips3 = 2,
            mult0 = 50,
            dollars0 = 50,
            dollars = 20,
            dollars2 = 10,
            dollars3 = 1,
            card_draw0 = 10,
            card_draw = 5,
            card_draw2 = 3,
            card_draw3 = 1,
            scale0 = 1,
            rotation0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Personalized Joker',
        ['text'] = {
            [1] = 'The effects of this Joker are dependant on your OS and are better the slower your game speed is',
            [2] = 'On Windows, when a card is scored if your game speed is X0.5, gives {X:blue,C:white}X15{} Chips. If your game speed',
            [3] = 'is X1, gives {X:blue,C:white}X8{} Chips, If your game speed is X2, gives {X:blue,C:white}X2{} Chips. If your game speed is X4, gives {C:blue}+50{} Chips',
            [4] = 'On Linux, when a card is scored, if your game speed is X0.5, gives {X:red,C:white}X15{} Mult. If your game speed is x1',
            [5] = 'gives {X:red,C:white}X8{} Mult. If your game speed is x2, gives {X:red,C:white}X2{} Mult. If your game speed is X4, gives {C:red}+50{} Mult.',
            [6] = 'On Android, when a Blind is selected, if your game speed is X0.5, gives {C:money}$50{}. If your game speed is X1, gives {C:money}$20{}.',
            [7] = 'If your game speed is X2, gives {C:money}$10{}. If your game speed is X4, gives {C:money}$1{}.',
            [8] = 'On iOS, when a hand is drawn, if your game speed is X0.5 draws an extra {C:attention}10{} cards. If your game speed is X1,',
            [9] = 'draws an extra {C:attention}5{} cards. If game speed is X2, draws an extra {C:attention}3{} cards, If your game speed is X4, draws an',
            [10] = 'extra {C:attention}1{} card.',
            [11] = '{C:inactive}(Can only be appear if you have a Patience is a Virtue and Operating Joker){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
    pools = { ["mycustom_mycustom_jokerssynergy"] = true },
    in_pool = function(self, args)
        return (
            not args 
            
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.mycustom_Personal
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_mycustom_operatingjoker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_operatingjoker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mycustom_patienceisavirtue"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_patienceisavirtue\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (to_big(G.SETTINGS.GAMESPEED) == to_big(0.5) and love.system.getOS() == "Windows") then
                return {
                    x_chips = 15
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(1) and love.system.getOS() == "Windows") then
                return {
                    x_chips = 8
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(2) and love.system.getOS() == "Windows") then
                return {
                    x_chips = 2
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(4) and love.system.getOS() == "Windows") then
                return {
                    chips = 50
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(0.5) and love.system.getOS() == "Linux") then
                return {
                    Xmult = 15
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(1) and love.system.getOS() == "Linux") then
                return {
                    Xmult = 8
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(2) and love.system.getOS() == "Linux") then
                return {
                    x_chips = 2
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(4) and love.system.getOS() == "Linux") then
                return {
                    mult = 50
                }
            end
        end
        if context.setting_blind  then
            if (to_big(G.SETTINGS.GAMESPEED) == to_big(0.5) and love.system.getOS() == "Android") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 50
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(50), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(1) and love.system.getOS() == "Android") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 20
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(20), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(2) and love.system.getOS() == "Android") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 10
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(4) and love.system.getOS() == "Android") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
        if context.hand_drawn  then
            if (to_big(G.SETTINGS.GAMESPEED) == to_big(0.5) and love.system.getOS() == "iOS") then
                if G.hand and #G.hand.cards > 0 then
                    SMODS.draw_cards(10)
                end
                return {
                    message = "+"..tostring(10).." Cards Drawn"
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(1) and love.system.getOS() == "iOS") then
                if G.hand and #G.hand.cards > 0 then
                    SMODS.draw_cards(5)
                end
                return {
                    message = "+"..tostring(5).." Cards Drawn"
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(2) and love.system.getOS() == "iOS") then
                if G.hand and #G.hand.cards > 0 then
                    SMODS.draw_cards(3)
                end
                return {
                    message = "+"..tostring(3).." Cards Drawn"
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(4) and love.system.getOS() == "iOS") then
                if G.hand and #G.hand.cards > 0 then
                    SMODS.draw_cards(1)
                end
                return {
                    message = "+"..tostring(1).." Cards Drawn"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big(G.SETTINGS.GAMESPEED) == to_big(0.5) and not (love.system.getOS() == "Windows") and not (love.system.getOS() == "Linux") and not (love.system.getOS() == "Android") and not (love.system.getOS() == "iOS")) then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(1) and not (love.system.getOS() == "Windows") and not (love.system.getOS() == "Linux") and not (love.system.getOS() == "Android") and not (love.system.getOS() == "iOS")) then
                local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                local rank_suffix = 'J'
                local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_glass
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal("mycustom_sealseal", true)
                
                base_card:set_edition("e_polychrome", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                base_card.playing_card = G.playing_card
                table.insert(G.playing_cards, base_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.hand:emplace(base_card)
                        base_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Added Card to Hand!"
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(2) and not (love.system.getOS() == "Windows") and not (love.system.getOS() == "Linux") and not (love.system.getOS() == "Android") and not (love.system.getOS() == "iOS")) then
                local target_card = context.other_card
                return {
                    func = function()
                        card:juice_up(1, 1)
                        return true
                    end
                }
            elseif (to_big(G.SETTINGS.GAMESPEED) == to_big(2) and not (love.system.getOS() == "Windows") and not (love.system.getOS() == "Linux") and not (love.system.getOS() == "Android") and not (love.system.getOS() == "iOS")) then
                error("EasternFarmer Was Here")
            end
        end
    end
}