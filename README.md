# flask-inference

- AWS EMR 환경에서, Flask 기반의 Inference Application 구동
- AWS EMR 생성 시, Master device 의 EBS 볼륨 크기는 20GB로 설정 (Tensorflow 용량으로 인해)

  ```
  cd /home/hadoop
  sudo yum install git -y
  
  # flask inference application 관련 repository
  sudo git clone https://github.com/unhochoi/flask-inference-in-emr.git
  
  # model 및 scaler 관련 repository
  sudo git clone https://github.com/kmu-bigdata/dos.git
  
  ./flask-inference-in-emr/start.sh
  ```
- main.service 구동 확인

  ```
  systemctl status main.service
  ```

- 구동 중인 Inference Application 에 Request
  ```
  curl \
  -H "Content-Type: application/json" \
  -X POST "http://마스터퍼블릭DNS:80/" \
  -d '{
    "lr": 97366,
    "lc": 33288,
    "rc": 5958,
    "ld": 0.00056263,
    "rd": 0.13,
    "lnnz": 1823595,
    "rnnz": 25785518
  }' 
  ```

- main.py 는 수정에 따라 실시간으로 반영됨

  ```
  vi /home/hadoop/flask-inference-in-emr/main.py
  ```
