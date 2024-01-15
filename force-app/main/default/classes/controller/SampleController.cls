/**
 * This is a sample controller class
 * demonstrating a usage of the error handling exception class
 * how to instantiate it in case of an error
 */
public with sharing class SampleController {
	/**
	 *  @description : Sample method simulating a payment provider integration call with a failure
	 *  @param cardNumber String
	 *  @return void
	 */
	@AuraEnabled(cacheable=true)
	public static void callPaymentProvider(string cardNumber) {
		new EnrichedExceptionBuilder()
			.setHeader('Oups! something went wrong.')
			.setMessage('Payment failed, please check the additional details section for further information.')
			.setOperationName('callPaymentProvider')
			.setDetailedErrors(new List<String>{ 'Error 426: Invalid Card Number' })
			.setAdditionalDetails(
				new Map<String, Object>{ 'Invalid Card Number' => 'Provided card number has expired, please provide another one.' }
			)
			.build()
			.raise();
	}

	/**
	 *  @description : Sample method simulating a second payment provider integration call with a different failure
	 *  @param cardNumber String
	 *  @return void
	 */
	@AuraEnabled(cacheable=true)
	public static void recallPaymentProvider(string cardNumber) {
		new EnrichedExceptionBuilder()
			.setHeader('Oups! something went wrong.')
			.setMessage('Payment failed, please check the additional details section for further information.')
			.setOperationName('callPaymentProvider')
			.setDetailedErrors(new List<String>{ 'Error 427: Maximum Retry Reached' })
			.setAdditionalDetails(
				new Map<String, Object>{
					'Maximum Retry Reached' => 'You have reached the maximum ammount of retries, please wait a few minutes before retrying again.'
				}
			)
			.build()
			.raise();
	}
}
