// Lambda function code

module.exports.handler = async (event) => {
  console.log('Event: ', event)
  let responseMessage =  `Hello from ${process.env.env}`;

  if (event.queryStringParameters && event.queryStringParameters['Name']) {
    responseMessage = 'Hello, ' + event.queryStringParameters['Name'] + '!';
  }

  return {
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      message: responseMessage,
    }),
  }
}