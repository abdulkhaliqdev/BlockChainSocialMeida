puts "Seeding spices"

AdminUser.create_with(password: '123456789', password_confirmation: '123456789').find_or_create_by(email: 'abdulkhaliqdev@gmail.com')

if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: "web client", redirect_uri: "", scopes: "")
end


user = User.create(email: "abdulkhaliqdev@gmail.com", username: 'abdulkhaliqdev', password: '123456789')

Blog.create!(title: "Blog 1", body: "Body of First Blog", user_id: user.id)


iz = User.create! (
  {
    username: "Izabelle Cantu",
    email: "izabellecantu@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
  }
)

lg = User.create! ({
    username: "Lily Goddard",
    email: "lilygoddard@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
dg = User.create! ({
    username: "Digby Gibbons",
    email: "digby@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
am = User.create! ({
    username: "Annika Moran",
    email: "annika@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
kd = User.create! ({
    username: "Kenya Dorsey",
    email: "kenya@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
lh = User.create! ({
    username: "Layton Herrera",
    email: "layton@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
kd = User.create! ({
    username: "Karim Dunkley",
    email: "karim@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
kb = User.create! ({
    username: "Kayla Buxton",
    email: "kayla@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
dp = User.create! ({
    username: "Domas Plant",
    email: "domas@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})
wv = User.create! ({
    username: "Willard Velasquez",
    email: "willard@gmail.com",
    password: "password",
    profile_image_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669934737/default_profile_pic_wkgtad.jpg"
    
})

lo = AdminUser.create! (
  {
    email: "admin@gmail.com",
    password: "password", 
  }
)

puts "User Created"

#add collections for users
coll_iz=Collection.create!(
   {title:"IZA’s Collection", 
    user_id: iz.id
})

coll_lg=Collection.create! (
    {title:"Lily’s Collection", 
    user_id:lg.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_dg=Collection.create (
    {title:"Digby’s Collection", 
    user_id: dg.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_am=Collection.create (
    {title:"Annika’s Collection", 
    user_id: am.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_kd=Collection.create (
    {title:"Kenya’s Collection", 
    user_id: kd.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_lh=Collection.create (
    {title:"Layton’s Collection", 
    user_id:lh.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_kd=Collection.create (
    {title:"Karim’s Collection", 
    user_id:kd.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_kb=Collection.create (
    {title:"Kayla’s Collection", 
    user_id:kb.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_dp=Collection.create (
    {title:"Domas’ Collection", 
    user_id:dp.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

coll_wv=Collection.create (
    {title:"Willard’s Collection", 
    user_id:wv.id,
    description: "Lorem ipsum dolor sit amet, 
    consectetur adipiscing elit, sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
        Massa tincidunt dui ut ornare lectus sit amet. 
        Tellus cras adipiscing enim eu turpis egestas pretium 
        aenean pharetra."
    })

    coll_lo=Collection.create (
        {title:"Layna’s Collection", 
        user_id: lo.id,
        collection_img: "https://res.cloudinary.com/dhgw364gk/image/upload/v1669849745/sample.jpg",
        description: "Lorem ipsum dolor sit amet, 
        consectetur adipiscing elit, sed do eiusmod tempor incididunt 
            ut labore et dolore magna aliqua. A diam maecenas sed enim ut. 
            Massa tincidunt dui ut ornare lectus sit amet. 
            Tellus cras adipiscing enim eu turpis egestas pretium 
            aenean pharetra."
        })

puts "Collection Created"

#create some artworks for a collection
rr = Artwork.create! ({title:"Red River", keywords:"nature, red, river",collection_id: coll_iz.id, img_url: "https://res.cloudinary.com/dhgw364gk/image/upload/v1669930323/red_river_pgsljz.jpg"})
bb = Artwork.create! ({title:"Blue Bayou", keywords:"nature, blue, bayou",collection_id: coll_iz.id, img_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669930323/blue_bayou_ewduvp.jpg"})
gg = Artwork.create! ({title:"Green Grass", keywords:"nature, green, grass", collection_id: coll_iz.id, img_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669930323/green_grass_yzrcrh.jpg", for_sale:1, list_price:"1 cowry"})
cc = Artwork.create! ({title:"Cerulean Cloud", keywords:"nature, cloud, blue", collection_id: coll_iz.id, img_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669930323/cerulean_cloud_vturw1.jpg"})
pp = Artwork.create! ({title:"Pink Pelicans", keywords:"nature, pink, pelicans", collection_id: coll_iz.id, img_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669930323/pink_pelicans_d9fg24.jpg"})

Artwork.create ({
    title:"Show Sample",
    keywords:"shoe, white, blue, activity, exercise",
    collection_id: coll_lo.id ,
    img_url:"https://res.cloudinary.com/dhgw364gk/image/upload/v1669849771/cld-sample-5.jpg"
})


puts "Artwork Created"

tut_1 = Tutorial.create! (
        {   user_id: lo.id,
            title:"What is Crypto Currency?", 
            video_url: "https://res.cloudinary.com/dhgw364gk/video/upload/v1669936261/site_zinger_crypto_currency_mlv4gr.mp4",
        description:"Lorem ipsum dolor sit amet, consectetur 
                adipiscing elit, sed do eiusmod tempor incididunt ut 
                labore et dolore magna aliqua. Ut enim ad minim veniam, 
                quis nostrud exercitation ullamco laboris nisi ut aliquip 
                ex ea commodo consequat. Duis aute irure dolor in reprehenderit 
                in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui 
                officia deserunt mollit anim id est laborum."})
tut_2 = Tutorial.create! (
        {user_id: lo.id,
        title:"What is a Non-Fungible Token?", 
        video_url: "https://res.cloudinary.com/dhgw364gk/video/upload/v1669936663/SiteZinger_NFT_xevupm.mp4",
        description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
            nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
            deserunt mollit anim id est laborum."})
tut_3 = Tutorial.create! (
        {user_id: lo.id,
        video_url: "https://res.cloudinary.com/dhgw364gk/video/upload/v1669937041/making_generative_art_with_layers_drtzhb.mp4",
        description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad 
            minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex 
            ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit 
            esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
            non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})
tut_4 = Tutorial.create! (
        {user_id: lo.id,
        title:"Marketplaces", 
        video_url: "https://res.cloudinary.com/dhgw364gk/video/upload/v1669937280/siteZinger_marketplaces_hanje9.mp4",
        description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed 
        do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad 
            minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip 
            ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate 
            velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
            cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est 
            laborum."})
tut_5 = Tutorial.create! (
        {user_id: lo.id,            
        title:"Wallets", 
        video_url: "https://res.cloudinary.com/dhgw364gk/video/upload/v1669939843/SZ_cryptowallets_vlq0fl.mp4",
        description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
            veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum 
            dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
            sunt in culpa qui officia deserunt mollit anim id est laborum."})

puts "Tutorial Created"
puts "Seeding Done"
