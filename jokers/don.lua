
SMODS.Joker{ --Don
    key = "don",
    config = {
        extra = {
            ChipTime = 1
        }
    },
    loc_txt = {
        ['name'] = 'Don',
        ['text'] = {
            [1] = 'This Joker gains {X:blue,C:white}X15{} Chips for every card with an {C:enhanced}Enhancement{} you discard',
            [2] = '{C:inactive}(Currently{} {X:blue,C:white}X#1# {}{C:inactive} Chips){}',
            [3] = '{C:inactive}(Can only appear if you have a Quazy, Wherly, and Robo){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
            or args.source ~= 'sou' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.mycustom_Machine
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_mycustom_quazy"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_quazy\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mycustom_wherly"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_wherly\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_mycustom_robo"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_robo\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.ChipTime}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        card.ability.extra.ChipTime = (card.ability.extra.ChipTime) + 15
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.ChipTime
            }
        end
    end
}