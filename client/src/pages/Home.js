// import React ,{useContext}from 'react'
// import AuthContext from '../context/AuthContext'
// import '../styles/user.css'
// import axios from 'axios';

// function Home() {
//   const { user, isAuthenticated } = useContext(AuthContext);

//     if (!isAuthenticated) {
//         return <p>Please log in to add a subscription.</p>;
//     }
   

//   return (
//     <div>
//     <div className="user-container">
//       <div className="card">
//       <h2>
//         Welcome To The Gym
//       </h2>
//       <p>
//         Your Name is {user.name}
//       </p>
//       <p className="user-role">
//         Role: {user.role}
//       </p>
//       </div>
//       <div>
//         plans
//       </div>
//     </div>
//     </div>
//   )
// }

// export default Home

import React, { useContext, useEffect, useState } from 'react';
import AuthContext from '../context/AuthContext';
import '../styles/user.css';
import axios from 'axios';

function Home() {
  const { user, isAuthenticated } = useContext(AuthContext);
  const [plans, setPlans] = useState([]);
  
  useEffect(() => {
    if (isAuthenticated && user) {
      // Fetch the user's subscription plans using their user ID
      axios.post('http://localhost:5000/usersubscriptions', { user_id: user.user_id })
        .then((response) => {
          console.log(response.data)
          setPlans(response.data.subscriptions); // Adjust based on your API response structure
        })
        .catch((error) => {
          console.error("Error fetching plans:", error);
        });
    }
  }, [isAuthenticated, user]); // Fetch plans whenever user authentication status changes

  if (!isAuthenticated) {
    return <p>Please log in to see your subscriptions.</p>;
  }

  return (
    <div className="user-container">
      <div className="card">
        <h2>Welcome To The Gym</h2>
        <p>Your Name is {user.name}</p>
        <p className="user-role">Role: {user.role}</p>
      </div>
      <div className="plans-container">
        <h3>Your Subscription Plans</h3>
        {plans.length === 0 ? (
          <p>You have no active subscriptions.</p>
        ) : (
          <ul >
            {plans.map((plan) => (
              <li key={plan.plan_id}>
                <h4>{plan.name}</h4>
                <p>{plan.description}</p>
                <p>Price: ${plan.price}</p>
                <p>Duration: {plan.duration} months</p>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}

export default Home;
