The ALU receives two 4-bit inputs:

A[3:0]
B[3:0]

The ALU_Sel input determines which operation is performed.

        A[3:0] ─────┐
                    │
                    ▼
                ┌─────────┐
        B[3:0] ─►  4-Bit  │
                │   ALU   │
 ALU_Sel[2:0] ─►│         │
                └────┬────┘
                     │
              ┌──────┴──────┐
              ▼             ▼
         Result[3:0]   Carry / Zero