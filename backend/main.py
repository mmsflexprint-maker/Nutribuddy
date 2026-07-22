from dotenv import load_dotenv
import os

load_dotenv()

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from google import genai


# Gemini API key
key = os.getenv("GOOGLE_API_KEY")

client = genai.Client(
    api_key=key
)

for model in client.models.list():
    print(model.name)

app = FastAPI()


class ChatRequest(BaseModel):
    message: str



@app.post("/chat")
def chat(request: ChatRequest):

    try:
        prompt = f"""
You are NutriBuddy AI, a personalized health and nutrition assistant.

User asked:
{request.message}

Provide a detailed but simple answer.

Always include:
⚠️ Disclaimer: This is general health guidance only. Please consult a doctor or registered dietitian before making major diet changes.
"""

        response = client.models.generate_content(
            model="gemini-2.5-flash",
            contents=prompt
        )

        return {
            "reply": response.text
        }

    except Exception as e:
        return {
            "reply": f"AI Error: {str(e)}"
        }
