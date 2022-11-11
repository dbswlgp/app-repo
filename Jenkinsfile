node {
  stage('========== Clone repository ==========') {
    checkout scm
  }
  stage('========== Build image ==========') {
    sh "sleep 60"
  }
  stage('========== Push image ==========') {
    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_dbswlgp99') {
      sh "docker pull dbswlgp99/edge-image:latest"
      sh "docker tag dbswlgp99/edge-image:latest registry.hub.docker.com/dbswlgp99/edge-image:${env.BUILD_NUMBER}"
      sh "docker push registry.hub.docker.com/dbswlgp99/edge-image:${env.BUILD_NUMBER}"
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

