FROM ilsf1004/edge-image:2.1

RUN mkdir /facenet/face-recognition/pre-model

RUN git clone https://github.com/dbswlgp/app-repo.git /facenet/face-recognition/pre-model

RUN cp -r /facenet/face-recognition/pre-model/face_recogniser.pkl /facenet/face-recognition/model

WORKDIR /facenet/face-recognition

ENTRYPOINT ["python3"]

CMD ["-m","inference.video_classifier"]
