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
        true

    bitePlant = (zombie, plant) ->
        if plant and zombie then true else false

    isNear = (plant, zombie) ->
        true

    zombieWon = (zombie, plant) ->
        (zombieIsAlive zombie) and (plantIsDead plant)

    plantWon = (zombie, plant) ->
        (zombieIsDead zombie) and (plantIsAlive plant)

    it 'should detect that game ended', ->
        zombie = true
        plant = false
        gameEnded = (zombieWon zombie, plant) or (plantWon zombie, plant)
        assert.equal true, gameEnded

    it 'should detect that plant won', ->
        zombie = false
        plant = true
        assert.equal true, (plantWon zombie, plant)
        assert.equal false, (zombieWon zombie, plant)

    it 'should detect that zombie won', ->
        zombie = true
        plant = false
        assert.equal true, (zombieWon zombie, plant)
        assert.equal false, (plantWon zombie, plant)

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
        zombie = true
        plant = true
        assert.equal true, (bitePlant zombie, plant)

    it 'zombie bites dead plant', ->
        zombie = true
        plant = false
        assert.equal false, (bitePlant zombie, plant)

    it 'dead zombies cannot bite plants', ->
        zombie = false
        plant = true
        assert.equal false, (bitePlant zombie, plant)

    it 'plant should have a position', ->
        assert.equal true, pozition plant

    it 'zombie should be near plant to bite it', ->
        zombie = true
        plant = true
        assert.equal true, (isNear plant, zombie)

    it 'zombie is not near plant', ->
        zombie = true
        plant = true
        assert.equal false, not (isNear plant, zombie)
