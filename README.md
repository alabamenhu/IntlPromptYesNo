> *Το «ναι» και το «όχι», αν και είναι οι πιο σύντομες από όλες τις λέξεις, χρειάζεται να τις σκεφθεί κανείς πολύ προηγουμένως.*
— Πυθαγόρας

# Intl::Prompt::YesNo

A module to ask a user for a yes/no response in a localized command line interface.
To use:

```raku
use Intl::Prompt::YesNo

my $answer = prompt-yes-no 'Queres falar em português?', :language<pt>;
# Queres falar em português? [s/n]

if $answer { 
  # they answered yes
} else { 
  # they answered no
}
```

If the user responds in an affirmative manner, the sub `prompt-yes-no` will return `True`.
If they respond in a negative manner, it returns `False`.

The sub accepts a single positional argument, which is the message to display alongside the prompt.
It would be best to obtain such a string through a module like `Fluent`.
There are two named arguments available:

  * **`:language`**  
The language should be a BCP-47 compliant language tag.  It defaults to whatever `Intl::UserLanguage`'s `user-language` returns, so you don't know necessarily need to specify it.
  * **`:long`**  
Many languages have multiple strings that are acceptable for the two responses.
By default, the shortest ones are used (`y/n` in English, `s/n` for Portuguese).
If you use `:long`, the longer ones are used (`yes/no`, or `sim/não` for Portuguese).
In either case, all variants are accepted.

## Version history

  * **v0.1** 
    * Initial release

## License and Copyright
© 2020 Matthew Stephen Stuckwisch.  Licensed under the Artistic License 2.0. 
But as this is very simple, feel free to hack this code up and integrate it in your own code without need for attribution.