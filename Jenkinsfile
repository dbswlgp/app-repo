node {
  stage('========== Clone repository ==========') {
    checkout scm
  }
  stage('========== Build image ==========') {
    sh "pwd"
    sh "ls"
    sh "sudo cp ./face_recogniser.pkl /var/lib/docker/tmp"
    sh "ls /var/lib/docker/tmp"
    app = docker.build("dbswlgp99/edge-image")
  }
  stage('========== Push image ==========') {
    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_dbswlgp99') {
      app.push("${env.BUILD_NUMBER}")
      app.push("latest")
    }
  }
  stage('========== Manifest update ==========') {
    git branch: "main",
    credentialsId: 'github_access_token',
    url: 'https://github.com/dbswlgp/deploy-repo.git'
    sh "sed -i 's/edge-image:.*/edge-image:${env.BUILD_NUMBER}/g' model.yaml"
    sh "git add model.yaml"
    sh "git commit -m '${env.BUILD_NUMBER} image version'"
    withCredentials([gitUsernamePassword(credentialsId: 'github_access_token', gitToolName: 'git-tool')]) {
      sh "git remote set-url origin https://github.com/dbswlgp/deploy-repo"
      sh "git push -u origin main"
    }
  }
}

