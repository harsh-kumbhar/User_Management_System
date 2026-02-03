<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: LightGray"; color: Black >

        <div>
            <a href="https://github.com/harsh-kumbhar/User_Management_System.git" class="navbar-brand" style="color: Black;"> User Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link" style="color: Black;">Users</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/${user != null ? 'update' : 'insert'}" method="post">
                <caption>
                    <h2>
                        <c:if test="${user != null}">Edit User</c:if>
                        <c:if test="${user == null}">Add New User</c:if>
                    </h2>
                </caption>

                <c:if test="${user != null}">
                    <input type="hidden" name="sr_no" value="<c:out value='${user.sr_no}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Name of the User</label>
                    <input type="text" value="<c:out value='${user.name}' />" class="form-control"
                           name="name" required>
                </fieldset>

                <fieldset class="form-group">
                    <label>Email ID</label>
                    <input type="email" value="<c:out value='${user.email}' />" class="form-control"
                           name="email" required>
                </fieldset>
                
                <fieldset class="form-group">
				    <label>Gender:</label><br>
<input type="radio" name="gender" value="Male" ${user.gender == 'Male' ? 'checked' : ''}> Male
<input type="radio" name="gender" value="Female" ${user.gender == 'Female' ? 'checked' : ''}> Female
<input type="radio" name="gender" value="Other" ${user.gender == 'Other' ? 'checked' : ''}> Other

				</fieldset>
	               

                <fieldset class="form-group">
    <label>Country</label>
<select class="form-control" name="country" required>
    <option value="India" ${user.country == 'India' ? 'selected' : ''}>India</option>
    <option value="Australia" ${user.country == 'Australia' ? 'selected' : ''}>Australia</option>
    <option value="Brazil" ${user.country == 'Brazil' ? 'selected' : ''}>Brazil</option>
    <option value="Canada" ${user.country == 'Canada' ? 'selected' : ''}>Canada</option>
    <option value="China" ${user.country == 'China' ? 'selected' : ''}>China</option>
    <option value="Finland" ${user.country == 'Finland' ? 'selected' : ''}>Finland</option>
    <option value="France" ${user.country == 'France' ? 'selected' : ''}>France</option>
    <option value="Germany" ${user.country == 'Germany' ? 'selected' : ''}>Germany</option>
    <option value="Italy" ${user.country == 'Italy' ? 'selected' : ''}>Italy</option>
    <option value="Japan" ${user.country == 'Japan' ? 'selected' : ''}>Japan</option>
    <option value="Mexico" ${user.country == 'Mexico' ? 'selected' : ''}>Mexico</option>
    <option value="Netherlands" ${user.country == 'Netherlands' ? 'selected' : ''}>Netherlands</option>
    <option value="Portugal" ${user.country == 'Portugal' ? 'selected' : ''}>Portugal</option>
    <option value="Russia" ${user.country == 'Russia' ? 'selected' : ''}>Russia</option>
    <option value="Saudi Arabia" ${user.country == 'Saudi Arabia' ? 'selected' : ''}>Saudi Arabia</option>
    <option value="South Korea" ${user.country == 'South Korea' ? 'selected' : ''}>South Korea</option>
    <option value="Spain" ${user.country == 'Spain' ? 'selected' : ''}>Spain</option>
    <option value="Turkey" ${user.country == 'Turkey' ? 'selected' : ''}>Turkey</option>
    <option value="UK" ${user.country == 'UK' ? 'selected' : ''}>UK</option>
    <option value="USA" ${user.country == 'USA' ? 'selected' : ''}>USA</option>
</select>

