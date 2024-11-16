name: Build

on:
  workflow_dispatch:

permissions:
  contents: write

jobs:
  Build:
    name: Build
    runs-on: ubuntu-latest
    steps:
    - name: Check out
      uses: actions/checkout@v4
      with: 
        repository: '${{ secrets.ROOT }}'
        ref: 'main'
        token: ${{ secrets.GH_TOKEN }}
        
    - name: Set up Node.js
      uses: actions/setup-node@v1
      with:
        node-version: "12.x"

    - name: Install Hexo
      run: npm install hexo-cli -g
      
    - name: Build
      run: |
        npm install
        ${{ secrets.BUILD }}
        hexo clean
        hexo g

    - name: Push
      uses: JamesIves/github-pages-deploy-action@v4
      with:
        folder: public
        token: ${{ secrets.GH_TOKEN }}
        branch: gh-pages
        repository-name: ${{ secrets.PUB }}
