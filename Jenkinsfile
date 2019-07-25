pipeline {
    agent { docker 'node:10.16.0' }
    stages {
        stage('setup') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'yarn textlint'
                sh 'yarn remarklint'
            }
        }
        stage('build') {
            steps {
                sh 'yarn build'
            }
        }
    }
}
