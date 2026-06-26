
SMODS.Joker{ --Consumed
    key = "consumed",
    config = {
        extra = {
            Used_Consumables = 0,
            MinorArchanaUsed = 0,
            tarotcardsused = 0,
            spectralcardsused = 0,
            planetcardsused = 0
        }
    },
    loc_txt = {
        ['name'] = 'Consumed',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+1{} Mult for every consumable used.',
            [2] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["mycustom_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Used_Consumables, card.ability.extra.MinorArchanaUsed, ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0) or 0), ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) or 0), ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.planet or 0) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local Used_Consumables_value = card.ability.extra.Used_Consumables
            card.ability.extra.Used_Consumables = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)
            card.ability.extra.Used_Consumables = (card.ability.extra.Used_Consumables) + (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)
            card.ability.extra.Used_Consumables = (card.ability.extra.Used_Consumables) + (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.planet or 0)
            card.ability.extra.Used_Consumables = (card.ability.extra.Used_Consumables) + card.ability.extra.MinorArchanaUsed
            return {
                mult = Used_Consumables_value
            }
        end
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'archana' or context.consumeable.ability.set == 'minor_archana') then
                return {
                    func = function()
                        card.ability.extra.MinorArchanaUsed = (card.ability.extra.MinorArchanaUsed) + 1
                        return true
                    end
                }
            end
        end
    end
}