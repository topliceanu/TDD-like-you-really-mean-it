## TDD like you really mean it - PVZ edition

**"TDD like you really mean it"** is an extreme coding technique that reveals the true nature of TDD.

Knowledge of the traditional TDD technique is assumed. For a quick refresher, please refer to the appendix at the bottom of this page.

**In "TDD like you really mean it", your workflow is going to be:**
- to only add brand-new code to test methods in a test class.
- to only add just enough production code in order to make a failing test pass (production code goes into the same test method).
- to only create new non-test methods by way of the "extract method" (when you notice duplication of production code).
- to only create new classes as destinations for "move method".

**Be very strict about this. Refactoring only happens:**
- by extracting code from test methods into non-test methods in the same test class, when duplication of code has been observed.
- by moving non-test methods into domain-specific classes, when the solution design eventually starts to emerge.

Inevitably, there is going to be an initial mental block due to the fact that there is no solution code to test - you obviously can't have tests that talk about a solution that doesn't exist yet.  
So how do you move past this initial mental block?  
How do you jumpstart the process?  
Is there anything you can write tests about?  
**Yes.**  
You can write tests about inputs and outputs without there being a piece of formally structured code that takes those inputs and produces those outputs.  
You can write tests about domain-specific computations as they intrinsically exist outside of any solution design.  
In other words, you can write tests about the problem domain, because that's all there is for you to write tests about.  
You are going to notice how the next step in your solution design emerges from the code you wrote to make those tests about the problem pass.  
That's the way in.  
The process isn't going to feel natural, and it's going to make your brain hurt, but remember - if your brain doesn't hurt once in a while, you're not really learning anything new.  

### The invariants of the Plants vs. Zombies game

Zombie speed: 20cm per second  
Zombie speed after being hit by a snow pea: 10cm per second  
Projectile speed: 3m per second  

#### Plant varieties:
<table>
<tr>
<td><img src="http://dserban.github.com/tmp/pvz/Gun.png"></td>
<td><strong>Regular Gun</strong><br>fires 1 regular projectile per second</td>
</tr>
<tr>
<td><img src="http://dserban.github.com/tmp/pvz/Repeater.png"></td>
<td><strong>Repeater Gun</strong><br>fires 2 regular projectiles per second</td>
</tr>
<tr>
<td><img src="http://dserban.github.com/tmp/pvz/SnowGun.png"></td>
<td><strong>Snow Gun</strong><br>fires 1 snow pea per second</td>
</tr>
</table>

Upon impact, each projectile removes 1 life from the leading zombie. Projectiles do not reach any zombies who are behind the leading zombie.

A zombie's resilience is measured by the number of lives (a.k.a. how many projectiles a zombie can absorb before dropping to the ground).

#### Zombie varieties:
<table>
<tr>
<td><img src="http://dserban.github.com/tmp/pvz/RegularZombie.png"></td>
<td><strong>Regular Zombie</strong><br>Resilience: 10 lives</td>
</tr>
<tr>
<td><img src="http://dserban.github.com/tmp/pvz/ConeheadZombie.png"></td>
<td><strong>Conehead Zombie</strong><br>Resilience: 28 lives</td>
</tr>
<tr>
<td><img src="http://dserban.github.com/tmp/pvz/BucketheadZombie.png"></td>
<td><strong>Buckethead Zombie</strong><br>Resilience: 65 lives</td>
</tr>
</table>

When a zombie arrives at a plant, it stops while devouring the plant, then resumes walking.  
When devouring a plant, a zombie bites twice every second.  
(After being hit by a snow pea, a zombie bites once every second.)  
A plant is completely devoured after 6 zombie bites.  
While it's being devoured, a plant continues to emit projectiles as per usual, and the zombie devouring the plant keeps absorbing those projectiles.  

### The problem statement

Pick one plant variety and one zombie variety from the above selections.  
For a given initial distance between the plant and the zombie, test-drive a program that determines who wins.  
If the plant and the zombie are too close to one another at the start of the game, the zombie is resilient enough to walk up to the plant and devour it completely - **the zombie wins**.  
If the plant and the zombie are far enough apart, there is plenty of time for the plant to shoot as many projectiles as it takes to kill the zombie from a distance - **the plant wins**.  
Therefore an equilibrium distance exists, where the plant wins, but just barely. What is that distance? Test-drive a program that you can use to manually find the answer by trial and error.

### Appendix: The traditional TDD technique

**Add a test**
- the simplest one you can think of

**See it fail**
- nobody ever learned anything from a passing test
- not compiling counts as failing
- in dynamic languages, exceptions such as NameError, AttributeError and NoMethodError count as failing

**Make all tests pass**
- by implementing the absolute minimum amount of production code, even if the code is trivial

**(Optionally) Refactor production code**

**(Optionally) Refactor test code**

**Repeat until done**

Design thinking **only** happens during the refactoring steps.

