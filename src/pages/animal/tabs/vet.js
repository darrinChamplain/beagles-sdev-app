import { useSetRecoilState } from 'recoil';
import {
    vetBusiness, vetName, vetAddress, vetAddress2, vetCity, vetState, vetZipcode,
    vetEmail, vetPhone
} from '../../../main/atoms'

function VetTab() {
    // Variables for the vet information
    const setBusiness = useSetRecoilState(vetBusiness);
    const setName = useSetRecoilState(vetName);
    const setAddress1 = useSetRecoilState(vetAddress);
    const setAddress2 = useSetRecoilState(vetAddress2);
    const setCity = useSetRecoilState(vetCity);
    const setState = useSetRecoilState(vetState);
    const setZipcode = useSetRecoilState(vetZipcode);
    const setEmail = useSetRecoilState(vetEmail);
    const setPhone = useSetRecoilState(vetPhone);

    // Other input field saving
    const saveBusiness = (event) => {
        setBusiness(event.target.value);
    }
    const saveName = (event) => {
        setName(event.target.value);
    }
    const saveAddress1 = (event) => {
        setAddress1(event.target.value);
    }
    const saveAddress2 = (event) => {
        setAddress2(event.target.value);
    }
    const saveCity = (event) => {
        setCity(event.target.value);
    }
    const saveState = (event) => {
        setState(event.target.value);
    }
    const saveZipcode = (event) => {
        setZipcode(event.target.value);
    }
    const saveEmail = (event) => {
        setEmail(event.target.value);
    }
    const savePhone = (event) => {
        setPhone(event.target.value);
    }

    return (
        <>
            <div class="tab-title">
                Vet Information Entry
            </div>
            <div class="tab-section">
                <div class="tab-row">
                    <div class="tab-label"><label for="businessname">Business Name</label></div>
                    <div class="tab-input"><input type="text" id="businessname" maxLength={25} placeholder="Generic Vet Hospital" onChange={saveBusiness} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="vetname">Vet Name</label></div>
                    <div class="tab-input"><input type="text" id="vetname" maxLength={25} placeholder="Dr. Smiles" onChange={saveName} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="address1">Address 1</label></div>
                    <div class="tab-input"><input type="text" id="address1" maxLength={25} placeholder="123 Main St" onChange={saveAddress1} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="address2">Address 2</label></div>
                    <div class="tab-input"><input type="text" id="address2" maxLength={15} placeholder="Suite 101" onChange={saveAddress2} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="city">City</label></div>
                    <div class="tab-input"><input type="text" id="city" maxLength={15} placeholder="Burlington" onChange={saveCity} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="state">State</label></div>
                    <div class="tab-input"><input type="text" id="state" maxLength={20} placeholder="Vermont" onChange={saveState} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="zipcode">Zipcode</label></div>
                    <div class="tab-input"><input type="text" id="zipcode" maxLength={5} placeholder="05201" onChange={saveZipcode} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="email">Email</label></div>
                    <div class="tab-input"><input type="text" id="email" maxLength={25} placeholder="drsmiles@vethospital.com" onChange={saveEmail} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="phone">Phone</label></div>
                    <div class="tab-input"><input type="phone" id="phone" maxLength={12} placeholder="888-123-4567" onChange={savePhone} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="validated">Is Validated</label></div>
                    <div class="tab-input"><input type="text" id="validated" maxLength={15} value="False" disabled /></div>
                </div>
            </div>
        </>
    );
}

export default VetTab;