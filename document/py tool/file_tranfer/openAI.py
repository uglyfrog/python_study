
import os
import openai

openai.organization = "org-OdpWvcAxA8WcQHiSQs8kYAa0"
#openai.api_key = os.getenv("OPENAI_API_KEY")
openai.api_key = "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"
#openai.model.list()


response = openai.Completion.create(
  model="text-davinci-003",
  #model="text-curie-001",
  prompt="choose 10 best games in 2022",
  temperature=0.7,
  max_tokens=631,
  top_p=1,
  frequency_penalty=0,
  presence_penalty=0.18
)


#response = openai.Completion.create(
#  model="text-davinci-003",
#  prompt="Correct this to standard English:\n\nShe no went to the market.\n\nShe did not go to the market.",
#  temperature=0,
#  max_tokens=60,
#  top_p=1,
#  frequency_penalty=0,
#  presence_penalty=0
#)
print (response)

#openai.Edit.create(
#  model="text-davinci-edit-001",
#  input="What day of the wek is it?",
#  instruction="Fix the spelling mistakes"
#)


#curl https://api.openai.com/v1/completions \
#-H "Content-Type: application/json" \
#-H "Authorization: Bearer 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" \
#-d '{"model": "text-davinci-003", "prompt": "Say this is a test", "temperature": 0, "max_tokens": 7}'


