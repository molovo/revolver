# Revolver

A progress spinner for ZSH scripts

[![asciicast](https://asciinema.org/a/ex8z3z6d5m7uv4buww0o2qeq2.png)](https://asciinema.org/a/ex8z3z6d5m7uv4buww0o2qeq2)

## Installation

### [Zulu](https://github.com/zulu-zsh/zulu)

```sh
zulu install revolver
```

### zplug

```sh
zplug "molovo/revolver", \
  as:command, \
  use:revolver
```

### [Homebrew](http://brew.sh)

```sh
brew install molovo/revolver/revolver
```

### Manual

```sh
git clone https://github.com/molovo/revolver revolver
chmod u+x revolver/revolver
mv revolver/revolver /usr/local/bin
```

## Usage

```sh
revolver start 'Your awesome message'

# Do something here

revolver update 'A different message'

# Do something else here

revolver stop
```

## Styles

Revolver comes with a `revolver demo` command which demonstrates each of the
included spinner styles. Once you've found one you like, select it using the
`--style` option.

```sh
revolver --style 'bouncingBall' 'The spinner message'
```

## License

Copyright (c) 2016 James Dinsdale <hi@molovo.co> (molovo.co)

Revolver is licensed under The MIT License (MIT)

## Team

* [James Dinsdale](http://molovo.co)
