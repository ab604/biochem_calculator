# UI for mass molarity and dilution calculator
# A. Bailey 19th October 2015

library(shiny)

# Define UI
shinyUI(
        navbarPage(
                "",
                # Create Mass Molarity Calculator tab
                tabPanel(
                        "Mass Molarity Calculator",
                        # Create sidebar for input calculations
                        sidebarLayout(
                                sidebarPanel(
                                        # Select final volume units
                                        selectInput(
                                                "vol.unit",
                                                label = "Desired final volume units",
                                                choices = list(
                                                        "L (litres)" = 1,
                                                        "mL (millilitres)" = 2,
                                                        "uL (microlitres)" = 3
                                                ),
                                                selected = 2
                                        ),
                                        # Input volume
                                        numericInput("fv","Desired final volume", 100),
                                        # select input concentration units
                                        selectInput(
                                                "conc.unit",
                                                label = "Desired concentration units",
                                                choices = list(
                                                        "M (molar)" = 1,
                                                        "mM (millimolar)" = 2,
                                                        "uM (micromolar)" = 3,
                                                        "nM (nanomolar)" = 4,
                                                        "pM (picomolar)" = 5,
                                                        "fM (femtomolar)" = 6
                                                ),
                                                selected = 2
                                        ),
                                        # Input desired concentration
                                        numericInput("dc","Desired concentration", 10),
                                        # Input Formula weight
                                        numericInput("fw","Formula weight (g/mol)"
                                                     , 292.24)
                                ),
                                # Show reactive ouptut of mass requrired
                                mainPanel(
                                          p(h4("Mass required:")),
                                          textOutput("mass"),
                                          hr(),
                                          # Help documentation
                                          h4("How to use this calculator"),
                                          p("This calculator calculates the dry mass
                                            of a substance in grams required to make up a
                                            solution to the desired volume and",
                                            a("molar concentration",href = "https://en.wikipedia.org/wiki/Molar_concentration", target="_blank"),"."),
                                          p("To do this, select the desired volume and
                                            molar concentration unit using the tabs,
                                            and enter the volume of solution, the concentration
                                            and the formula weight of the substance to be dissolved
                                            into the boxes. The mass required is then calculated."),
                                          p(strong("An example calculation:")),
                                          p(a("EDTA",href = "https://en.wikipedia.org/wiki/Ethylenediaminetetraacetic_acid", target="_blank"),
                                            " has a formula weight of 292.24 g/mol."),
                                          p("To make 100 mL at a concentration of 10 mM, we
                                            would find the mass of dry EDTA required by
                                            multiplying the formula weight by the volume in Litres and the
                                            molar concentration in Molar units, like so:"),
                                          withMathJax("$$292.24\\,g/mol \\times 0.1\\,L \\times 10^{-3}\\,M = 0.29224\\,g$$"),
                                          p(a("A.Bailey",href = "mailto:ab604@soton.ac.uk"),"2015")
                        ))
                ),
                # Solution Dilution tab
                tabPanel(
                        "Solution Dilution Calculator",
                                # Create sidebar for input calculations
                                sidebarLayout(
                                        sidebarPanel(
                                                # Select stock solution
                                                # concentration units
                                                selectInput(
                                                        "M1.unit",
                                                        label = "Stock solution concentration units",
                                                        choices = list(
                                                                "M (molar)" = 1,
                                                                "mM (millimolar)" = 2,
                                                                "uM (micromolar)" = 3,
                                                                "nM (nanomolar)" = 4,
                                                                "pM (picomolar)" = 5,
                                                                "fM (femtomolar)" = 6
                                                        ),
                                                        selected = 1
                                                ),
                                                # Input stock solution concentration
                                                numericInput("M1","Stock solution concentration", 0.5),
                                                # Select desired solution
                                                # concentration units
                                                selectInput(
                                                        "M2.unit",
                                                        label = "Desired concentration units",
                                                        choices = list(
                                                                "M (molar)" = 1,
                                                                "mM (millimolar)" = 2,
                                                                "uM (micromolar)" = 3,
                                                                "nM (nanomolar)" = 4,
                                                                "pM (picomolar)" = 5,
                                                                "fM (femtomolar)" =6
                                                        ),
                                                        selected = 2
                                                ),
                                                # Select stock solution concentration units
                                                numericInput("M2","Desired concentration", 10),
                                                selectInput(
                                                        "V2.unit",
                                                        label = "Desired final volume units",
                                                        choices = list(
                                                                "L (litres)" = 1,
                                                                "mL (millilitres)" = 2,
                                                                "uL (microlitres)" = 3
                                                        ),
                                                        selected = 2
                                                ),
                                                # Input desired volume of solution
                                                numericInput("V2","Desired final volume", 100)
                                        ),
                                        # Output the volume of stock required
                                        mainPanel(
                                                p(h4("Volume required:")),
                                                textOutput("V1"),
                                                  hr(),
                                                # Help documentation
                                                h4("How to use this calculator"),
                                                p("This calculator calculates the volume of
                                                  a stock solution of in a given",
                                                  a("molar concentration",href = "https://en.wikipedia.org/wiki/Molar_concentration", target="_blank"),
                                                  "needed to make a new solution of a desired volume diluted to a desired 
                                                  lower concentration."),
                                                p("To do this, select the stock solution concentraion units,
                                                desired concentration and volume units using the tabs,
                                                  and enter the stock concentration, the desired concentration,
                                                  and the desired volume of solution
                                                  into the boxes. The volume of stock required is then calculated."),
                                                p(strong("An example calculation:")),
                                                # (M2*V2)/M1
                                                p("If we had a stock solution of",a("EDTA",href = "https://en.wikipedia.org/wiki/Ethylenediaminetetraacetic_acid", target="_blank"),
                                                  "at M1 = 0.5 Molar."),
                                                p("To make a volume V2 = 100 mL of EDTA at a concentration of M2 = 10 mM from the stock solution
                                                  we multiply  V2 in Litres by M2 in Molar and divide by stock concentration M1 in Molar units, like so:"),
                                                withMathJax("$$\\frac{ 0.1\\,L\\times 10^{-3}\\,M}{0.5\\,M} = 0.002\\,L\\,(2\\,mL)$$"),
                                                p(a("A.Bailey",href = "mailto:ab604@soton.ac.uk"),"2015")
                                                
                                                )
                                )
                                
                        )
                ))
                