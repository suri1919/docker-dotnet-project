pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 855991486920.dkr.ecr.ap-south-1.amazonaws.com
		 docker build -t docker-application .
		 docker tag docker-application:latest 855991486920.dkr.ecr.ap-south-1.amazonaws.com/docker-application:${BUILD_NUMBER}
		 docker push 855991486920.dkr.ecr.ap-south-1.amazonaws.com/docker-application:${BUILD_NUMBER}
		  '''
	     }	         
	   }

    stage('Deploy docker'){
      steps {
		sh '''
			  ssh -i /var/lib/jenkins/.ssh/application.pem -o StrictHostKeyChecking=no ubuntu@ec2-13-233-164-238.ap-south-1.compute.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
			  '''	 
		    
      		}
		}		    

}

 }
