# Dr Pepper excercise

Please refer to exercises [here](https://github.com/bugcrowd/drpepper).

## Task 1

There are a few things we need build in AWS first before we deploy the application. First, we need to create a Virtual Private Cloud (VPC). This is a private space where we can easily configure all the networking for our AWS resources in a secure manner. With a VPC we can define our IP address space and create different subnets, or a subdivision of our address space. We can divide the subnets into public and private subnets where we will build all of our internet facing resources in the public space and all of our application servers and databases in the private space. Furthermore, we can divide our subnets between the different Availability Zones (AZs) in the region where we are building our VPC. You can think of AZs as just different data centers built in the same region. This allows us to place our application servers in different AZs to make our application fault tolerant in case one AZ goes down.  

In the VPC we can also build Access Control Lists (ACLs) which act as a firewall between what goes in and out of our VPC. With the ACLs we would specify, for instance that nothing can talk to our private servers aside from something that lives in our own private address space. Furthermore, we can add another level of security and say that from the private space we can ssh (or login) to the public space but not vice versa. Hence, there won't be anything coming from the outside world touching our application servers.

Once we have our VPC and underlying networking set up we can now look into deploying our application in AWS. We can build our application using multiple servers spanning some or all of the available AZs for the region we are building on. We can then serve this application through an Elastic Load Balancer siting on the public subnet whom the client will talk to. The load balancer can then balance the load between the application servers and can make sure it only serves currently working servers through the use of health checks. If one server goes down then the load balancer will no longer direct traffic to that server. This makes the application highly available meaning that its continuously operational. The servers will also connect to the database in the backend side which we can also make highly available by having multiple nodes and data replication between those nodes. Moreover, each of these resources will have a security group attached to them as another layer of security specifying what ports are opened in each resource and what traffic can talk to those resources using those ports.

## Task 2

Run bash script as `bash cars.sh`
