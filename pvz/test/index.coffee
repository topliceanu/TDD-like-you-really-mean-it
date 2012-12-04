assert = require 'assert'

describe 'Plants vs. Zombie', ->

    before: ->

    it 'should detect that the game is over', ->
        zombie = true
        plant = false
        gameEnded = (zombie and not plant) or (not zombie and plant)
        assert.equal true, gameEnded

    it 'zombie is dead', ->
        isDeadZombie = (zombie) ->
            zombie is 0
        zombie = 0
        assert.equal true, isDeadZombie zombie
