Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E6CC52D6F
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2024 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRy0g98TOTEkR4h+E3PP+V/407Z+v8XOX9aOFJfvWW0=; b=aAjZ64qTetZBYZ
	Va7f0q7c+89649K+Awh8cH9TYtGbwsayMVlqL7Hdc6VQfkhX8BX1zaUc4IFkGLsLmEzYwVZ7Fb7G5
	QPmi5K3LWFgxdvwZSXzZEvsXmIyhffUBWyM7XZjY7AddgabhhFipeToL+VpkGYHHZpt+12HHl+vGk
	reyVtdM4qHKL7gQwgwED1q8Pco2a1Mrk3A8NsqUFP+XnbJfkKE4psEbuMDTbp1/421GeZUpSUx3Hu
	sYD6m+LcS65XXM4eCkcEsHE7Ym4tMCdJVyihum50/Cz2rvtE8wyllhhkW5HIYEuWT31qyQL8bPbRi
	6a36MnMCfUseQQWr6CyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgiLX-00000008NSr-3oK3;
	Wed, 21 Aug 2024 10:13:43 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgiB6-00000008LBI-2aRK;
	Wed, 21 Aug 2024 10:02:59 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6CF4D120009;
	Wed, 21 Aug 2024 13:02:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6CF4D120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=s2b.tech;
	s=s2b.tech; t=1724234571;
	bh=COXiy57lY8dzSPNXsiiYnAyzRBL65uPiWZ3K75EEL8s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=yiEsMJp6lq7tdEgPiHFXk1xdLN78EScAQP4xLlgVULgr/MBYJfTYTe3A7YkaYowy7
	 ZgyOILRBQuL9HqtYh45ofGS+c5wpup2Kpcllz2toUlI3/67ESMvz4VmWdNV+xLrDEY
	 BVp+9vWBR0gI/kNZ/zW4BAiKTp4eEZ/nzyJggz8qXj63OuxHdWxqYIiM2KiNi190Sp
	 G0m8ZhLEhIvaI2chNCyuLlYHXn+H6gD5u+n5cJlEnco1ZIBfHW5GIOhTnbIvcbPz2c
	 CLHIT3xW1EGujP7yytLg+B4txR5PqjzbAu8qlZ7Gt6V9kEgfh9E2Uetsj4ltrprvnX
	 /rQXZaNI+iFGA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 21 Aug 2024 13:02:51 +0300 (MSK)
From: Alexey Romanov <avromanov@s2b.tech>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
CC: "clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v9 00/23] Support more Amlogic SoC families in crypto
 driver
Thread-Topic: [PATCH v9 00/23] Support more Amlogic SoC families in crypto
 driver
Thread-Index: AQHa8xEu8HBRFAfkMUCcNq+0g+oZurIwEEOAgAE52YA=
Date: Wed, 21 Aug 2024 10:02:50 +0000
Message-ID: <20240821100245.q5uptswxmx4rk35n@cab-wsm-0029881>
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
 <6e535895-6a06-42f8-abf3-e3b7472c97e0@linaro.org>
