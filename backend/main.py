

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from google import genai
from dotenv import load_dotenv
import os

load_dotenv()

client = genai.Client(
    api_key=os.getenv("GOOGLE_API_KEY")
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
            model="gemini-flash-latest",
            contents=data.message,
        )

        return {"response": response.text}

    except Exception as e:
        return {"response": str(e)}
