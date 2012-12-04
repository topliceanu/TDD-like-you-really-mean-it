assert = require 'assert'

describe 'Plants vs. Zombie', ->

    zombieIsDead = (zombie) ->
        zombie is false

    zombieIsAlive = (zombie) ->
        zombie is true

    plantIsDead = (plant) ->
        plant is false

    plantIsAlive = (plant) ->
        plant is true

    it 'should detect that zombie won', ->
        zombie = true
        plant = false
        gameEnded = ((zombieIsAlive zombie) and (plantIsDead plant)) or ((zombieIsDead zombie) and (plantIsAlive plant))
        assert.equal true, gameEnded

    it 'should detect that zombie is dead', ->
        zombie = false
        assert.equal true, zombieIsDead zombie

    it 'should detect that zombie is alive', ->
        zombie = true
        assert.equal true, zombieIsAlive zombie

    it 'should detect that plant is dead', ->
        plant = false
        assert.equal true, plantIsDead plant

    it 'should detect that plant is alive', ->
        plant = true
        assert.equal true, plantIsAlive plant

    it 'plant should fire a projectile', ->
        assert.equal true, fireProjectile plant


