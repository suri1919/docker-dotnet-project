pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 #aws configure set aws_access_key_id $ACCESS_KEY
		 #aws configure set aws_secret_access_key $ACCESS_SECRET_KEY
		 #aws configure set default.region ap-southeast-1
		 aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 754495971822.dkr.ecr.ap-south-1.amazonaws.com
		 docker build -t docker-newproject .
		 docker tag docker-newproject:latest 754495971822.dkr.ecr.ap-south-1.amazonaws.com/docker-newproject:latest:${BUILD_NUMBER}
		 docker push 754495971822.dkr.ecr.ap-south-1.amazonaws.com/docker-newproject:latest:${BUILD_NUMBER}
		  '''
	     }	         
	   }

    stage('Deploy docker'){
      steps {
		sh '''
			  ssh -i /var/lib/jenkins/.ssh/application.pem -o StrictHostKeyChecking=no ubuntu@ec2-3-110-169-138.ap-south-1.compute.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
			  '''	 
		    
      		}
		}		    

}

 }
