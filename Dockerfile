FROM ilsf1004/face-recognition:2.2

COPY ./face_recogniser.pkl /facenet/face-recognition/model

WORKDIR /facenet/face-recognition

ENTRYPOINT ["python3"]

CMD ["-m","inference.video_classifier"]

