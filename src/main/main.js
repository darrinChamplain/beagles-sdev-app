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
                {page === "Pet" ? <div class="menu-item-selected">Add Pet</div> : <div class="menu-item" onClick={selNewPet}>Add Pet</div>}
                {page === "Report" ? <div class="menu-item-selected">Reports</div> : <div class="menu-item" onClick={selReports}>Reports</div>}
                <div class="menu-title">{page === "Pet" ? "Now adding a new pet to the dataset!" : "Reviewing Reports"}</div>
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