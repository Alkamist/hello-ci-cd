# ====================== Build stage ======================
FROM alkamist1/odin:latest AS builder

WORKDIR /app

COPY . .

RUN odin build . -out:app



# ====================== Runtime stage ======================
FROM ubuntu:24.04

WORKDIR /app

COPY --from=builder /app/app .

CMD ["./app"]
