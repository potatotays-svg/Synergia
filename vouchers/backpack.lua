
SMODS.Voucher {
    key = 'backpack',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            discard_size0 = 4
        } 
    },
    loc_txt = {
        name = 'Backpack',
        text = {
            [1] = '{C:attention}+4{} Discard size.'
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
                    
                    
                    SMODS.change_discard_limit(4)
                    return true
                end
            }))
        }
    end
}