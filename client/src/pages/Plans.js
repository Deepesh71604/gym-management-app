import React, { useContext, useEffect, useState } from 'react'
import axios from 'axios'
import '../styles/plans.css';
import AuthContext from '../context/AuthContext';

function Plans() {
    const[plans,setPlans]=useState([]);
    const {user} =useContext(AuthContext)

    //Srry for the bad routing names My First time so don't get confused
    useEffect(()=>{
        axios.get('http://localhost:5000/subscriptions').then((response)=>{
            setPlans(response.data.subscriptions)
        })
        .catch((error)=>{
            console.error("Error Fetching Plans:",error);
        })
    },[]);

    function handleclick (plan,user)  {
        console.log("Button Clicked");
        console.log(plan.name)
        console.log(user.name)
        console.log(user.user_id)

        const startDate = new Date().toISOString().split('T')[0]
        const endDate = new Date(new Date().setMonth(new Date().getMonth()+ plan.duration)).toISOString().split('T')[0]

        axios.post('http://localhost:5000/addsubscriptions',{
            user_id: user.user_id,
            plan_id: plan.plan_id,
            start_date: startDate,
            end_date: endDate
        })
        .then((response)=>{
            console.log("Subscription added successfully:", response.data);
        })
        .catch((error)=>{
            console.error("Error adding subscription:",error);
        })
    }   

  return (
    <div className="plans-container">
            <h2>Subscription Plans</h2>
            {plans.length === 0 ? (
                <p>No subscription plans available.</p>
            ) : (
                <ul>
                    {plans.map((plan) => (
                        <li key={plan.plan_id}>
                            <h3 className="plan-title">{plan.name}</h3>
                        <p className="plan-description">{plan.description}</p>
                        <p className="plan-price">Price: ${plan.price}</p>
                        <p className="plan-duration">Duration: {plan.duration} Months</p>
                        <button className="plan-button" onClick={()=>handleclick(plan,user)}> Add the plan </button>
                        </li>
                    ))}
                </ul>
            )}
        </div>
  )
}

export default Plans
