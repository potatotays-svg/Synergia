
SMODS.Joker{ --Wild Card
    key = "wildcard",
    config = {
        extra = {
            ChipTime = 1,
            Multadd = 0,
            Chipadd = 0,
            Moneyadd = 0,
            Multtime = 1
        }
    },
    loc_txt = {
        ['name'] = 'Wild Card',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+600{} Chips, {X:blue,C:white}X500{} Chips, {C:red}+300{} Mult,',
            [2] = '{X:red,C:white}X500{} Mult and {C:money}+$100{} whenever a {C:attention}Booster pack{}',
            [3] = 'is opened, exited, or skipped.',
            [4] = 'Currently {C:blue}+#3# {} Chips, {X:blue,C:white}X#1# {} Chips, {C:red}+#2# {} Mult, {X:red,C:white}X#5# {} Mult, and {C:money}+$#4# {}',
            [5] = '{C:inactive}(Can only appear if you have Red Card, Blue Card, Green Card, and Gold Card){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
            or args.source ~= 'buf' 
            or args.source == 'sho' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.mycustom_Wild
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_red_card"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_red_card\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mycustom_bluecard"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_bluecard\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_mycustom_greencard"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_greencard\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_3 = G.P_CENTERS["j_mycustom_goldcard"]
        if info_queue_3 then
            info_queue[#info_queue + 1] = info_queue_3
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_goldcard\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.ChipTime, card.ability.extra.Multadd, card.ability.extra.Chipadd, card.ability.extra.Moneyadd, card.ability.extra.Multtime}}
    end,
    
    calculate = function(self, card, context)
        if context.open_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.ChipTime = (card.ability.extra.ChipTime) + 500
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Multadd = (card.ability.extra.Multadd) + 300
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            card.ability.extra.Chipadd = (card.ability.extra.Chipadd) + 600
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.Moneyadd = (card.ability.extra.Moneyadd) + 100
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                func = function()
                                    card.ability.extra.Multtime = (card.ability.extra.Multtime) + 500
                                    return true
                                end,
                                colour = G.C.GREEN
                            }
                        }
                    }
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Chipadd,
                extra = {
                    x_chips = card.ability.extra.ChipTime,
                    colour = G.C.DARK_EDITION,
                    extra = {
                        mult = card.ability.extra.Multadd,
                        extra = {
                            Xmult = card.ability.extra.Multtime,
                            extra = {
                                
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = G.GAME.dollars + card.ability.extra.Moneyadd
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.Moneyadd), colour = G.C.MONEY})
                                    return true
                                end,
                                colour = G.C.MONEY
                            }
                        }
                    }
                }
            }
        end
        if context.skipping_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.ChipTime = (card.ability.extra.ChipTime) + 500
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Multadd = (card.ability.extra.Multadd) + 300
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            card.ability.extra.Chipadd = (card.ability.extra.Chipadd) + 600
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.Moneyadd = (card.ability.extra.Moneyadd) + 100
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                func = function()
                                    card.ability.extra.Multtime = (card.ability.extra.Multtime) + 500
                                    return true
                                end,
                                colour = G.C.GREEN
                            }
                        }
                    }
                }
            }
        end
        if context.ending_booster  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.ChipTime = (card.ability.extra.ChipTime) + 500
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.Multadd = (card.ability.extra.Multadd) + 300
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            card.ability.extra.Chipadd = (card.ability.extra.Chipadd) + 600
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.Moneyadd = (card.ability.extra.Moneyadd) + 100
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                func = function()
                                    card.ability.extra.Multtime = (card.ability.extra.Multtime) + 500
                                    return true
                                end,
                                colour = G.C.GREEN
                            }
                        }
                    }
                }
            }
        end
    end
}