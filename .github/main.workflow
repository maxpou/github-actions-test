workflow "Build, Test and Lint" {
  resolves = ["sitespeed", "custom"]
  on = "push"
}

action "custom" {
  uses = "./action-speedtest.io-netlify"
  args = "world"
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
  needs = ["Test", "Lint"]
  uses = "netlify/actions/build@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    NETLIFY_CMD = "npm run build"
    NETLIFY_DIR = "build"
  }
}

action "sitespeed" {
  needs = "Pre-publish"
  uses = "docker://sitespeedio/sitespeed.io:8.0.6-action"
  args = "https://deploy-preview-4--github-actions-test.netlify.com/ -n 1 --budget.configPath /github/workspace/.github/budget.json"
}
