
SMODS.Enhancement {
    key = 'burnt',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            odds = 4,
            levels0 = 1
        }
    },
    loc_txt = {
        name = 'Burnt',
        text = {
            [1] = 'When held in hand, {C:green}1 in 4{} chance to upgrade played poker hand.'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            if SMODS.pseudorandom_probability(card, 'group_0_df74e991', 1, card.ability.extra.odds, 'j_mycustom_burnt', false) then
                local target_hand
                target_hand = context.scoring_name or "High Card"
                SMODS.calculate_effect({level_up = 1,
                level_up_hand = target_hand}, card)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
            end
        end
    end
}