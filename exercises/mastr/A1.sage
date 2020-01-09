class A1(MastrExercise):
  @classmethod
  def title(self):
    return "A1 - Linear Polynomial Transformations"

  def generate(self):
    latex.matrix_delimiters("[", "]")    

    x=var("x")
    function_letter=choice(["f","g","h"])
    f=function(function_letter)(x)
    fp=function(function_letter+"p",latex_name=function_letter+"'")(x)

    # some linear terms
    linear_terms = [
      x^randrange(0,4)*f,
      f(x=x^randrange(1,4)),
      f(x=choice([-1,1])*randrange(1,6)),
      fp,
      fp(x=choice([-1,1])*randrange(1,6)),
    ]
    shuffle(linear_terms)
    # some non-linear
    nonlinear_terms = [
      f^randrange(2,4),
      x^randrange(0,4),
    ]
    shuffle(nonlinear_terms)

    linear_trans = choice([-1,1])*randrange(1,6)*linear_terms[0] +\
      choice([-1,1])*randrange(1,6)*linear_terms[1]

    nonlinear_trans = choice([-1,1])*randrange(1,6)*linear_terms[2] +\
      choice([-1,1])*randrange(1,6)*nonlinear_terms[0]
    
    swapped = choice([True,False])
    return {
      "swapped": swapped,
      "linear_trans": latex(linear_trans),
      "nonlinear_trans": latex(nonlinear_trans),
      "f_letter": function_letter
    }
