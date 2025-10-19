# import aiohttp
# import asyncio

# async def main():

#     async with aiohttp.ClientSession() as session:
#         async with session.get('http://lotus.tetakent.com') as response:

#             print("Status:", response.status)
#             print("Content-type:", response.headers['content-type'])

#             html = await response.text()
#             print("Body:", html[:100], "...")

# asyncio.run(main())

import numpy as np
import cv2

# Open the image.
img = cv2.imread('cat_damaged.png')

# Load the mask.
mask = cv2.imread('mask.png', 0)

# Inpaint.
dst = cv2.inpaint(img, mask, 3, cv2.INPAINT_NS)

# Write the output.
cv2.imwrite('cat_inpainted.png', dst)