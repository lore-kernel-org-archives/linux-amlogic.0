From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 1 Oct 2017 15:28:31 +0200
Subject: S805/S812 Device Tree upstreaming
In-Reply-To: <6cc8520a-cadc-7c53-f40b-768ed0b071b0@yandex.ru>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
 <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
 <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
 <CAFBinCDXx5j_W5WtLSd8q0RDp7TXezCdDNHtXp5mYNnY=jR5wA@mail.gmail.com>
 <fdc29cda-b67d-add9-9c8a-f0a61db537da@yandex.ru>
 <CAFBinCBhVGabCo-2j-sd=5JSPa2xsQ4a1Tn=iMC6QuzxrnSfQQ@mail.gmail.com>
 <60f432cf-ea24-9158-a5ab-f967f19393ed@yandex.ru>
 <CAFBinCD0YZchEYxr8Ts1u3PoqY6+0C1kgKsF2Qj2oBZObmQuNg@mail.gmail.com>
 <6cc8520a-cadc-7c53-f40b-768ed0b071b0@yandex.ru>
Message-ID: <CAFBinCAq3iYkjh2wdadf8aCH6gvB0zn3f33qud9nn9tkaeo=pw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Sun, Oct 1, 2017 at 9:22 AM, Oleg <balbes-150@yandex.ru> wrote:
> Hi Martin
>
> I regularly collect the test images using your GIT and check them on my
> MXIII Plus.
> Since the upgrade to version 4.15 I have stopped, not start kernel.
> It does not even starts.
> The same behavior I see on other kernels if i'm use not correct dtb or if
> the dtb is missing.
> The latest version that I have started kernel 4.13_20170814.
> I compared the dts files, they match the version 4.15.
> You've changed something in the source code 4.15 ?
> You kernel 4.15 normal start on your model TV box ?
I have started experimenting with CPU clock changes some time ago -
unfortunately I didn't get it working properly so far.
could you please re-try with branch meson-mx-integration-4.15-20171001
where I made all the CPU-clocks read-only again?

Thanks for testing by the way!


Regards,
Martin
