assert = require 'assert'

describe 'Plants vs. Zombie', ->

    zombie = true
    plant = false

    zombieIsDead = (zombie) ->
        not zombie

    it 'should detect that the game is over', ->
        gameEnded = (zombie and not plant) or ((zombieIsDead zombie) and plant)
        assert.equal true, gameEnded

    it 'zombie is alive', ->
        assert.equal false, zombieIsDead zombie

    it 'plant is dead', ->
        assert.equal plant, false
