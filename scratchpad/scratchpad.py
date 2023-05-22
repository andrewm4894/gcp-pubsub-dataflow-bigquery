#%%

import json
from google.cloud import pubsub_v1

# TODO: replace with your own settings
project_id = "andrewm4894"
topic_id = "telemetry_events"

publisher = pubsub_v1.PublisherClient()
topic_path = publisher.topic_path(project_id, topic_id)

# prepare your message as a dict
message = {
    "k1": "value1",
    "k2": "value2"
}

# convert dict to json and then to bytestring
data = json.dumps(message).encode("utf-8")

# Publish a message
future = publisher.publish(topic_path, data)
print(f"Published messages with ID: {future.result()}")


#%%

#%%