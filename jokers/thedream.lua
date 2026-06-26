
SMODS.Joker{ --The Dream
    key = "thedream",
    config = {
        extra = {
            xmult0 = 100
        }
    },
    loc_txt = {
        ['name'] = 'The Dream',
        ['text'] = {
            [1] = 'I HAVE A DREAM!',
            [2] = '{s:0.5}To explode{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokerslegendary"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            context.other_card.should_destroy = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("mycustom_bomb")
                    
                    return true
                end,
            }))
            return {
                Xmult = 100,
                extra = {
                    message = "Exploded",
                    colour = G.C.RED
                }
            }
        end
    end
}