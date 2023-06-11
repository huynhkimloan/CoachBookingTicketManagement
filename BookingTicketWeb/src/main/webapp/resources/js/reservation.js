/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global fetch */


function addToPay(id, name, price, pasCarId, tripId) {
    event.preventDefault();
//    let btn = document.getElementById(`seat-${id}`);
//    btn.style.background = "#f8beab";
//    btn.disabled = "true";
//    sessionStorage.setItem(`seat-${id}`, 'selected');
     let btn = document.getElementById(`seat-${id}`);

    if (sessionStorage.getItem(`seat-${id}`) === 'selected') {
        btn.style.background = "#fafad2"; 
        btn.disabled = false;
        sessionStorage.removeItem(`seat-${id}`);
    } else {
        btn.style.background = "#f8beab";
        btn.disabled = true;
        sessionStorage.setItem(`seat-${id}`, 'selected');
    }

    fetch("/BookingTicketWeb/api/reservation", {
        method: 'post',
        body: JSON.stringify({
            "id": id,
            "name": name,
            "pasCarId": pasCarId,
            "tripId": tripId,
            "price": price,
            "quantity": 1
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let counter = document.getElementById("count");
        counter.innerHTML = data;
        restoreSeatStates();
    });
}

function restoreSeatStates() {
    const seatElements = document.querySelectorAll('[id^="seat-"]');

    seatElements.forEach(seatElement => {
        const id = seatElement.id;
        const seatState = sessionStorage.getItem(id);
        if (seatState === 'selected') {
            seatElement.style.background = "#f8beab";
            seatElement.disabled = true;
        } else {
            seatElement.style.background = "#fafad2";
            seatElement.disabled = false;
        }
    });
}

document.addEventListener('DOMContentLoaded', (event) => {
    restoreSeatStates();
});

function deleteSeat(seatId) {
    var option = confirm('Bạn có chắc chắn muốn xóa không?');
    if (option === true) {
        fetch(`/BookingTicketWeb/api/reservation/delete/${seatId}`, {
            method: "delete"
        }).then(function (res) {
            return res.json();
        }).then(function (data) {
            sessionStorage.removeItem(`seat-${seatId}`);
            location.reload();
            let counter = document.getElementById("count");
            counter.innerHTML = data.counter;
            let amount = document.getElementById("amount");
            amount.innerHTML = data.amount;
        });
    }

}

function pay(tripId, method) {
    var option = confirm('Bạn có chắc chắn muốn thanh toán không?');
    if (option === true) {
        fetch("/BookingTicketWeb/api/pay", {
            method: 'post',
            body: JSON.stringify({
                "method": method
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
            console.log(code);
            document.location.href = `/BookingTicketWeb/reservation/${tripId}/confirm-seat/user-information/success`;
        });
    }
}

function addTicket(tripId, method) {
    event.preventDefault();
    var option = confirm('Bạn có chắc chắn muốn thanh toán không?');
    if (option === true) {

        return fetch("/BookingTicketWeb/api/add-user-booking", {
            method: 'post',
            body: JSON.stringify({
                "name": document.getElementById("nameUser").value,
                "phone": document.getElementById("phoneNumber").value,
                "email": document.getElementById("emailUser").value
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then((res) => {
            return res.json();
        }).then((data) => {
            if (data && data.id > 0) {
                userId = data.id;
                return fetch("/BookingTicketWeb/api/add-ticket-customer", {
                    method: 'post',
                    body: JSON.stringify({
                        "userId": userId,
                        "method": method
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                });
            } else {
                throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!");
            }
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
            console.log(code);
            document.location.href = `/BookingTicketWeb/reservation/${tripId}/confirm-seat/user-information/success`;
        });
    }
}



