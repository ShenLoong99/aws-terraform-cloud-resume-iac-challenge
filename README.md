<a id="readme-top"></a>

<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

   <h1>☁️ AWS Cloud Resume Challenge</h1>
   <img src="assets/cover-image.jpg" alt="cover-image" />
   <p>A production-grade, serverless resume website built with <strong>Terraform</strong>, <strong>AWS</strong>, and <strong>GitHub Actions</strong></p>

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

<br>

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)<br>
[![Infrastructure CI][ci-shield]][ci-url]
[![Production Deployment][cd-shield]][cd-url]
[![Update Documentation][docs-shield]][docs-url]

<br>

![Last Commit](https://img.shields.io/github/last-commit/ShenLoong99/aws-terraform-cloud-fun-facts-generator?style=for-the-badge)
![Repo Size](https://img.shields.io/github/repo-size/ShenLoong99/aws-terraform-cloud-fun-facts-generator?style=for-the-badge)
![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?style=for-the-badge&logo=pre-commit&logoColor=white)
[![Checkov Security](https://img.shields.io/badge/Checkov-Secured-brightgreen?style=for-the-badge&logo=checkov&logoColor=white)](https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/ci.yml)

<a href="#about-the-project"><strong>Explore the docs »</strong></a>

</div>
<details>
   <summary>Table of Contents</summary>
   <ol>
      <li><a href="#about-the-project">About The Project</a></li>
      <li><a href="#built-with">Built With</a></li>
      <li><a href="#use-cases">Use Cases</a></li>
      <li><a href="#architecture">Architecture</a></li>
      <li><a href="#file-structure">File Structure</a></li>
      <li><a href="#technical">Technical Reference</a></li>
      <li><a href="#getting-started">Getting Started</a></li>
      <li><a href="#gitops">GitOps & CI/CD Workflow</a></li>
      <li><a href="#usage">Usage</a></li>
      <li><a href="#roadmap">Roadmap</a></li>
      <li><a href="#challenges-faced">Challenges</a></li>
      <li><a href="#well-architected">AWS Well-Architected Framework</a></li>
      <li><a href="#special-thanks">Special Thanks</a></li>
   </ol>
</details>

<h2 id="about-the-project">About The Project</h2>
<p>This project represents the successful completion of the <strong>Cloud Resume Challenge</strong>. It transitions my professional profile from a static document into a high-availability, globally distributed web application. The core objective was to demonstrate full-stack cloud proficiency by automating the deployment of both infrastructure (IaC) and application code through a secure CI/CD pipeline.</p>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="built-with">Built With</h2>
<p>
    <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-original.svg" alt="terraform" width="45" height="45" style="margin: 10px;"/>
    <img src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/aws/aws.png" alt="aws" width="45" height="45" style="margin: 10px;"/>
    <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="javascript" width="45" height="45" style="margin: 10px;"/>
    <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_Compute/48/Arch_AWS-Lambda_48.svg" alt="lambda" width="45" height="45" style="margin: 10px;">
    <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_App-Integration/Arch_48/Arch_ Amazon-API-Gateway_48.svg" alt="api-gateway" width="45" height="45" style="margin: 10px;"/>
    <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_Database/48/Arch_Amazon-DynamoDB_48.svg" alt="dynamodb" width="45" height="45" style="margin: 10px;"/>
    <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Resource-Icons_01312022/Res_Storage/Res_48_Light/Res_Amazon-Simple-Storage-Service_S3-Standard_48_Light.svg" alt="s3" width="45" height="45" style="margin: 10px;"/>
    <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_Networking-Content-Delivery/48/Arch_Amazon-CloudFront_48.svg" alt="cloudfront" width="45" height="45" style="margin: 10px;"/>
    <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/githubactions/githubactions-original.svg" alt="github-actions" width="45" height="45" style="margin: 10px;"/>
</p>
<ul>
   <li><strong>Terraform Cloud</strong> – Remote state management and automated IaC execution.</li>
   <li><strong>Amazon S3 & CloudFront (OAC)</strong> – Secure static web hosting with Origin Access Control.</li>
   <li><strong>AWS Lambda & API Gateway</strong> – Serverless backend for the visitor counter.</li>
   <li><strong>Amazon DynamoDB</strong> – NoSQL database for stateful counter persistence.</li>
   <li><strong>GitHub Actions</strong> – CI/CD pipeline featuring OIDC for keyless AWS authentication.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="use-cases">Use Cases</h2>
<ul>
   <li><strong>Professional Branding:</strong> Showcases my technical evolution from QA and Project Management into Cloud Infrastructure.</li>
   <li><strong>Security Demonstration:</strong> Implements OIDC and least-privilege IAM roles, eliminating the need for long-lived AWS keys in GitHub Secrets.</li>
   <li><strong>Automated Synchronization:</strong> Uses dynamic <code>sed</code> injection to ensure the frontend always targets the correct backend API endpoint after every infrastructure update.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="architecture">Architecture</h2>
<img src="assets/aws-terraform-cloud-resume-iac-challenge.jpg" alt="architecture-diagram" />
<p>The architecture follows a modern decoupled serverless flow:<code>User Browser</code> ➔ <code>CloudFront (HTTPS)</code> ➔ <code>S3 (Static Assets)</code><code>Frontend JS</code> ➔ <code>API Gateway</code> ➔ <code>Lambda</code> ➔ <code>DynamoDB (Atomic Update)</code></p>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="file-structure">File Structure</h2>
<pre>aws-terraform-cloud-resume-iac-challenge
├── .github/
│   └── workflows/            # CI/CD Pipeline Definitions
│       ├── cd.yml            # Continuous Deployment
│       ├── ci.yml            # Continuous Integration
│       └── documentation.yml # Automated README Sync
├── .terraform/               # Local Terraform managed files
├── assets/                   # Documentation images and media
├── modules/                  # Child Modules (Stateless Logic)
│   ├── api/                  # API Gateway (HTTP/REST) configurations
│   ├── cdn/                  # CloudFront CDN with OAC
│   ├── database/             # DynamoDB Table definitions
│   ├── iam/                  # Least-privilege Roles & Policies
│   ├── storage/              # S3 Buckets for static hosting
│   └── lambda/               # Lambda Compute & Trigger setup
│       └── lambda/           # Serverless backend logic
│           ├── func.py       # Lambda Python source code
│           └── func.zip      # Compiled deployment artifact
│       ├── main.tf           # Module-specific resources
│       ├── outputs.tf        # Values exported to the root
│       ├── providers.tf      # Version constraints (No cloud block!)
│       └── variables.tf      # Module inputs
├── scripts/                  # Automation & Post-deployment tests
│   ├── health-check.sh       # API Endpoint verification
│   └── smoke-test-website.sh # CloudFront availability test
├── website-files/            # Frontend static assets
│   └── index.html            # Resume UI
├── .gitignore                # Excluded files from Git
├── .terraform.lock.hcl       # Provider lock file
├── acm.tf                    # SSL/TLS Certificate configuration (Commented file)
├── main.tf                   # Core infrastructure definitions
├── outputs.tf                # Resource endpoints and IDs
├── providers.tf              # AWS and Terraform backend configuration
├── README.md                 # Generated documentation
├── README.template.md        # Documentation source template
├── route53.tf                # DNS management (Commented file)
├── terraform.tfstate         # Local state file (if not using cloud)
├── terraform.tfstate.backup  # Previous state snapshot
├── .pre-commit-config.yaml   # Local git-hook orchestration
├── .tflint.hcl               # TFLint AWS ruleset configuration
├── .checkov.yml              # Checkov scan ignore list
└── variables.tf              # Input parameters and configurations
</pre>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="technical">Technical Reference</h2>
This section is automatically updated with the latest infrastructure details.
<details>
<summary><b>Detailed Infrastructure Specifications</b></summary>

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api"></a> [api](#module\_api) | ./modules/api | n/a |
| <a name="module_cdn"></a> [cdn](#module\_cdn) | ./modules/cdn | n/a |
| <a name="module_database"></a> [database](#module\_database) | ./modules/database | n/a |
| <a name="module_lambda"></a> [lambda](#module\_lambda) | ./modules/lambda | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ./modules/storage | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name of the S3 bucket | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name prefix | `string` | `"cloud-resume"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_url"></a> [api\_url](#output\_api\_url) | The URL of the API Gateway |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | The AWS region where resources are deployed |
| <a name="output_cloudfront_dist_id"></a> [cloudfront\_dist\_id](#output\_cloudfront\_dist\_id) | The ID of the CloudFront distribution |
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | The ARN of the Lambda function |
| <a name="output_resume_url"></a> [resume\_url](#output\_resume\_url) | The permanent URL for the Cloud Resume |
| <a name="output_website_bucket_id"></a> [website\_bucket\_id](#output\_website\_bucket\_id) | The name of the S3 bucket |
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | The URL of the CloudFront distribution |
<!-- END_TF_DOCS -->
</details>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="getting-started">Getting Started</h2>
<h3>Prerequisites</h3>
<ul>
   <li>AWS Account with an active IAM role for OIDC.</li>
   <li>Terraform Cloud Organization and Workspace.</li>
   <li>GitHub Repository with <code>EMAIL_ADDRESS</code> and <code>TF_API_TOKEN</code> secrets.</li>
   <li><strong>Set your AWS Region:</strong> Set to whatever <code>aws_region</code> you want in <code>variables.tf</code>.</li>
</ul>

<h3>Terraform Cloud State Management</h3>
<ol>
   <li>Create a new <strong>Workspace</strong> with github version control workflow in Terraform Cloud.</li>
   <li>In the Variables tab, add the following <strong>Terraform Variables:</strong>
   </li>
   <li>
    Add the following <strong>Environment Variables</strong> (AWS Credentials):
    <ul>
      <li><code>AWS_ACCESS_KEY_ID</code></li>
      <li><code>AWS_SECRET_ACCESS_KEY</code></li>
   </ul>
   </li>
    <li>
      Run the command ni Terraform CLI:
      <pre>terraform login</pre>
    </li>
    <li>Create a token and follow the steps in browser to complete the Terraform Cloud Connection.</li>
    <li>
      Add the <code>backend</code> block in <code>terraform</code> code block</code>:
    <pre>backend "remote" {
  hostname     = "app.terraform.io"
  organization = &lt;your-organization-name&gt;
  workspaces {
    name = &lt;your-workspace-name&gt;
  }
}</pre>
   </li>
    <li>
      Run the command in Terraform CLI to migrate the state into Terraform Cloud:
      <pre>terraform init -migrate-state</pre>
    </li>
</ol>

<h3>Installation & Deployment</h3>
<ol>
    <li>
        <strong>Clone the Repository:</strong>
        <pre>git clone https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge.git</pre>
    </li>
    <li>
        <strong>Provision Infrastructure:</strong><br>
        <strong>Terraform Cloud</strong> → <strong>Initialize & Apply:</strong> Push your code to GitHub. Terraform Cloud will automatically detect the change, run a <code>plan</code>, and apply automatically (TFC CLI workflow).
    </li>
    <li>
        <strong>Observe workflow:</strong><br>
        <strong>GitHub (GitOps)</strong> → <strong>Github actions:</strong> Observe the process/workflow of CI/CD in the actions tab in GitHub.
    </li>
</ol>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="gitops">GitOps & CI/CD Workflow</h2>
<p>This repository implements a "Hybrid" GitOps workflow where infrastructure changes are verified via Pull Requests and documentation is automatically kept in sync using a dedicated GitHub App to maintain branch integrity. The <strong>Pre-commit</strong> framework implements a "Shift-Left" strategy, ensuring that code is formatted, documented, and secure before it ever leaves your machine.</p>

<h3>Workflow</h3>
<ol>
  <li>
    <strong>Branch Protection Rulesets</strong><br>
    To ensure high code quality and prevent unauthorized changes to the production environment, the <code>main</code> branch is governed by a <strong>GitHub Branch Ruleset</strong>.
    <ul>
      <li><strong>Pull Request Mandatory:</strong> No code can be pushed directly to <code>main</code>. All changes must originate from a feature branch and be merged via a Pull Request.</li>
      <li><strong>Required Status Checks:</strong> The <code>Infrastructure CI</code> (Terraform Plan & Static Analysis) must pass successfully before a merge is permitted.</li>
      <li><strong>Bypass Authority:</strong> The dedicated GitHub App is added to the Bypass List with "Always allow" permissions. This allows the bot to push documentation updates directly to <code>main</code> without being blocked by PR requirements.</li>
    </ul>
  </li>
  <li>
    <strong>Pre-commit</strong>
    <ul>
      <li><strong>Tool:</strong> Executes <code>terraform fmt</code>, <code>terraform validate</code>, <code>TFLint</code>, <code>terraform_docs</code> and <code>checkov</code> to ensure the code is clean.</li>
      <li><strong>Trigger:</strong> Runs on every <strong>git commit</strong>.</li>
      <li>
        <strong>Outcome:</strong> If any check fails, the commit is blocked. You fix the error, re-add the file, and commit again.
      </li>
    </ul>
  </li>
  <li>
    <strong>Continuous Integration (PR)</strong>
    <ul>
      <li><strong>Tool:</strong> Executes <code>terraform fmt -check</code>, <code>terraform validate</code> and <code>checkov</code>, then do <code>plan</code> and cost estimation and print it on PR.</li>
      <li><strong>Trigger:</strong> Runs on every <strong>Pull Request</strong>.</li>
      <li>
        <strong>Outcome:</strong> This acts as the "Gatekeeper" before code is merged to <code>main</code>.
      </li>
    </ul>
  </li>
  <li>
    <strong>Continuous Delivery (Deployment)</strong>
    <ul>
      <li><strong>Tool:</strong> Terraform Cloud + GitHub Actions OIDC.</li>
      <li><strong>Trigger:</strong> Merges to the <code>main</code> branch.</li>
      <li>
        <strong>Outcome:</strong> The pipeline verifies the infrastructure state and runs a post-deployment health check with(<code>health-check.sh</code> & <code>smoke-test-website.sh</code>).
      </li>
    </ul>
  </li>
  <li>
    <strong>Dynamically update readme documentation</strong>
    <ul>
      <li><strong>Tool:</strong> <code>terraform_docs</code> + GitHub Actions.</li>
      <li><strong>Trigger:</strong> Merges to the <code>main</code> branch.</li>
      <li>
        <strong>Outcome:</strong> The pipeline verifies the infrastructure state from Terraform Cloud, retrieve outputs from Terraform Cloud and update the readme documentation file dynamically.
      </li>
    </ul>
  </li>
</ol>

<h3>Prerequisites for GitOps</h3>
<ul>
  <li><strong>Repository Secret <code>TF_API_TOKEN</code>:</strong> Required for GitHub to communicate with Terraform Cloud.</li>
  <li><strong>Trigger:</strong> A GitHub Actions OIDC role (<code>GitHubActionRole</code>) allows the runner to verify AWS resources without long-lived keys.</li>
  <li>
      <strong>Automated Documentation via GitHub App:</strong> Instead of using a Personal Access Token (PAT) or the default <code>GITHUB_TOKEN</code>, this project uses a custom <strong>GitHub App</strong> for automated tasks.<br>
      <table>
         <thead>
            <tr>
               <td>Secret</td>
               <td>Description</td>
               <td>Source</td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td><code>BOT_APP_ID</code></td>
               <td>The unique numerical ID assigned to your GitHub App.</td>
               <td>App Settings > General</td>
            </tr>
            <tr>
               <td><code>BOT_PRIVATE_KEY</code></td>
               <td>The full content of the generated <code>.pem</code> private key file.</td>
               <td>App Settings > Private keys</td>
            </tr>
         </tbody>
      </table>
   </li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="usage">Usage</h2>
<p> Once deployed, the project provides two live interfaces: </p>
<ul>
   <li>
    <strong>Resume Website:</strong> Accessible via the <code>website_url</code> (CloudFront Domain).<br>
    <img src="assets/my-resume-website.png" alt="my-resume-website" />
    </li>
   <li><strong>Visitor API:</strong> Testable via <code>curl</code> using the <code>api_url</code> output.</li>
</ul>

<h3 id="monitoring">📊 Monitoring & Observability</h3>
<img src="assets/cloudwatch-logs.png" alt="cloudwatch-logs" />
<p>
  The backend performance and reliability are monitored using <strong>Amazon CloudWatch</strong>. This ensures high availability for the visitor counter and provides insights into the execution health of the serverless stack.
</p>
<ul>
  <li><strong>Execution Logs:</strong> Every Lambda invocation is recorded in CloudWatch Logs for real-time debugging.</li>
  <li><strong>Metrics Tracking:</strong> Monitors invocation counts, error rates, and execution duration (latency).</li>
  <li><strong>Cost Optimization:</strong> Log retention is set to <strong>7 days</strong> via Terraform to minimize storage costs while maintaining sufficient history for troubleshooting.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="roadmap">Roadmap</h2>
<ul>
   <li>[x] <strong>Static Site:</strong> S3 Bucket + CloudFront Distribution.</li>
   <li>[x] <strong>Serverless Backend:</strong> Lambda function with DynamoDB integration.</li>
   <li>[x] <strong>Infrastructure as Code:</strong> Full resource management via Terraform.</li>
   <li>[x] <strong>Automation:</strong> GitHub Actions pipeline with smoke testing.</li>
   <li>[ ] <strong>Custom Domain:</strong> (Optional) Route 53 and ACM Certificate integration.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="challenges-faced">Challenges Faced</h2>
<table>
   <thead>
      <tr>
         <th>Challenge</th>
         <th>Solution</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><strong>OIDC Trust Policy Mismatch</strong></td>
         <td>
            Refined the IAM Trust Relationship to explicitly include the GitHub <code>environment: prod</code> claim.<br>
            <img src="assets/assume-aws-role-oidc-error.png" alt="assume-aws-role-oidc-error" />
        </td>
      </tr>
      <tr>
         <td><strong>Dynamic API Endpoints</strong></td>
         <td>
            Implemented <code>sed</code>-based injection in the CI/CD pipeline to patch <code>index.html</code> with Terraform outputs in real-time.
        </td>
      </tr>
      <tr>
         <td><strong>API Smoke Test Failures</strong></td>
         <td>
            Corrected endpoint paths in the test scripts to align with Terraform's <code>api_endpoint</code> structure.<br>
            <img src="assets/test-website-error.png" alt="test-website-error" />
        </td>
      </tr>
   </tbody>
</table>

<h3 id="technical-challenges">🧠 Technical Challenges & Lessons Learned</h3>
<p>
    During the development of the automated documentation pipeline, I explored several advanced GitOps strategies to allow the GitHub Actions bot to update the README while maintaining strict branch protection on <code>main</code>.
</p>
<p>I evaluated the following industry-standard patterns:</p>
<ul>
    <li><strong>Option 1: Grant Bypass Permissions (Bot Actor):</strong> Attempted to grant the <code>github-actions</code> bot specific bypass rights to push directly to <code>main</code> without a PR.</li>
    <li><strong>Option 2: Automated Pull Requests:</strong> Implementing a workflow where the bot opens a PR for every doc change to satisfy the "Require PR" rule.</li>
    <li><strong>Option 3: Custom Administrative PAT:</strong> Using a Personal Access Token with elevated scopes to override protection hooks.</li>
</ul>
<p>
    <strong>The Hurdle:</strong> These implementations were ultimately deprioritized because <strong>GitHub Free</strong> tier (for personal accounts) limits the "Bypass Pull Request" functionality for specific actors. Furthermore, creating a chain of dependencies (Bot PR -> Automated Merge -> Deployment) added significant complexity that was not cost-effective for a single-developer resume project.
</p>
<p>
    <strong>The Solution:</strong> I opted for a cleaner, more sustainable approach by implementing Path Filtering. This ensures the documentation workflow only triggers when essential template or infrastructure files change, minimizing the need for constant bypasses while keeping the repository's security posture intact
</p>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="well-architected">🏗️ AWS Well-Architected Framework Alignment</h2>

<p>This project is engineered to align with the six pillars of the <strong>AWS Well-Architected Framework</strong>, ensuring a production-grade cloud environment.</p>

<table align="center">
  <tr>
    <th width="30%">Pillar</th>
    <th width="70%">Project Implementation & Alignment</th>
  </tr>
  <tr>
    <td><strong>1. Operational Excellence</strong></td>
    <td>
      <ul>
        <li><strong>Infrastructure as Code (IaC):</strong> Entirely provisioned via modularized Terraform for consistency and repeatability.</li>
        <li><strong>GitOps Workflow:</strong> Automated documentation (terraform-docs) and quality gates (TFLint, Checkov) integrated via GitHub Actions.</li>
        <li><strong>Observability:</strong> Tagging strategy implemented via <code>local.common_tags</code> in <code>main.tf</code> for effective resource tracking.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong>2. Security</strong></td>
    <td>
      <ul>
        <li><strong>Principle of Least Privilege:</strong> Managed through a dedicated <code>iam</code> module that scope permissions specifically to Lambda, S3, and DynamoDB.</li>
        <li><strong>Encryption:</strong> S3 website storage and DynamoDB tables utilize AWS-managed encryption at rest.</li>
        <li><strong>Infrastructure Scanning:</strong> Static analysis via Checkov identifies security misconfigurations before deployment.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong>3. Reliability</strong></td>
    <td>
      <ul>
        <li><strong>Global Content Delivery:</strong> Utilization of <code>aws_cloudfront_distribution</code> ensures high availability and low latency via edge locations.</li>
        <li><strong>Managed Services:</strong> Leveraging serverless components (Lambda, DynamoDB) to remove the operational burden of server maintenance and recovery.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong>4. Performance Efficiency</strong></td>
    <td>
      <ul>
        <li><strong>Serverless Architecture:</strong> Uses <code>aws_lambda</code> to scale automatically in response to incoming API traffic.</li>
        <li><strong>Static Asset Optimization:</strong> S3 and CloudFront integration ensures efficient delivery of frontend assets without compute overhead.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong>5. Cost Optimization</strong></td>
    <td>
      <ul>
        <li><strong>Pay-as-you-go:</strong> The serverless stack (Lambda/API Gateway) incurs zero costs when idle.</li>
        <li><strong>S3 Hosting:</strong> Significantly cheaper than running a dedicated EC2 instance for static web hosting.</li>
        <li><strong>AWS Free Tier:</strong> Utilizes S3, CloudFront, Lambda, and DynamoDB (On-Demand) to maintain <strong>$0/month</strong> operating costs.</li>
        <li><strong>CloudFront OAC:</strong> Securely serves content without public S3 bucket access, reducing potential data egress abuse.</li>
        <li><strong>Lambda Resource Tuning:</strong> Minimal memory allocation (128MB) ensures high performance for simple atomic counter increments.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong>6. Sustainability</strong></td>
    <td>
      <ul>
        <li><strong>Resource Utilization:</strong> By using serverless modules, the carbon footprint is minimized as resources are only consumed during execution rather than running 24/7.</li>
      </ul>
    </td>
  </tr>
</table>

<h2 id="special-thanks">⭐ Special Thanks</h2>
<div align="center">
  <p>This project was built as part of the <strong>Cloud Resume Challenge</strong>. A special thanks to the creators and community for providing the framework to bridge the gap between theory and practice.</p>
  <table>
    <tr>
      <td align="center">
        <a href="https://cloudresumechallenge.dev/docs/extensions/terraform-getting-started/">
          <img src="https://img.shields.io/badge/Challenge-Terraform_Getting_Started-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Challenge" />
          <br />
          <sub><b>Terraform Your Cloud Resume</b></sub>
        </a>
      </td>
      <td align="center">
        <a href="https://github.com/cloudresumechallenge/projects/blob/main/projects/terraform/getting-started.md">
          <img src="https://img.shields.io/badge/GitHub-Project_Specs-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Specs" />
          <br />
          <sub><b>View Project Specs</b></sub>
        </a>
      </td>
      <td align="center">
        <a href="https://cloudresumechallenge.dev/">
          <img src="https://img.shields.io/badge/Official-Website-blue?style=for-the-badge" alt="Cloud Resume Challenge" />
          <br />
          <sub><b>Cloud Resume Challenge</b></sub>
        </a>
      </td>
    </tr>
  </table>
</div>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

[contributors-shield]: https://img.shields.io/github/contributors/ShenLoong99/aws-terraform-cloud-resume-iac-challenge.svg?style=for-the-badge
[contributors-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ShenLoong99/aws-terraform-cloud-resume-iac-challenge.svg?style=for-the-badge
[forks-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/network/members
[stars-shield]: https://img.shields.io/github/stars/ShenLoong99/aws-terraform-cloud-resume-iac-challenge.svg?style=for-the-badge
[stars-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/stargazers
[issues-shield]: https://img.shields.io/github/issues/ShenLoong99/aws-terraform-cloud-resume-iac-challenge.svg?style=for-the-badge
[issues-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/issues
[license-shield]: https://img.shields.io/github/license/ShenLoong99/aws-terraform-cloud-resume-iac-challenge.svg?style=for-the-badge
[license-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: {{LINKEDIN_URL}}
[ci-shield]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/actions/workflows/ci.yml/badge.svg
[ci-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/actions/workflows/ci.yml
[cd-shield]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/actions/workflows/cd.yml/badge.svg
[cd-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/actions/workflows/cd.yml
[docs-shield]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/actions/workflows/documentation.yml/badge.svg
[docs-url]: https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge/actions/workflows/documentation.yml
