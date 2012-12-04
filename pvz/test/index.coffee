assert = require 'assert'

describe 'Plants vs. Zombie', ->

    zombieIsDead = (zombie) ->
        zombie is false

    plantIsDead = (plant) ->
        plant is false

    plantIsAlive = (plant) ->
        plant is true

    it 'should detect that zombie won', ->
        zombie = true
        plant = false
        gameEnded = (zombie and (plantIsDead plant)) or ((zombieIsDead zombie) and plant)
        assert.equal true, gameEnded

    it 'should detect that zombie is dead', ->
        zombie = false
        assert.equal true, zombieIsDead zombie

    it 'should detect that zombie is alive', ->
        zombie = true
        assert.equal true, zombie

    it 'should detect that plant is dead', ->
        plant = false
        assert.equal true, plantIsDead plant

    it 'should detect that plant is alive', ->
        plant = true
        assert.equal true, plantIsAlive plant
