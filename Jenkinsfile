pipeline {
  agent any
  parameters {
    string(name: 'ARTIFACT_ID', description: "Name artifact")
  }
  options {
    timeout(time: 15, unit: 'MINUTES')
  }
  stages{
    stage("Build Packager"){
      steps{
        sh './bash/build.sh'
      }
    }
  }
}