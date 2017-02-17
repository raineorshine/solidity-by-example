const fs = require('fs')
const path = require('path')
const glob = require('glob')
const promisify = require('bluebird').promisify
const globAsync = promisify(glob)

const repoRoot = 'https://github.com/raineorshine/solidity-by-example/blob/master/'
const readmeTemplateFile = 'README-template.md'
const readmeFile = 'README.md'
const readmePlaceholder = '<%=examples%>'

function renderExamples(files) {
  return files.map(file => {
    const filename = path.basename(file)
    const src = fs.readFileSync(file, 'utf-8')
    return `### ${filename}\n\`\`\`js\n${src}\n\`\`\`\n`
  }).join('\n')
}

function renderReadme(content) {
  const readmeTemplate = fs.readFileSync(readmeTemplateFile, 'utf-8')
  return readmeTemplate.replace(readmePlaceholder, content)
}

globAsync('**/*.sol')
  .then(renderExamples)
  .then(renderReadme)
  .then(fileContent => fs.writeFileSync(readmeFile, fileContent))

