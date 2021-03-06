workflow "Build, Test and Lint" {
  resolves = ["Test", "Lint", "Pre-publish"]
  on = "push"
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

action "Lint" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "run lint"
}

action "Pre-publish" {
  uses = "netlify/actions/build@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    NETLIFY_CMD = "npm run build"
    NETLIFY_DIR = "build"
  }
}