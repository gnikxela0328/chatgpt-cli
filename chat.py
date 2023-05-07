import sys
import time
import openai
import asyncio
import threading
from key import API_KEY
openai.api_key = API_KEY
from openai.error import RateLimitError

messages = []
loading = threading.Event()
animation = "▂▄▆█▆▄▂"

async def sendMessage(message):
    messages.append({"role": "user", "content": message})

    try:
        completion = openai.ChatCompletion.create(model="gpt-3.5-turbo", messages=messages)
        messages.append(completion.choices[0].message)
        print("\n\nChat : ")
        print("-----")
        print(completion.choices[0].message.content)
        return
    except RateLimitError:
        print("Rate limit exceeded.")
        return

def loadMessage():
    for x in range(10000):
        idx = x % len(animation)
        idx1 = idx - 1 if idx != 0 else 0
        idx2 = idx + 1 if idx != len(animation) - 1 else len(animation) - 1

        sys.stdout.write('\rloading ' + animation[idx1] + animation[idx] + animation[idx2])
        time.sleep(0.1)
        if loading.is_set():
            sys.stdout.write(" ")
            break

if __name__ == "__main__":

    print("\n--- ChatGPT ---")
    print("(Enter, ctrl + D to send prompt)")
    print("(ctrl + C to exit)")

    while True:
        try:
            print("\nPrompt : ")
            print("-------")
            input_arr = sys.stdin.readlines()
            prompt = ""
            for x in input_arr:
                prompt+=x
            t = threading.Thread(target=loadMessage)
            loading.clear()
            t.start()
            asyncio.run(sendMessage(prompt))
            loading.set()
            t.join()
        except KeyboardInterrupt:
            print("\n\n--- Chat Closed ---")
            exit(0)