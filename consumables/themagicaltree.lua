
SMODS.Consumable {
    key = 'themagicaltree',
    set = 'its_a_seal',
    pos = { x = 9, y = 4 },
    loc_txt = {
        name = 'The Magical Tree',
        text = {
            [1] = '{C:enhanced}He is real. Don\'t you frown. He can\'t live in the sea.{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { 
                handname = localize('High Card', 'poker_hands'), 
                chips = G.GAME.hands['High Card'].chips, 
                mult = G.GAME.hands['High Card'].mult, 
                level = G.GAME.hands['High Card'].level 
            }
        )
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
        delay(1.3)
        level_up_hand(card, "High Card", true, 500)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
            {handname=localize('High Card', 'poker_hands'), 
                chips = G.GAME.hands['High Card'].chips, 
                mult = G.GAME.hands['High Card'].mult, 
            level=G.GAME.hands['High Card'].level})    
            delay(1.3)
            update_hand_text(
                { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { 
                    handname = localize('Pair', 'poker_hands'), 
                    chips = G.GAME.hands['Pair'].chips, 
                    mult = G.GAME.hands['Pair'].mult, 
                    level = G.GAME.hands['Pair'].level 
                }
            )
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
            delay(1.3)
            level_up_hand(card, "Pair", true, 500)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Pair', 'poker_hands'), 
                    chips = G.GAME.hands['Pair'].chips, 
                    mult = G.GAME.hands['Pair'].mult, 
                level=G.GAME.hands['Pair'].level})    
                delay(1.3)
                update_hand_text(
                    { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                    { 
                        handname = localize('Two Pair', 'poker_hands'), 
                        chips = G.GAME.hands['Two Pair'].chips, 
                        mult = G.GAME.hands['Two Pair'].mult, 
                        level = G.GAME.hands['Two Pair'].level 
                    }
                )
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = true
                        return true
                    end
                }))
                update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.9,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.8, 0.5)
                        return true
                    end
                }))
                update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.9,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = nil
                        return true
                    end
                }))
                update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                delay(1.3)
                level_up_hand(card, "Two Pair", true, 500)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                    {handname=localize('Two Pair', 'poker_hands'), 
                        chips = G.GAME.hands['Two Pair'].chips, 
                        mult = G.GAME.hands['Two Pair'].mult, 
                    level=G.GAME.hands['Two Pair'].level})    
                    delay(1.3)
                    update_hand_text(
                        { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                        { 
                            handname = localize('Three of a Kind', 'poker_hands'), 
                            chips = G.GAME.hands['Three of a Kind'].chips, 
                            mult = G.GAME.hands['Three of a Kind'].mult, 
                            level = G.GAME.hands['Three of a Kind'].level 
                        }
                    )
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            play_sound('tarot1')
                            card:juice_up(0.8, 0.5)
                            G.TAROT_INTERRUPT_PULSE = true
                            return true
                        end
                    }))
                    update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.9,
                        func = function()
                            play_sound('tarot1')
                            card:juice_up(0.8, 0.5)
                            return true
                        end
                    }))
                    update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.9,
                        func = function()
                            play_sound('tarot1')
                            card:juice_up(0.8, 0.5)
                            G.TAROT_INTERRUPT_PULSE = nil
                            return true
                        end
                    }))
                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                    delay(1.3)
                    level_up_hand(card, "Three of a Kind", true, 500)
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                        {handname=localize('Three of a Kind', 'poker_hands'), 
                            chips = G.GAME.hands['Three of a Kind'].chips, 
                            mult = G.GAME.hands['Three of a Kind'].mult, 
                        level=G.GAME.hands['Three of a Kind'].level})    
                        delay(1.3)
                        update_hand_text(
                            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                            { 
                                handname = localize('Straight', 'poker_hands'), 
                                chips = G.GAME.hands['Straight'].chips, 
                                mult = G.GAME.hands['Straight'].mult, 
                                level = G.GAME.hands['Straight'].level 
                            }
                        )
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.2,
                            func = function()
                                play_sound('tarot1')
                                card:juice_up(0.8, 0.5)
                                G.TAROT_INTERRUPT_PULSE = true
                                return true
                            end
                        }))
                        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.9,
                            func = function()
                                play_sound('tarot1')
                                card:juice_up(0.8, 0.5)
                                return true
                            end
                        }))
                        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.9,
                            func = function()
                                play_sound('tarot1')
                                card:juice_up(0.8, 0.5)
                                G.TAROT_INTERRUPT_PULSE = nil
                                return true
                            end
                        }))
                        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                        delay(1.3)
                        level_up_hand(card, "Straight", true, 500)
                        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                            {handname=localize('Straight', 'poker_hands'), 
                                chips = G.GAME.hands['Straight'].chips, 
                                mult = G.GAME.hands['Straight'].mult, 
                            level=G.GAME.hands['Straight'].level})    
                            delay(1.3)
                            update_hand_text(
                                { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                                { 
                                    handname = localize('Flush', 'poker_hands'), 
                                    chips = G.GAME.hands['Flush'].chips, 
                                    mult = G.GAME.hands['Flush'].mult, 
                                    level = G.GAME.hands['Flush'].level 
                                }
                            )
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.2,
                                func = function()
                                    play_sound('tarot1')
                                    card:juice_up(0.8, 0.5)
                                    G.TAROT_INTERRUPT_PULSE = true
                                    return true
                                end
                            }))
                            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.9,
                                func = function()
                                    play_sound('tarot1')
                                    card:juice_up(0.8, 0.5)
                                    return true
                                end
                            }))
                            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.9,
                                func = function()
                                    play_sound('tarot1')
                                    card:juice_up(0.8, 0.5)
                                    G.TAROT_INTERRUPT_PULSE = nil
                                    return true
                                end
                            }))
                            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                            delay(1.3)
                            level_up_hand(card, "Flush", true, 500)
                            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                                {handname=localize('Flush', 'poker_hands'), 
                                    chips = G.GAME.hands['Flush'].chips, 
                                    mult = G.GAME.hands['Flush'].mult, 
                                level=G.GAME.hands['Flush'].level})    
                                delay(1.3)
                                update_hand_text(
                                    { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                                    { 
                                        handname = localize('Full House', 'poker_hands'), 
                                        chips = G.GAME.hands['Full House'].chips, 
                                        mult = G.GAME.hands['Full House'].mult, 
                                        level = G.GAME.hands['Full House'].level 
                                    }
                                )
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.2,
                                    func = function()
                                        play_sound('tarot1')
                                        card:juice_up(0.8, 0.5)
                                        G.TAROT_INTERRUPT_PULSE = true
                                        return true
                                    end
                                }))
                                update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.9,
                                    func = function()
                                        play_sound('tarot1')
                                        card:juice_up(0.8, 0.5)
                                        return true
                                    end
                                }))
                                update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.9,
                                    func = function()
                                        play_sound('tarot1')
                                        card:juice_up(0.8, 0.5)
                                        G.TAROT_INTERRUPT_PULSE = nil
                                        return true
                                    end
                                }))
                                update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                                delay(1.3)
                                level_up_hand(card, "Full House", true, 500)
                                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                                    {handname=localize('Full House', 'poker_hands'), 
                                        chips = G.GAME.hands['Full House'].chips, 
                                        mult = G.GAME.hands['Full House'].mult, 
                                    level=G.GAME.hands['Full House'].level})    
                                    delay(1.3)
                                    update_hand_text(
                                        { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                                        { 
                                            handname = localize('Four of a Kind', 'poker_hands'), 
                                            chips = G.GAME.hands['Four of a Kind'].chips, 
                                            mult = G.GAME.hands['Four of a Kind'].mult, 
                                            level = G.GAME.hands['Four of a Kind'].level 
                                        }
                                    )
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.2,
                                        func = function()
                                            play_sound('tarot1')
                                            card:juice_up(0.8, 0.5)
                                            G.TAROT_INTERRUPT_PULSE = true
                                            return true
                                        end
                                    }))
                                    update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.9,
                                        func = function()
                                            play_sound('tarot1')
                                            card:juice_up(0.8, 0.5)
                                            return true
                                        end
                                    }))
                                    update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.9,
                                        func = function()
                                            play_sound('tarot1')
                                            card:juice_up(0.8, 0.5)
                                            G.TAROT_INTERRUPT_PULSE = nil
                                            return true
                                        end
                                    }))
                                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                                    delay(1.3)
                                    level_up_hand(card, "Four of a Kind", true, 500)
                                    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                                        {handname=localize('Four of a Kind', 'poker_hands'), 
                                            chips = G.GAME.hands['Four of a Kind'].chips, 
                                            mult = G.GAME.hands['Four of a Kind'].mult, 
                                        level=G.GAME.hands['Four of a Kind'].level})    
                                        delay(1.3)
                                        update_hand_text(
                                            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                                            { 
                                                handname = localize('Five of a Kind', 'poker_hands'), 
                                                chips = G.GAME.hands['Five of a Kind'].chips, 
                                                mult = G.GAME.hands['Five of a Kind'].mult, 
                                                level = G.GAME.hands['Five of a Kind'].level 
                                            }
                                        )
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.2,
                                            func = function()
                                                play_sound('tarot1')
                                                card:juice_up(0.8, 0.5)
                                                G.TAROT_INTERRUPT_PULSE = true
                                                return true
                                            end
                                        }))
                                        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.9,
                                            func = function()
                                                play_sound('tarot1')
                                                card:juice_up(0.8, 0.5)
                                                return true
                                            end
                                        }))
                                        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.9,
                                            func = function()
                                                play_sound('tarot1')
                                                card:juice_up(0.8, 0.5)
                                                G.TAROT_INTERRUPT_PULSE = nil
                                                return true
                                            end
                                        }))
                                        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                                        delay(1.3)
                                        level_up_hand(card, "Five of a Kind", true, 500)
                                        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                                            {handname=localize('Five of a Kind', 'poker_hands'), 
                                                chips = G.GAME.hands['Five of a Kind'].chips, 
                                                mult = G.GAME.hands['Five of a Kind'].mult, 
                                            level=G.GAME.hands['Five of a Kind'].level})    
                                            delay(1.3)
                                            update_hand_text(
                                                { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                                                { 
                                                    handname = localize('Straight Flush', 'poker_hands'), 
                                                    chips = G.GAME.hands['Straight Flush'].chips, 
                                                    mult = G.GAME.hands['Straight Flush'].mult, 
                                                    level = G.GAME.hands['Straight Flush'].level 
                                                }
                                            )
                                            G.E_MANAGER:add_event(Event({
                                                trigger = 'after',
                                                delay = 0.2,
                                                func = function()
                                                    play_sound('tarot1')
                                                    card:juice_up(0.8, 0.5)
                                                    G.TAROT_INTERRUPT_PULSE = true
                                                    return true
                                                end
                                            }))
                                            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                                            G.E_MANAGER:add_event(Event({
                                                trigger = 'after',
                                                delay = 0.9,
                                                func = function()
                                                    play_sound('tarot1')
                                                    card:juice_up(0.8, 0.5)
                                                    return true
                                                end
                                            }))
                                            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                                            G.E_MANAGER:add_event(Event({
                                                trigger = 'after',
                                                delay = 0.9,
                                                func = function()
                                                    play_sound('tarot1')
                                                    card:juice_up(0.8, 0.5)
                                                    G.TAROT_INTERRUPT_PULSE = nil
                                                    return true
                                                end
                                            }))
                                            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                                            delay(1.3)
                                            level_up_hand(card, "Straight Flush", true, 500)
                                            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                                                {handname=localize('Straight Flush', 'poker_hands'), 
                                                    chips = G.GAME.hands['Straight Flush'].chips, 
                                                    mult = G.GAME.hands['Straight Flush'].mult, 
                                                level=G.GAME.hands['Straight Flush'].level})    
                                                delay(1.3)
                                                update_hand_text(
                                                    { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                                                    { 
                                                        handname = localize('Flush House', 'poker_hands'), 
                                                        chips = G.GAME.hands['Flush House'].chips, 
                                                        mult = G.GAME.hands['Flush House'].mult, 
                                                        level = G.GAME.hands['Flush House'].level 
                                                    }
                                                )
                                                G.E_MANAGER:add_event(Event({
                                                    trigger = 'after',
                                                    delay = 0.2,
                                                    func = function()
                                                        play_sound('tarot1')
                                                        card:juice_up(0.8, 0.5)
                                                        G.TAROT_INTERRUPT_PULSE = true
                                                        return true
                                                    end
                                                }))
                                                update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                                                G.E_MANAGER:add_event(Event({
                                                    trigger = 'after',
                                                    delay = 0.9,
                                                    func = function()
                                                        play_sound('tarot1')
                                                        card:juice_up(0.8, 0.5)
                                                        return true
                                                    end
                                                }))
                                                update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                                                G.E_MANAGER:add_event(Event({
                                                    trigger = 'after',
                                                    delay = 0.9,
                                                    func = function()
                                                        play_sound('tarot1')
                                                        card:juice_up(0.8, 0.5)
                                                        G.TAROT_INTERRUPT_PULSE = nil
                                                        return true
                                                    end
                                                }))
                                                update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                                                delay(1.3)
                                                level_up_hand(card, "Flush House", true, 500)
                                                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                                                    {handname=localize('Flush House', 'poker_hands'), 
                                                        chips = G.GAME.hands['Flush House'].chips, 
                                                        mult = G.GAME.hands['Flush House'].mult, 
                                                    level=G.GAME.hands['Flush House'].level})    
                                                    delay(1.3)
                                                    update_hand_text(
                                                        { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                                                        { 
                                                            handname = localize('Flush Five', 'poker_hands'), 
                                                            chips = G.GAME.hands['Flush Five'].chips, 
                                                            mult = G.GAME.hands['Flush Five'].mult, 
                                                            level = G.GAME.hands['Flush Five'].level 
                                                        }
                                                    )
                                                    G.E_MANAGER:add_event(Event({
                                                        trigger = 'after',
                                                        delay = 0.2,
                                                        func = function()
                                                            play_sound('tarot1')
                                                            card:juice_up(0.8, 0.5)
                                                            G.TAROT_INTERRUPT_PULSE = true
                                                            return true
                                                        end
                                                    }))
                                                    update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                                                    G.E_MANAGER:add_event(Event({
                                                        trigger = 'after',
                                                        delay = 0.9,
                                                        func = function()
                                                            play_sound('tarot1')
                                                            card:juice_up(0.8, 0.5)
                                                            return true
                                                        end
                                                    }))
                                                    update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                                                    G.E_MANAGER:add_event(Event({
                                                        trigger = 'after',
                                                        delay = 0.9,
                                                        func = function()
                                                            play_sound('tarot1')
                                                            card:juice_up(0.8, 0.5)
                                                            G.TAROT_INTERRUPT_PULSE = nil
                                                            return true
                                                        end
                                                    }))
                                                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(500) })
                                                    delay(1.3)
                                                    level_up_hand(card, "Flush Five", true, 500)
                                                    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                                                        {handname=localize('Flush Five', 'poker_hands'), 
                                                            chips = G.GAME.hands['Flush Five'].chips, 
                                                            mult = G.GAME.hands['Flush Five'].mult, 
                                                        level=G.GAME.hands['Flush Five'].level})    
                                                        delay(1.3)
                                                    end,
                                                    can_use = function(self, card)
                                                        return true
                                                    end
                                                }