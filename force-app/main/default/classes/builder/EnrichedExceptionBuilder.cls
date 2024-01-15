/**
 * Builder class for EnrichedException
 *
 */
public with sharing class EnrichedExceptionBuilder {
	public String header;
	public String message;
	public String operationName;
	public List<String> detailedErrors;
	public Map<String, Object> additionalDetails;
	public EnrichedException enrichedException;

	public EnrichedExceptionBuilder setHeader(String header) {
		this.header = header;
		return this;
	}

	public EnrichedExceptionBuilder setMessage(String message) {
		this.message = message;
		return this;
	}

	public EnrichedExceptionBuilder setOperationName(String operationName) {
		this.operationName = operationName;
		return this;
	}

	public EnrichedExceptionBuilder setDetailedErrors(List<String> detailedErrors) {
		this.detailedErrors = detailedErrors;
		return this;
	}

	public EnrichedExceptionBuilder setAdditionalDetails(Map<String, Object> additionalDetails) {
		this.additionalDetails = additionalDetails;
		return this;
	}

	public EnrichedExceptionBuilder build() {
		this.enrichedException = new EnrichedException(this);
		return this;
	}

	public void raise() {
		throw enrichedException;
	}
}
