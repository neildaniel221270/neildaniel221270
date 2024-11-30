# DEDA framework
1. **Project name, date, place:**
   Tech Fusion 5, 23/6/23

2. **Participants of the project:**
   Andrea, Borislav, Jouhar, Vincent, Neil

3. **What is the project about and what is its goal?**
   The goal of the project is to improve the quality of life in the different neighbourhoods of Breda.

4. **What kind of data will you be using?**

| **Dataset:**         | **Publisher:**                                  | **Format** | **Rows** | **Columns** | **Description:**                                                                           | 
|----------------------|-------------------------------------------------|------------|----------|-------------|--------------------------------------------------------------------------------------------|
| **Green Index**      | Municipality of Breda                           | .csv       | 298038   | 7           | Data showing the green index score per neighborhood, per year.                             |
| **Public  Nuisance** | Police                                          | .csv       | 89964    | 7           | Data showing the amount of recorded public nuisance incidents per neighborhood, per year   |
| **Nuisance**         | Police                                          | .csv       | 89964    | 7           | Data showing the amount of recorded public nuisance incidents per neighborhood, per year   |
| **Crime data**       | Police                                          | .csv       | 545632   | 5           | Data showing all recorded crimes per neighborhood                                          |
| **Livability data**  | Ministry of the Interior and Kingdom relations  | .csv       | 56       | 8           | Data showing the livability index per neighborhood, per year                               |
| **Move Houses**      | Municipality of Breda                           | .csv       | 39374    | 5           | Data showing the frequency of the different types of house movement in and from the city.  |

5. **Who might be affected by the project?**
   The housing market. The people who live in the neighbourhood with aldready high livability might be affected, because after our project the livability of other neighbourhoods will also rise and thus the neighbourhood will not be that unique.

6. **What are the benifits of the project?**
   This project benifits the city of Breda as a whole as it will be more attractive to live in, so many people will want to move to Breda.

7. **What are the problems or concerns that might arise in connection with this project**
   The only concern that might arise in connection with this project is the dirsuption of the housing market in Breda.

