# add a dummy service if needed
$ curl http://localhost:8001/services \
        -d name=acme-dummy \
        -d url=http://test-http:80
# add a dummy route if needed
$ curl http://localhost:8001/routes \
        -d name=acme-dummy \
        -d paths[]=/.well-known/acme-challenge \
        -d service.name=acme-dummy

# add the plugin
$ curl http://localhost:8001/plugins \
        -d name=acme \
        -d config.account_email=yourname@strapi.scaleway.ansc.fr \
        -d config.tos_accepted=true \
        -d config.domains[]=strapi.scw.ansc.fr \
        -d config.domains[]=cms.scw.ansc.fr

# test acme-challenge -> not found
curl http://localhost:80/.well-known/acme-challenge/x -H "host:cms.scaleway.ansc.fr"

# create certificate
curl http://localhost:8001/acme -d host=cms.scw.ansc.fr
curl http://localhost:8001/acme -d host=strapi.scw.ansc.fr




# add a dummy service if needed
$ curl http://localhost:8001/services \
        -d name=test-http \
        -d url=http://test-http:80

# add a dummy route if needed
$ curl http://localhost:8001/routes \
        -d name=test-http \
        -d paths[]=/test \
        -d service.name=test-http




# add strapi
curl http://localhost:8001/services \
        -d name=strapi \
        -d url=http://strapi:1337

# add route strapi
curl http://localhost:8001/routes \
        -d name=strapi \
        -d service.name=strapi \
        -d hosts[]=strapi.scw.ansc.fr
