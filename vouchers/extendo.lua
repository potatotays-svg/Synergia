
SMODS.Voucher {
    key = 'extendo',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            play_size0 = 4
        } 
    },
    loc_txt = {
        name = 'Extendo',
        text = {
            [1] = '{C:attention}+4{} Played Hand size.'
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
    requires = {'mycustom_backpack'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_play_limit(4)
                    return true
                end
            }))
        }
    end
}