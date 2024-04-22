import { useState, useEffect } from 'react';
import GeneralTab from './animal/tabs/general';
import VetTab from './animal/tabs/vet';
import OwnerTab from './animal/tabs/owner';
import { useRecoilValue, useSetRecoilState } from 'recoil'; import {
    petType, petName, petWeight, petAge, petBirthDate, petAcquiredDate, petBreeds,
    ownerFirstname, ownerLastname, ownerEmail, ownerPhone, ownerCity, ownerState,
    vetBusiness, vetName, vetAddress, vetAddress2, vetCity, vetState, vetZipcode,
    vetEmail, vetPhone, breedlist
} from '../main/atoms'

function AnimalPage() {
    const [tab, setTab] = useState('general');
    const setBreedsAvailable = useSetRecoilState(breedlist);
    const [seconds, setTimer] = useState(0);
    const [firstPull, setFirstPull] = useState(false);

    // Variables used for checking values
    const pType = useRecoilValue(petType);
    const pName = useRecoilValue(petName);
    const pWeight = useRecoilValue(petWeight);
    const pAge = useRecoilValue(petAge);
    const pBirthDate = useRecoilValue(petBirthDate);
    const pAcquiredDate = useRecoilValue(petAcquiredDate);
    const pBreeds = useRecoilValue(petBreeds);

    const ownFirstname = useRecoilValue(ownerFirstname);
    const ownLastname = useRecoilValue(ownerLastname);
    const ownEmail = useRecoilValue(ownerEmail);
    const ownPhone = useRecoilValue(ownerPhone);
    const ownCity = useRecoilValue(ownerCity);
    const ownState = useRecoilValue(ownerState);

    const vBusiness = useRecoilValue(vetBusiness);
    const vName = useRecoilValue(vetName);
    const vAddress = useRecoilValue(vetAddress);
    const vAddress2 = useRecoilValue(vetAddress2);
    const vCity = useRecoilValue(vetCity);
    const vState = useRecoilValue(vetState);
    const vZipcode = useRecoilValue(vetZipcode);
    const vEmail = useRecoilValue(vetEmail);
    const vPhone = useRecoilValue(vetPhone);

    const selGeneral = () => {
        setTab("general");
    }

    const selVet = () => {
        setTab("vet");
    }

    const selOwner = () => {
        setTab("owner");
    }



    useEffect(() => {
        const GetDogBreeds = () => {
            fetch('https://localhost:7044/GetDogBreeds',
                {
                    method: "GET",
                    mode: "cors",
                    headers: {
                        "Content-Type": "application/json",
                    },
                }).then((response) => response.json())
                .then((data) => {
                    if(data) {
                        setBreedsAvailable(data);
                    }
                })
                .catch((err) => {
                    console.log(err.message);
                });
        };

        let interval = null;

        // Running at a timer of 9 seconds before reloading
        if (firstPull === false) {
            GetDogBreeds(); // Get the list of dog breeds when the page loads
            setFirstPull(true)
        }
        else {
            interval = setInterval(() => {
                setTimer(seconds => seconds + 1);
            }, 1000);
        }

        //Clearing the interval
        return () => clearInterval(interval);
    }, [seconds, firstPull, setBreedsAvailable]);



    // Reusable functions
    function IsEmpty(sValue) {
        return sValue === "" || sValue === null ? true : false;
    }

    function CleanTextfield(sValue) {
        return sValue.replace('\'', '').replace('"', '')
    }

    const submitAnimalRecord = () => {
        var ErrorMsg = "";

        // Check the data
        if (IsEmpty(pType)) { ErrorMsg += " No pet type was provided!"; }
        if (IsEmpty(pName)) { ErrorMsg += " No pet name was provided!"; }
        if (IsEmpty(pWeight)) { ErrorMsg += " No pet weight was provided!"; }
        if (IsEmpty(pAge)) { ErrorMsg += " No pet age was provided!"; }
        if (IsEmpty(pBirthDate)) { ErrorMsg += " No pet birthdate was provided!"; }
        if (IsEmpty(pAcquiredDate)) { ErrorMsg += " No pet acquired date was provided!"; }
        if (pBreeds.length === 0) { ErrorMsg += " No breeds were provided!"; }
        if (IsEmpty(ownFirstname)) { ErrorMsg += " No owner first name was provided!"; }
        if (IsEmpty(ownLastname)) { ErrorMsg += " No owner last name was provided!"; }
        if (IsEmpty(ownEmail)) { ErrorMsg += " No owner email was provided!"; }
        if (IsEmpty(ownPhone)) { ErrorMsg += " No owner phone was provided!"; }
        if (IsEmpty(ownCity)) { ErrorMsg += " No owner city was provided!"; }
        if (IsEmpty(ownState)) { ErrorMsg += " No owner state was provided!"; }
        if (IsEmpty(vBusiness)) { ErrorMsg += " No vet business name was provided!"; }
        if (IsEmpty(vName)) { ErrorMsg += " No vet name was provided!"; }
        if (IsEmpty(vAddress)) { ErrorMsg += " No vet address was provided!"; }
        if (IsEmpty(vCity)) { ErrorMsg += " No vet city was provided!"; }
        if (IsEmpty(vState)) { ErrorMsg += " No vet state was provided!"; }
        if (IsEmpty(vZipcode)) { ErrorMsg += " No vet zipcode was provided!"; }
        if (IsEmpty(vEmail)) { ErrorMsg += " No vet email was provided!"; }
        if (IsEmpty(vPhone)) { ErrorMsg += " No vet phone was provided!"; }

        if (ErrorMsg.length > 0) {
            window.alert(ErrorMsg);
            return; // Prevent sending the information for saving
        }

        // Create the json object
        var AnimalRecord = {};
        var Animal = {};
        Animal.type = CleanTextfield(pType);
        Animal.name = CleanTextfield(pName);
        Animal.weight = pWeight;
        Animal.age = pAge;
        Animal.pBirthDate = pBirthDate;
        Animal.pAcquiredDate = pAcquiredDate;
        Animal.breeds = pBreeds;
        AnimalRecord.Animal = Animal; // Adding the animal object to the json

        var Vet = {};
        Vet.business = CleanTextfield(vBusiness);
        Vet.name = CleanTextfield(vName);
        Vet.address1 = CleanTextfield(vAddress);
        Vet.address2 = CleanTextfield(vAddress2);
        Vet.city = CleanTextfield(vCity);
        Vet.state = CleanTextfield(vState);
        Vet.zipcode = CleanTextfield(vZipcode);
        Vet.email = CleanTextfield(vEmail);
        Vet.phone = CleanTextfield(vPhone);
        AnimalRecord.Vet = Vet; // Adding the animal object to the json

        var Owner = {};
        Owner.firstname = CleanTextfield(ownFirstname);
        Owner.lastname = CleanTextfield(ownLastname);
        Owner.email = CleanTextfield(ownEmail);
        Owner.phone = CleanTextfield(ownPhone);
        Owner.city = CleanTextfield(ownCity);
        Owner.state = CleanTextfield(ownState);
        AnimalRecord.Owner = Owner; // Adding the animal object to the json

        // Send the data to the database
        fetch('https://localhost:7044/AddAnimalRecord',
            {
                method: "GET",
                mode: "cors", // This seems to make it work on the same computer. I don't know why but my research said to do this
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(AnimalRecord), // Send the animal record in the body
            }).then((response) => response.json())
            .then((data) => {
                if (data === true) {
                    alert("Animal record was successfully sent to the database!");
                }
                else {
                    alert("Animal record did not save to the database. Please try again!");
                }
            })
            .catch((err) => {
                console.log(err.message);
            });
    }



    return (
        <div class="page">
            {/* Show the input fields that match the tab that is selected */}
            {
                /* show the general tab */
                tab === "general" ?
                    <GeneralTab></GeneralTab>
                    : tab === "vet" ? /* show the vet tab */
                        <VetTab></VetTab>
                        : /* show the owner tab */
                        <OwnerTab></OwnerTab>
            }

            {/* Show the input tabs in the correct formatting based on which one is currently selected */}
            <div class="tabBar">
                {tab === "general" ? <div class="selectedTab">General</div> : <div class="tab" onClick={selGeneral}>General</div>}
                {tab === "vet" ? <div class="selectedTab">Vet</div> : <div class="tab" onClick={selVet}>Vet</div>}
                {tab === "owner" ? <div class="selectedTab">Owner</div> : <div class="tab" onClick={selOwner}>Owner</div>}
            </div>
            <div class="tabBar">
                <div class="menu-item" onClick={submitAnimalRecord}>Save Record</div>
            </div>
        </div>
    );
}

export default AnimalPage;