In-Reply-To: <6e535895-6a06-42f8-abf3-e3b7472c97e0@linaro.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.92]
Content-ID: <7FC1B060E590BD478A7D229A9792E8A3@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187202 [Aug 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@s2b.tech
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 27 0.3.27 71302da218a62dcd84ac43314e19b5cc6b38e0b6, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;gist.github.com:7.1.1;127.0.0.199:7.1.2;s2b.tech:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/08/21 05:09:00
X-KSMG-LinksScanning: Clean, bases: 2024/08/21 05:09:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/08/21 06:50:00 #26388227
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_030257_359694_D775D728 
X-CRM114-Status: GOOD (  28.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Aug 20, 2024 at 05:19:27PM +0200, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 20/08/2024 16:56, Alexey Romanov wrote:
> > Hello!
> > 
> > This patchset expand the funcionality of the Amlogic
> > crypto driver by adding support for more SoC families:
> > AXG, G12A, G12B, SM1, A1, S4.
> > 
> > Also specify and enable crypto node in device tree
> > for reference Amlogic devices.
> > 
> > Tested on GXL, AXG, G12A/B, SM1, A1 and S4 devices via
> > custom tests [1] and tcrypt module.
> 
> On which tree did you base yourself ? It fails to apply patch 20 on next-20240820 and 6.11-rc4

Sorry, my tree is out of date (6.10.1). 

I can rebase it to linux-next and resend patchset.

> 
> Neil
> 
> > 
> > ---
> > 
> > Changes V1 -> V2 [2]:
> > 
> > - Rebased over linux-next.
> > - Adjusted device tree bindings description.
> > - A1 and S4 dts use their own compatible, which is a G12 fallback.
> > 
> > Changes V2 -> V3 [3]:
> > 
> > - Fix errors in dt-bindings and device tree.
> > - Add new field in platform data, which determines
> > whether clock controller should be used for crypto IP.
> > - Place back MODULE_DEVICE_TABLE.
> > - Correct commit messages.
> > 
> > Changes V3 -> V4 [4]:
> > 
> > - Update dt-bindings as per Krzysztof Kozlowski comments.
> > - Fix bisection: get rid of compiler errors in some patches.
> > 
> > Changes V4 -> V5 [5]:
> > 
> > - Tested on GXL board:
> >    1. Fix panic detected by Corentin Labbe [6].
> >    2. Disable hasher backend for GXL: in its current realization
> >       is doesn't work. And there are no examples or docs in the
> >       vendor SDK.
> > - Fix AES-CTR realization: legacy boards (gxl, g12, axg) requires
> >    inversion of the keyiv at keys setup stage.
> > - A1 now uses its own compatible string.
> > - S4 uses A1 compatible as fallback.
> > - Code fixes based on comments Neil Atrmstrong and Rob Herring.
> > - Style fixes (set correct indentations)
> > 
> > Changes V5 -> V6 [7]:
> > 
> > - Fix DMA sync warning reported by Corentin Labbe [8].
> > - Remove CLK input from driver. Remove clk definition
> >    and second interrput line from crypto node inside GXL dtsi.
> > 
> > Changes V6 -> V7 [9]:
> > 
> > - Fix dt-schema: power domain now required only for A1.
> > - Use crypto_skcipher_ctx_dma() helper for cipher instead of
> >    ____cacheline_aligned.
> > - Add import/export functions for hasher.
> > - Fix commit message for patch 17, acorrding to discussion [10].
> > 
> > Changes V7 -> V8 [11]:
> > 
> > - Test patchset with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS: fix some bugs
> >    in hasher logic.
> > - Use crypto crypto_ahash_ctx_dma in hasher code.
> > - Correct clock definition: clk81 is required for all SoC's.
> > - Add fixed-clock (clk81) definition for A1/S4.
> > - Add information (in commit messages) why different compatibles are used.
> > 
> > Changes V8 -> V9 [12]:
> > 
> > - Remove required field clk-names from dt-schema according to Rob Herring
> > recommendation [13].
> > - Fix commit order: all dt-bindings schema commits now located earlier
> > than any changes in device tree.
> > - Fix typos and add more clarifications in dt-schema patches.
> > 
> > Links:
> >    - [1] https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7
> >    - [2] https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
> >    - [3] https://lore.kernel.org/all/20240123165831.970023-1-avromanov@salutedevices.com/
> >    - [4] https://lore.kernel.org/all/20240205155521.1795552-1-avromanov@salutedevices.com/
> >    - [5] https://lore.kernel.org/all/20240212135108.549755-1-avromanov@salutedevices.com/
> >    - [6] https://lore.kernel.org/all/ZcsYaPIUrBSg8iXu@Red/
> >    - [7] https://lore.kernel.org/all/20240301132936.621238-1-avromanov@salutedevices.com/
> >    - [8] https://lore.kernel.org/all/Zf1BAlYtiwPOG-Os@Red/
> >    - [9] https://lore.kernel.org/all/20240326153219.2915080-1-avromanov@salutedevices.com/
> >    - [10] https://lore.kernel.org/all/20240329-dotted-illusive-9f0593805a05@wendy/
> >    - [11] https://lore.kernel.org/all/20240411133832.2896463-1-avromanov@salutedevices.com/
> >    - [12] https://lore.kernel.org/all/20240607141242.2616580-1-avromanov@salutedevices.com/
> >    - [13] https://lore.kernel.org/all/20240610222827.GA3166929-robh@kernel.org/
> > 
> > Alexey Romanov (23):
> >    drivers: crypto: meson: don't hardcode IRQ count
> >    drviers: crypto: meson: add platform data
> >    drivers: crypto: meson: remove clock input
> >    drivers: crypto: meson: add MMIO helpers
> >    drivers: crypto: meson: move get_engine_number()
> >    drivers: crypto: meson: drop status field from meson_flow
> >    drivers: crypto: meson: move algs definition and cipher API to
> >      cipher.c
> >    drivers: crypto: meson: cleanup defines
> >    drivers: crypto: meson: process more than MAXDESCS descriptors
> >    drivers: crypto: meson: avoid kzalloc in engine thread
> >    drivers: crypto: meson: introduce hasher
> >    drivers: crypto: meson: add support for AES-CTR
> >    drivers: crypto: meson: use fallback for 192-bit keys
> >    drivers: crypto: meson: add support for G12-series
> >    drivers: crypto: meson: add support for AXG-series
> >    drivers: crypto: meson: add support for A1-series
> >    dt-bindings: crypto: meson: correct clk and remove second interrupt
> >      line
> >    dt-bindings: crypto: meson: support new SoC's
> >    arch: arm64: dts: meson: gxl: correct crypto node definition
> >    arch: arm64: dts: meson: a1: add crypto node
> >    arch: arm64: dts: meson: s4: add crypto node
> >    arch: arm64: dts: meson: g12: add crypto node
> >    arch: arm64: dts: meson: axg: add crypto node
> > 
> >   .../bindings/crypto/amlogic,gxl-crypto.yaml   |  32 +-
> >   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  14 +
> >   arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
> >   .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
> >   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
> >   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  13 +
> >   drivers/crypto/amlogic/Makefile               |   2 +-
> >   drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 632 ++++++++++++------
> >   drivers/crypto/amlogic/amlogic-gxl-core.c     | 292 ++++----
> >   drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 507 ++++++++++++++
> >   drivers/crypto/amlogic/amlogic-gxl.h          | 118 +++-
> >   11 files changed, 1269 insertions(+), 361 deletions(-)
> >   create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
> > 
> 

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