## 1 Algoritms
This part of the DEDA is important for us because this project makes use of machine learning.
1. **Does the project make use of an algorithm, or some form of machine learning or neural networks?**
   
   Yes, it does. It uses [**Random Forest
   Regression**](https://github.com/BredaUniversityADSAI/2022-23d-1fcmgt-reg-ai-01-group-team5/blob/main/src/model/RF_model.ipynb)
   and [**Linear Regression with Interaction
   Terms**](https://github.com/BredaUniversityADSAI/2022-23d-1fcmgt-reg-ai-01-group-team5/blob/main/src/model/LR_model_with_interactions.ipynb)
   .

   ### Andrea - [Random Forest Regression](https://github.com/BredaUniversityADSAI/2022-23d-1fcmgt-reg-ai-01-group-team5/blob/main/src/model/RF_model.ipynb)

![rf_model.jpg](https://anasbrital98.github.io/assets/img/20/random-forest.jpg)

  Explanation of the model:  
  *The model works by training a random forest regression algorithm to predict the livability index of different neighborhoods. It analyzes the characteristics of each neighborhood, such as green spaces, registered incidents of nuisance, registered crimes, and migration patterns. The algorithm learns patterns and relationships between these features and the livability index through training on the available data. The model also provides insights into the importance of different features for predicting livability.*

#### Neil - [Evaluation Random Forest Regression](https://github.com/BredaUniversityADSAI/2022-23d-1fcmgt-reg-ai-01-group-team5/blob/main/src/model/RF_evaluation.ipynb)

### Borislav - [Linear Regression with Interaction Terms](https://github.com/BredaUniversityADSAI/2022-23d-1fcmgt-reg-ai-01-group-team5/blob/main/src/model/LR_model_with_interactions.ipynb)

![lr_with_interactions.png](https://www.jmp.com/en_ch/statistics-knowledge-portal/what-is-multiple-regression/mlr-with-interactions/_jcr_content/par/styledcontainer_2069/par/lightbox_3be9/lightboxImage.img.png/1548351208495.png)

  Explanation of the model: *Based on the Simple Linear Regression model which tries the relationship between a scalar
  response and one or more
  explanatory variables, an interaction terms allows the model to make the relationship between one variable X1 and Y
  dependent on another variable X2.*

#### Neil - [Evaluation Linear Regression model with Interaction Terms](https://github.com/BredaUniversityADSAI/2022-23d-1fcmgt-reg-ai-01-group-team5/blob/main/src/model/LR_evaluation.ipynb)

2. **Is there someone within the team that can explain how the algorithm in question works?**
   
   Yes, the group who worked on the Machine Learning models.
    * The group who worked on the Machine Learning models:
        * Andrea - Machine Learning models
        * Borislav - Machine Learning models
        * Neil - Evaluation of the ML models

3. **Is there someone who can provide an explanation that is accessible to the wider public?**
   
   Yes, everyone in the team who worked on this project.
   

## 2 Source
This part of the DEDA is also important because the source of the data affects the reliability of the data.
1. **Where do the datasets come from?**
   - green index: Municipality of Breda
   - public lights: ArcGIS Hub
   - move houses: Municipality of Breda
   - livability: Municipality of Breda
   - poi: Esri Nederland
   - police: Ducth police
   - public nuisance: Ducth police
   - recorded crimes: Dutch police
   - neighbourhood: podk
2. **In what ways have you checked the quality of the data?**
   We have all performed and EDA on the datasets to check how accurate the data is and what sort of things we can get out of the data that would be useful to us for the research.

   ### Borislav, Andrea - [Data quality report](https://github.com/BredaUniversityADSAI/2022-23d-1fcmgt-reg-ai-01-group-team5/blob/andrea-dev/docs/Data_quality%26ML_lifecycle_report.docx)

3. **Do the data have an expiration date?**
   No, the data does not have an expiration date. We do however get real time data, so if there are changes to the data we get the chanegs as well.

## 3 Anonymization
This part of the DEDA is not important for this project because the data is aldready anonimized as we are doing our research on a neighbourhood level.

## 4 Visualization
This part of the DEDA is important for this project because we need to visialize the project in a way that be of use to our clients. This way they can use the final product to improve Breda.
1. **How will the results of the project be presented? Are the results suitable for visualization?**
   
   - ***(Vincent)*** The result of the project will be visualized as a dashboard that will be presented to the client.
   - ***(Jouhar)*** The visualization of the model's results will be presented in various forms depending on the audience, and the purpose, our visualization contains both geographical for spatial patterns of different variables, and meaningful simple, and relevant charts as line and table charts to ensure audience understanding and engagement on all levels.

2. **What alternative of viualizing the result sare there?**
   
   - ***(Vincent)*** The results of the project can be presented using various visual methods. Graphs and charts are useful for displaying numerical or categorical data. Maps are effective for showcasing geographical or spatial information, while infographics combine text, images, and graphics to convey complex statistics. These visualizations help present the project's findings in a clear and visually appealing manner, making it easier for the audience to understand the information being presented.
   - ***(Jouhar)*** In the broader term there are many alternatives to what have been mentioned as bar charts, histograms, and disk charts.
3. **How will the result of the project be presented?**
   
   - ***(Vincent)*** The results of the project will be presented through a dashboard created using Streamlit, which provides an interactive and user-friendly interface. This dashboard will be accessible to anyone interested in exploring the project's findings. It will showcase visualizations such as graphs, charts, and maps to present the data and convey complex information in a simple and engaging manner. By utilizing Streamlit, the project results will be easily accessible to a wide audience, enabling them to explore the findings and gain insights into the project's outcomes.
   - ***(Jouhar)*** Depending on the cotenxt, the meaning, and purpose, for the most part our project will be presented to the audience as a website that has each of the previously mentioned visualizations, not to mention the model as a predictor, and each of the ethical, and legal views and frameworks we have strictly committed to where our data had been used.
4. **Are the result suitable for visualisation?**
   
   - ***(Vincent)*** Yes, the results are suitable for visualization. The project involves numerical or categorical data that can be effectively presented using graphs, charts, and maps. Visualizing the results enhances their clarity and makes it easier for the audience to understand the findings.

## 5 Access
This part of the DEDA is slightly less important for the project as everyone in our team has access to the data on the condition that is not shared with other people outside of this project. 
1. **Who has access to the data and under what condition?**
   Everyone from our team has access to the data under the condition that we will not show/ send the data to anyone that is not part of the project.
2. **How is the access monitored?**
   The access to the data is not monitored. 

## 6 Sharing, reusing and repurposing
This part of the DEDA is an important part of the project because we need to know the obligations for sharing, reusing the data.
1. **Is any of the data suitable for reuse, and if so under what conditions and what (new) purpose could the be reused.**
All the data is suitable for reusing. You could try and predict what kind of complaints the residents have regarding the amount of green there is in the neighbourhood/ or about the nuisance/ crimes that happen in the neighbourhood. 

2. **Are there any obligations (not) to make the data publicly available? If you were to provide open access to parts of the data,what opportunities/ risks would arise?**
There are some data that we are not allowed to show/ display the data to the public. If we were to provide access to it, you would be able to see the whereabouts of police officers, BOA patrols which would endanger the safety of the officers 

## 7 Responsibility
This part of the DEDA is not important for our project as we are all responsible for the project.
1. **Which laws and regulations apply to your project?**
   The GDPR rules apply to this project.
   
2. **Who is ultimately responsible for the project?**
   The team as a whole is responsible for the project.

3.  **Are the duties and responsibilities of that person clear, with regards to this project?**
   Yes, the duties and responsibilities of the person are clear. There will be some further description of the tasks in the Trello board.

4.  **Is the project suitable for cooperation with (commercial) partners? If so which parties could that be?**
   Yes, it can be used by the municipality of BREDA (to make Breda a more favourable place to move to), police (to improve the safety/ minimize crime in neighbourhoods), builders(to see what sort of things/ ways to build/ change in certain neighbourhoods).

## 8 Communication
This part of the DEDA is important for the project because we need to have a proper way to communicate with each-other to make sure we are all on the same page.
1. **What is the communication strategy with regard to this project? Are all parties involved in agreement as to this strategy?**
   We will communicate with each-other by a call/ group chat that we use every day. We meet with the product owners once a week to show the progress that we have made sp far and get their thoughts on the work.
 
2. **What communication strategies are there for cases in which something goes wrong, and who is responsible for them?**
   We as a team will be held responsible if something goes wrong.
   
## 9 Transparency
This part of the DEDA is not important for the project because we are not going to send the dashboard to the public.
1. **Does the project risk generating public concern or outrage?** 
   It is unlikely, because the project just shows the livability index of the neighbourhood.

2. **How transparent are you about this project towards citizens?** 
   We are not transparent about this project with the public because, this project is directed towards the municipality of Breda and the decision makers.

3. **Do citizens have the opportunity to raise objections to the results of the project?**
   No, the citizens can not raise objections. However,if the municipality do want to contact us, our contact information will be available in the dashboard.
   
4. **Can citizens opt out of their involvement in the project? If so, when and how can they do this?**
   The citizens are not involved in this project.

## 10 Privacy
This part of the project is not important as there is not private data, but there is data that we are not allowed to make available to the public.
1. **Is there a data protection officer or data privacy officer involved in this project?**
   No, there is no data protection officer or data privacy officer that is involved in this project.

2. **Have you conducted a PIA (Privacy Impact Assessment) or DPIA (Data Protection Impact Assessment)?**
   We have not conducted a PIA (Privacy Impact Assessment) or DPIA (Data Protection Impact Assessment).
3. **Does this project make use of personal data? If not, continue with "Bias."**
   No, this project does not make use of personal data. The Data is already generalized, so it does not use any personal data.

4. **Do the data provide insight into the personal lives of citizens?**
   No, the data does not provide insight into the personal lives of citizens. The Data is already generalized, so it does not use any personal data and so no insight.

## 11 Bias
This part of the DEDA framework is not important for the project because we do not use any personal information. We only use data about the neighbourhood in general, so there can be no bias.
1. **As a member of the project, what outcomes do you expect?**
   I expect that we will be able to create a dashboard that will show the livability score on a neighbourhood level, and we will be able to show what factors contribute to it. This way the municipality will be able to improve the livability score in certain neighbourhoods.

2. **Is there anything about this project that makes you uneasy? If so, discuss these concerns.**
   No.

3. **Will the results of the analysis be evaluated by a human, before being implemented?**
   Yes, the analysis wil be evaluated by the team and by the product owner before the final deliverable.

4. **Is there a risk that your project could contribute to discrimination against certain people or groups?**
   No, because we have taken the data in neighbourhood level and not against specific people/ groups.

5. **Are all relevant citizens adequately represented within your data(sets)? Which ones are missing or under-represented?**
   Yes, because we are taking everyone that is living in the neighbourhood.

6. **Is there a feedback loop in the model that might have negative consequences?**
   Yes, the users can contact us if there are any problems with the model. 

7. **Are you gathering the information that is appropriate for the purposes of your project?**
   Yes, we are gathering information that is appropriate for the purposes of your project.

8. **Is there a risk that the project will unintentionally create incentives for undesirable behaviour?**
   Yes, people might become more unhappy with the place they are living and will want to move to other neighbourhoods/ will want to change things to improve the livability score in their neighbourhood.

9.  **Function creep: can you imagine a future scenario in which the results of your project could be (mis)used for alternative purposes?**
    After seeing the results of the project, people might not want to live in/ move to certain neighbourhoods and so the neighbourhood inhabitants will decrease.

10. **Do your answers change when you consider possible long-term effects? Why?**
    No because, the answers take into account of the long-term affects and the positive outcomes drastically outweigh the negative outcomes.