# MANetworkJSONDataManager

MANetworkJSONDataManager is a light-weight Json network data mapper library. The Library assumes a certain format at which the network response will be recieved but there is not limitation on the Type of Data/Model. For example,
Currently, it expects the network response to return an error string and a data model or array of data models. If there is any error, the error string will represent that; otherwise the error string will be nil and the data Model will be recieved which then is mapped in the application as a Codable object.
The library makes use of the concept of generics so that it doesn't need to define method to fetch or post every kind of data model. 
The network Response can be editted according to one's own REST API response and new models can be added to be fetched, created, updated or delted with the help of only two methods- getData and postData.

HTTP Status codes along client-end errors like encoding or decoding errors are also handled. 

The work is in progress. Currently fetching or uploading image files is not available. On top of that Unit Text suit will also be added. 

# Requirements
 - *iOS 13.0*
 - *Swift 5.2*
