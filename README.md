# MANetworkJSONDataManager

MANetworkJSONDataManager is a light-weight Json network data mapper library. The Library assumes a certain format at which network data will be recieved but there 
is not limitation on the . For example,
Currently, it expects the network response to return an error string if any otherwise the error string can be nil and any Model that can be declared as Codable.
The library makes use of the concept of generics. The network Response can be editted according to one's own REST API response and new models can be added to be 
fetched, created, updated or delted with the help of only two methods-
getData and postData.

Also HTTP Status codes are handled along client end errors like encoding or decoding errors.

The work is in progress. Currently fetching or uploading image files will be added. 

# Requirements
 - *iOS 13.0*
 - *Swift 5.2*
