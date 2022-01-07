# DBPRIN CW Group 21

## Assumptions

- The General Practitioner name refers to the surgerys name, not the name of the doctors that work at the GP themselves.

- Doctors can work in multiple wards.

- The nurses entity can be zero or many as nurses can potentially go on strike, be made redundant or many other scenarios which may result in the inability to work.
We assumed that the GP has its own database for referrals thus we reference only the GP surgeries name and not the doctor at the GP surgery.

- Only patients with complaints can receive appropriate treatment(if the problem can be treated).

- It is possible for a ward to have no patients.

- A GP can have zero or many patients admitted to the hospital. We assumed zero as it may be a new GP that has opened up.

- A patient can only be assigned to one ward. This is because they can receive many treatments in that one ward and doctors can work on different wards.

- Some complaints cannot be treated.

- When a patient is admitted for treatment, they are assigned to one ward only

- Patient is admitted for treatment based on the complaint

- Patients cannot be treated without a complaint.

- We are aware some of the patients may be international - therefore we increased the digits for the phone number to 15 characters or less.
