pipeline {
    agent any
    // environment {
    //     // PATH = '$PATH:/usr/local/go/bin'
    //     // GOPATH = '/usr/local/go/bin'
    // }
    options {
        timestamps()
    }
    stages {
        stage ("Glina") {
            steps {
                cleanWs()
            }
        }
        stage('Clone') {
            steps {
                println("privet")
            }
            // git branch: 'lab4',
            // credentialsId: '12345-1234-4696-af25-123455',
            // url: 'git@github.com:B-a-r-c-i-k/labs_pdris.git'
        }
        stage('Lets go') {
            steps {
                script {
                    sh 'curl -Ok https://dl.google.com/go/go1.23.4.linux-amd64.tar.gz'
                    sh 'tar -C $JENKINS_HOME -xf go1.23.4.linux-amd64.tar.gz'
                    sh 'GOPATH=$JENKINS_HOME/go/bin PATH=$PATH:$GOPATH go version'
                }
            }
            // steps {
            //     sh 'go mod init main'
            // }
        }
        stage('Build') {
            steps {
                sh 'GOPATH=$JENKINS_HOME/go/bin PATH=$PATH:$GOPATH go mod init main'
            }
        }
        stage('Test') {
            steps {
                sh 'GOPATH=$JENKINS_HOME/go/bin PATH=$PATH:$GOPATH go test *.go -v'
                // allureReport reportDir: 'allure-results'
            }
        }
        // stage('SonarQube Analysis') {
        //     steps {
        //         withSonarQubeEnv('SonarQube Server') {
        //             sh 'mvn sonar:sonar'
        //         }
        //     }
        // }
        // stage('Deploy') {
        //     steps {
        //         sh 'docker build -t my-app .'
        //         sh 'docker push my-app'
        //     }
        // }
    }
}