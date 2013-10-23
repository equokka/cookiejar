class CookieJar
  def initialize(*names)
    @names = names
    reset # actually setting, not resetting (who cares)
  end

  def start(options={})
    # this is a gateway method to #debate that uses all the other methods.
    # only #new and #start (this mehtod) are public

    options[:times].nil? ? times = @names.count : times = options[:times]
    options[:repeat].nil? ? repeat = false : repeat = options[:repeat]
    options[:delay].nil? ? delay = false : delay = options[:delay]
    
    debate times, repeat, delay
  end

  private

  def say(name, str, delay = false) #f acilitator
    unless name.nil? || name == ""
      init = "#{name}: "
    else
      init = ""
    end
    puts "#{init}#{str}"
    sleep 1 if delay
  end
  def reset
    name = lastname = c_denial = l_denial = ""
    denials = ["Not me!", "Couldn't be!", "Wasn't me!"]
    c_debate = 0
    repeated_names = []
  end
  def new_name(repeat) # resetter for naming, also with repeat control
    repeated_names << name
    loop do
      name = @names[rand @names.count]
      break unless repeated_names.include? name && repeat
    end
  end
  def new_denial # resetter for denials, repeating will never occur
    l_denial = c_denial
    loop do
      c_denial = denials[rand 3]
      break unless c_denial == l_denial
    end
  end
  def debate(t, r, d) # output-er
    say nil, "Who stole the cookie from the cookie jar?", d

    t.times do
      c_debate += 1 #error here (????????????)
      new_name r
      new_denial

      say lastname, "#{name} stole the cookie from the cookie jar.", d
      say name, "Who, me?", d
      say lastname, "Yes, you!", d
      unless c_debate == t # dont blame the innocent
        say name, c_denial, d
        say lastname, "Then who?", d
      else # they DID steal the damn cookie
        new_name r 

        say name, "Okay, okay... I stole the cookie!", d
        say name, "I stole the cookie from the cookie jar.", d
        say name, "The yummy, yummy cookie from the cookie jar", d
        say lastname, "Are you hungry?", d
        say name, "Uh-huh.", d
        say lastname, "Let's share!", d

        reset
        break
      end
    end
  end
end