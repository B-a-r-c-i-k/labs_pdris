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
                println("privett")
                sh 'git clone -b lab4 https://github.com/B-a-r-c-i-k/labs_pdris.git .'
                // git branch: 'lab4',
                // credentialsId: '12345-1234-4696-af25-123455',
                // url: 'git@github.com:B-a-r-c-i-k/labs_pdris.git'
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
                sh 'GOROOT=$JENKINS_HOME/go GOPATH=$JENKINS_HOME/go PATH=$PATH:$GOPATH/bin go install github.com/jstemmer/go-junit-report/v2@latest'
                sh 'mkdir allure'
                sh 'GOROOT=$JENKINS_HOME/go GOPATH=$JENKINS_HOME/go PATH=$PATH:$GOPATH/bin go test *.go -v | $JENKINS_HOME/go/bin/go-junit-report > allure/report.xml'
                // script {
                // sh 'curl -Ok -L https://github.com/allure-framework/allure2/releases/download/2.32.0/allure-2.32.0.zip'
                // sh 'unzip allure-2.32.0.zip'
                allure([
                        includeProperties: false,
                        jdk: '',
                        properties: [],
                        reportBuildPolicy: 'ALWAYS',
                        results: [[path: '$JENKINS_HOME/workspace/allure']]
                ])
                // }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool name: 'sonar';
                    withSonarQubeEnv('My SonarQube Server') { 
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
        // stage('Deploy') {
        //     steps {
        //         sh 'docker build -t my-app .'
        //         sh 'docker push my-app'
        //     }
        // }
    }
}