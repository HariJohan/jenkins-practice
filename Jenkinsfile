pipeline{
    agent any
    environment{
        DOCKER_IMAGE='flaskapp-image'
        CONTAINER_NAME='cont-helloworld'
        ENVIRONMENT='prod'
    }
    stages{
        stage('git clone'){
            steps{
                git branch: 'main', credentialsId: 'github-flaskapp-credentials', url: 'https://github.com/HariJohan/jenkins-practice'
            }
        }
        stage('testing'){
            when{
                expression{
                    ENVIRONMENT=='testing'
                }
            }
            steps{
                 sh 'python3 -m py_compile app.py'
                 sh 'echo $PATH'
                }
        }
        stage('build'){
            steps{
                 sh """
                    #!/bin/bash
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    python -m py_compile app.py
                    """
                }
        }
        stage('dockerimage'){
            steps{
                 sh 'docker build -t $DOCKER_IMAGE .'
                 
                }
        }
         stage('docker-container'){
            steps{
                 sh 'docker rm -f $CONTAINER_NAME || true'
                 sh 'docker run -d -p 5000:5000 --name $CONTAINER_NAME $DOCKER_IMAGE'
                }
        }
        
    }
}
