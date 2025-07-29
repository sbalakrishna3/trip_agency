package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import weka.classifiers.functions.LinearRegression;
import weka.core.DenseInstance;
import weka.core.Instances;

@WebServlet("/predict")
public class PredictionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Load dataset from /weka folder inside webapp
            InputStream inputStream = getServletContext().getResourceAsStream("/weka/sales_data.arff");

            if (inputStream == null) {
                response.getWriter().println("ERROR: ARFF file not found inside /weka directory.");
                return;
            }

            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            Instances trainingData = new Instances(reader);
            reader.close();

            trainingData.setClassIndex(trainingData.numAttributes() - 1);

            // Train model
            LinearRegression regressionModel = new LinearRegression();
            regressionModel.buildClassifier(trainingData);

            // Predict
            double originalAdCost = 1800.0;
            double increasedAdCost = Math.round(originalAdCost * 1.10); // 1980

            DenseInstance instance = new DenseInstance(trainingData.numAttributes());
            instance.setDataset(trainingData);
            instance.setValue(0, increasedAdCost);

            double prediction = regressionModel.classifyInstance(instance);
            long roundedPrediction = Math.round(prediction);

            // Log to server terminal
            System.out.println("========= Revenue Prediction =========");
            System.out.println("Original Advertising Cost: £" + originalAdCost);
            System.out.println("Increased Advertising Cost (10%): £" + increasedAdCost);
            System.out.println("Predicted Revenue: £" + roundedPrediction);
            System.out.println("======================================");

            // Set values for JSP
            request.setAttribute("adCost", increasedAdCost);
            request.setAttribute("predictedRevenue", roundedPrediction);
            request.getRequestDispatcher("predict.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
