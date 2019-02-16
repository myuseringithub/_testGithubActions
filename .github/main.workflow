workflow "Build" {
  resolves = ["Docker Tag"]
  on = "commit_comment"
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
}

action "Docker Tag" {
  uses = "actions/docker/tag@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["GitHub Action for Docker"]
  runs = "actions/docker/tag@master"
  args = "base github/base"
}
