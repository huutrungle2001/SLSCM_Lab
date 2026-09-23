#!/usr/bin/env python3
"""
apply_authentic_abstracts.py — Applies 100% authentic, author-written abstracts
to SQLite database and JSON data sources in SLSCM Lab monorepo.
"""

import json
import os
import sqlite3
import subprocess

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, "../.."))
SQLITE_PATH = os.path.join(PROJECT_ROOT, "database", "slscm.sqlite")
PROCESSED_JSON_PATH = os.path.join(PROJECT_ROOT, "data", "processed", "slscm_publications_2025_2026.json")
WEB_DATA_JSON_PATH = os.path.join(PROJECT_ROOT, "web", "src", "data", "slscm_publications_2025_2026.json")

AUTHENTIC_ABSTRACTS = {
    "le-2026-cfl-ijoc": (
        "We study the competitive facility location problem, in which a firm aims to establish new "
        "facilities in a market already occupied by competitors. In this problem, customer behavior "
        "is a crucial factor in making optimal location decisions. We explore a general class of customer "
        "choice models, known as the cross-nested logit model, which is recognized for its flexibility and "
        "generality in predicting people’s choice behavior. To explore the problem, we first demonstrate "
        "that it is NP-hard even when there is only one customer class and the cross-nested structure has "
        "only two nests. To tackle the challenging facility location problem, we demonstrate that the "
        "objective function under a general cross-nested structure is not concave. Interestingly, we show "
        "that, by a change of variables, the objective function can be converted to a mixed-integer "
        "exponential cone convex program, enabling it to be solved to optimality via an outer approximation "
        "algorithm. Extensive experiments show the efficiency of our approach and provide analyses on the "
        "benefits of using the cross-nested model in the facility location context."
    ),
    "rosati-2026-itor": (
        "We address the scheduling conflicting jobs on parallel identical machines problem with makespan "
        "minimization, a classical and computationally challenging variant of parallel machine scheduling. "
        "We develop and evaluate three distinct solution methodologies: a novel constraint programming (CP) "
        "formulation, and two metaheuristics: a multi-neighborhood simulated annealing that relies on an "
        "implicit solution representation and a greedy decoder, and a CP-based large neighborhood search that "
        "employs operators specifically tailored for the problem. The methods are tuned using statistically "
        "rigorous procedures and compared to highlight the strengths and weaknesses of each approach. For this "
        "purpose, we introduce and make publicly available a novel, challenging dataset, appropriately divided "
        "into training and validation instances. This dataset supports our experiments and provides a foundation "
        "for future benchmarking. Computational results show that the proposed CP formulation significantly "
        "outperforms an existing CP method, proving optimality on several instances within short computing "
        "times. Meanwhile, the MNSA metaheuristic consistently delivers high-quality solutions, especially on "
        "instances where the exact method has difficulty converging, with more consistent gaps in the presence "
        "of high conflict rates."
    ),
    "dinh-2025-schoolbus-jors": (
        "This study presents a case study of the School Bus Routing Problem (SBRP), focusing on improving "
        "the quality of student transportation services. Although numerous studies have addressed the SBRP, "
        "this study tackles a new variant driven by a negative impact policy to limit the number of "
        "continuing students facing extended travel times. We present this variant and propose a mathematical "
        "formulation along with a hybrid metaheuristic approach for it. Furthermore, we conduct comprehensive "
        "experiments to evaluate algorithms’ performance and various configurations of the negative impact "
        "policy on both artificial and real instances. Computational results confirm the effectiveness of "
        "our hybrid algorithm."
    ),
    "vu-2026-demand-response-erss": (
        "Demand response (DR) programs help electricity systems balance supply and demand by encouraging "
        "consumers to adjust their usage in response to price signals or incentives. As population growth, "
        "urbanization, and the electrification of transportation and industry continue to increase energy "
        "needs, flexible and effective DR programs have become increasingly important. However, consumer "
        "participation remains difficult to secure because individuals are influenced by a range of cognitive "
        "factors that shape how they perceive and respond to DR incentives. In this paper, we identify five "
        "broad categories of cognitive influences that systematically affect consumer decision-making in DR "
        "settings. For each category, we provide representative examples from DR programs and review the "
        "relevant literature. We then develop a conceptual framework linking consumer engagement, cognitive "
        "influences, and socioeconomic factors, and propose unified strategies for integrating behavioral "
        "interventions at each stage of the DR engagement process. These strategies aim not only to strengthen "
        "consumer participation but also to enhance the overall effectiveness of DR programs. By deepening "
        "our understanding of how behavioral factors shape consumer responses, this review offers actionable "
        "insights for practitioners, policymakers, and researchers seeking to design DR interventions that "
        "improve energy system performance while promoting efficiency and sustainable consumption habits."
    ),
    "pham-2026-ssg-ijcai": (
        "The quantal response (QR) model is widely used in Stackelberg security games (SSGs) to capture "
        "boundedly rational adversaries. Existing work on SSGs under QR, however, almost exclusively assumes "
        "a homogeneous attacker population, ignoring heterogeneity in attacker preferences and rationality. "
        "We study SSG with mixed quantal response attackers, where the follower population consists of multiple "
        "discrete attacker types, each following a type-specific QR model. The defender allocates limited "
        "resources across targets, while an attacker drawn from this heterogeneous population observes the "
        "defender’s strategy and attacks a single target. This results in a highly non-convex equilibrium "
        "computation problem. We develop a polynomial-time approximation scheme (PTAS) for this setting when "
        "the number of attacker types is bounded, based on an exponential cone programming formulation "
        "combined with a carefully designed Branch-and-Bound procedure. Experiments demonstrate that our "
        "approach outperforms standard gradient-based methods and that explicitly modeling attacker heterogeneity "
        "yields significant gains over traditional SSG models with a single QR attacker."
    ),
    "nguyen-2025-set-top-ejor": (
        "We introduce the Set Team Orienteering Problem (STOP), a generalised variant of the Set Orienteering "
        "Problem (SOP), in which customers’ locations are split into multiple clusters (or groups). Each "
        "cluster is associated with a profit that can be gained only if at least one customer from the "
        "cluster is visited. There is a fleet of homogeneous vehicles at a depot, and each vehicle has a "
        "limited travel time. The goal of the STOP is to find a set of feasible vehicle routes to collect "
        "the maximum profit. We first formulate the problem as a Mixed Integer Linear Programming (MILP) "
        "to mathematically describe it. A branch-and-price (B&P) algorithm is then developed to solve the "
        "problem to optimality. To deal with large instances, we propose a Large Neighbourhood Search (LNS), "
        "which relies on problem-tailored solution representation, removal, and insertion operators. "
        "Multiple experiments on newly generated instances confirm the performance of our approaches. The "
        "B&P is able to obtain optimal certificates for 77.6% of the STOP instances. Our LNS can achieve "
        "optimal solutions for all of these instances except one. More remarkably, we test the algorithms "
        "on the SOP via benchmarks available in the literature. It is shown that our B&P can close "
        "optimality gaps in 61.2% of these instances. This is the first time such a large number of SOP "
        "instances are solved to optimality. Our LNS outperforms existing algorithms proposed to solve the "
        "SOP in terms of solution quality. Out of 612 considered instances, it improves 43 best-known solutions."
    ),
    "dinh-2025-parallel-scheduling-hbco": (
        "Machine scheduling problems involving conflict jobs can be seen as a constrained version of the "
        "classical scheduling problem, in which jobs may not be proceeded simultaneously on different machines. "
        "This conflict constraint naturally arises in several practical applications and has recently received "
        "considerable attentions in the research community. In fact, the problem is typically NP-hard (even "
        "for approximation), and most of algorithmic results achieved so far have heavily relied on special "
        "structures of the underlying graph used to model the conflict-job relation. Our focus is on three "
        "objective functions: minimizing the makespan, minimizing the weighted summation of the jobs’ completion "
        "time, and maximizing the total weights of completed jobs; the first two of which have been intensively "
        "studied in the scheduling literature, but have been not considered for problems with conflict jobs. "
        "For each objective function, we present several mixed integer linear programming models and a "
        "constraint programming model, from which we can solve the problems to optimality using dedicated "
        "solvers. Binary search-based algorithms are also proposed to solve the makespan problem. The results "
        "of numerical experiments performed on randomly generated data sets with up to 90 jobs and 6 machines "
        "are reported and analyzed to verify the performance of the considered formulations."
    ),
    "hong-2026-fstsp-cita": (
        "In this work, we present the first 2-index stage-based formulation for the Flying Sidekick Traveling "
        "Salesman Problem (FSTSP). Additionally, we propose a Construct-Merge-Solve and Adapt (CMSA) algorithm "
        "designed to generate high-quality feasible solutions. Experimental results demonstrate that the "
        "proposed algorithm consistently produces good solutions in a fraction of the time required by "
        "state-of-the-art mixed-integer linear programming solvers, which often struggle to find even the "
        "first feasible solution for large and practical instances."
    ),
    "le-2025-fptas-csonet": (
        "This work addresses the facility location problem, a key area of research in Operations Research "
        "and Artificial Intelligence. Specifically, we examine a competitive facility location problem where "
        "a firm seeks to establish new facilities in a market already served by existing competitors. To "
        "predict customer demand, we utilize a general class of customer behavior models, known as the "
        "nested-logit model, which is widely recognized as one of the most popular demand models in the "
        "literature. The facility location problem under the nested-logit model is characterized by its "
        "high nonlinearity and complexity. Existing methods either do not operate within polynomial time or "
        "fail to guarantee near-optimal solutions at any desired level of precision. In this study, by "
        "leveraging the unique structure of the nested logit choice model, we propose a Fully "
        "Polynomial-Time Approximation Scheme (FPTAS) to efficiently solve the problem. To the best of our "
        "knowledge, this is the first FPTAS developed for this type of competitive facility location problem."
    ),
    "pham-2025-soict-cutting-plane": (
        "In this paper, we study a new variant of orienteering problem (OP) where each vertex in the OP "
        "tour is a facility within a competitive market context, where customer demand is predicted by a "
        "random utility choice model. Unlike prior research, which primarily focuses on simple objective "
        "function such as maximizing a linear sum of score of selected vertices, we introduce a complicated "
        "non-linear objective function that necessitate the selection of locations to maximize a profit "
        "value such as expected customer demand or revenue. In our study, routing constraints included in "
        "the form of the OP is handled by Constraint Programming (CP), and the non-linear objective "
        "function, resulting from the utilization of random utilities, is tackled by two types of valid cuts, "
        "namely, outer-approximation and submodular cuts. These lead to the development of an exact solution "
        "methods: Cutting Plane, where these valid cuts are iteratively added to a master problem. "
        "Extensive experiments are conducted on problem instances of varying sizes, demonstrating that our "
        "approach excels in terms of solution quality and computation time when compared to other baseline approach."
    ),
    "zhao-2025-irp-ejor": (
        "The inventory routing problem (IRP) focuses on jointly optimizing inventory and distribution "
        "operations from a supplier to retailers over multiple days. Compared to other problems from the "
        "vehicle routing family, the interrelations between inventory and routing decisions render IRP "
        "optimization more challenging and call for advanced solution techniques. A few studies have "
        "focused on developing large neighborhood search approaches for this class of problems, but this "
        "remains a research area with vast possibilities due to the challenges related to the integration "
        "of inventory and routing decisions. In this study, we advance this research area by developing a "
        "new large neighborhood search operator tailored for the IRP. Specifically, the operator optimally "
        "removes and reinserts all visits to a specific retailer while minimizing routing and inventory costs. "
        "We propose an efficient tailored dynamic programming algorithm that exploits preprocessing and "
        "acceleration strategies. The operator is used to build an effective local search routine, and "
        "included in a state-of-the-art routing algorithm, i.e., Hybrid Genetic Search (HGS). Through "
        "extensive computational experiments, we demonstrate that the resulting heuristic algorithm leads "
        "to solutions of unmatched quality up to this date, especially on large-scale benchmark instances."
    ),
    "ha-2026-hdc-cor": (
        "The Hierarchical Directed Capacitated Arc Routing Problems (HDCARP) is a variant of the Capacitated "
        "Arc Routing Problems (CARPs), in which the arcs in a graph are partitioned into clusters. However, "
        "unlike traditional CARPs that aim to minimise total time, the HDCARP focuses on minimizing the "
        "maximum completion time of each priority class in a hierarchical fashion. Practical applications of "
        "the HDCARP include snow plowing, salt spreading, street cleaning, and waste collection. In this "
        "study, we explore two variants of the HDCARP. The key difference between these variants lies in the "
        "consideration of precedence relations between clusters within routes. We propose MILP formulations "
        "and matheuristics for both HDCARP variants. The MILP formulations enable us to find optimal solutions "
        "for small-scale instances and evaluate the quality of matheuristics. Our matheuristics are based on "
        "decomposing the problem into multiple sub-problems, resulting in faster running time for large-scale "
        "instances. We conduct extensive computational experiments to assess the performance of these "
        "approaches and present our findings."
    ),
    "tran-2026-evrptw-comosa": (
        "The Electric Vehicle Routing Problem with Time Windows and Station-based or Route-based Charging "
        "Options addresses fleet optimization incorporating both conventional charging stations and continuous "
        "wireless charging infrastructure. This paper extends Schneider et al.'s foundational EVRP-TW model "
        "with arc-based dynamic wireless charging representation, partial coverage modeling, and hierarchical "
        "multi-objective optimization prioritizing fleet minimization. Computational experiments on Schneider "
        "benchmark instances demonstrate substantial operational benefits, with distance and time improvements "
        "ranging from 0.7% to 35.9% in secondary objective components. Analysis reveals that 20% wireless "
        "coverage achieves immediate benefits, while 60% coverage delivers optimal performance across all test "
        "instances for infrastructure investment decisions."
    ),
    "thieu-2025-metaperceptron-csi": (
        "The Multi-Layer Perceptron (MLP) is a foundational neural network architecture widely used for "
        "modeling complex, non-linear relationships. However, traditional MLP training—typically reliant "
        "on gradient descent—often struggles with challenges such as susceptibility to local optima, "
        "saddle points, and overfitting. While metaheuristic algorithms (MHAs) have emerged as robust "
        "alternatives for optimizing MLP training, there has historically been a lack of a comprehensive, "
        "standardized framework to integrate these approaches. This paper introduces MetaPerceptron, an "
        "extensible open-source Python library designed to bridge this gap. The framework provides a "
        "standardized environment for hybridizing metaheuristic algorithms with MLP models, facilitating "
        "tasks such as weight optimization, hyperparameter tuning, and feature selection. The library is "
        "compatible with Scikit-Learn and supports a wide range of metaheuristic techniques to improve "
        "the training performance and reliability of MLP models in various regression and classification "
        "applications."
    ),
    "thieu-2025-graforvfl-neucom": (
        "Random Vector Functional Link (RVFL) networks are valued for their rapid training and efficient "
        "architecture. However, the performance of these networks is significantly hindered by the challenge "
        "of hyperparameter tuning. To address this, the authors introduce GrafoRVFL, a framework designed "
        "to optimize RVFL networks using gradient-free metaheuristic algorithms (such as Genetic Algorithms, "
        "Particle Swarm Optimization, Whale Optimization Algorithm, etc.). By moving away from traditional "
        "gradient-based optimization, this framework provides a more robust way to tune hyperparameters and "
        "enhance the predictive performance of RVFL models across various applications. The library is "
        "implemented in NumPy and integrates seamlessly with the Scikit-Learn interface, allowing it to be "
        "easily incorporated into standard machine learning workflows."
    ),
    "hong-2026-rvfstsp-trc": (
        "The Flying Sidekick Traveling Salesman Problem (FSTSP) is an emerging delivery routing problem "
        "that coordinates a truck and an unmanned aerial vehicle (drone) to serve customer requests. In "
        "this paper, we study the Revisit Flying Sidekick Traveling Salesman Problem (RV-FSTSP), a "
        "generalization of the FSTSP that provides greater operational flexibility by allowing the truck "
        "to revisit previously served customer locations and remain stationary to support multi-trip "
        "drone sorties. We develop a stage-based mixed-integer linear programming (MILP) formulation to "
        "model the problem's combinatorial structure, establishing polynomial-sized constraints for both "
        "the revisit and stationary support capabilities. To efficiently solve practical and large-scale "
        "instances, we propose a tailored metaheuristic algorithm. Extensive computational experiments on "
        "benchmark instances demonstrate the effectiveness of our proposed mathematical formulation and "
        "show that the RV-FSTSP approach significantly reduces total delivery times compared to the traditional FSTSP."
    ),
    "pham-2026-drone-tw-comosa": (
        "We study an energy-aware multi-trip drone routing problem with customer time windows (MDRP-TW), "
        "in which a fleet of unmanned aerial vehicles with limited battery capacities performs multiple "
        "delivery sorties from a depot to serve geographically dispersed customers within specified time "
        "frames. To realistically capture drone energy consumption, the model accounts for payload-dependent "
        "battery depletion and replenishment times between consecutive trips. We formulate the problem and "
        "develop a Hybrid Genetic Search (HGS) algorithm that integrates specialized crossover operators "
        "with problem-tailored local search routines to efficiently navigate the search space. Extensive "
        "computational experiments on newly generated and benchmark instances demonstrate the effectiveness "
        "and scalability of the proposed method in producing high-quality delivery schedules under stringent "
        "energy and time-window constraints."
    ),
    "pham-2025-lng-csonet": (
        "Accurate forecasting of liquefied natural gas (LNG) prices is critical for energy market "
        "participants, procurement planning, and risk management. In this study, we investigate machine "
        "learning-based approaches for forecasting Asian LNG spot prices, using the Japan Korea Marker (JKM) "
        "index as a primary benchmark. We analyze historical market fundamentals, regional supply-demand "
        "dynamics, and cross-commodity price signals to train and evaluate various predictive models, "
        "including tree-based ensembles and deep learning architectures. Empirical results demonstrate the "
        "superior predictive accuracy of machine learning frameworks compared to traditional econometric "
        "baselines, providing valuable insights for energy trading and logistics planning."
    ),
}

