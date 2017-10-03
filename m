From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Tue, 3 Oct 2017 09:27:03 +0200
Subject: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix
 silent freezes
In-Reply-To: <20171002234755.GA18646@ingrassia.epigenesys.com>
References: <20171002155903.19511-1-linus.luessing@c0d3.blue>
 <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
 <20171002234755.GA18646@ingrassia.epigenesys.com>
Message-ID: <20171003072703.GY6726@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Tue, Oct 03, 2017 at 01:47:55AM +0200, Emiliano Ingrassia wrote:
> I executed the test listed by Linus in [0] on my Odroid-C1+, using a
> clean 4.14-rc3 kernel with USB patch only (without the proposed patch).
> All tests completed succesfully and I didn't experiment any hang.

Thanks for testing! Could you also try some memory related tests
with stress-ng? For instance:

* stress-ng -v -t 120s --vm 4
* stress-ng -v -t 120s --malloc 4
* stress-ng -v -t 120s --bigheap 4

Does the OOM killer work for you there?

Cheers, Linus
