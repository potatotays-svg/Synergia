
SMODS.Booster {
    key = 'idiot_pack',
    loc_txt = {
        name = "Idiot Pack",
        text = {
            [1] = 'Pick {C:attention}1 of 4{} Jokers from the {C:legendary}Synergia{} Mod'
        },
        group_name = "Idiot Pack"
    },
    config = { extra = 4, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "mycustom_mycustom_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "mycustom_idiot_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'jumbo_idiot_pack',
        loc_txt = {
            name = "Jumbo Idiot Pack",
            text = {
                [1] = 'Pick {C:attention}1 of 5{} Jokers from the {C:legendary}Synergia{} Mod'
            },
            group_name = "Jumbo Idiot Pack"
        },
        config = { extra = 5, choose = 1 },
        cost = 6,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "mycustom_mycustom_jokers",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "mycustom_jumbo_idiot_pack"
            }
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'mega_idiot_pack',
            loc_txt = {
                name = "Mega Idiot Pack",
                text = {
                    [1] = 'Pick {C:attention}2 of 5{} Jokers from the {C:legendary}Synergia{} Mod'
                },
                group_name = "Mega Idiot Pack"
            },
            config = { extra = 5, choose = 2 },
            cost = 8,
            weight = 0.45,
            atlas = "CustomBoosters",
            pos = { x = 2, y = 0 },
            discovered = true,
            loc_vars = function(self, info_queue, card)
                local cfg = (card and card.ability) or self.config
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                return {
                    set = "mycustom_mycustom_jokers",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "mycustom_mega_idiot_pack"
                }
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'minorarcanapack',
                loc_txt = {
                    name = "Minor Arcana Pack",
                    text = {
                        [1] = 'Pick {C:attention}1 of 4{} Minor Arcana Cards to be used immediately'
                    },
                    group_name = "Minor Archana Pack"
                },
                config = { extra = 4, choose = 1 },
                atlas = "CustomBoosters",
                pos = { x = 3, y = 0 },
                select_card = "consumeables",
                discovered = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "minor_archana",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "mycustom_minorarcanapack"
                    }
                end,
                particles = function(self)
                    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                        timer = 0.015,
                        scale = 0.2,
                        initialize = true,
                        lifespan = 1,
                        speed = 1.1,
                        padding = -1,
                        attach = G.ROOM_ATTACH,
                        colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                        fill = true
                    })
                    G.booster_pack_sparkles.fade_alpha = 1
                    G.booster_pack_sparkles:fade(1, 0)
                end,
            }
            
            
            SMODS.Booster {
                key = 'jumbominorarcanapack',
                loc_txt = {
                    name = "Jumbo Minor Arcana Pack",
                    text = {
                        [1] = 'Pick {C:attention}1 of 5{} Minor Arcana Cards to be used immediately'
                    },
                    group_name = "Jumbo Minor Archana Pack"
                },
                config = { extra = 5, choose = 1 },
                cost = 6,
                atlas = "CustomBoosters",
                pos = { x = 4, y = 0 },
                select_card = "consumeables",
                discovered = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "minor_archana",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "mycustom_jumbominorarcanapack"
                    }
                end,
                particles = function(self)
                    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                        timer = 0.015,
                        scale = 0.2,
                        initialize = true,
                        lifespan = 1,
                        speed = 1.1,
                        padding = -1,
                        attach = G.ROOM_ATTACH,
                        colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                        fill = true
                    })
                    G.booster_pack_sparkles.fade_alpha = 1
                    G.booster_pack_sparkles:fade(1, 0)
                end,
            }
            
            
            SMODS.Booster {
                key = 'megaminorarcanapack',
                loc_txt = {
                    name = "Mega Minor Arcana Pack",
                    text = {
                        [1] = 'Pick {C:attention}2 of 5{} Minor Arcana Cards to be used immediately'
                    },
                    group_name = "Maga Minor Archana Pack"
                },
                config = { extra = 5, choose = 2 },
                cost = 8,
                atlas = "CustomBoosters",
                pos = { x = 5, y = 0 },
                select_card = "consumeables",
                discovered = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    return {
                        set = "minor_archana",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "mycustom_megaminorarcanapack"
                    }
                end,
                particles = function(self)
                    G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                        timer = 0.015,
                        scale = 0.2,
                        initialize = true,
                        lifespan = 1,
                        speed = 1.1,
                        padding = -1,
                        attach = G.ROOM_ATTACH,
                        colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                        fill = true
                    })
                    G.booster_pack_sparkles.fade_alpha = 1
                    G.booster_pack_sparkles:fade(1, 0)
                end,
            }
            