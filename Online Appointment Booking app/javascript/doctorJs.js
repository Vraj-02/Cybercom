
document.addEventListener('DOMContentLoaded', function () {
    const doctorName = sessionStorage.getItem('currentUser') || []; 
    const appointments = JSON.parse(localStorage.getItem('appointments')) || [];
    
    const upcomingAppointments = appointments.filter(function(appointments){
        return appointments.doctor === `${doctorName}`;
    });

    const appointmentsList = document.getElementById('appointments-list');
    upcomingAppointments.forEach(appointment => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `Date: ${appointment.date}, Patient: ${appointment.patient}, Time: ${appointment.time}
                        <br>Status: ${appointment.status}<br>`;
        if(appointment.status === 'Pending'){
        const acceptButton = document.createElement('button');
            acceptButton.textContent = 'Accept';
            acceptButton.addEventListener('click', () => handleAppointment(appointment, 'Accept'));
            
            const declineButton = document.createElement('button');
            declineButton.textContent = 'Decline';
            declineButton.addEventListener('click', () => handleAppointment(appointment, 'Decline'));
            
            listItem.appendChild(acceptButton);
            listItem.appendChild(declineButton);
        }
            appointmentsList.appendChild(listItem);       
    });
});

function handleAppointment(appointment,action){
    const appointments = JSON.parse(localStorage.getItem('appointments')) || [];
    console.log(action);
    let currentAppointment = appointments.findIndex((apt)=> apt.doctor === appointment.doctor 
            && apt.patient === appointment.patient && apt.date === appointment.date && apt.status === "Pending");
    // let currentAppointment = appointments.find((apt)=> apt.id ===appointment.id   && apt.status === "Pending");
    console.log(currentAppointment);
    if(currentAppointment >=0){
        appointments[currentAppointment]={
            ...appointments[currentAppointment],
            status: action
        }
    }
      localStorage.setItem('appointments',JSON.stringify(appointments))
      location.reload();   
}
