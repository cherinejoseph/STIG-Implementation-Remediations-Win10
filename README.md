## Programmatic Vulnerability Remediations: STIG Implementations - Win10 (Powershell)

## Introduction

In the world of cybersecurity, maintaining a secure environment is critical for mitigating vulnerabilities that can be exploited by attackers. One of the most widely recognized frameworks for hardening operating systems and applications is the **Security Technical Implementation Guide (STIG)**, which provides detailed configuration guidelines aimed at improving the security posture of IT systems.

STIGs are developed by the **Defense Information Systems Agency (DISA)** and are used primarily by the Department of Defense (DoD) and other federal agencies. These guides contain a series of security requirements designed to mitigate common vulnerabilities, ensure compliance, and reduce the risk of compromise. 

This repository is focused on automating the remediation of **STIGs** on Windows operating systems using **PowerShell scripts**. The scripts are designed to address specific security requirements outlined in each **STIG ID** and can be run in environments that need to adhere to DoD or similar security standards. 

Keep reading to see an example of how I handled a STIG implementation using PowerShell scripts for automation, and also the benefits of using automated remediation vs manual remediation. For detailed information on individual STIGs and their associated remediations, I made use of **[stigaview.com](https://stigaview.com/products/win10/v3r1/)**, a comprehensive resource that provides in-depth insights into each STIG.

---

## Repository Structure

The repository is organized into the following folders:

### 1. **[STIGS folder](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/tree/main/STIGS)**:
- Contains scripts to automate remediation for each STIG.
- Each STIG ID (e.g., **WN10-AU-000500**) has its own corresponding PowerShell script that configures the required settings automatically.

### 2. **[Manual Fix Folder](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/tree/main/Manual%20Fix)**:
- Provides step-by-step instructions for manually applying STIG configurations and **verifying the details** of each setting.
- This folder is helpful for users who want to manually check and apply STIG configurations or prefer to verify settings before making changes, or who want to make the necessary registry or group policy changes without using automation.

### 3. **[Script Test Photos](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/tree/main/Script-Test-Photos)**:
- Contains screenshots showing the **command-line output** after running the PowerShell script to remediate a STIG.
- These screenshots provide **confirmation of success**, showing the successful application of the configuration changes after executing the script.

---

## STIGs and Vulnerability Management

STIGs play a key role in vulnerability management. By following STIG guidelines, organizations can systematically address security gaps and reduce vulnerabilities in their systems. However, manually applying these security configurations can be tedious and prone to human error. 

This repository helps simplify the process by providing automated PowerShell scripts to remediate **Windows**-specific STIGs. These scripts are designed to ensure compliance with the security settings, minimizing vulnerabilities and improving overall system hardening.

## Vulnerability Scan Results

To identify which vulnerabilities needed remediation, I performed a vulnerability scan using Tenable. This scan helped pinpoint specific **STIG violations** and highlighted areas of non-compliance within the system. Each identified vulnerability directly corresponds to a **STIG ID**, which I have addressed in this repository with remediation scripts and manual fix instructions.

Below is an example screenshot of the **Tenable vulnerability scan results**, showing the specific STIG violations that needed remediation:

![Tenable Vulnerability Scan Results](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/blob/main/tenable-scan-WN10AU000500.png) 

The scan shows a variety of **failed STIGs** across the system. From this list, I selected **STIG ID: WN10-AU-000500**, which focuses on configuring the **Application Event Log size** to `32768 KB` or greater.

---

## Remediation Example: **STIG ID: WN10-AU-000500**

---

### **STIG ID: WN10-AU-000500**  
**Requirement**: The Application event log size must be configured to `32768 KB` or greater.

This STIG requires that the **Application Event Log Size** be configured to a minimum of `32768 KB` to ensure adequate logging and monitoring. Here is how I addressed this issue:

### **Step 1: Initial Scan Results (Failed)**

As part of the **vulnerability scan**, **STIG ID: WN10-AU-000500** was identified as a failure. Below is the **Tenable scan failure screenshot**, showing that the **Application Event Log Size** was not configured correctly:

![Tenable Scan Failure - WN10-AU-000500](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/blob/main/failed-WN10AU000500.png)

In this screenshot, the scan results clearly indicate that the **Application Event Log Size** was smaller than the required `32768 KB`, resulting in a failed compliance check.

### **Step 2: Remediating the Issue**

To fix this, I applied the appropriate **PowerShell script** that automatically adjusted the **Event Log Size** to meet the STIG requirement of `32768 KB`. You can find the remediation script in the **PowerShell Scripts Folder** for **[WN10-AU-000500](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/blob/main/STIGS/WN10-AU-000500.ps1)**.

### **Step 3: Re-scan After Remediation (Pass)**

After running the script to apply the required configuration, I performed a **re-scan** to verify the fix. The results showed that **STIG ID: WN10-AU-000500** was now in compliance.

Below is the screenshot showing the **successful scan results** after remediation:

![Tenable Scan Pass - WN10-AU-000500](https://github.com/cherinejoseph/STIG-Implementation-Remediations-Win10/blob/main/second-scan-passed-WN10AU000500.png)

In this screenshot, you can see that the **Application Event Log Size** is now correctly configured to `32768 KB`, and the scan results confirm the system has passed the STIG check.

---

## Benefits of Automation vs. Manual Remediation

- **Automation** (via PowerShell scripts):
  - **Time-efficient**: Automates repetitive tasks, saving time.
  - **Consistency**: Ensures that configurations are applied uniformly across systems.
  - **Reduced human error**: Automation minimizes the risk of manual mistakes.
  
- **Manual Remediation**:
  - **Control**: Gives the user full control over the system configuration.
  - **Learning Opportunity**: Provides insight into the underlying configurations and the ability to make other manual adjustments as needed.
  - **No reliance on scripts**: Useful if automation is not an option in some environments.
 

Automated vulnerability remediation is generally considered more effective for Security Technical Implementation Guides (STIGs) due to its efficiency, speed, and ability to manage the frequent updates required by STIGs. Manual processes, on the other hand, are often time-consuming and may cause delays in applying security updates, potentially leaving systems vulnerable for extended periods.

In contrast, automated tools can apply updates and configurations within hours, significantly reducing the time and effort required compared to manual methods. Additionally, automation ensures that systems remain compliant with the latest STIG standards, which are updated every 90 days.

This approach not only accelerates the implementation of new network applications and appliances but also reduces the overall cost of maintaining security policies. Automation further enables continuous monitoring and compliance, which is essential given the dynamic nature of cybersecurity threats and the need for ongoing audit readiness.

While manual audits can provide in-depth insights for smaller systems, automated scans are far more efficient for larger networks.

Overall, the shift towards automated STIG hardening has been driven by the need for faster, more reliable, and cost-effective solutions to maintain compliance and security.
