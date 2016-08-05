module.exports = [
    {
        pattern: /An-Introduction-To-Applied-Bioinformatics/,
        branchPattern: /master/,
        event: 'push',
        script: './hook.sh'
    }
]
