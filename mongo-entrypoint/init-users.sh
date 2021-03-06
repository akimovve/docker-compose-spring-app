if [ "$MONGO_INITDB_USERNAME" ] && [ "$MONGO_INITDB_PASSWORD" ]; then
  "${mongo[@]}" -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase "$rootAuthDatabase" "$MONGO_INITDB_DATABASE" <<-EOJS
  db.createUser({
    user: $(_js_escape "$MONGO_INITDB_USERNAME"),
    pwd: $(_js_escape "$MONGO_INITDB_PASSWORD"),
    roles: [{
      role: "readWrite",
      db: $(_js_escape "$MONGO_INITDB_DATABASE")
    }]
  })
EOJS
fi

echo ======================================================================
echo Created $MONGO_INITDB_USERNAME with "readWrite" role for database $MONGO_INITDB_DATABASE successfully
echo ======================================================================
