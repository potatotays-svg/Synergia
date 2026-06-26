
SMODS.Joker{ --Illusion
    key = "illusion",
    config = {
        extra = {
            Packs = 0
        }
    },
    loc_txt = {
        ['name'] = 'Illusion',
        ['text'] = {
            [1] = 'When a Booster Pack is opened, creates a random consumable.',
            [2] = 'Creates two consumables every {C:attention}5{} Booster Packs',
            [3] = '{C:inactive}(Currently #1#){} {C:inactive}(Must have room.){}',
            [4] = '{C:inactive}(Can only appear if you have Hallucination and Mirage){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        and G.GAME.pool_flags.mycustom_Illusion
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_hallucination"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_hallucination\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mycustom_mirage"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_mirage\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.Packs}}
    end,
    
    calculate = function(self, card, context)
        if context.open_booster  then
            if to_big((card.ability.extra.Packs or 0)) == to_big(4) then
                return {
                    func = function()
                        
                        for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    local sets = {'Tarot', 'Planet', 'Spectral'}
                                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                    SMODS.add_card({ set = random_set, })                            
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
                    extra = {
                        func = function()
                            card.ability.extra.Packs = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            else
                return {
                    func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    local sets = {'Tarot', 'Planet', 'Spectral'}
                                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                    SMODS.add_card({ set = random_set, })                            
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
                    extra = {
                        func = function()
                            card.ability.extra.Packs = (card.ability.extra.Packs) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}