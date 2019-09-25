using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N01330009_Assignment_1
{
    public partial class Skiing_Incident_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Page.Validate();
                
                if (Page.IsValid)
                {
                    Dictionary<string, string> environment_weather_values = new Dictionary<string, string>();
                    environment_weather_values.Add("environment_weather_type_1","Clear (The sky was clear or had some clouds)");
                    environment_weather_values.Add("environment_weather_type_2","Snowing (It was snowing at the time of the incident)");
                    environment_weather_values.Add("environment_weather_type_3","Raining (It was raining at the time of the incident)");
                    environment_weather_values.Add("environment_weather_type_4","Fog (There was fog at the time and place of the incident)");
                    environment_weather_values.Add("environment_weather_type_5","Unknown (Incident was not reported when it occurred but at a later date/time)");
                    environment_weather_values.Add("environment_weather_type_6","N/A (Not applicable ie: indoors)");

                    Dictionary<string, string> incident_place_temprature_values = new Dictionary<string, string>();
                    incident_place_temprature_values.Add("incident_place_temprature_type_1","Above10 (At the time and site air temperature estimate above 10)");
                    incident_place_temprature_values.Add("incident_place_temprature_type_2","0 to10 (As above estimated to 0 to 10)");
                    incident_place_temprature_values.Add("incident_place_temprature_type_3","-10 to 0 (Below 0 and above -10)");
                    incident_place_temprature_values.Add("incident_place_temprature_type_4","-20 to -11 (Estimated between -11 and -20)");
                    incident_place_temprature_values.Add("incident_place_temprature_type_5","Below 20 (Estimated below -21)");
                    incident_place_temprature_values.Add("incident_place_temprature_type_6","Unknown (Incident was not reported when it occurred but at a later date/time)");
                    incident_place_temprature_values.Add("incident_place_temprature_type_7","N/A (Not applicable ie: indoors)");

                    Dictionary<string, string> environment_snow_values = new Dictionary<string, string>();
                    environment_snow_values.Add("environment_snow_type_1","No new (There has been no new snow in the previous 24 hours)");
                    environment_snow_values.Add("environment_snow_type_2","0 to 5 (Up to 5 cm of new snow)");
                    environment_snow_values.Add("environment_snow_type_3","5 to 10 (Between 6 and 10 cm)");
                    environment_snow_values.Add("environment_snow_type_4","10 to 15 (Between 11 and 15 cm)");
                    environment_snow_values.Add("environment_snow_type_5","Over 15 (More than 16 cm of new snow)");
                    environment_snow_values.Add("environment_snow_type_6","Unknown (Incident was not reported when it occurred but at a later date/time)");
                    environment_snow_values.Add("environment_snow_type_7","N/A (Not applicable ie: indoors)");

                    Dictionary<string, string> environment_light_values = new Dictionary<string, string>();
                    environment_light_values.Add("environment_light_type_1","Sharp (There was enough light for distinct shadows)");
                    environment_light_values.Add("environment_light_type_2","Flat (Diffused light – shadows are not distinct)");
                    environment_light_values.Add("environment_light_type_3","Whiteout (Diffused dim light or obscured light – difficult to judge depth due to lack of shadows)");
                    environment_light_values.Add("environment_light_type_4","Lights (Night lights)");
                    environment_light_values.Add("environment_light_type_5","Dark (No lighting)");
                    environment_light_values.Add("environment_light_type_6","Unknown (Incident was not reported when it occurred but at a later date/time)");
                    environment_light_values.Add("environment_light_type_7","N/A (Not applicable ie: indoors)");

                    Dictionary<string, string> incident_place_surface_values = new Dictionary<string, string>();
                    incident_place_surface_values.Add("incident_place_surface_type_1","Groomed (The surface at the site had been groomed recently)");
                    incident_place_surface_values.Add("incident_place_surface_type_2","Moguls (There were moguls at the site)");
                    incident_place_surface_values.Add("incident_place_surface_type_3","Powder (There was some new snow on the old surface)");
                    incident_place_surface_values.Add("incident_place_surface_type_4","Variable (The surface had a mixture of snow types ie: slush or cut up powde)");
                    incident_place_surface_values.Add("incident_place_surface_type_5","Granular (The surface snow was melt/freeze granules ie: corn snow)");
                    incident_place_surface_values.Add("incident_place_surface_type_6","Hard (The surface was hard enough to resist penetration of poles or ski edges due to freezing or compaction)");
                    incident_place_surface_values.Add("incident_place_surface_type_7","Unknown (Incident was not reported when it occurred but at a later date/time)");
                    incident_place_surface_values.Add("incident_place_surface_type_8","N/A (Not applicable ie: indoors)");
                    
                    string incident_date_value = incident_date.Text.ToString();
                    string incident_time_hours_value = incident_time_hours.Text.ToString();
                    string incident_time_minutes_value = incident_time_minutes.Text.ToString();
                    string incident_time_type_value = incident_time_type.Text.ToString();
                    string incident_location_value = incident_location.Text.ToString();
                    string incident_description_value = incident_description.Text.ToString();
                    string environment_weather_value = environment_weather.Text.ToString();
                    string incident_place_temprature_value = incident_place_temprature.Text.ToString();
                    string environment_snow_value = environment_snow.Text.ToString();
                    string environment_light_value = environment_light.Text.ToString();
                    string incident_place_surface_value = incident_place_surface.Text.ToString();
                    string actions_taken_after_incident_value = actions_taken_after_incident.Text.ToString();
                    string witness_first_name_value = witness_first_name.Text.ToString();
                    string witness_last_name_value = witness_last_name.Text.ToString();
                    string witness_phone_number_value = witness_phone_number.Text.ToString();
                    string witness_email_value = witness_email.Text.ToString();

                    var htmlContent = "";
                    htmlContent = "<h2>Information Summary</h2>";
                    
                    htmlContent += "<p>Date: <span class='incident-summary-values'>" + incident_date_value + "</span></p>";
                    
                    htmlContent += "<p>Time: <span class='incident-summary-values'>" + incident_time_hours_value + ":" + incident_time_minutes_value + " " + incident_time_type_value + "</span></p>";
                    
                    htmlContent += "<p>Location: <span class='incident-summary-values'>" + incident_location_value + "</span></p>";
                    
                    htmlContent += "<p>Description of Incident: <span class='incident-summary-values'>" + incident_description_value + "</span></p>";

                    htmlContent += "<p>Weather: <span class='incident-summary-values'>" + environment_weather_values[environment_weather_value] + "</span></p>";

                    htmlContent += "<p>Temprature: <span class='incident-summary-values'>" + incident_place_temprature_values[incident_place_temprature_value] + "</span></p>";
                    
                    htmlContent += "<p>Snow: <span class='incident-summary-values'>" + environment_snow_values[environment_snow_value] + "</span></p>";

                    htmlContent += "<p>Light: <span class='incident-summary-values'>" + environment_light_values[environment_light_value] + "</span></p>";

                    htmlContent += "<p>Surface: <span class='incident-summary-values'>" + incident_place_surface_values[incident_place_surface_value] + "</span></p>";

                    htmlContent += "<p>Actions Taken: <span class='incident-summary-values'>" + actions_taken_after_incident_value + "</span></p>";

                    htmlContent += "<p>Witness Fullname: <span class='incident-summary-values'>" + witness_first_name_value +  witness_last_name_value + "</span></p>";
                    
                    htmlContent += "<p>Witness phone number: <span class='incident-summary-values'>" + witness_phone_number_value + "</span></p>";

                    htmlContent += "<p>Witness email Id: <span class='incident-summary-values'>" + witness_email_value + "</span></p>";

                    summaryInformation.InnerHtml = htmlContent;

                }
            }
        }
    }
}