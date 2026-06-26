
SMODS.Joker{ --All For 1
    key = "allfor1",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'All For 1',
        ['text'] = {
            [1] = 'This Joker gives 1 of every {C:attention}consumable{} type',
            [2] = 'and a random tag when a {C:attention}blind{} is skipped.',
            [3] = '{C:inactive}(Can only appear if you have 2 For 1 Special, PayCheck, and Your it!{}'
            },
            ['unlock'] = {
                [1] = 'Unlocked by default.'
            }
        },
        pos = {
            x = 4,
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
            and G.GAME.pool_flags.mycustom_Skip
        end,
        
        loc_vars = function(self, info_queue, card)
            
            local info_queue_0 = G.P_CENTERS["j_mycustom__2for1special"]
            if info_queue_0 then
                info_queue[#info_queue + 1] = info_queue_0
            else
                error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom__2for1special\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
            end
            local info_queue_1 = G.P_CENTERS["j_mycustom_paycheck"]
            if info_queue_1 then
                info_queue[#info_queue + 1] = info_queue_1
            else
                error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_paycheck\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
            end
            local info_queue_2 = G.P_CENTERS["j_mycustom_yourit"]
            if info_queue_2 then
                info_queue[#info_queue + 1] = info_queue_2
            else
                error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_yourit\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
            end
            return {vars = {}}
        end,
        
        calculate = function(self, card, context)
            if context.skip_blind  then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                                local tag = Tag(selected_tag)
                                if tag.name == "Orbital Tag" then
                                    local _poker_hands = {}
                                    for k, v in pairs(G.GAME.hands) do
                                        if v.visible then
                                            _poker_hands[#_poker_hands + 1] = k
                                        end
                                    end
                                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                                end
                                tag:set_ability()
                                add_tag(tag)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end
                        }))
                        return true
                    end,
                    message = "Created Tag!",
                    extra = {
                        func = function()
                            
                            for i = 1, 1 do
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.4,
                                    func = function()
                                        play_sound('timpani')
                                        SMODS.add_card({ set = 'Tarot', })                            
                                        card:juice_up(0.3, 0.5)
                                        return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                            end
                            return true
                        end,
                        colour = G.C.PURPLE,
                        extra = {
                            func = function()
                                
                                for i = 1, 1 do
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.4,
                                        func = function()
                                            play_sound('timpani')
                                            SMODS.add_card({ set = 'minor_archana', })                            
                                            card:juice_up(0.3, 0.5)
                                            return true
                                        end
                                    }))
                                end
                                delay(0.6)
                                
                                if created_consumable then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                                end
                                return true
                            end,
                            colour = G.C.PURPLE,
                            extra = {
                                func = function()
                                    
                                    for i = 1, 1 do
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.4,
                                            func = function()
                                                play_sound('timpani')
                                                SMODS.add_card({ set = 'Planet', })                            
                                                card:juice_up(0.3, 0.5)
                                                return true
                                            end
                                        }))
                                    end
                                    delay(0.6)
                                    
                                    if created_consumable then
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
                                    end
                                    return true
                                end,
                                colour = G.C.SECONDARY_SET.Planet,
                                extra = {
                                    func = function()
                                        
                                        for i = 1, 1 do
                                            G.E_MANAGER:add_event(Event({
                                                trigger = 'after',
                                                delay = 0.4,
                                                func = function()
                                                    play_sound('timpani')
                                                    SMODS.add_card({ set = 'Spectral', })                            
                                                    card:juice_up(0.3, 0.5)
                                                    return true
                                                end
                                            }))
                                        end
                                        delay(0.6)
                                        
                                        if created_consumable then
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                                        end
                                        return true
                                    end,
                                    colour = G.C.SECONDARY_SET.Spectral
                                }
                            }
                        }
                    }
                }
            end
        end
    }