# Avalie Meu Professor
### Created by Devin Ballam
### Developed by Travis Fantina

 ******************************************************************************
 This app was created by Travis Fantina in 2016, all this code and stuff belongs
 to Learning Made Better.
 ******************************************************************************
  Release 1.1.0
   Features professor rating system
   Admin controls

   For future releases:
     Add professor photos
     Add specific class  
     See professors
     School features
 ******************************************************************************
 * Ruby 2.3.1
 * Rails 4.2.5.1
 * Rails 5.0.2
 * Major Dependencies:
         * Searchkick
         * Elasticsearch
         * Bonsai for Elasticsearch
         * Sqlite3 for development & tests
         * PostgreSQL for production

 ******************************************************************************
## Architecture
******************************************************************************
* Root 'site#index'
  At this moment there is no reason for a user to register and thus this feature
  has been disabled except for administrators.

  Functions for a user:  Search, review, add professor, flag review, flag professor.

  Functions for an admin: Delete professor, delete review.
