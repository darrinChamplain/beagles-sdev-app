import { atom } from "recoil";

// This is used for navigating through the pages
export const currentPage = atom({
    key: "currentPage",
    default: "Home",
});

// Used for selecting a breed
export const breedlist = atom({
    key: "breedlist",
    default: [],
    get: ({ get }) => get(breedlist),
    set: ({ set }, newValue) => {
        set(breedlist, newValue)
    },
});

// This section contains variables for getting pet information
export const petType = atom({
    key: "petType",
    default: "Dog",
});

export const petName = atom({
    key: "petName",
    default: "",
});

export const petWeight = atom({
    key: "petWeight",
    default: 0,
});

export const petAge = atom({
    key: "petAge",
    default: 0,
});

export const petBirthDate = atom({
    key: "petBirthDate",
    default: "",
});

export const petAcquiredDate = atom({
    key: "petAcquiredDate",
    default: "",
});

export const petBreeds = atom({
    key: "petBreeds",
    default: [],
});

// This section contains variables for getting the owner information
export const ownerFirstname = atom({
    key: "ownerFirstname",
    default: "",
});

export const ownerLastname = atom({
    key: "ownerLastname",
    default: "",
});

export const ownerEmail = atom({
    key: "ownerEmail",
    default: "",
});

export const ownerPhone = atom({
    key: "ownerPhone",
    default: "",
});

export const ownerCity = atom({
    key: "ownerCity",
    default: "",
});

export const ownerState = atom({
    key: "ownerState",
    default: "",
});

// This section contains variables for getting the vet information
export const vetBusiness = atom({
    key: "vetBusiness",
    default: "",
});

export const vetName = atom({
    key: "vetName",
    default: "",
});

export const vetAddress = atom({
    key: "vetAddress",
    default: "",
});

export const vetAddress2 = atom({
    key: "vetAddress2",
    default: "",
});

export const vetCity = atom({
    key: "vetCity",
    default: "",
});

export const vetState = atom({
    key: "vetState",
    default: "",
});

export const vetZipcode = atom({
    key: "vetZipcode",
    default: "",
});

export const vetEmail = atom({
    key: "vetEmail",
    default: "",
});

export const vetPhone = atom({
    key: "vetPhone",
    default: "",
});

export const vetValidated = atom({
    key: "vetValidated",
    default: false,
});