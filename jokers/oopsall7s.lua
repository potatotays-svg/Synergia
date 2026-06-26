
SMODS.Joker{ --Oops! All 7s?
    key = "oopsall7s",
    config = {
        extra = {
            set_probability0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Oops! All 7s?',
        ['text'] = {
            [1] = 'Guarantees all listed probabilities',
            [2] = '{C:inactive}(Can only appear if you have an Oops! All 6s and Oops! All 1s){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "mycustom_synergy",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokerssynergy"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' 
            or args.source == 'sho' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.mycustom_Oops
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_oops"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_oops\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mycustom_oopsall1s"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_oopsall1s\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.fix_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            numerator = 1
            denominator = 1
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}