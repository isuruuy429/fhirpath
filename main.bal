import ballerina/io;
import ballerinax/health.fhir.r4utils.fhirpath;

map<json> patient = {
    "resourceType": "Patient",
    "id": "1",
    "meta": {
        "profile": [
            "http://hl7.org/fhir/StructureDefinition/Patient"
        ]
    },
    "active": true,
    "name": [
        {
            "use": "official",
            "family": "Chalmers",
            "given": [
                "Peter",
                "James"
            ]
        },
        {
            "use": "usual",
            "given": [
                "Jim"
            ]
        }
    ],
    "gender": "male",
    "birthDate": "1974-12-25",
    "managingOrganization": {
        "reference": "Organization/1",
        "display": "Burgers University Medical Center"
    },
    "address": [
        {
            "use": "home",
            "line": [
                "534 Erewhon St",
                "sqw"
            ],
            "city": "PleasantVille",
            "district": "Rainbow",
            "state": "Vic",
            "postalCode": "3999",
            "country": "Australia"
        },
        {
            "use": "work",
            "line": [
                "33[0] 6th St"
            ],
            "city": "Melbourne",
            "district": "Rainbow",
            "state": "Vic",
            "postalCode": "3000",
            "country": "Australia"
        }
    ]
};

public function main() {
    //string fPath = "Patient.address[4].city";
    string fPath1 = "Patient.birthDate";
    fhirpath:FhirPathResult newFhirPathResult = fhirpath:getFhirPathResult(patient, fPath1);

    if newFhirPathResult?.result is null {
        json outcome = newFhirPathResult?.resultenError;
        io:println(outcome.toString());
    }
    else {
        json outcome = newFhirPathResult?.result;
        io:println(outcome.toString());
    }

}
