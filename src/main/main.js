import '../styles/style.css';
import Report from '../pages/report'
import Pet from '../pages/animal'
import Home from '../pages/home'
import Error from '../pages/error'
import { currentPage } from './atoms'
import { useRecoilState } from 'recoil';

export default function Main() {
    const [page, setPage] = useRecoilState(currentPage);

    const selNewPet = () => {
        setPage("Pet");
    }

    const selReports = () => {
        setPage("Report");
    }

    return (
        <div className="main">
            <div class="menu">
                <div class="menu-item" onClick={selNewPet}>Register a Pet</div>
                <div class="menu-item" onClick={selReports}>Reports</div>
            </div>
            {page === "Home" ?
                <Home></Home>
                : page === "Pet" ?
                    <Pet></Pet>
                    : page === "Report" ?
                        <Report></Report>
                        :
                        <Error></Error>
            }

        </div>
    );
}