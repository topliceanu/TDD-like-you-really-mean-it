assert = require 'assert'

describe 'Plants vs. Zombie', ->

    before: ->

    it 'should detect that the game is over', ->
        zombie = true
        plant = false
        gameEnded = (zombie and not plant) or (not zombie and plant)
        assert.equal true, gameEnded
