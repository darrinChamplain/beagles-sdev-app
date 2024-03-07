import Head from './main/header';
import Main from './main/main';
import Foot from './main/footer';
import './App.css';
import React from 'react';
import {
  RecoilRoot
} from 'recoil';

function App() {
  return (
    <RecoilRoot>
      <div className="App">
        <Head></Head>
        <Main></Main>
        <Foot></Foot>
      </div>
    </RecoilRoot>
  );
}

export default App;
