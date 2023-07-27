#!/bin/bash

get_value_from_nested_object() {
    # First argument is the JSON string
    json_string="$1"
    # Second argument is the key to find
    key="$2"

    # Convert the key into a "dot-separated" path for jq
    jq_key=$(echo "$key" | sed 's#/#.#g')

    # Use jq to parse the JSON and extract the value for the given key
    value=$(echo "$json_string" | jq -r "$jq_key")

    echo "$value"
}

## Example usage:
object1='{"a":{"b":{"c":"d"}}}'
key1="a/b/c"
result1=$(get_value_from_nested_object "$object1" "$key1")
echo "$result1"  ## Output: d

object2='{"x":{"y":{"z":"a"}}}'
key2="x/y/z"
result2=$(get_value_from_nested_object "$object2" "$key2")
echo "$result2"  ## Output: a
