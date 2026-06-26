
SMODS.Enhancement {
    key = 'unstable',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 2,
            odds = 2
        }
    },
    loc_txt = {
        name = 'Unstable',
        text = {
            [1] = '{C:green}1 in 2{} chance to change rank.',
            [2] = '{C:green}1 in 2 {} chance to change suit.'
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
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_e21fc88e', 1, card.ability.extra.odds, 'j_mycustom_unstable', false) then
                assert(SMODS.change_base(card, nil, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
            end
        end
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_378c6201', 1, card.ability.extra.odds, 'j_mycustom_unstable', false) then
                assert(SMODS.change_base(card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, nil))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
            end
        end
    end
}