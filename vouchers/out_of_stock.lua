
SMODS.Voucher {
    key = 'out_of_stock',
    pos = { x = 2, y = 0 },
    config = { 
        extra = {
            item_rate0 = 0,
            item_rate = 0,
            item_rate2 = 0
        } 
    },
    loc_txt = {
        name = 'Out of Stock',
        text = {
            [1] = 'Disables {C:tarot}Tarot{}, {C:planet}Planet{}, and {C:tarot}Minor Archana{} cards',
            [2] = 'from appearing in the shop.'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.tarot_rate = 0               
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.planet_rate = 0               
                        return true
                    end
                })),
                colour = G.C.BLUE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.minor_archana_rate = 0               
                            return true
                        end
                    })),
                    colour = G.C.BLUE
                }
            }
        }
    end
}