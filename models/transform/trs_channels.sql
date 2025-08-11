select
  channel_id,
  trim(channel_name) as channel_name,
  trim(channel_type) as channel_type,
  coalesce(cost_per_channel, 0) as cost_per_channel
FROM {{ source('raw', 'channels') }}
WHERE CHANNEL_ID IS NOT NULL