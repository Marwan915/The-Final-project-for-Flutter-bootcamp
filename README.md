# **TourKSA**

**TourKSA** is a mobile application designed to enhance the travel experience within Saudi Arabia. The app provides features such as hotel and restaurant listings, an interactive map, and an AI-powered chat for tourists.

---


## **Main Screen**
<img width="218" alt="Screenshot 2025-01-11 133624" src="https://github.com/user-attachments/assets/3e911ff2-3075-427a-8e17-6a44b8b442a1" />


- The main screen showcases an iconic Saudi Arabian landmark.
- It provides two options for users:
  - **Log In**: For users who already have an account.
  - **Sign Up**: For users who wish to create a new account.

---

## **Sign-Up Screen**
<img width="213" alt="Screenshot 2025-01-11 133654" src="https://github.com/user-attachments/assets/5ae02f2b-72e8-4006-9bc1-4a11081ad78c" />


- This screen allows users to create a new account.
- Includes input fields such as email, and password.
- Once the form is completed, the user can register and proceed to the app.

---

## **Log-In Screen**
<img width="221" alt="Screenshot 2025-01-11 133747" src="https://github.com/user-attachments/assets/9166f1ba-acd5-4be7-a5dc-f28067095484" />


- This screen allows users to log in with their email and password.
- Successful login directs the user to the main homepage.

---

## **Home Page**
<img width="223" alt="Screenshot 2025-01-11 132835" src="https://github.com/user-attachments/assets/1fa90da6-70ee-40b9-8460-72d31eba2247" />
 ![City Switcher]
 <img width="127" alt="switch button my app" src="https://github.com/user-attachments/assets/2fef6279-377e-43fc-aa82-a8611b599e19" />

- Displays a list of the best hotels, restaurants and tourist attraction in the selected city.
- **City Switcher**: Allows users to change the city (e.g., Riyadh, Jeddah) to explore different locations.
- **Scrollable List**: Users can scroll through the list to view more hotels and restaurants.
- **Weather Updates**: The homepage displays the current temperature of the selected city, fetched from the **OpenWeather API**. The temperature dynamically updates based on the selected city.

---

## **Jeddah Listings**
<img width="218" alt="Screenshot 2025-01-11 133027" src="https://github.com/user-attachments/assets/3026892e-320a-447d-b511-fd3f4154a9f4" />

- A specific example of the listings when Jeddah is selected as the city.
- Displays various popular tourist spots, hotels, and restaurants in Jeddah.

---

## **Details Page**
<img width="217" alt="Screenshot 2025-01-11 132931" src="https://github.com/user-attachments/assets/df2bb472-7c57-4658-baf1-3f623129665c" />

- This page provides detailed information about a selected hotel, restaurant, or tourist attraction.
- Includes:
  - **Name**: The name of the selected location.
  - **Description**: A short overview of the place.
  - **Ratings**: User ratings or reviews.
  - **Price**: The cost of staying or dining, helping users to plan their budget.
  - **Images**: Photos of the location using the **cached_network_image** package for optimized loading.
- **Data Source**: The details are fetched from a built-in **JSON file** integrated into the app without relying on external APIs, ensuring fast and consistent data retrieval.
- Users can navigate back to the homepage or explore related locations.

---

## **Map Screen**
<img width="220" alt="Screenshot 2025-01-11 133103" src="https://github.com/user-attachments/assets/a27e2fa0-5a37-4cb0-ae4d-7bfa7053171a" />

- Provides an **interactive map** showing different locations within the city.
- Developed using the **flutter_map: ^4.0.0** library and the **latlong2** package for handling coordinates.
- Users can zoom in/out and navigate the map to find desired locations.

---

## **Chat Screen**
<img width="221" alt="Screenshot 2025-01-11 133233" src="https://github.com/user-attachments/assets/2d8f5325-0ce6-47a2-88e0-ee7103687321" />

- Features a **chat interface powered by ChatGPT API**.
- Enables users to:
  - Explore tourist attractions.
  - Get detailed information about specific locations.
  - Ask questions about travel-related topics.

---

## **Profile Screen**
<img width="218" alt="Screenshot 2025-01-11 133317" src="https://github.com/user-attachments/assets/9400d3ef-bf12-495d-b26a-91a062ecf680" />

- Displays the user's email used during login or sign-up.
- Includes a **Log Out** button that redirects the user to the main screen.

---


## **Database table**
<img width="1268" alt="subabaceTesting" src="https://github.com/user-attachments/assets/af606031-5fd1-4108-8571-faeea276628a" />

- The `users` table contains 
  - `id`: Unique identifier for each user.
  - `email`: User email address.
  - `encrypted_password`: Encrypted user password.
  - etc...
- The schema is managed through **Supabase**.

---

## **Technologies Used**

- **Flutter**: For developing cross-platform apps.
- **flutter_dotenv**: For managing environment variables securely.
- **http**: For making HTTP requests (e.g., APIs).
- **supabase_flutter: ^2.8.2**: For authentication and backend management.
- **flutter_map: ^4.0.0**: For the interactive map.
- **latlong2: ^0.8.1**: For handling geographical coordinates.
- **cached_network_image**: For efficient image loading and caching.
- **dash_chat_2**: For the chat interface powered by ChatGPT API.

### **Features**
- **Built-in JSON File**: Some app data, like location details and prices, is stored in an internally created JSON file to ensure offline functionality and faster access.
- Real-time weather data fetched using the **OpenWeather API**.
- User authentication and management powered by **Supabase**.
- AI-driven chat assistant for enhanced tourist guidance.

---

With **TourKSA**, users can explore Saudi Arabia effortlessly, making their travel experience more enriching and informed.
