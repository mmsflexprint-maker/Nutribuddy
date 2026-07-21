from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel


app = FastAPI()


# Allow Flutter app to connect
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
    return {"status": "NutriBuddy Backend Running"}


@app.post("/chat")
def chat(data: ChatRequest):

    message = data.message.lower()

    if "weight loss" in message or "lose weight" in message:
        reply = """
Weight Loss Diet Tips:

• Eat more vegetables and fruits
• Include protein like eggs, dal, paneer, chicken or fish
• Avoid sugary drinks and junk food
• Drink enough water
• Exercise or walk daily
"""

    elif "diabetes" in message or "sugar" in message:
        reply = """
Diabetes Friendly Tips:

• Avoid excess sugar
• Choose whole grains
• Eat vegetables and protein
• Keep regular meal timings
• Monitor portion sizes
"""

    elif "breakfast" in message:
        reply = """
Healthy Breakfast Ideas:

• Oats with fruits
• Sprouts
• Eggs with whole wheat bread
• Poha or upma with vegetables
"""

    elif "water" in message:
        reply = """
Water Tips:

• Drink water regularly
• Aim for around 8 glasses daily
• Drink more during exercise or hot weather
"""

    elif "exercise" in message or "workout" in message:
        reply = """
Exercise Tips:

• Walk 30 minutes daily
• Do strength exercises 2-3 times per week
• Stretch regularly
"""

    elif "diet plan" in message or "meal plan" in message:
        reply = """
Sample Healthy Diet Plan:

Morning:
- Warm water
- Healthy breakfast

Lunch:
- Roti/rice
- Vegetables
- Protein source

Evening:
- Fruits or nuts

Dinner:
- Light balanced meal
"""

    else:
        reply = """
Hello! I am NutriBuddy Health Assistant.

I can help you with:
✓ Diet plans
✓ Weight loss
✓ Healthy meals
✓ Exercise tips
✓ Water intake
✓ Nutrition advice
"""

    return {
        "reply": reply
    }
