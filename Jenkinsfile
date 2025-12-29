def branch = "main"
def remote = "origin"
def directory = "~/dumbwaysapp/wayshub-frontend"
def server = "genabc@103.103.23.200"
def cred = "namassh"

pipeline{
	agent any
	stages{
		stage('repo pull'){
		     steps{
			sshagent([cred]){
				sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
				cd ${directory}
				git pull ${remote} ${branch}
				exit
				EOF"""
				}
			}
		}

                stage('docker build'){
                     steps{
                        sshagent([cred]){
                                sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                cd ${directory}
				docker build -t dumbflix-fe .
                                exit
                                EOF"""
                                }
                        }
                }

                stage('docker run'){
                     steps{
                        sshagent([cred]){
                                sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
				docker run -d -p 3000:3000 --tty --name frontend dumbflix-fe
                                exit
                                EOF"""
                                }
                        }
                }
	}
}
