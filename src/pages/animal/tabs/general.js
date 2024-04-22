import { useState } from 'react';
import { useRecoilState, useSetRecoilState } from 'recoil';
import {
    petType, petName, petWeight, petAge, petBirthDate, petAcquiredDate, petBreeds, breedlist
} from '../../../main/atoms'

function GeneralTab() {
    const [type, setType] = useRecoilState(petType);
    const setName = useSetRecoilState(petName);
    const setWeight = useSetRecoilState(petWeight);
    const setAge = useSetRecoilState(petAge);
    const setBirthdate = useSetRecoilState(petBirthDate);
    const setAcquiredDate = useSetRecoilState(petAcquiredDate);
    const [breeds, setBreeds] = useRecoilState(petBreeds);
    const [showAddBreeds, setShowAddBreeds] = useState(true);
    const [showBreedList, setShowBreedList] = useState(false);

    // Select the type of animal that is being added
    const selDog = () => {
        setType("Dog");
    }

    const selCat = () => {
        setType("Cat");
    }

    // Other input field saving
    const selName = (event) => {
        setName(event.target.value);
    }
    const selWeight = (event) => {
        setWeight(event.target.value);
    }
    const selAge = (event) => {
        setAge(event.target.value);
    }
    const selBirthdate = (event) => {
        setBirthdate(event.target.value);
    }
    const selAcquiredDate = (event) => {
        setAcquiredDate(event.target.value);
    }
    const showBreeds = (event) => {
        setShowBreedList(true);
    }

    const hideBreeds = (event) => {
        setShowBreedList(false);
    }

    const selNewBreed = (event) => {
        // Add new breed to array. Check if there are 4 breeds present
        var bds = [breeds.length + 1];

        for (var i = 0; i < breeds.length; i++) {
            bds[i] = breeds[i];
        }

        bds[breeds.length + 1] = event.target.value;

        // Save the new array
        setBreeds(bds);

        if (breeds.length === 4) {
            setShowAddBreeds(false);
        }

        setShowBreedList(false);
    }

    const removeBreed = (event) => {
        var count = 0;
        var bds = [breeds.length - 1];

        for (var i = 0; i < breeds.length; i++) {
            if (event.target.value !== breeds[i]) {
                bds[count] = breeds[i];
                count++;
            }
        }

        setBreeds(bds);
    }

    return (
        <>
            <div class="tab-title">
                Pet Information Entry
            </div>
            <div class="tab-section">
                <div class="tab-row">
                    {type === "Dog" ? <div class="selectedTab">Dog</div> : <div class="tab" onClick={selDog}>Dog</div>}
                    {type === "Cat" ? <div class="selectedTab">Cat</div> : <div class="tab" onClick={selCat}>Cat</div>}
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="petname">Name</label></div>
                    <div class="tab-input"><input type="text" id="petname" maxLength={15} placeholder="Fluffy" onChange={selName} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="petweight">Weight</label></div>
                    <div class="tab-input"><input type="number" id="petweight" placeholder="35.5" onChange={selWeight} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="petage">Age</label></div>
                    <div class="tab-input"><input type="number" id="petage" placeholder="5.5" onChange={selAge} /></div>
                    <div class="tab-label">Years</div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="petbirthdate">Birth Date</label></div>
                    <div class="tab-input"><input type="date" id="petbirthdate" placeholder="09/15/2018" onChange={selBirthdate} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="petacquireddate">Acquired Date</label></div>
                    <div class="tab-input"><input type="date" id="petacquireddate" placeholder="11/22/2018" onChange={selAcquiredDate} /></div>
                </div>
                <div class="tab-row">
                    <div class="tab-label"><label for="petacquireddate">Breeds <span style={{ fontSize: "0.9rem" }}>(Max 4)</span></label></div>
                    {showAddBreeds === true ? <div class="menu-item" onclick={showBreeds}>+</div> : <div></div>}
                </div>
                {
                    breeds !== undefined && breeds.length > 0 ? breeds.map((item, i) => (
                        <div class="tab-input"> <input type="text" tooltip="Click to remove a breed from the list" onclick={removeBreed} value={item} />{item}</div>
                    )) : <></>
                }
                {showBreedList &&
                    <div onMouseLeave={hideBreeds}>
                        {
                            breedlist !== undefined && breedlist.length > 0 ? breedlist.map((item, i) => (
                                <div class="dropdownItem" onclick={selNewBreed}>{item}</div>
                            ))
                                : <></>
                        }
                    </div>
                }
            </div>
        </>
    );
}

export default GeneralTab;