
const users = JSON.parse(localStorage.getItem('users')) || [];
var doctors = users.filter(function(users) {
    return users.role === 'doctor';
});

const doctorSelect = document.getElementById('doctor-select');
doctors.forEach(doctor => {
    const option = document.createElement('option');
    option.value = doctor.username;
    option.textContent = doctor.username;
    doctorSelect.appendChild(option);
});

function bookAppointment() {
    const selectedDoctor = document.getElementById('doctor-select').value;
    const selectedDate = document.getElementById('appointment-date').value;
    const selectedTime = document.getElementById('time-select').value;
    const patientName = sessionStorage.getItem('currentUser') || [];

    const appointments = JSON.parse(localStorage.getItem('appointments')) || [];
    const newAppointment = {
        // id: date.Now(),
        doctor: selectedDoctor,
        patient: patientName,
        date: selectedDate,
        time: selectedTime,
        status: 'Pending', 
    };
    appointments.push(newAppointment);
    localStorage.setItem('appointments', JSON.stringify(appointments));

    // alert('Appointment booked successfully!');
    displayAppointments();

}
function displayAppointments(){
    
    let  appointments = JSON.parse(localStorage.getItem('appointments')) || [];
    const patientName = sessionStorage.getItem('currentUser') || [];
    
    
    const patientAppointments = appointments.filter(function(appointments){
        return appointments.patient === `${patientName}`;
    });
    
    let  appointmentsList = document.getElementById('patient-appointments-list');
    appointmentsList.innerHTML = '';
    patientAppointments.forEach(appointment=>{
        const listItem = document.createElement('li');
        listItem.className=
        listItem.innerHTML = `Date: ${appointment.date}, Doctor: ${appointment.doctor},Time:${appointment.time}
                        <br>status: ${ appointment.status}<br> `; 
        appointmentsList.appendChild(listItem);
    })



}
displayAppointments();
