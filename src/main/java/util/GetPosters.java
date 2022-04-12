package util;

import com.api.igdb.request.TwitchAuthenticator;
import com.api.igdb.utils.ImageBuilderKt;
import com.api.igdb.utils.ImageSize;
import com.api.igdb.utils.ImageType;
import com.api.igdb.utils.TwitchToken;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import dao.Config;
import org.json.JSONArray;

public class GetPosters {
    public static String getImagePoster(String gameName) {
        Config config = new Config();
        String CLIENT_ID = config.getIGDBClientID();
        String CLIENT_SECRET = config.getIDGBClientSecret();

        // GET TWITCH ACCESS TOKEN
        TwitchAuthenticator tAuth = TwitchAuthenticator.INSTANCE;
        TwitchToken token = tAuth.requestTwitchToken(CLIENT_ID, CLIENT_SECRET);
        String ACCESS_TOKEN = token.getAccess_token();
        String imageURL = null;

        try {
            // GET GAME ID
            HttpResponse<JsonNode> jsonResponse = Unirest.post("https://api.igdb.com/v4/games")
                    .header("Client-ID", CLIENT_ID)
                    .header("Authorization", "Bearer " + ACCESS_TOKEN)
                    .header("Accept", "application/json")
                    .body("search \"" +  gameName  + "\";fields *;")
                    .asJson();

            JSONArray arr = jsonResponse.getBody().getArray();

            if(arr.length() == 0){
                System.out.println("No game found.");
            } else {
                String gameId = arr.getJSONObject(0).get("id").toString();

                // GET IMAGE ID USING RETRIEVED GAME ID
                HttpResponse<JsonNode> jsonResponse2 = Unirest.post("https://api.igdb.com/v4/covers")
                        .header("Client-ID", CLIENT_ID)
                        .header("Authorization", "Bearer " + ACCESS_TOKEN)
                        .header("Accept", "application/json")
                        .body("fields *; where game = " + gameId + ";")
                        .asJson();

                JSONArray arr2 = jsonResponse2.getBody().getArray();
                String image_id = arr2.getJSONObject(0).get("image_id").toString();
                imageURL = ImageBuilderKt.imageBuilder(image_id, ImageSize.COVER_BIG, ImageType.PNG);
            }
        } catch (UnirestException e) {
            e.printStackTrace();
        }
        return imageURL;
    }
}