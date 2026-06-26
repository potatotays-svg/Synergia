
SMODS.Joker{ --Jonkler
    key = "jonkler",
    config = {
        extra = {
            Action = 0,
            xchips0 = 4,
            xmult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Jonkler',
        ['text'] = {
            [1] = 'This Joker gives {X:blue,C:white}X4{} Chips and {X:red,C:white}X4{} Mult',
            [2] = '{C:inactive}(Can only appear if you have a Joker and a Rekoj){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
            or args.source ~= 'buf' 
            or args.source == 'sho' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and G.GAME.pool_flags.mycustom_Joke
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_joker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_joker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mycustom_rekoj"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_rekoj\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.Action}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 4,
                extra = {
                    Xmult = 4
                }
            }
        end
    end
}