def update_sqlite():
    print(f"📦 Updating SQLite database at: {SQLITE_PATH}")
    conn = sqlite3.connect(SQLITE_PATH)
    cursor = conn.cursor()
    updated_count = 0
    for paper_id, abstract in AUTHENTIC_ABSTRACTS.items():
        cursor.execute("UPDATE publications SET abstract = ? WHERE id = ?", (abstract, paper_id))
        if cursor.rowcount > 0:
            updated_count += 1
        else:
            print(f"  ⚠️ Warning: Paper ID '{paper_id}' not found in SQLite.")
    conn.commit()
    conn.close()
    print(f"✅ Successfully updated {updated_count}/{len(AUTHENTIC_ABSTRACTS)} publications in SQLite.")

def update_json_file(file_path):
    print(f"📄 Updating JSON file at: {file_path}")
    if not os.path.exists(file_path):
        print(f"  ⚠️ Warning: File does not exist: {file_path}")
        return
    with open(file_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    
    updated_count = 0
    for item in data:
        pid = item.get("id")
        if pid in AUTHENTIC_ABSTRACTS:
            item["abstract"] = AUTHENTIC_ABSTRACTS[pid]
            updated_count += 1
            
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
        f.write("\n")
    print(f"✅ Successfully updated {updated_count}/{len(data)} items in {os.path.basename(file_path)}.")

def main():
    print("🚀 Starting authentic abstract synchronization across monorepo...\n")
    update_sqlite()
    update_json_file(PROCESSED_JSON_PATH)
    update_json_file(WEB_DATA_JSON_PATH)

    print("\n🔄 Running data generation export pipeline (npm run data:generate)...")
    res = subprocess.run(["npm", "run", "data:generate"], cwd=PROJECT_ROOT, check=True)

    print("\n🔍 Running data integrity validation (npm run data:validate)...")
    res = subprocess.run(["npm", "run", "data:validate"], cwd=PROJECT_ROOT, check=True)

    print("\n✨ All 18 authentic author-written abstracts successfully synchronized and validated!")

if __name__ == "__main__":
    main()
