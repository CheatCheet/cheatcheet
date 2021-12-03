# CHEATCHEET

**CheatCheet** is a project that aims to *simplify answers to specific tech questions*.

Users can create posts that contains the correct answer to a question/problem they've one day met.
A post contains a title (the Question - `What ?`) and a body (the Answer - `How ?`)

## Technical Stack

- Ruby `3.0.3`
- Ruby on Rails `6.1.4`
- [Hotwire](https://hotwired.dev/)
- [Simplecss](https://simplecss.org/)

## Install

### Pre-requisites
- Ruby `3.0.3`
- Ruby on Rails `6.1.4`
- PostgreSQL `>~ 13`

### Clone the repository
```
git clone git@github.com:phanremy/cheatcheet.git
cd cheatcheet
```

### Install dependencies
```
bundle
yarn
```

### Initialize the database
```
rails db:create db:migrate db:seed
```

### Serve

#### If you're using [Overmind](https://github.com/DarthSim/overmind)
```
overmind s
```

#### Classique way
```
rails s
```

## Testing
- [MiniTest](https://guides.rubyonrails.org/testing.html)
```
rails test
```

