<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Skiing_Incident_Report.aspx.cs" Inherits="N01330009_Assignment_1.WebForm1" %>

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
            border: none;
        }

        textarea {
            resize: none;
        }

        td {
            padding: 5px;
            margin: 0;
            border: 1px solid grey;
        }
        
        table table td {
            padding: 0;
            margin: 0;
            border: 0;
        }

        th {
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

        .form-table {
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
    </style>
</head>
<body>
    <div class="incident-container">
        <section class="heading">
            <h1>Skiing Incident Report</h1>
        </section>
        <form method="POST" id="incident_form" runat="server" action="https://postman-echo.com/post">
            <table class="form-table">
                <thaed>
                    <tr>
                        <th colspan="4">
                            INCIDENT INFORMATION
                        </th>
                    </tr>
                </thaed>
                <tbody>
                    <tr>
                        <td>Date of Incident</td>
                        <td colspan="3">
                            <asp:TextBox ID="incident_date" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Time of Incident</td>
                        <td>
                            <asp:TextBox ID="incident_time_hours" runat="server" TextMode="Number" min="0" max="11" placeholder="hours"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="incident_time_minutes" runat="server" TextMode="Number" min="0" max="59" placeholder="minutes"></asp:TextBox>
                        </td>
                        <td>
                             <asp:DropDownList runat="server" ID="incident_time_type">
                                <asp:ListItem Text="AM / PM" Value="" selected="true" disabled="true"></asp:ListItem>
                                <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Location of Incident</td>
                        <td colspan="3">
                            <asp:TextBox id="incident_location" TextMode="multiline" Columns="5" Rows="5" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Describe the incident</td>
                        <td colspan="3">
                            <asp:TextBox id="incident_description" TextMode="multiline" Columns="5" Rows="5" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Weather</td>
                        <td colspan="3">
                             <asp:RadioButtonList runat="server" ID="weather">
                                <asp:ListItem Text="Clear (The sky was clear or had some clouds)" Value="weather_type_1"></asp:ListItem>
                                <asp:ListItem Text="Overcast (There was a general overcast)" Value="weather_type_2"></asp:ListItem>
                                <asp:ListItem Text="Snowing (It was snowing at the time of the incident)" Value="weather_type_3"></asp:ListItem>
                                <asp:ListItem Text="Raining (It was raining at the time of the incident)" Value="weather_type_4"></asp:ListItem>
                                <asp:ListItem Text="Fog (There was fog at the time and place of the incident)" Value="weather_type_5"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="weather_type_6"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="weather_type_7"></asp:ListItem>
                            </asp:RadioButtonList>
                       
                        </td>
                    </tr>
                    <tr>
                        <td>Temp C</td>
                        <td colspan="3">
                            <asp:RadioButtonList runat="server" ID="temprature">
                                <asp:ListItem Text="Above10 (At the time and site air temperature estimate above 10)" Value="temprature_type_1"></asp:ListItem>
                                <asp:ListItem Text="0 to10 (As above estimated to 0 to 10)" Value="temprature_type_2"></asp:ListItem>
                                <asp:ListItem Text="-10 to 0 (Below 0 and above -10)" Value="temprature_type_3"></asp:ListItem>
                                <asp:ListItem Text="-20 to -11 (Estimated between -11 and -20)" Value="temprature_type_4"></asp:ListItem>
                                <asp:ListItem Text="Below 20 (Estimated below -21)" Value="temprature_type_5"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="temprature_type_6"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="temprature_type_7"></asp:ListItem>
                            </asp:RadioButtonList>
                            <section> 
                                Temperature refers to the general air temperature at the time and location of the incident. It does not refer to snow temperature, which will always be below 0.
                            </section>
                        </td>
                    </tr>
                    <tr>
                        <td>Snow</td>
                        <td colspan="3">
                            <asp:RadioButtonList runat="server" ID="snow">
                                <asp:ListItem Text="No new (There has been no new snow in the previous 24 hours)" Value="snow_type_1"></asp:ListItem>
                                <asp:ListItem Text="0 to 5 (Up to 5 cm of new snow)" Value="snow_type_2"></asp:ListItem>
                                <asp:ListItem Text="5 to 10 (Between 6 and 10 cm)" Value="snow_type_3"></asp:ListItem>
                                <asp:ListItem Text="10 to 15 (Between 11 and 15 cm)" Value="snow_type_4"></asp:ListItem>
                                <asp:ListItem Text="Over 15 (More than 16 cm of new snow)" Value="snow_type_5"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="snow_type_6"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="snow_type_7"></asp:ListItem>
                            </asp:RadioButtonList>
                            <br> This category refers to snow that has accumulated over the past 24 hours. I.e.: on the day of, and
                            before the incident.
                        </td>
                    </tr>
                    <tr>
                        <td>Light</td>
                        <td colspan="3">
                            <asp:RadioButtonList runat="server" ID="light">
                                <asp:ListItem Text="Sharp (There was enough light for distinct shadows)" Value="light_type_1"></asp:ListItem>
                                <asp:ListItem Text="Flat (Diffused light – shadows are not distinct)" Value="light_type_2"></asp:ListItem>
                                <asp:ListItem Text="Whiteout (Diffused dim light or obscured light – difficult to judge depth due to lack of shadows)" Value="light_type_3"></asp:ListItem>
                                <asp:ListItem Text="Lights (Night lights)" Value="light_type_4"></asp:ListItem>
                                <asp:ListItem Text="Dark (No lighting)" Value="light_type_5"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="light_type_6"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="light_type_7"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>Surface</td>
                        <td colspan="3">
                            <asp:RadioButtonList runat="server" ID="surface">
                                <asp:ListItem Text="Groomed (The surface at the site had been groomed recently)" Value="surface_type_1"></asp:ListItem>
                                <asp:ListItem Text="Moguls (There were moguls at the site)" Value="surface_type_2"></asp:ListItem>
                                <asp:ListItem Text="Powder (There was some new snow on the old surface)" Value="surface_type_3"></asp:ListItem>
                                <asp:ListItem Text="Variable (The surface had a mixture of snow types ie: slush or cut up powde)" Value="surface_type_4"></asp:ListItem>
                                <asp:ListItem Text="Granular (The surface snow was melt/freeze granules ie: corn snow)" Value="surface_type_5"></asp:ListItem>
                                <asp:ListItem Text="Hard (The surface was hard enough to resist penetration of poles or ski edges due to freezing or
                                compaction)" Value="surface_type_6"></asp:ListItem>
                                <asp:ListItem Text="Unknown (Incident was not reported when it occurred but at a later date/time)" Value="surface_type_7"></asp:ListItem>
                                <asp:ListItem Text="N/A (Not applicable ie: indoors)" Value="surface_type_8"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>People Factors</td>
                        <td colspan="3">
                            <asp:CheckBoxList runat="server" ID="people_factor">
                                <asp:ListItem Text="Procedure not followed/ no procedure exists" Value="Procedure not followed/ no procedure exists"></asp:ListItem>
                                <asp:ListItem Text="Drugs/ alcohol" Value="Drugs/ alcohol"></asp:ListItem>
                                <asp:ListItem Text="Fatigue" Value="Fatigue"></asp:ListItem>
                                <asp:ListItem Text="Time/ production pressures" Value="Time/ production pressures"></asp:ListItem>
                                <asp:ListItem Text="Change of routine" Value="Change of routine"></asp:ListItem>
                                <asp:ListItem Text="Distraction/ personal issues/ stress" Value="Distraction/ personal issues/ stress"></asp:ListItem>
                                <asp:ListItem Text="Lack of communication" Value="Lack of communication"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>Actions taken</td>
                        <td colspan="3">
                            <asp:TextBox id="actions_taken_after_incident" TextMode="multiline" Columns="5" Rows="5" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th colspan="4">
                            WITNESS INFORMATION
                        </th>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td>
                            <asp:TextBox ID="witness_first_name" runat="server"></asp:TextBox>
                        </td>
                        <td>Last Name</td>
                        <td>
                            <asp:TextBox ID="witness_last_name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td colspan="3">
                            <asp:TextBox ID="witness_phone_number" runat="server"  TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td colspan="3">
                            <asp:TextBox ID="witness_email" runat="server"  TextMode="Email"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="no-border"></td>
                        <td colspan="3" class="no-border">
                            <asp:Button runat="server" Text="Submit"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
