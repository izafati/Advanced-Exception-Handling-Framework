import { LightningElement, api } from "lwc";

export default class EnrichedExceptionDialog extends LightningElement {
	@api supportRetry;

	header;
	message;
	operationName;
	detailedErrors = [];
	additionalDetails = [];

	showDialog;

	get hasDetailedErrors() {
		return this.detailedErrors?.length;
	}

	get hasAdditionalDetails() {
		return this.additionalDetails?.length;
	}

	get activeSections() {
		const activeSections = [];

		if (this.hasDetailedErrors) {
			activeSections.push("additionalDetails");
		}
		if (this.hasAdditionalDetails) {
			activeSections.push("detailedErrors");
		}
		return activeSections;
	}

	@api openDialog(error) {
		if (error) {
			const isErrorString = typeof error === "string";
			this.header = isErrorString ? "Error while performing the action" : error.header;
			this.message = isErrorString ? error : error.message;
			this.detailedErrors = isErrorString ? [] : error.detailedErrors;
			this.additionalDetails = isErrorString ? [] : this.parseAdditionalDetails(error.additionalDetails);
			this.operationName = isErrorString ? error : error.operationName;
		}
		this.showDialog = true;
	}

	handleDialogOk() {
		this.showDialog = false;
	}

	parseAdditionalDetails(details) {
		return Object.keys(details).map((item) => {
			return {
				key: item,
				value: details[item]
			};
		});
	}

	fireRetryEvent() {
		this.showDialog = false;
		const retryEvent = new CustomEvent("retry", {
			detail: this.operationName
		});
		this.dispatchEvent(retryEvent);
	}
}
