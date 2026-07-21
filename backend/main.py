from dotenv import load_dotenv
import os

load_dotenv()
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from google import genai

# Paste your AQ... API key here
key = os.getenv("GOOGLE_API_KEY")

print("API KEY FOUND:", key is not None)

client = genai.Client(
    api_key=key
)
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatRequest(BaseModel):
    message: str

@app.get("/")
def home():
    return {"status": "NutriBuddy AI Backend Running"}

@app.post("/chat")
def chat(data: ChatRequest):
    try:
        response = client.models.generate_content(
            model="gemini-2.5-flash",
            contents=data.message,
        )

        return {"response": response.text}

    except Exception as e:
        print(e)
        return {"response": "AI service is temporarily unavailable. Please try again later."}
