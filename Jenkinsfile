pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                println("privet")
            }
            // git branch: 'lab4',
            // credentialsId: '12345-1234-4696-af25-123455',
            // url: 'git@github.com:B-a-r-c-i-k/labs_pdris.git'
        }
        stage('Lets go') {
            agent {
                docker {
                    image 'golang'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
                sh 'go mod init main'
            }
        }
        // stage('Build') {
        //     steps {
        //         sh 'go mod init main'
        //     }
        // }
        // stage('Test') {
        //     steps {
        //         sh 'go test *.go -v'
        //         allureReport reportDir: 'allure-results'
        //     }
        // }
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