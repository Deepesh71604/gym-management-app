import React, { useState,useContext } from 'react'
import axios from 'axios';
import AuthContext from '../context/AuthContext'
import '../styles/subscriptionform.css'
function CreateSubscription() {
  const { user} = useContext(AuthContext);

  const [values,setValues]=useState({
    name:"",
    price:"",
    duration:"",
    description:""
  });


async function handleSubmit(e) {
    e.preventDefault();
  if(user.role==="admin"){
  try{
    const response = await axios.post('http://localhost:5000/subscriptions',values)
    console.log(response.data);
  } 
  catch (err) {
    console.error(err);
  }
  }
  else{
    alert("Only Admins can add the plans ")
  }
}

function handleChange (e){
  setValues({...values,
    [e.target.name]:e.target.value})
}

  return (
    <div className="subscription-container">
      <form onSubmit={handleSubmit}>
        <div>
        <label>Name:</label>
        <input type="text" name ="name" value={values.name} required onChange={handleChange}></input>
        </div>
        <div>
        <label>Duration In months :</label>
        <input type="number" name ="duration" value={values.duration} required onChange={handleChange}></input>
        </div>
        <div>
        <label>description:</label>
        <textarea type="text" name ="description" value={values.description} required onChange={handleChange}/>
        </div>
        <div>
        <label>Price:</label>
        <input type="number" name ="price" values={values.price} required onChange={handleChange}></input>
        </div>
        <div>
        <button type="submit" >Submit</button>
        </div>
      </form>
    </div>
  )
}

export default CreateSubscription
