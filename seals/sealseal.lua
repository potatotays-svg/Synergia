
SMODS.Seal {
    key = 'sealseal',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            odds = 100
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Seal Seal',
        label = 'Seal Seal',
        text = {
            [1] = '{C:inactive}It\'s a seal?{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            if SMODS.pseudorandom_probability(card, 'group_0_0e03e320', 1, card.ability.seal.extra.odds, 'j_mycustom_sealseal', true) then
                SMODS.calculate_effect({
                    func = function()
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'its_a_seal', key = 'c_mycustom_themagicaltree'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    }