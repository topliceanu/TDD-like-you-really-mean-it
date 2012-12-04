assert = require 'assert'

describe 'Plants vs. Zombie', ->

    zombie = true
    plant = false

    it 'should detect that the game is over', ->
        gameEnded = (zombie and not plant) or (not zombie and plant)
        assert.equal true, gameEnded

    it 'zombie is alive', ->
        assert.equal zombie, true

    it 'plant is dead', ->
        assert.equal plant, false
