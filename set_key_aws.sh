#!/bin/bash

ID=<aws_id>
KEY=<aws key>

cat << EOF > temp_access.sh
#!/bin/bash

export AWS_ACCESS_KEY_ID=$ID
export AWS_SECRET_ACCESS_KEY=$KEY

EOF

chmod a+x temp_access.sh
source ./temp_access.sh
rm temp_access.sh

#echo $AWS_ACCESS_KEY_ID
#echo $AWS_SECRET_ACCESS_KEY

