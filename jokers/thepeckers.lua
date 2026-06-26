
SMODS.Joker{ --The Peckers
    key = "thepeckers",
    config = {
        extra = {
            XScore = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Peckers',
        ['text'] = {
            [1] = 'When a card is scored or discarded, destroys the card.',
            [2] = 'When any card is destroyed, this Joker gains {X:red,C:white}X5{} Mult and  {X:blue,C:white}X5{} Chips',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1# {} {C:inactive}Mult and{} {X:blue,C:white}X#1# {} {C:inactive}Chips){}',
            [4] = '{C:inactive}(Can only appear if you have Tom and Jerry){}',
            [5] = '{s:0.8{} Tom, Jerry, sick \'em!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        and G.GAME.pool_flags.mycustom_Bird
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_mycustom_tom"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_tom\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mycustom_jerry"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mycustom_jerry\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.XScore}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            context.other_card.should_destroy = true
            return {
                message = "Destroyed!"
            }
        end
        if context.discard  and not context.blueprint then
            return {
                remove = true,
                message = "Destroyed!"
            }
        end
        if context.remove_playing_cards  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.XScore = (card.ability.extra.XScore) + 5
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.XScore,
                extra = {
                    Xmult = card.ability.extra.XScore
                }
            }
        end
    end
}