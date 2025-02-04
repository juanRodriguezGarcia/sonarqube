import groovy.json.JsonSlurperClassic

def jsonParse(def json) {
    new groovy.json.JsonSlurperClassic().parseText(json)
}
pipeline {
  agent any 
  environment {
    appName = "variable" 
	        SONAR_SCANNER_HOME = "/opt/sonar-scanner"   
        SONAR_HOST_URL = "http://http://35.153.134.0" 
        SONAR_TOKEN = credentials('tokensonar') 
  }
  

  
 stages {

 stage("paso 1"){
     
      steps {
          script {			
           sh "echo 'hola mundo desde GIT'"
        }
      }
    }
	
	
	        stage('SonarQube Scan') {
            steps {
                sh '''
                    ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
                    -Dsonar.projectKey=mi-proyecto \
                    -Dsonar.sources=codigo \
                    -Dsonar.host.url=${SONAR_HOST_URL} \
                    -Dsonar.login=${SONAR_TOKEN}
                '''
            }
        }

        stage('Quality Gate') {
            steps {
                script {
                    def qg = waitForQualityGate()
                    if (qg.status != 'OK') {
                        error "El anlisis de calidad no paso: ${qg.status}"
                    }
                }
            }
        }
	
	
  }
  post {
      always {          
          deleteDir()
           sh "echo 'ESTA FASE SIEMPRE SE EJECUTA SIN IMPORTAR SI FUE FALLIDO O NO'"
      }
      success {
            sh "echo 'ESTA FASE SE EJECUTA SOLAMENTE SI FUE EXITOSO'"
        }

      failure {
            sh "echo 'ESTA FASE SE EJECUTA SI FUE FALLIDO'"
      }
      
  }
}  

