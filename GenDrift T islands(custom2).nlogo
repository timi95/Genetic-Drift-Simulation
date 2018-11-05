breed [humans human1]
breed [humans2 human2]
breed [humans3 human3]
breed [humans4 human4]
globals[colour coordx coordy];global coordinates are not needed, but I use them here so I can move the turtles around on setup


to setup
  clear-all
  set-default-shape humans "person"
  set-default-shape humans2 "person"
  set-default-shape humans3 "person"
  set-default-shape humans4 "person"


  create-humans number[;varies the population size of a breed
    set colour 33
    set color colour
    setxy random-xcor random-ycor]
  create-humans2 number2[
    set colour 16
    set color colour
    setxy (random-xcor ) (random-ycor )]
  create-humans3 number3[
    set colour 45
    set color colour
    setxy random-xcor random-ycor]
    
    ;painting land and sea
  ask Patches
  [
    ifelse(pxcor >= -20 and pxcor <= -2 and pycor >= -10 and pycor <= 5)
    [set pcolor 26.5]
    [set pcolor 96]

    if(pxcor >= -2 and pxcor <= 19 and pycor >= 5 and pycor <= 19)
    [set pcolor 26.5]

  ]
  reset-ticks
end

to go
  if variance [color] of turtles = 0
    [ stop ]
  ask turtles [
    rt random 50
    lt random 50
    fd 0.1
  ]

  ask turtles[
    interact
    avoid-water]
  death
  tick
end

to interact ; have them mate on contact, changing the scope affects inbreeding
  if any? other turtles-here
  [ birth
    birth2
    birth3
  ]
;detect interaction
end
;; turtles hatch between 0 and 4 babies
to birth
     hatch-humans random 7 [ fd 0.1 ]
end
to birth2
     hatch-humans2 random 5  [ fd 0.1 ]
end
to birth3
     hatch-humans3 random 6  [ fd 0.1 ]
end

to mix

  ask humans
  [ if any? other humans2-here
  [hatch-humans4 random 1
    [fd 0.1
      set color green]]

  if any? other humans3-here
  [hatch-humans4 random 1
    [fd 0.1
      set color green]]]
  ask humans2
  [
     if any? other humans-here
  [hatch-humans4 random 1
    [fd 0.1
      set color green]]

       if any? other humans3-here
  [hatch-humans4 random 1
    [fd 0.1
      set color green]]
  ]
  ask humans3
  [if any? other humans-here
  [hatch-humans4 random 1
    [fd 0.1
      set color green]]

   if any? other humans2-here
  [hatch-humans4 random 1
    [fd 0.1
      set color green]]]


end

to avoid-water;have them stay mostly on the island, but also let a few drown to keep population constant :)
    if(pcolor = 96)
    [
     bk 0.01
     lt 90
    ]
end

;; if the overall population is greater than the original number,
;; randomly kill turtles to keep population roughly constant
to death
  let total-turtles count turtles
  ask turtles
  [
    if (random total-turtles > (number + number2 + number3)/ 3 )
      [ die ]

    if pcolor = 96
    [die]
  ]



end

