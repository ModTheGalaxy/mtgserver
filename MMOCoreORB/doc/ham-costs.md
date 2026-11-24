# Stat-adjusted HAM costs

Strength, Quickness, and Focus reduce Health, Action, and Mind costs,
respectively, using the creature's current stat. The shared cost formula is
unchanged through 600, except that a positive cost cannot truncate to zero.
Above 600, its unrounded cost is:

```
base cost * (0.25 + 0.50 / (1 + (stat - 600) / 600))
```

For a base cost of 100, this is 75 at 600, approximately 58.3 at 900,
50 at 1200, and 45 at 1500. Whole-point deductions truncate, but the
minimum is rounded up to at least 25% of the pre-stat cost and at least one
point. Intentionally zero base costs remain zero.

Surveying, sampling, medical DOT packs, and entertainer flourishes retain
their own cost rates through 600 and use diminishing returns toward the
same 25% floor above it. A flourish whose old cost is already below the
floor at or below 600 is raised to the floor.

The floor limits the stat discount, not separate discounts: weapon
powerups, command multipliers, and skill modifiers can change or eliminate
the cost independently.

## Player regeneration

Constitution, Stamina, and Willpower regenerate Health, Action, and Mind.
For players, each stat point above 1000 provides half its previous
regeneration benefit: the effective stat is `1000 + (stat - 1000) * 0.5`
above that threshold. Regeneration remains unchanged at or below 1000, and
there is no hard cap. Existing tick timing, rounding, posture modifiers,
and non-player regeneration are unchanged.

## Doctor enhancements

Doctor Health and Action enhancement power is unchanged through 1200.
Above that, the enhancement is:

```
1200 + floor(800 * (power - 1200) / (800 + power - 1200))
```

Strength, Constitution, Quickness, and Stamina enhancements are unchanged
through 1000. Above that, the enhancement is:

```
1000 + floor(500 * (power - 1000) / (500 + power - 1000))
```

Both curves use power after medical rating, wound treatment, and battle
fatigue. At 2405 power, Health/Action gain 1680 and the secondary stats
gain 1368. These curves approach 2000 and 1500 respectively without
reaching them; whole-point rounding can make adjacent powers yield the
same enhancement. Protection enhancements are not affected. Existing
active doctor buffs retain their saved amounts until
they expire or are replaced.

## Entertainer enhancements

Dance Mind enhancement and music Focus/Willpower enhancement are flat
amounts, independent of the patron's base stats. Raw power is
`floor(accumulated performance strength * 2405 / 100)`. Mind uses the
doctor Health/Action curve; Focus and Willpower use the doctor secondary
curve. At 100 strength, Mind gains 1680 and Focus/Willpower each gain 1368,
matching a doctor enhancement with 2405 calculated power. Strength still builds
up over time and is limited by the entertainer's corresponding enhancement
skill and eligible faction perk.

At 125 strength, Mind gains 1754 and Focus/Willpower each gain 1400.
The results approach 2000 and 1500 respectively without reaching them.
There is no additional 125-point cap on the enhancement skill; existing
skill-mod limits still apply. Existing active buffs retain their saved
amounts until they expire or are replaced.
