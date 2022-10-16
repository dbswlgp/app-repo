FROM ilsf1004/face-recognition:2.2

USER root

COPY /var/lib/jenkins/workspace/jenkins-test/face_recogniser.pkl /facenet/face-recognition/model

WORKDIR /facenet/face-recognition

ENTRYPOINT ["python3"]

CMD ["-m","inference.video_classifier"]

