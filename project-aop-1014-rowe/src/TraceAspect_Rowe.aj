
public aspect TraceAspect_Rowe {
	pointcut classToTrace(): within(*App);
	pointcut methodToTrace():  classToTrace() &&  execution(* *(..));
	
	before(): methodToTrace() {
	      String info = thisJoinPointStaticPart.getSignature() + ", " //
	            + thisJoinPointStaticPart.getSourceLocation().getLine();
	      System.out.println("String " + info);
	}

	after(): methodToTrace() {
	      System.out.println("\t" + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
}
