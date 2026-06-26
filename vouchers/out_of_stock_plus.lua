
SMODS.Voucher {
    key = 'out_of_stock_plus',
    pos = { x = 3, y = 0 },
    config = { 
        extra = {
            item_rate0 = 0
        } 
    },
    loc_txt = {
        name = 'Out of Stock Plus',
        text = {
            [1] = 'Dissables {C:attention}Jokers{} from appearing in the shop'
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
    requires = {'mycustom_out_of_stock'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.joker_rate = 0               
                    return true
                end
            }))
        }
    end
}