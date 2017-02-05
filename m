From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 5 Feb 2017 02:28:56 +0100
Subject: [PATCH v2 1/9] mmc: meson-gx: fix setting f_min
In-Reply-To: <78e18d60-8359-df37-ebcb-34134b31f708@gmail.com>
References: <e8f1b59a-927b-b50e-4137-0b4b9e3cbc6e@gmail.com>
 <CAPDyKFq9mScEuqcmP0E3Lz0APhYbHYtyUvc6WXkGGXR1OZavgg@mail.gmail.com>
 <78e18d60-8359-df37-ebcb-34134b31f708@gmail.com>
Message-ID: <CAFBinCB=xx41G4pUsCmMPAxyXutGBDJkapO8Ezd7gdCHOdzY6A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Feb 4, 2017 at 11:12 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
[snip]
> Requesting 100kHz resulted in f_min = 0 in my tests. Same for 200kHz
> and 300 kHz. 400kHz results in f_min = 400kHz with actual rate = 380kHz.
> 380kHz = 24MHz / 63 is the lowest possible frequency on Meson anyway.
> All requested frequencies below this value seem to be rounded down to 0.
doesn't that sound more like an issue with the clock configuration
which should be investigated? the divider for example has
CLK_DIVIDER_ROUND_CLOSEST set, removing that will probably make it
round up (but I'm not sure if that would break other things).


Martin
