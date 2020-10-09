# Mint Docker Compose

A skeleton repo for setting up and/or running a Mint project via Docker Compose.

## Usage

### In short

1. Clone this project.
2. Add the resulting directory to file sharing in Docker's preferences.
3. `cd` into it and create a [`.env` file](https://docs.docker.com/compose/environment-variables/) for the project with the following env vars: `WEB_SERVER_PORT`, `WORKSPACE`, and `PROJECT_NAME`.
4. Add an existing workspace (optional).
5. Run `docker-compose up -d` and get to work.


### For example, using an existing project…

…like [Mint's example todo app](https://github.com/mint-lang/example-todo):

    $ pwd
    # ~/Projects
    $ git clone https://github.com/yb66/mint-docker-compose example-todo

Add `~/Projects/example-todo` to Docker's file sharing, then:

    $ cd example-todo
    $ git clone https://github.com/mint-lang/example-todo

At this point if you run `tree .` you would see:

    $ tree .
    .
    ├── Docker
    │   ├── Dockerfile
    │   └── docker-entrypoint.sh
    ├── LICENCE.txt
    ├── README.md
    ├── docker-compose.yml
    └── example-todo
        ├── Makefile
        ├── assets
        │   ├── head.html
        │   └── icon.png
        ├── mint.json
        └── source
            ├── Main.mint
            ├── Store.mint
            └── Todo.mint

Open my editor and create a file called .env, and write:

```
WEB_SERVER_PORT=4567
WORKSPACE=./example-todo
PROJECT_NAME=example-todo
```

They're just suggestions, you can use what suits you.

Finally, run:

    docker-compose up -d

Given the .env file in the example, this would:

- Build an image called `example-todo_mint`.
- Start it running in the background.
- Share the Mint files found in the `./example-todo` workspace with the container so that you can edit the files in it and the container be able to access them.

If you open an browser and go to `http://localhost:4567` you can play around with the todo app!


#### Now that the project container is running…

…you can run one off commands. For example, to see the mint help:

    docker-compose exec mint mint --help

Just prepend `docker-compose exec mint` to the command you wish to run inside the container.

To stop the project you can use [`docker-compose stop`](https://docs.docker.com/compose/reference/stop/) and [`docker-compose start`](https://docs.docker.com/compose/reference/start/) when you want to return to it, or [`docker-compose down`](https://docs.docker.com/compose/reference/down/) if you want to clean up the assets (see Docker's help for more).

### For example, a new project…

In the case that you're starting a new project the only differences would be that you don't run the `git clone https://github.com/mint-lang/example-todo` command because a workspace will be set up an initialised with a Mint project. So:

    $ pwd
    # ~/Projects
    $ git clone https://github.com/yb66/mint-docker-compose my-stunning-app

Add `~/Projects/my-stunning-app` to Docker's file sharing, then:

    $ cd my-stunning-app

This time the `tree` is different because we don't bring in an existing project:
    
    $ tree .
    .
    ├── Docker
    │   ├── Dockerfile
    │   └── docker-entrypoint.sh
    ├── LICENCE.txt
    ├── README.md
    └── docker-compose.yml

Set up an `.env`. For example:

```
WEB_SERVER_PORT=4568
WORKSPACE=./workspace
PROJECT_NAME=my-stunning-app
```

Run `docker-compose up -d` to start the project.

Running `tree` again will reveal that a default workspace has been set up for you:

    $ tree .
    .
    ├── Docker
    │   ├── Dockerfile
    │   └── docker-entrypoint.sh
    ├── README.md
    ├── docker-compose.yml
    └── workspace
        ├── assets
        │   └── head.html
        ├── mint.json
        ├── source
        │   └── Main.mint
        └── tests
            └── Main.mint

Now if you open a browser and go to `http://localhost:4568`, you should see the default Mint page with its greeting. Open `workspace/source/Main.mint` and alter the greeting, save, and you should see the page update in the browser.

You can also see that an image has been set up called `my-stunning-app_mint`.

    $ docker images
    REPOSITORY              TAG      <snip!>        
    my-stunning-app_mint    latest


If you want to keep this skeleton project separate from the contents of the Mint workspace then I'd suggest adding `workspace` (or whatever you've chosen to call it) to a `.gitignore` in this project's root and then you're free to start a new git repo in the workspace, but it all depends on the way you wish to organise things.

All the things in "Now that the project container is running…" apply to this too.

### Contributing

Do let me know if you have suggestions or problems, all contributions are welcome!

### Licence

See the LICENCE.txt file.
