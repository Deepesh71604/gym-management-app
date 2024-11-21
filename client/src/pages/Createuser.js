import React, { useState } from 'react';
import axios from 'axios';
import '../styles/registerform.css'

function CreateUser() {
    const [values, setValues] = useState({
        name: "",
        email: "",
        password: "",
        address: "",
        phone: "",
        role: "member", // Default role is 'user'
        specialty: "",
        bio: "",
        rate: ""
    });
    const [message, setMessage] = useState(""); // For success/error feedback
    const [showTrainerFields, setShowTrainerFields] = useState(false); // Controls visibility of trainer fields

    function handleChange(e) {
        setValues({
            ...values,
            [e.target.name]: e.target.value
        });
    }

    function handleRoleToggle() {
        setShowTrainerFields(!showTrainerFields);
        setValues({
            ...values,
            role: showTrainerFields ? "user" : "trainer" // Toggle role between 'user' and 'trainer'
        });
    }

    async function handleSubmit(e) {
        e.preventDefault();

        try {
            const response = await axios.post('http://localhost:5000/user', values);
            setMessage(response.data.success || "User added successfully");
            console.log(response.data);
        } catch (err) {
            setMessage("Error adding user: " + err.message);
            console.log(err);
        }
    }

    return (
        <div className="register-container">
            <h2>Register as {showTrainerFields ? "Trainer" : "User"}</h2>
            <button type="button" onClick={handleRoleToggle}>
                {showTrainerFields ? "Register as User" : "Register as Trainer"}
            </button>

            <form onSubmit={handleSubmit}>
                <div>
                    <label>Name:</label>
                    <input
                        type='text'
                        name='name'
                        value={values.name}
                        onChange={handleChange}
                        required
                    />
                </div>
                <div>
                    <label>Email:</label>
                    <input
                        type='email'
                        name='email'
                        value={values.email}
                        onChange={handleChange}
                        required
                    />
                </div>
                <div>
                    <label>Password:</label>
                    <input
                        type='password'
                        name='password'
                        value={values.password}
                        onChange={handleChange}
                        required
                    />
                </div>
                <div>
                    <label>Address:</label>
                    <input
                        type='text'
                        name='address'
                        value={values.address}
                        onChange={handleChange}
                    />
                </div>
                <div>
                    <label>Phone:</label>
                    <input
                        type='text'
                        name='phone'
                        value={values.phone}
                        onChange={handleChange}
                        required
                    />
                </div>

                {/* Conditional trainer fields */}
                {showTrainerFields && (
                    <>
                        <div>
                            <label>Specialty:</label>
                            <input
                                type='text'
                                name='specialty'
                                value={values.specialty}
                                onChange={handleChange}
                                required
                            />
                        </div>
                        <div>
                            <label>Bio:</label>
                            <textarea
                                name='bio'
                                value={values.bio}
                                onChange={handleChange}
                                required
                            />
                        </div>
                        <div>
                            <label>Rate:</label>
                            <input
                                type='number'
                                name='rate'
                                value={values.rate}
                                onChange={handleChange}
                                required
                            />
                        </div>
                    </>
                )}

                <button type="submit" className="submit-button" >Submit</button>
            </form>

            {/* Display feedback message */}
            {message && <p>{message}</p>}
        </div>
    );
}

export default CreateUser;
