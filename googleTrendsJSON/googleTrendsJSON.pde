import org.freaknet.gtrends.api.GoogleAuthenticator;
import org.freaknet.gtrends.api.GoogleTrendsClient;
import org.freaknet.gtrends.api.GoogleTrendsCsvParser;
import org.freaknet.gtrends.api.GoogleTrendsRequest;
import org.freaknet.gtrends.api.exceptions.GoogleTrendsClientException;


void setup(){



  String u = "krystof.pesek@gmail.com";
  String p = "cigareta33";

  /* OPTIONAL: setup a proxy with NTLM authentication */
  HttpHost proxy = new HttpHost("proxy.mydomain.com", 8080, "http");
  Credentials credentials = new NTCredentials("myLogin", "myPasswd", "", "DOMAIN");
  DefaultHttpClient httpClient = new DefaultHttpClient();
  httpClient.getCredentialsProvider().setCredentials(new AuthScope(proxy.getHostName(), proxy.getPort()), credentials);
  httpClient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy);

  /* Creates a new authenticator */
  GoogleAuthenticator authenticator = new GoogleAuthenticator(u, p, httpClient);

  /* Creates a new Google Trends Client */
  GoogleTrendsClient client = new GoogleTrendsClient(authenticator, httpClient);
  GoogleTrendsRequest request = new GoogleTrendsRequest("bananas");

  /* Here the default request params can be modified with getter/setter methods */
  String content = client.execute(request);

  /* The default request downloads a CSV available in content */
  GoogleTrendsCsvParser csvParser = new GoogleTrendsCsvParser(content);
  /* Get a specific section of the CSV */
  String section = csvParser.getSection("Top searches for", true);
  System.out.println(section);

}
