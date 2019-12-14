export TF_VAR_image_id=$(curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/images?private=true" | jq ."images[] | select(.name==\"tec-snapp-$ARTIFACT_ID\") | .id")
cd terraform
terraform init
terraform apply -input=false -auto-approve