workflow "New workflow" {
  resolves = ["GitHub Action for npm"]
  on = "push"
}

action "GitHub Action for npm" {
  uses = "actions/npm@1.0.0"
}

action "Build" {
  uses = "actions/npm@master"
  args = "install"
}

action "Test" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "test"
}