</fieldset>
	<fieldset class="form-group">
    <label>State</label>
    <select name="state" class="form-control" required>
    	  <optgroup label="India">
            <option value="Maharashtra" ${user.state == 'Maharashtra' ? 'selected' : ''}>Maharashtra</option>
            <option value="Karnataka" ${user.state == 'Karnataka' ? 'selected' : ''}>Karnataka</option>
            <option value="Tamil Nadu" ${user.state == 'Tamil Nadu' ? 'selected' : ''}>Tamil Nadu</option>
        </optgroup>

        <optgroup label="Australia">
            <option value="New South Wales" ${user.state == 'New South Wales' ? 'selected' : ''}>New South Wales</option>
            <option value="Queensland" ${user.state == 'Queensland' ? 'selected' : ''}>Queensland</option>
            <option value="Victoria" ${user.state == 'Victoria' ? 'selected' : ''}>Victoria</option>
        </optgroup>

        <optgroup label="Brazil">
            <option value="São Paulo" ${user.state == 'São Paulo' ? 'selected' : ''}>São Paulo</option>
            <option value="Rio de Janeiro" ${user.state == 'Rio de Janeiro' ? 'selected' : ''}>Rio de Janeiro</option>
            <option value="Minas Gerais" ${user.state == 'Minas Gerais' ? 'selected' : ''}>Minas Gerais</option>
        </optgroup>

        <optgroup label="Canada">
            <option value="Ontario" ${user.state == 'Ontario' ? 'selected' : ''}>Ontario</option>
            <option value="Quebec" ${user.state == 'Quebec' ? 'selected' : ''}>Quebec</option>
            <option value="British Columbia" ${user.state == 'British Columbia' ? 'selected' : ''}>British Columbia</option>
        </optgroup>
    
        <optgroup label="China">
            <option value="Guangdong" ${user.state == 'Guangdong' ? 'selected' : ''}>Guangdong</option>
            <option value="Shanghai" ${user.state == 'Shanghai' ? 'selected' : ''}>Shanghai</option>
            <option value="Beijing" ${user.state == 'Beijing' ? 'selected' : ''}>Beijing</option>
        </optgroup>

        <optgroup label="USA">
            <option value="California" ${user.state == 'California' ? 'selected' : ''}>California</option>
            <option value="Texas" ${user.state == 'Texas' ? 'selected' : ''}>Texas</option>
            <option value="New York" ${user.state == 'New York' ? 'selected' : ''}>New York</option>
        </optgroup>
        
           <optgroup label="Finland">
            <option value="Uusimaa" ${user.state == 'Uusimaa' ? 'selected' : ''}>Uusimaa</option>
            <option value="Pirkanmaa" ${user.state == 'Pirkanmaa' ? 'selected' : ''}>Pirkanmaa</option>
            <option value="Southwest Finland" ${user.state == 'Southwest Finland' ? 'selected' : ''}>Southwest Finland</option>
        </optgroup>

        <optgroup label="France">
            <option value="Île-de-France" ${user.state == 'Île-de-France' ? 'selected' : ''}>Île-de-France</option>
            <option value="Occitanie" ${user.state == 'Occitanie' ? 'selected' : ''}>Occitanie</option>
        </optgroup>

        <optgroup label="Germany">
            <option value="Bavaria" ${user.state == 'Bavaria' ? 'selected' : ''}>Bavaria</option>
            <option value="Berlin" ${user.state == 'Berlin' ? 'selected' : ''}>Berlin</option>
            <option value="North Rhine-Westphalia" ${user.state == 'North Rhine-Westphalia' ? 'selected' : ''}>North Rhine-Westphalia</option>
        </optgroup>

        <optgroup label="Italy">
            <option value="Lombardy" ${user.state == 'Lombardy' ? 'selected' : ''}>Lombardy</option>
            <option value="Lazio" ${user.state == 'Lazio' ? 'selected' : ''}>Lazio</option>
            <option value="Sicily" ${user.state == 'Sicily' ? 'selected' : ''}>Sicily</option>
        </optgroup>

        <optgroup label="Japan">
            <option value="Tokyo" ${user.state == 'Tokyo' ? 'selected' : ''}>Tokyo</option>
            <option value="Osaka" ${user.state == 'Osaka' ? 'selected' : ''}>Osaka</option>
            <option value="Hokkaido" ${user.state == 'Hokkaido' ? 'selected' : ''}>Hokkaido</option>
        </optgroup>

        <optgroup label="Mexico">
            <option value="Mexico City" ${user.state == 'Mexico City' ? 'selected' : ''}>Mexico City</option>
            <option value="Jalisco" ${user.state == 'Jalisco' ? 'selected' : ''}>Jalisco</option>
            <option value="Nuevo León" ${user.state == 'Nuevo León' ? 'selected' : ''}>Nuevo León</option>
        </optgroup>

        <optgroup label="Netherlands">
            <option value="North Holland" ${user.state == 'North Holland' ? 'selected' : ''}>North Holland</option>
            <option value="South Holland" ${user.state == 'South Holland' ? 'selected' : ''}>South Holland</option>
            <option value="Utrecht" ${user.state == 'Utrecht' ? 'selected' : ''}>Utrecht</option>
        </optgroup>

        <optgroup label="Portugal">
            <option value="Lisbon" ${user.state == 'Lisbon' ? 'selected' : ''}>Lisbon</option>
            <option value="Porto" ${user.state == 'Porto' ? 'selected' : ''}>Porto</option>
            <option value="Algarve" ${user.state == 'Algarve' ? 'selected' : ''}>Algarve</option>
        </optgroup>

        <optgroup label="Russia">
            <option value="Moscow" ${user.state == 'Moscow' ? 'selected' : ''}>Moscow</option>
            <option value="Saint Petersburg" ${user.state == 'Saint Petersburg' ? 'selected' : ''}>Saint Petersburg</option>
            <option value="Novosibirsk" ${user.state == 'Novosibirsk' ? 'selected' : ''}>Novosibirsk</option>
        </optgroup>

        <optgroup label="Saudi Arabia">
            <option value="Riyadh" ${user.state == 'Riyadh' ? 'selected' : ''}>Riyadh</option>
            <option value="Jeddah" ${user.state == 'Jeddah' ? 'selected' : ''}>Jeddah</option>
            <option value="Mecca" ${user.state == 'Mecca' ? 'selected' : ''}>Mecca</option>
        </optgroup>

        <optgroup label="South Korea">
            <option value="Seoul" ${user.state == 'Seoul' ? 'selected' : ''}>Seoul</option>
            <option value="Busan" ${user.state == 'Busan' ? 'selected' : ''}>Busan</option>
            <option value="Incheon" ${user.state == 'Incheon' ? 'selected' : ''}>Incheon</option>
        </optgroup>

        <optgroup label="Spain">
            <option value="Madrid" ${user.state == 'Madrid' ? 'selected' : ''}>Madrid</option>
            <option value="Catalonia" ${user.state == 'Catalonia' ? 'selected' : ''}>Catalonia</option>
            <option value="Andalusia" ${user.state == 'Andalusia' ? 'selected' : ''}>Andalusia</option>
        </optgroup>

        <optgroup label="UK">
            <option value="England" ${user.state == 'England' ? 'selected' : ''}>England</option>
            <option value="Scotland" ${user.state == 'Scotland' ? 'selected' : ''}>Scotland</option>
            <option value="Wales" ${user.state == 'Wales' ? 'selected' : ''}>Wales</option>
        </optgroup>
        
    </select>
</fieldset>

     <fieldset class="form-group">
                    <label>City</label>
                    <input type="city" value="<c:out value='${user.city}' />" class="form-control"
                           name="city" required>
                </fieldset>
                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
