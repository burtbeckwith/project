<%@ page import="edu.harvard.cscie56.Members"%>

<h1>Personal Information</h1>
<div class="lampstand-outer lampstand-required" >
	<div class="lampstand-inner">
		<label for="input-title">Full Name:</label> <input type="text"
			name="fullname" value="${membersInstance?.fullname}" id="fullname"
			size="50">
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="email">Email Address</label> <input type="text"
			name="email" id="email" required size="50"
			value="${membersInstance?.email}">
	</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="input-phone">Phone Number</label> <input type="text"
			name="phone" id="input-phone" placeholder="XXX-XXX-XXXX"
			value="${membersInstance?.phone}">
	</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="address">Current Address:</label> <input type="text"
			name="address" id="address" required size="50">
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="address">Address (Optional):</label> <input type="text"
			name="address1" id="address" size="50"
			placeholder="Apt #, Suite Optional">
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="input-bdate">Birth Date</label> <input type="date"
			name="birthdate" id="input-bdate" placeholder="MM/DD/YYYY">
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="city">City State & Zip Code:</label> <input type="text"
			name="city" id="city" placeholder="City" size="20"> <select
			name="state">
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI" selected>Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
		</select> <input type="text" name="zip" id="zip" placeholder="Zip Code"
			size="6" maxLength="5">
	</div>
</div>
<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<div
			class="fieldcontain ${hasErrors(bean: membersInstance, field: 'gender', 'error')} ">
			<label for="gender"> <g:message code="members.gender.label"
					default="Gender" />

			</label>
			<g:select name="gender"
				from="${membersInstance.constraints.gender.inList}"
				value="${membersInstance?.gender}"
				valueMessagePrefix="members.gender"
				noSelection="['': 'Select Gender']" />
		</div>
	</div>
</div>

<div class="lampstand-outer lampstand-required">
	<div class="lampstand-inner">
		<label for="agegroup">Age Group:</label> <select name='agegroup'>
			<option value="0-18">0-18</option>
		</select>
	</div>
</div>
