library('paychex-jenkins-pipeline@master')

def libsrc = library('paychex-jenkins-pipeline@master').com.paychex.build.jenkinsfile

standardBuildPipeline {
    buildProvider = libsrc.OpenShiftBuildProvider.new()
    containerImage = 'app-release-docker-local.registry.paychex.com/base-tools/tools-jdk-11-openjdk:latest'
    skipGates = true
    gradleBuildTasks = ['imageBuild', 'imagePush', 'imageCertify']
    gradlePublishTasks = ['']
}
