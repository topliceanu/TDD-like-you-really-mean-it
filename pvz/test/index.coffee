assert = require 'assert'

describe 'Plants vs. Zombie', ->

    # Initial scenario.
    zombie = true
    plant = false

    zombieIsDead = (zombie) ->
        not zombie

    plantIsDead = (plant) ->
        not plant

    it 'should detect that the game is over', ->
        gameEnded = (zombie and plantIsDead plant) or ((zombieIsDead zombie) and plant)
        assert.equal true, gameEnded

    it 'zombie is alive', ->
        assert.equal false, zombieIsDead zombie

    it 'plant is dead', ->
        assert.equal true, plantIsDead plant
