/**
 * Enriched exception class
 */
public with sharing class EnrichedException extends Exception {
	public EnrichedException(EnrichedExceptionBuilder builder) {
		EnrichedException.Wrapper errorHandlingWrapper = new EnrichedException.Wrapper();
		errorHandlingWrapper.header = builder.header;
		errorHandlingWrapper.message = builder.message;
		errorHandlingWrapper.operationName = builder.operationName;
		errorHandlingWrapper.detailedErrors = builder.detailedErrors;
		errorHandlingWrapper.additionalDetails = builder.additionalDetails;
		this.setMessage(Json.serialize(errorHandlingWrapper));
	}

	public class Wrapper {
		private final String header;
		private final String message;
		private final String operationName;
		private final List<String> detailedErrors;
		private final Map<String, Object> additionalDetails;
	}
}
