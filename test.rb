def race(v1, v2, g)
    # your code
    list = []
    t=0
    m=0
    h=0
    # m1 = g + v1*3600*t
    # m2 = v2*3600*t
    value = (v2-v1)/3600.0*t
    until value.round == g do
        t += 1/3600.0
        # m1 = g + v1*3600*t
        # m2 = v2*3600*t
        value = (v2-v1)*t
        #puts "#{m1} | #{m2} "
    end
    puts "#{t}"
    t *= 3600.0
    hours = (t / 3600.0).floor
    t -= hours * 3600
    
    minutes = (t / 60.0).floor
    t -= minutes * 60
    
    seconds = t
    list << hours
    list << minutes
    list << seconds
    list
end

puts "#{race(720, 850, 70)}"
puts "#{race(80, 91, 37)}"
#puts "#{race(80, 100, 40)}"
