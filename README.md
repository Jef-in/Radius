# Radius

1. From the API, display the list of facilities and their options by creating a UI, so that
users can select one option from each facility. Display name and icon. For Example,
i) Property Type: Apartment, Condo, Boat House, Land - The user can select
only one among this

2. Add the exclusion condition by extending the above UI, so that users cannot select
from the exclusions combinations.
For example, users can’t select these options together.
Ex. 1: Property Type: Land, Number of Rooms: 1 to 3 rooms. (If the user selects
“Land”, then the user should not be able to select “1 to 3 rooms”)
Ex. 2: Property Type: Boat House, Other Facilities: Garage. (if the user selects
“Boat House”, then the user should not be able to select “Garage”)

The architecture followed is MVVM with the support of Combine

NWPathMonitor have been used to check the network connection availability

Added Unit Test Cases for the Project

No third party libraries have been used to perform any of the functionalities.
