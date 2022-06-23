pipeline {
  agent {
    docker {
      image '192.168.10.10:8082/builder:1.0.0'
      registryUrl 'http://192.168.10.10:8082'
      registryCredentialsId 'myrepo'
      args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
    }
  }

  stages {
     stage ('git') {
        steps {
            dir ('war') { git 'https://github.com/boxfuse/boxfuse-sample-java-war-hello.git' }
            dir ('img') { git 'https://github.com/mitropolitippolit/training_engineer_homework11.git' }
        }
    }
    stage ('war') {
        steps {
            dir ('war') { sh 'mvn package' }
        }
    }
    stage ('img') {
        steps {
            sh 'docker build -t app:1.0.0 -f img/Dockerfile .'
        }
    }
    stage ('push') {
        steps {
            sh 'docker tag app:1.0.0 192.168.10.10:8082/app:1.0.0'
            sh 'docker push 192.168.10.10:8082/app:1.0.0'
        }
    }
  }
}
