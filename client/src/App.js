import React from 'react'
import {BrowserRouter,Routes,Route,Link} from 'react-router-dom'
import 'bootstrap/dist/css/bootstrap.min.css'
import Createuser from './pages/Createuser'
import Home from './pages/Home'
import Login from './pages/Login'
import CreateSubscription from './pages/CreateSubscription'
import Plans from './pages/Plans'
import './styles/navbar.css'
import AuthContext  from './context/AuthContext'
import { useContext } from 'react'

function App() {
  const { user, isAuthenticated } = useContext(AuthContext);

  return (
    <div>
    
    <BrowserRouter>
    <div  className="navbar">
    <Link to="/user">Go SignUp</Link>
    <Link to="/login">Login </Link>
    <Link to="/" >Home </Link>
    {/* <Link to="/subscription">Subscription </Link> */}
    {isAuthenticated && user.role === 'admin' && (
            <Link to="/subscription">Subscription</Link>
          )}
    <Link to="/plans">See the Plans</Link>
    </div>
    <Routes>
      <Route path ='/user' element={<Createuser/>}/>
      <Route path="/" element={<Home/>}></Route>
      <Route path="/login" element={<Login/>}></Route>
      <Route path="/subscription" element={<CreateSubscription/>}></Route>
      <Route path="/plans" element={<Plans/>}></Route>
    </Routes>
    </BrowserRouter>
    
    </div>
  )
}

export default App
