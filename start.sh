#!/bin/bash

# 필요 패키지 다운로드
sudo yum update -y
sudo yum install python3-pip -y
sudo pip3 install virtualenv

# venv 라는 이름의 가상 환경 생성
virtualenv venv
# venv 가상 환경 활성화
. venv/bin/activate

# 가상 환경 내부에 필요 패키지 다운로드
pip3 install -r /home/ec2-user/flask-inference-in-ec2/requirements.txt

# Flask Application 실행
sudo cp /home/ec2-user/flask-inference-in-ec2/main.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start main
sudo systemctl enable main
sudo systemctl status main
