import '../styles/style.css';
import Logo from '../image/logo.jpg'
import {currentPage} from './atoms'
import { useSetRecoilState } from 'recoil';

export default function Header() {
    const setPage = useSetRecoilState(currentPage);

    const selHome = () => {
        setPage("Home");
    }

    return (
      <div className="head">
        <div class="headLogo"><img src={Logo} alt="Logo of a dog with a bowl"  width={'90%'} onClick={selHome}/></div>
        <div class="headTitle">Tracking & Reporting Animal Data</div>
      </div>
    );
  }