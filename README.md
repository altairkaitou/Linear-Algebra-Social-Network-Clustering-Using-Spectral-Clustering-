# Social Network Clustering Using Spectral Clustering

## Objective

This project aims to apply linear algebra techniques to cluster data from a social network. Specifically, we use the spectral clustering algorithm based on the Fiedler vector to divide a social network into clusters with strong internal connections and fewer external connections.

## Steps Performed

1. **Create Adjacency Matrix for a Simple Graph:**
    - Initialize an adjacency matrix for a small graph and compute its Laplacian matrix.

2. **Compute Eigenvalues and Eigenvectors:**
    - Compute the eigenvalues and eigenvectors of the Laplacian matrix, then cluster the nodes of the graph into two groups based on the second smallest eigenvector.

3. **Load and Process Large Adjacency Matrix:**
    - Load the adjacency matrix of a large social network from the `social.mat` file and compute its Laplacian matrix.

4. **Cluster the Nodes into Two Groups:**
    - Use the second smallest eigenvector to divide the nodes of the social network into two groups.

5. **Permute the Adjacency Matrix:**
    - Reorder the adjacency matrix based on the clusters obtained and visualize the result.

6. **Cluster into Four Groups:**
    - Use the third smallest eigenvector to further divide the nodes into four groups.

7. **Recursive Clustering using Fiedler Vector:**
    - Apply the Fiedler vector method iteratively to refine the clusters further.

## Final Output

The final output is a visual representation of the reordered adjacency matrix showing the clusters of the social network.

## How to Run the Code

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/yourusername/social-network-clustering.git
    cd social-network-clustering
    ```

2. **Ensure you have the required files:**
    - `lab13.m` (Matlab script)
    - `social.mat` (Adjacency matrix of the social network)

3. **Run the Matlab Script:**
    - Open Matlab.
    - Navigate to the directory containing the `lab13.m` and `social.mat` files.
    - Run the script:
      ```matlab
      lab13
      ```

## Files

- `lab13.m`: Matlab script containing the steps for clustering the social network.
- `social.mat`: MAT file containing the adjacency matrix of a simulated social network.

## Results

The script generates figures that visualize the adjacency matrix before and after clustering, showing how the nodes are grouped into clusters based on their connections.



