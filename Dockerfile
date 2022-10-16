FROM ilsf1004/face-recognition:2.2

USER root

RUN apt-get install git -y

RUN git clone https://github.com/dbswlgp/app-repo.git

COPY app-repo/face_recogniser.pkl /facenet/face-recognition/model

WORKDIR /facenet/face-recognition

ENTRYPOINT ["python3"]

CMD ["-m","inference.video_classifier"]

