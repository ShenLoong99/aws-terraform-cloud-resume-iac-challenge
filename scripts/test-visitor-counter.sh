#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Configuration from Environment Variables or Defaults
API_ENDPOINT="${API_URL}"
MAX_RETRIES=3
WAIT_TIME=2

echo "🔍 Starting Industry Standard Visitor Counter Test..."
echo "Target API: $API_ENDPOINT"

if [ -z "$API_ENDPOINT" ]; then
    echo "❌ Error: API_URL environment variable is not set."
    exit 1
fi

# Function to get current count with validation
get_count() {
    local response
    response=$(curl -s -m 10 "$API_ENDPOINT") # 10s timeout
    
    # Check if response is valid JSON and contains .count
    if ! echo "$response" | jq -e '.count' > /dev/null; then
        echo "❌ Error: Invalid API response or missing 'count' field."
        echo "Response received: $response"
        return 1
    fi
    
    echo "$response" | jq '.count'
}

# --- Execution ---

# 1. Fetch initial count
COUNT1=$(get_count)
echo "📊 Initial count: $COUNT1"

# 2. Trigger increment (The GET request should increment via Lambda)
# We wait a moment for the DynamoDB write consistency
sleep $WAIT_TIME

# 3. Fetch second count with retries
SUCCESS=false
for i in $(seq 1 $MAX_RETRIES); do
    COUNT2=$(get_count)
    echo "🔄 Attempt $i: Current count is $COUNT2"

    if [ "$COUNT2" -gt "$COUNT1" ]; then
        echo "✅ Success: Counter incremented correctly ($COUNT1 -> $COUNT2)."
        SUCCESS=true
        break
    fi
    
    echo "⚠️ Count hasn't updated yet. Retrying in $WAIT_TIME seconds..."
    sleep $WAIT_TIME
done

if [ "$SUCCESS" = false ]; then
    echo "❌ Failure: Counter did not increment after $MAX_RETRIES retries."
    exit 1
fi