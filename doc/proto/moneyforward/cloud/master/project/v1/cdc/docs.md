# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [change_data_message.proto](#change_data_message-proto)
    - [ChangeDataMessage](#moneyforward-cloud-master-project-v1-cdc-ChangeDataMessage)
    - [DeputyManager](#moneyforward-cloud-master-project-v1-cdc-DeputyManager)
    - [Project](#moneyforward-cloud-master-project-v1-cdc-Project)
    - [ProjectTag](#moneyforward-cloud-master-project-v1-cdc-ProjectTag)
    - [Record](#moneyforward-cloud-master-project-v1-cdc-Record)
    - [Tag](#moneyforward-cloud-master-project-v1-cdc-Tag)
  
    - [Record.OperationType](#moneyforward-cloud-master-project-v1-cdc-Record-OperationType)
  
- [Scalar Value Types](#scalar-value-types)



<a name="change_data_message-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## change_data_message.proto



<a name="moneyforward-cloud-master-project-v1-cdc-ChangeDataMessage"></a>

### ChangeDataMessage



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| request_id | [string](#string) |  | Published and sent by subsystems for requests idempotency. Send it back in the Kafka message header. |
| message_number | [uint32](#uint32) |  | Sequential number of the messages in the request. |
| total_message_count | [uint32](#uint32) |  | The total count of events in the request starting with `1`.` |
| tenant_uid | [uint64](#uint64) |  | tenant uid from Navis |
| records | [Record](#moneyforward-cloud-master-project-v1-cdc-Record) | repeated |  |






<a name="moneyforward-cloud-master-project-v1-cdc-DeputyManager"></a>

### DeputyManager



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uid | [uint64](#uint64) |  |  |
| code | [string](#string) | optional |  |
| name | [string](#string) |  | next number 4; |






<a name="moneyforward-cloud-master-project-v1-cdc-Project"></a>

### Project



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| biid | [string](#string) |  |  |
| department_biid | [string](#string) | optional |  |
| tenant_uid | [uint64](#uint64) |  |  |
| manager_uid | [uint64](#uint64) | optional |  |
| manager_code | [string](#string) | optional |  |
| manager_name | [string](#string) | optional |  |
| deputy_managers | [DeputyManager](#moneyforward-cloud-master-project-v1-cdc-DeputyManager) | repeated |  |
| code | [string](#string) |  |  |
| name | [string](#string) |  |  |
| valid_from | [google.type.Date](#google-type-Date) |  |  |
| valid_to | [google.type.Date](#google-type-Date) |  |  |
| transaction_from | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| transaction_to | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| transaction_from_by | [uint64](#uint64) |  |  |
| transaction_to_by | [uint64](#uint64) |  |  |
| transaction_from_by_name | [string](#string) |  |  |
| transaction_to_by_name | [string](#string) |  |  |
| transaction_from_by_srv | [string](#string) |  |  |
| transaction_to_by_srv | [string](#string) |  |  |
| disp_order | [uint32](#uint32) |  |  |
| search_key | [string](#string) |  |  |
| related_project_biid | [string](#string) | optional |  |
| abort_flag | [bool](#bool) |  |  |
| version | [uint32](#uint32) |  | next number 26; |






<a name="moneyforward-cloud-master-project-v1-cdc-ProjectTag"></a>

### ProjectTag



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| project_id | [string](#string) |  |  |
| tenant_uid | [uint64](#uint64) |  |  |
| tag_biid | [string](#string) |  | next number 4; |






<a name="moneyforward-cloud-master-project-v1-cdc-Record"></a>

### Record



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| operation_type | [Record.OperationType](#moneyforward-cloud-master-project-v1-cdc-Record-OperationType) |  |  |
| project | [Project](#moneyforward-cloud-master-project-v1-cdc-Project) |  |  |
| project_tag | [ProjectTag](#moneyforward-cloud-master-project-v1-cdc-ProjectTag) |  |  |
| tag | [Tag](#moneyforward-cloud-master-project-v1-cdc-Tag) |  |  |






<a name="moneyforward-cloud-master-project-v1-cdc-Tag"></a>

### Tag



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| biid | [string](#string) |  |  |
| tenant_uid | [uint64](#uint64) |  |  |
| name | [string](#string) |  |  |
| transaction_from | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| transaction_to | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  |  |
| transaction_from_by | [uint64](#uint64) |  |  |
| transaction_to_by | [uint64](#uint64) |  |  |
| transaction_from_by_name | [string](#string) |  |  |
| transaction_to_by_name | [string](#string) |  |  |
| transaction_from_by_srv | [string](#string) |  |  |
| transaction_to_by_srv | [string](#string) |  |  |
| version | [uint32](#uint32) |  | next number 14; |





 


<a name="moneyforward-cloud-master-project-v1-cdc-Record-OperationType"></a>

### Record.OperationType


| Name | Number | Description |
| ---- | ------ | ----------- |
| CREATE | 0 |  |
| UPDATE | 1 |  |
| DELETE | 2 |  |


 

 

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

