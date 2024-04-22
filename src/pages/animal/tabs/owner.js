import { useSetRecoilState } from 'recoil';
import {
    ownerFirstname, ownerLastname, ownerEmail, ownerPhone, ownerCity, ownerState
} from '../../../main/atoms'

function OwnerTab() {
    // Variables for the vet information
    const setFirstname = useSetRecoilState(ownerFirstname);
    const setLastname = useSetRecoilState(ownerLastname);
    const setEmail = useSetRecoilState(ownerEmail);
    const setPhone = useSetRecoilState(ownerPhone);
    const setCity = useSetRecoilState(ownerCity);
    const setState = useSetRecoilState(ownerState);

    // Other input field saving
    const saveFirstname = (event) => {
        setFirstname(event.target.value);
    }
    const saveLastname = (event) => {
        setLastname(event.target.value);
    }
    const saveEmail = (event) => {
        setEmail(event.target.value);
    }
    const savePhone = (event) => {
        setPhone(event.target.value);
    }
    const saveCity = (event) => {
        setCity(event.target.value);
    }
    const saveState = (event) => {
        setState(event.target.value);
    }

    return (
        <>
            <div class="tab-title">
                Owner Information Entry
            </div>
            <div class="tab-section">
            <div class="tab-row">
                    <div class="tab-label"><label for="firstname">First Name</label></div>
                    <div class="tab-input"><input type="text" id="firstname" maxLength={25} placeholder="Jeremy" onChange={saveFirstname} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="lastname">Last Name</label></div>
                    <div class="tab-input"><input type="text" id="lastname" maxLength={25} placeholder="Freckles" onChange={saveLastname} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="email">Email</label></div>
                    <div class="tab-input"><input type="text" id="email" maxLength={25} placeholder="jfreckles@gmail.com" onChange={saveEmail} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="phone">Phone</label></div>
                    <div class="tab-input"><input type="text" id="phone" maxLength={12} placeholder="888-456-7890" onChange={savePhone} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="city">City</label></div>
                    <div class="tab-input"><input type="text" id="city" maxLength={15} placeholder="Burlington" onChange={saveCity} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="state">State</label></div>
                    <div class="tab-input"><input type="text" id="state" maxLength={20} placeholder="Vermont" onChange={saveState} /></div>
                </div>
            </div>
        </>
    );
}

export default OwnerTab;