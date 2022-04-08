package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformCompleteExample(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/complete",
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	networkId := terraform.Output(t, terraformOptions, "network_id")
	subnetId := terraform.Output(t, terraformOptions, "subnet_id")
	routerId := terraform.Output(t, terraformOptions, "router_id")
	subnetPoolStart := terraform.Output(t, terraformOptions, "subnet_pool_start")
	subnetPoolEnd := terraform.Output(t, terraformOptions, "subnet_pool_end")

	assert.NotEmpty(t, networkId)
	assert.NotEmpty(t, subnetId)
	assert.NotEmpty(t, routerId)

	assert.Equal(t, "192.168.0.4", subnetPoolStart)
	assert.Equal(t, "192.168.0.223", subnetPoolEnd)
}
