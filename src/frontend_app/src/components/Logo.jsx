import {useState} from "react";
import reactLogo from '../assets/react.svg'

function Logo() {
    return ( 
        <>
        <div>
            {/* <a href="https://vite.dev" target="_blank">
            <img src="/vite.svg" className="logo vite" alt="Vite logo" />
            </a> */}
            <a href="https://react.dev" target="_blank">
            <img src={reactLogo} className="logo react" alt="React logo" />
            </a>
            
        </div>
        </>
        
    );
}


export default Logo;