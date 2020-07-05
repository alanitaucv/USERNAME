--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.score = params.score
    self.pipes = params.pipes
end

function PauseState:update(dt)
 if love.keyboard.wasPressed('p') then
    sounds['pause']:play()
    sounds['music']:play()
    gStateMachine:change('play',  {
        score = self.score,
        pipes = self.pipes
    })
 end
end

function PauseState:render()
    love.graphics.draw(pause, VIRTUAL_WIDTH/2 - 20, VIRTUAL_HEIGHT/2 - 20)
end
