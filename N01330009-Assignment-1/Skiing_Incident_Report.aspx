<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Skiing_Incident_Report.aspx.cs" Inherits="N01330009_Assignment_1.Skiing_Incident_Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

         input,
        textarea,
        select {
            width: 100%;
            border: 1px solid lighgrey;
            padding: 5px;
        }

        .submit-button-container input {
            width: 100px;
            float: right;
            border: 0px;
            padding: 10px;  
            color: white;
            background-color: black;
            font-weight: 500;
        }

        textarea {
            resize: none;
        }

        .form-heading {
            background-color: black;
            color: white;
            padding: 5px;
            text-align: left;
        }

        input[type="checkbox"] {
            width: auto;
            margin: 7px;
        }

        input[type="radio"] {
            width: auto;
            margin: 7px;
        }

        .incident-container {
            margin: 0 auto;
            width: 80%;
        }

        .no-border {
            border: 0;
        }

        .no-border input {
            padding: 10px;
            font-weight: bold;
            border: 1px solid grey;
        }
        .heading{
            text-align: center;
        } 

        .form-container {
            margin: 0 auto;
            width: 80%;
        }

        .flex-container {
            display: flex;
            flex-direction: row;
        }

        .flex-container > .flex-item {
            flex: auto;
            padding: 7px;
        }

        .raw-item {
            padding: 7px;
        }
        .form-item{
            border: 1px solid lightgrey;
            padding-right: 10px;
        }
        .form-item span {
            color: #c62828;
            display: block;
        }
        .summary-container{
            background-color: #ffebee;
            color:#c62828;
        }
        #summaryInformation{
            background-color: #e3f2fd;
        }
        .incident-summary-values{
            font-weight: bold;
            display: inline !important;
            color:#1e88e5 !important;
        }
    </style>
