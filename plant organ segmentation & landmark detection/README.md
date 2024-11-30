# NPEC Plant Root Segmentation and Robotic Control

## Project Overview
In collaboration with the Netherlands Plant Eco-phenotyping Centre (NPEC), we embarked on an exciting project aimed at integrating computer vision, reinforcement learning, and robotics to address complex challenges in plant phenotyping. The focus was on NPEC's Hades system, which specializes in in-vitro root systems. Our objective was to develop an innovative computer vision system to accurately segment plant roots and to implement a reinforcement learning model that controls a liquid handling robot for precise plant inoculation.

## Background on NPEC and Plant Phenotyping
Plants play a crucial role in sustaining life on Earth, directly and indirectly providing our food. NPEC's mission is to leverage advanced plant phenotyping technology to help meet future food demands while minimizing environmental impact. Plant phenotyping involves studying plants' observable traits (phenotypes), which result from the interaction between their genetic makeup and environmental conditions. By understanding these traits, scientists can uncover critical insights into plant growth, adaptation, and resilience.

The Hades system, part of NPEC's Plant-Microbe Interaction Phenotyping module, allows for high-throughput characterization of root systems in controlled environments. This system automatically processes thousands of Arabidopsis thaliana seedlings, capturing vital data through hyperspectral imaging and morphometric imaging. Our project focused on processing images from this system to segment roots for further analysis and applying reinforcement learning to automate precise microbial inoculation.

## Technical Approach
Our approach involved two key components: **computer vision** for root segmentation and **reinforcement learning** for robotic control. The computer vision system was designed to identify and segment plant roots from daily images of Arabidopsis thaliana seedlings in Petri dishes. This task required sophisticated techniques to handle the complexity of roots that crisscross and grow in unpredictable patterns.

We complemented this with a **reinforcement learning model**, which was used to control the liquid handling robot. The goal was to direct the robot to inoculate the plants precisely at the root tips based on coordinates identified by the computer vision system. This integration of vision and robotics has the potential to revolutionize plant phenotyping by increasing precision and efficiency in experiments.

## Challenges and Solutions
Throughout the project, we encountered several challenges, especially in instance segmentation and root landmark detection. The complexity of root growth and overlap required advanced image processing techniques to ensure accurate root segmentation. Additionally, controlling the liquid handling robot involved fine-tuning the reinforcement learning algorithm to ensure that the inoculation was precise and efficient.

To tackle these challenges, we iteratively improved our models and developed a simulation environment to test our reinforcement learning strategies using the Opentron OT-2 robot. This simulation allowed us to experiment with controller optimization and evaluate the performance of the entire system in a controlled virtual setting.

## Practical Applications and Learning Outcomes
The development of this comprehensive pipeline, from image annotation and segmentation to robotic control, demonstrates its practicality and versatility in real-world applications. We applied our methods to a Kaggle competition, where we showcased the system’s capability to solve similar challenges in plant phenotyping.

Our work has laid the foundation for transitioning this pipeline from a simulated environment to real-world scenarios. Future efforts will focus on refining the deep learning models for instance segmentation, improving controller performance through benchmarking, and addressing potential discrepancies between simulations and physical environments.

## Skills and Knowledge Gained
This project allowed for the integration of multiple technologies and disciplines, contributing to a holistic skill set in computer vision, deep learning, reinforcement learning, and robotics. Through hands-on experience and overcoming real-world challenges, I deepened my understanding of the intersection between these fields and developed strong problem-solving skills. Interdisciplinary collaboration played a crucial role in successfully integrating computer vision and robotics, demonstrating the value of such approaches in addressing complex, real-world problems.

## Future Directions
Our iterative approach revealed areas for improvement, including:
- **Enhancing the instance segmentation model** with advanced techniques like Non-Maximum Suppression for better root detection.
- **Improving model generalization** by increasing dataset diversity, especially for underrepresented classes.
- **Optimizing robotic control** through PID tuning and further benchmarking to enhance performance in real-world settings.

Transitioning the pipeline to real-world applications remains a key future goal, ensuring the system performs as effectively in the physical environment as it does in simulations.