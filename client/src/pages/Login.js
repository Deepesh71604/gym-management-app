import React, { useContext, useState } from 'react'
import axios from 'axios'
import { useNavigate } from 'react-router-dom';
import AuthContext from '../context/AuthContext'
import '../styles/login.css'
function Login() {
    const {login,logout} =useContext(AuthContext)
    const navigate = useNavigate(); 
    const [values,setValues]=useState({
        email: "",
        password: "",
    })

    function handleChange(e){
        setValues({...values,
            [e.target.name]:e.target.value})
    }

    async function handleSubmit(e){
        e.preventDefault()
        try{
            const response = await axios.post('http://localhost:5000/login', values);
            login(response.data.user)
            console.log(response.data);
            navigate('/')
        } catch (err){
            console.error(err);
        }
    }
    function handleLogout(){
        logout()
    }


  return (
    <div className="login-container">
      <form>
        <label>Email</label>
        <input type="email" name ='email' value={values.email} onChange={handleChange}></input>
        <label>Password</label>
        <input type="password" name='password' value={values.password} onChange={handleChange}></input>
        <button type="submit" onClick={handleSubmit}>Login</button>
        <button type="submit" onClick={handleLogout}>Logout</button>
      </form>
    </div>
  )
}

export default Login

