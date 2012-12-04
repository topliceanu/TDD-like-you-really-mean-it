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

    fireProjectile = (plant) ->
        if plant then true else false

    hitZombie = (zombie) ->
        return true

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
        plant = true
        assert.equal true, fireProjectile plant

    it 'dead plant cannot fire a projectile', ->
        plant = false
        assert.equal false, fireProjectile plant

    it 'projectile hits zombie', ->
        zombie = true
        assert.equal true, hitZombie zombie

    it 'zombie bites plant', ->
        assert.equal true, (bite zombie, plant)
