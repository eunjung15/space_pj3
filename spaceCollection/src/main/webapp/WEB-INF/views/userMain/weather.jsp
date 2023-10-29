<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <body>
    <button class="button" type="button">현재 날씨는?</button><br><br>
    <dl>
      <dt>기온</dt>
      <dd class="temperature"></dd>
      <dt>위치</dt>
      <dd class="place"></dd>
      <dt>설명</dt>
      <dd class="description"></dd>
      <!-- img class="icon" /> -->
    </dl>
<script src="weather.js">
	 button.addEventListener('click', () => {
	  navigator.geolocation.getCurrentPosition(success, fail);
	});
	...
	const fail = () => {
	  alert("좌표를 받아올 수 없음");
	}
	
	const API_KEY = 'a408e82232cf7c21d3264d12924a62ab';
	...
	const success = (position) => {
	  const latitude = position.coords.latitude;
	  const longitude = position.coords.longitude;
	
	  getWeather(latitude, longitude);
	};
	
	...
	
	const getWeather = (lat, lon) => {
	  fetch(
	    `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric&lang=kr`
	  )
	}
	
	const getWeather = (lat, lon) => {
		  fetch(
		    `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric&lang=kr`
		  )
		    .then((response) => {
		      return response.json();
		    })
		}
	
	const getWeather = (lat, lon) => {
		  ...
		    .then((json) => {
		      console.log(json);
		    })
		}
	
	const getWeather = (lat, lon) => {
		  ...
		   .catch((error) => {
		      alert(error);
		    });
		}
	
	const iconSection = document.querySelector('.icon');

	const getWeather = (lat, lon) => {
	  ...
	    .then((json) => {
	      const icon = json.weather[0].icon;
	      const iconURL = `http://openweathermap.org/img/wn/${icon}@2x.png`;

	      iconSection.setAttribute('src', iconURL);
	    })
	  ...
	};
</script>
  </body>
</html>