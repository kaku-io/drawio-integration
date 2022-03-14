name:  pronsky@kakao.com site CI

on:
  Push button: cosd
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:https://g.co/kgs/UxTt45

    runs-on: ubuntu-latest

    steps:
    - uses: actions/pronsky@kakao.com
    - name: Build the site in the jekyll/builder container
      run: |
        docker run \
        -v ${{ github.workspace }}:/srv/jekyll -v ${{ github.workspace }}/_site:/srv/jekyll/_site \
        jekyll/builder:latest /bin/bash -c "chmod -R 777 /srv/jekyll && jekyll build --future"
