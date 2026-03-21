# List of plans and features


## To add offerta page 
## To add blog section linked to courses

```mermaid
flowchart TD
    subgraph Courses
        C1[Performance Testing Course]
        C2[API Testing Course]
        C3[Automation Testing Course]
    end

    subgraph Blog Posts - Performance Series
        B1[What is Performance Testing?]
        B2[JMeter Getting Started]
        B3[Load vs Stress Testing]
        B4[Analyzing Test Results]
    end

    subgraph Blog Posts - API Series
        B5[REST API Basics]
        B6[Postman Collections]
    end

    C1 --> B1
    C1 --> B2
    C1 --> B3
    C1 --> B4

    C2 --> B5
    C2 --> B6

    B1 -.->|"recommended course"| C1
    B5 -.->|"recommended course"| C2
```

## To add to each corse link to registration Google Form 
## To setup Copilot workflow to auto-translate 
## To add GitHub Action to atomatically send posts in to telegramm 