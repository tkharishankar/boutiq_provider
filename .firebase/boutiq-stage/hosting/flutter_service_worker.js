'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "3e4653f6f2d29ea1c4e8256486a94426",
"index.html": "4cd518df1f860e92a85bdaffae26e828",
"/": "4cd518df1f860e92a85bdaffae26e828",
"main.dart.js": "e60c55fb84bfeb885ff48e40034f54db",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4bd227c5198d73d0250162c78f7c9918",
"assets/AssetManifest.json": "ebcb4a6c8ed694a439c086847ef3ec3d",
"assets/NOTICES": "d7fb72edda3d97eefe882a138b829a71",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/lib/di/injector.dart": "cf1b423cba4e397903723c882c2a284a",
"assets/lib/core/local_storage/app_cache.dart": "c252fdef775a03f3ac5222feede785bc",
"assets/lib/core/network/network_info.dart": "30ab1e3468045a11b071a1ffb5a0476c",
"assets/lib/core/network/api_error.dart": "c6e5a03a755578e2ec168469c79fd0c1",
"assets/lib/core/utils/input_validation.dart": "4ba1ea9ee539245a5db28609704142ce",
"assets/lib/core/utils/app_images.dart": "085cd2ee8f0bacdb9f679af681e2b738",
"assets/lib/core/utils/size.dart": "9d0b5656611484f358e6b60eec6573a9",
"assets/lib/core/utils/app_texts.dart": "0be65ad58c8d12bab0c178cd9a688587",
"assets/lib/core/utils/loading_overlay.dart": "a513aaa01242aa6b3e567b3545665bf1",
"assets/lib/core/utils/responsive.dart": "036b3604b164d86d8fef1f179ee289eb",
"assets/lib/core/common/textfield/textfield.dart": "4609b1e281890cf91f29ef99141d9e82",
"assets/lib/core/common/textfield/search_textfield.dart": "e2367ee97dde365762f32b910d906414",
"assets/lib/core/common/button/buttons.dart": "fd319c4a789b9300a5d5ae665701a18d",
"assets/lib/core/common/error/failure.dart": "c168bc31070219745060d1ceef15eae8",
"assets/lib/core/common/error/exceptions.dart": "0d945a69cfa21e78fc8fbc992ab731a7",
"assets/lib/core/themes/color_scheme.dart": "ccca5058847dba9265b8b4656f0f1e1f",
"assets/lib/core/usecases/usecases.dart": "2f5832ba16923a06cda2d604f0da9349",
"assets/lib/features/auth/auth_service_locator.dart": "1db1ab75df075db96bdf1cbbf2ba7a7a",
"assets/lib/features/auth/data/data_source/authentication_remote_firebase.dart": "648c4ee2833e876bdaf3db966879be04",
"assets/lib/features/auth/data/data_source/authentication_local.dart": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/features/auth/data/repositories/authentication_repo.dart": "0d4ac0dfce542caf8214553f37de0b82",
"assets/lib/features/auth/domain/usecases/registration_usecase.dart": "3bf0cb5a477283779e58693072a16dcd",
"assets/lib/features/auth/domain/usecases/login_usecase.dart": "10ba7d038628bb86db49df9a08614d16",
"assets/lib/features/auth/domain/entities/registration_response.dart": "e3a41cece33ff3f7fa2f976b9d7bdd91",
"assets/lib/features/auth/domain/entities/login_response.dart": "1d1d8bd96fdd840ee439cdc23f0f9580",
"assets/lib/features/auth/domain/entities/registration_response.g.dart": "21356a860ab06751d1e79dcdaf903266",
"assets/lib/features/auth/domain/entities/login_response.freezed.dart": "ee549df6f977d0e0108674526da0b700",
"assets/lib/features/auth/domain/entities/registration_response.freezed.dart": "090830bba3c3bbc6a22c6e0b48f08386",
"assets/lib/features/auth/domain/entities/login_response.g.dart": "351c51eda1a242d4e2ca821723b923f0",
"assets/lib/features/auth/presentation/registration/registration_screen.dart": "8e4f13e8dfcfbda7d61bfec38110dc97",
"assets/lib/features/auth/presentation/registration/states/registration_bloc.dart": "8081a0aaa79fa0bdaf5fb26fce7e6c95",
"assets/lib/features/auth/presentation/registration/states/registration_event.dart": "22acf252f93fab862a29588963d5d79a",
"assets/lib/features/auth/presentation/registration/states/registration_bloc.freezed.dart": "9f0ed654e3f0043a543be45ee82e6f73",
"assets/lib/features/auth/presentation/registration/states/registration_state.dart": "d10ba8e5e48f4a10175fc8a8f1c8b007",
"assets/lib/features/auth/presentation/otp/otp_screen.dart": "df3c08418dac967e12979ba41a06ccd8",
"assets/lib/features/auth/presentation/login/login_screen.dart": "f581463a69e162d8559bc7135497f31a",
"assets/lib/features/auth/presentation/login/states/login_bloc.dart": "7e177e256fded9c18c030f76ef3ae5c4",
"assets/lib/features/auth/presentation/login/states/login_event.dart": "ae07fb50b4c090180e62b0d16201379c",
"assets/lib/features/auth/presentation/login/states/login_bloc.freezed.dart": "e33bc82de44179044f04caf6842e4c55",
"assets/lib/features/auth/presentation/login/states/login_state.dart": "93a79659f0836c2603b5ad6e7a147cc1",
"assets/lib/features/onboarding_screen.dart": "892c31a473b0a66597f9f8230e94bdcb",
"assets/lib/features/dashboard/data/data_source/product_remote_firebase.dart": "556445406a768ebf781457616dde37a6",
"assets/lib/features/dashboard/data/data_source/product_local.dart": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/features/dashboard/data/repositories/product_repo.dart": "1718f3cbda22f809c2f0d9841c39921c",
"assets/lib/features/dashboard/domain/entities/product_resp.freezed.dart": "9e882a785a98ee1e6b6eca2c73fe2594",
"assets/lib/features/dashboard/domain/entities/product_resp.dart": "4582b4785fa678efda51c07b28b23878",
"assets/lib/features/dashboard/domain/entities/product_resp.g.dart": "2870f1ec69b22b9f00d32f1b720b3ab0",
"assets/lib/features/dashboard/product_locator.dart": "f4bb51d65c520de3f6ab51dca861965e",
"assets/lib/features/dashboard/presentation/dashboard_screen.dart": "26f84ff0ce25fedfd4205000241a83f4",
"assets/lib/features/dashboard/presentation/add_new_product.dart": "a86506c35a84471e9208a6fb8797f7bb",
"assets/lib/features/dashboard/presentation/states/product_bloc.dart": "0a4ae91e9a0eaca4eed5fe04881b9261",
"assets/lib/features/dashboard/presentation/states/product_state.dart": "c7b1364e4318ca1c22dcc77578231000",
"assets/lib/features/dashboard/presentation/states/product_event.dart": "7e3f78448766ae485e01456022243545",
"assets/lib/features/dashboard/presentation/states/product_bloc.freezed.dart": "0c087bec87c1fe88a39c844e9ee835a8",
"assets/lib/features/dashboard/presentation/product_card.dart": "928cbc0bddc491690f0c885ff6b4354f",
"assets/lib/features/splash_screen.dart": "f4dfde0285d37726121e4ca20f06df58",
"assets/lib/firebase_options.dart": "42416a17c3506f3b4a15c878fff80c94",
"assets/lib/main.dart": "a03d855de5cc163f58f634c3b8643ee4",
"assets/lib/router/router.dart": "8d76c22d1d0d5f22338ee23f8ea47cc1",
"assets/AssetManifest.bin": "fda6403917e7301932a51da216e54c8b",
"assets/fonts/MaterialIcons-Regular.otf": "ba237e2d33269e93ba9dc499215126bc",
"assets/assets/images/instagram.png": "b03c209a55555b2cd210bad0ea28591f",
"assets/assets/images/flutter.png": "d21f1eecaeaab081ba7efec1721c0712",
"assets/assets/images/fullscreen.jpg": "df5a33671f287160298604d3372b5d85",
"assets/assets/images/twitter.png": "32725710a59ef47cacc1fb17dae2997f",
"assets/assets/images/facebook.png": "e6cb5ea720b929ca490bd723af02ce22",
"assets/assets/images/loading.png": "410857df193358789cb3b315515fd063",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