</head>
<body>
    <div class="incident-container">
        <section class="heading">
            <h1>Skiing Incident Report</h1>
        </section>
        <form method="POST" id="incident_form" runat="server">
            <div class="form-container">
                <section class="form-heading">
                    <div class="flex-container">
                        <div class="flex-item">
                                INCIDENT INFORMATION
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Date of Incident</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox ID="incident_date" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter date of an incident" ControlToValidate="incident_date"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Time of Incident</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox ID="incident_time_hours" runat="server" TextMode="Number" placeholder="hours"></asp:TextBox>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter incident time (Hours)." ControlToValidate="incident_time_hours"></asp:RequiredFieldValidator>
                            <asp:RangeValidator runat="server" EnableClientScript="true" ControlToValidate="incident_time_hours" ErrorMessage="Incident time hours should be between 0 and 11." MinimumValue="0" MaximumValue="11" ></asp:RangeValidator>
                        </div>
                        <div class="flex-item">
                            <asp:TextBox ID="incident_time_minutes" runat="server" TextMode="Number" placeholder="minutes"></asp:TextBox>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter incident time (Minutes)." ControlToValidate="incident_time_minutes"></asp:RequiredFieldValidator>
                            <asp:RangeValidator runat="server" EnableClientScript="true" ControlToValidate="incident_time_minutes" ErrorMessage="Incident time minutes should be between 0 and 59." MinimumValue="0" MaximumValue="59" ></asp:RangeValidator>
                        </div>
                        <div  class="flex-item">
                            <asp:DropDownList runat="server" ID="incident_time_type">
                                <asp:ListItem Text="AM / PM" Value="" selected="true" disabled="true"></asp:ListItem>
                                <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please select value for incident time (AM/PM)." ControlToValidate="incident_time_type"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Location of Incident</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox id="incident_location" TextMode="multiline" Columns="5" Rows="5" runat="server" />
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter location of the incident." ControlToValidate="incident_location"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Describe the incident</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox id="incident_description" TextMode="multiline" Columns="5" Rows="5" runat="server" />
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please describe the incident." ControlToValidate="incident_description"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Weather</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:RadioButtonList runat="server" ID="environment_weather">
                            <asp:ListItem Text="Clear (The sky was clear or had some clouds)" Value="environment_weather_type_1"></asp:ListItem>
                            <asp:ListItem Text="Overcast (There was a general overcast)" Value="environment_weather_type_2"></asp:ListItem>
                            <asp:ListItem Text="Snowing (It was snowing at the time of the incident)" Value="environment_weather_type_3"></asp:ListItem>
                            <asp:ListItem Text="Raining (It was raining at the time of the incident)" Value="environment_weather_type_4"></asp:ListItem>
                            <asp:ListItem Text="Fog (There was fog at the time and place of the incident)" Value="environment_weather_type_5"></asp:ListItem>
                            <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="environment_weather_type_6"></asp:ListItem>
                            <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="environment_weather_type_7"></asp:ListItem>
                        </asp:RadioButtonList>
                        <section>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please select weather type of the incident place." ControlToValidate="environment_weather"></asp:RequiredFieldValidator>
                        </section>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Temp C</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:RadioButtonList runat="server" ID="incident_place_temprature">
                                <asp:ListItem Text="Above10 (At the time and site air temperature estimate above 10)" Value="incident_place_temprature_type_1"></asp:ListItem>
                                <asp:ListItem Text="0 to10 (As above estimated to 0 to 10)" Value="incident_place_temprature_type_2"></asp:ListItem>
                                <asp:ListItem Text="-10 to 0 (Below 0 and above -10)" Value="incident_place_temprature_type_3"></asp:ListItem>
                                <asp:ListItem Text="-20 to -11 (Estimated between -11 and -20)" Value="incident_place_temprature_type_4"></asp:ListItem>
                                <asp:ListItem Text="Below 20 (Estimated below -21)" Value="incident_place_temprature_type_5"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="incident_place_temprature_type_6"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="incident_place_temprature_type_7"></asp:ListItem>
                            </asp:RadioButtonList>
                            <section> 
                                Temperature refers to the general air temperature at the time and location of the incident. It does not refer to snow temperature, which will always be below 0.
                            </section>
                            <section>
                                <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please select temprature of the incident place." ControlToValidate="incident_place_temprature"></asp:RequiredFieldValidator>
                            </section>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Snow</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:RadioButtonList runat="server" ID="environment_snow">
                                <asp:ListItem Text="No new (There has been no new snow in the previous 24 hours)" Value="environment_snow_type_1"></asp:ListItem>
                                <asp:ListItem Text="0 to 5 (Up to 5 cm of new snow)" Value="environment_snow_type_2"></asp:ListItem>
                                <asp:ListItem Text="5 to 10 (Between 6 and 10 cm)" Value="environment_snow_type_3"></asp:ListItem>
                                <asp:ListItem Text="10 to 15 (Between 11 and 15 cm)" Value="environment_snow_type_4"></asp:ListItem>
                                <asp:ListItem Text="Over 15 (More than 16 cm of new snow)" Value="environment_snow_type_5"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="environment_snow_type_6"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="environment_snow_type_7"></asp:ListItem>
                            </asp:RadioButtonList>
                            <br> This category refers to snow that has accumulated over the past 24 hours. I.e.: on the day of, and
                            before the incident.
                            <section>
                                <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please select snow type of the incident place." ControlToValidate="environment_snow"></asp:RequiredFieldValidator>
                            </section>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Light</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:RadioButtonList runat="server" ID="environment_light">
                                <asp:ListItem Text="Sharp (There was enough light for distinct shadows)" Value="environment_light_type_1"></asp:ListItem>
                                <asp:ListItem Text="Flat (Diffused light – shadows are not distinct)" Value="environment_light_type_2"></asp:ListItem>
                                <asp:ListItem Text="Whiteout (Diffused dim light or obscured light – difficult to judge depth due to lack of shadows)" Value="environment_light_type_3"></asp:ListItem>
                                <asp:ListItem Text="Lights (Night lights)" Value="environment_light_type_4"></asp:ListItem>
                                <asp:ListItem Text="Dark (No lighting)" Value="environment_light_type_5"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="environment_light_type_6"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="environment_light_type_7"></asp:ListItem>
                            </asp:RadioButtonList>
                            <section>
                                <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please select environment light type of the incident place." ControlToValidate="environment_light"></asp:RequiredFieldValidator>
                            </section>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Surface</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:RadioButtonList runat="server" ID="incident_place_surface">
                                <asp:ListItem Text="Groomed (The surface at the site had been groomed recently)" Value="incident_place_surface_type_1"></asp:ListItem>
                                <asp:ListItem Text="Moguls (There were moguls at the site)" Value="incident_place_surface_type_2"></asp:ListItem>
                                <asp:ListItem Text="Powder (There was some new snow on the old surface)" Value="incident_place_surface_type_3"></asp:ListItem>
                                <asp:ListItem Text="Variable (The surface had a mixture of snow types ie: slush or cut up powde)" Value="incident_place_surface_type_4"></asp:ListItem>
                                <asp:ListItem Text="Granular (The surface snow was melt/freeze granules ie: corn snow)" Value="incident_place_surface_type_5"></asp:ListItem>
                                <asp:ListItem Text="Hard (The surface was hard enough to resist penetration of poles or ski edges due to freezing or
                                compaction)" Value="incident_place_surface_type_6"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="incident_place_surface_type_7"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="incident_place_surface_type_8"></asp:ListItem>
                            </asp:RadioButtonList>
                            <section>
                                <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please select surface type of the incident place." ControlToValidate="incident_place_surface"></asp:RequiredFieldValidator>
                            </section>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">People Factors</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:CheckBoxList runat="server" ID="people_factors">
                                <asp:ListItem Text="Procedure not followed/ no procedure exists" Value="Procedure not followed/ no procedure exists"></asp:ListItem>
                                <asp:ListItem Text="Drugs/ alcohol" Value="Drugs/ alcohol"></asp:ListItem>
                                <asp:ListItem Text="Fatigue" Value="Fatigue"></asp:ListItem>
                                <asp:ListItem Text="Time/ production pressures" Value="Time/ production pressures"></asp:ListItem>
                                <asp:ListItem Text="Change of routine" Value="Change of routine"></asp:ListItem>
                                <asp:ListItem Text="Distraction/ personal issues/ stress" Value="Distraction/ personal issues/ stress"></asp:ListItem>
                                <asp:ListItem Text="Lack of communication" Value="Lack of communication"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Actions taken</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox id="actions_taken_after_incident" TextMode="multiline" Columns="5" Rows="5" runat="server" />
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please fill the value for actions taken. (If no actions has been taken, Just place 'None' in the field.)" ControlToValidate="actions_taken_after_incident"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-heading">
                    <div class="flex-container">
                        <div class="flex-item">
                                WITNESS INFORMATION
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">First Name</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox ID="witness_first_name" runat="server"></asp:TextBox>
                            <!-- 
                                - Regex taken from https://rubular.com/r/qfA68b8PO5 and modified for min 3 characters & max 20 characters
                                - Date: 25th Sept, 2019
                            -->
                            <asp:RegularExpressionValidator runat="server" EnableClientScript="true" ControlToValidate="witness_first_name" ValidationExpression="[A-Za-z ]{3,20}" ErrorMessage="Please enter valid firstname.(Minimum 3 characters, Maximum 20 characters, No special characters allowed.)"></asp:RegularExpressionValidator><br>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter your firstname." ControlToValidate="witness_first_name"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Last Name</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox ID="witness_last_name" runat="server"></asp:TextBox>
                            <!-- 
                                - Regex taken from https://rubular.com/r/qfA68b8PO5 and modified for min 3 characters & max 20 characters
                                - Date: 25th Sept, 2019
                             -->
                            <asp:RegularExpressionValidator runat="server" EnableClientScript="true" ControlToValidate="witness_last_name" ValidationExpression="[A-Za-z ]{3,20}" ErrorMessage="Please enter valid lastname.(Minimum 3 characters, Maximum 20 characters, No special characters allowed.)"></asp:RegularExpressionValidator><br>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter your lastname." ControlToValidate="witness_last_name"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Phone</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox ID="witness_phone_number" runat="server"></asp:TextBox>
                            <!-- 
                                - Regex taken from https://stackoverflow.com/questions/16699007/regular-expression-to-match-standard-10-digit-phone-number
                                - Date: 25th Sept, 2019
                                - Matches the following
                                    123-456-7890
                                    (123) 456-7890
                                    123 456 7890
                                    123.456.7890
                                    +91 (123) 456-7890
                            -->
                            <asp:RegularExpressionValidator runat="server" EnableClientScript="true" ControlToValidate="witness_phone_number" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$" ErrorMessage="Please enter valid phone number. Allowed formats [123-456-7890, (123) 456-7890, 123 456 7890, 123.456.7890, +91 (123) 456-7890]"></asp:RegularExpressionValidator><br>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter your phone number." ControlToValidate="witness_phone_number"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item">
                    <div class="raw-item">Email</div>
                    <div class="flex-container">
                        <div class="flex-item">
                            <asp:TextBox ID="witness_email" runat="server"  TextMode="Email"></asp:TextBox>
                            <!--  
                                - Regex taken from https://www.w3resource.com/javascript/form/email-validation.php
                                - Date 25th Sept, 2019
                             -->
                            <asp:RegularExpressionValidator runat="server" EnableClientScript="true" ControlToValidate="witness_email" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" ErrorMessage="Please enter valid email address"></asp:RegularExpressionValidator><br>
                            <asp:RequiredFieldValidator  runat="server" EnableClientScript="true" ErrorMessage="Please enter your email address." ControlToValidate="witness_email"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </section>
                <section class="form-item summary-container">
                    <div class="flex-container">
                        <div class="flex-item">
                                <asp:ValidationSummary runat="server" ShowSummary="true" />
                        </div>
                    </div>
                </section>
                <section class="form-item submit-button-container">
                    <div class="flex-container">
                        <div class="flex-item">
                            <input type="submit" value="Submit" />
                        </div>
                    </div>
                </section>
                <section class="form-item" id="summaryInformation" runat="server">

                </section>
            </div>   
        </form>
    </div>
</body>
</html>
