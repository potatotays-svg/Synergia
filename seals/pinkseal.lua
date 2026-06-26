
SMODS.Seal {
    key = 'pinkseal',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('FF69B4'),
    loc_txt = {
        name = 'Pink Seal',
        label = 'Pink Seal',
        text = {
            [1] = 'Changes this card\'s {C:gold}Enhancement{} and {C:enhanced}Edition{} when this card is played and scores'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local enhancement_pool = {}
            for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                if enhancement.key ~= 'm_stone' then
                    enhancement_pool[#enhancement_pool + 1] = enhancement
                end
            end
            local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
            card:set_ability(random_enhancement)
            local random_edition = poll_edition('edit_card_edition', nil, true, true)
            if random_edition then
                card:set_edition(random_edition, true)
            end
            return {
                message = "Card Modified!"
            }
        end
    end
}