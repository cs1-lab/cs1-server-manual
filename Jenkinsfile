String defaultBranchName = 'master'
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
                script {
                    if ( env.BRANCH_NAME == defaultBranchName) {
                        // ビルドしたファイルをvolumeに移動
                        sh 'cp -rf ./_book /tmp/jenkins_build/_book'
                    }  else {
                        print " ${defaultBranchName} ブランチではないのでコピーされません"
                    }
                }
            }
        }
    }
}
