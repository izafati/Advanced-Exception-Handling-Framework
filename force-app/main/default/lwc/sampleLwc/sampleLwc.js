import { LightningElement } from "lwc";
import callPaymentProvider from "@salesforce/apex/SampleController.callPaymentProvider";
import recallPaymentProvider from "@salesforce/apex/SampleController.recallPaymentProvider";

const TAKE_PAYMENT_OPERATION = "callPaymentProvider";
const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

export default class SampleLwc extends LightningElement {
	showSpinner;

	async callService() {
		try {
			this.showSpinner = true;
			await delay(2000); // Mocking waiting time for the operation to be executed.
			await callPaymentProvider();
		} catch (error) {
			this.handleError(error);
		} finally {
			this.showSpinner = false;
		}
	}

	async recallService() {
		try {
			this.showSpinner = true;
			await delay(2000); // Mocking waiting time for the operation to be executed.
			await recallPaymentProvider();
		} catch (error) {
			this.handleError(error);
		} finally {
			this.showSpinner = false;
		}
	}

	handleError(error) {
		const parsedError = JSON.parse(error.body.message);
		this.template.querySelector("c-enriched-exception-dialog").openDialog(parsedError);
	}

	handleRetry(event) {
		if (event.detail === TAKE_PAYMENT_OPERATION) {
			this.recallService();
		}
	}
}
