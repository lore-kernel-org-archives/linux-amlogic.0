Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D58C3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/b17iC63+rN7etHtfKfDtktQKRKy+ZIu5z5oh8vbTfo=; b=vbB2SMfkqTKKJt
	RhOAKxmpXCUrITSxwnIsaC3i321gnxjEEv/bd7Gz5tsuhV7HZMFKMoCv5x03U+PF3zE7Yxk5A2LcT
	QIH8+M1MYm4xVfkYpT3+WgZOo3NtoV0IeiVpdMySrGRyCYncjdTs3RiFm9AHZCNoqlr3m90ATRLWs
	wyoE6mjh03w34sBi84JWBfFKrFzYpt8aczxEXCNnNCfERP4nZcZJZuS81IdbneYTLFjwQWeTIiKZp
	l/6S+syacnU2RoGthQvSyKQlaqBfAut4pPmZ3OZaJ+gLChDV53HdB+gZNy3SIe6ul4KLH1qA3V+m+
	cLpUVIYCzPtArfNUt1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQlkr-00000003TRP-0YDn;
	Mon, 08 Jul 2024 10:37:57 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQlko-00000003TQo-0g6L
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Jul 2024 10:37:56 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id F334C100002;
	Mon,  8 Jul 2024 13:37:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru F334C100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720435070;
	bh=d7X44jwm0wJ1wwPyOMAr2L4W1FfaWYOt7WkDvfHxW6w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=pX8BzdjTVcKak4nV9jcvk4i6JcH6R8K9AUOQkyFxGwDtHrrd7OYYT5CJkCQ6Np1pr
	 WI5UM5IbKNSv4qpyVNdsjNLmbJqO6gaA2+J9/yRntQRjLcBRT/cRwv6Z0PmWwerNir
	 X8/lvmicn2JHfeg0UspHwMmJNLRCG9W9558LHZcDMc0or4puelrYgFkC3sNmris3Is
	 0ufJxBKfL2gfXeIzPEJ9olbY1sVLcEwXbfUjdeCVGxM/2D6gKELZFUUgaLqvILbKmI
	 vm/rTrX2jLEwObQMj6TouHCZkIcs4oj+fjiKZSwAOyaiJXmW1Ec4Of+gIXGZZfB5FY
	 IDilZ8dTd/UZA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 13:37:50 +0300 (MSK)
Received: from p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 13:37:50 +0300
Received: from p-i-exch-sc-m02.sberdevices.ru ([fe80::81d7:3d68:fdfd:518]) by
 p-i-exch-sc-m02.sberdevices.ru ([fe80::81d7:3d68:fdfd:518%9]) with mapi id
 15.02.1118.040; Mon, 8 Jul 2024 13:37:50 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 00/23] Support more Amlogic SoC families in crypto
 driver
Thread-Topic: [PATCH v8 00/23] Support more Amlogic SoC families in crypto
 driver
Thread-Index: AQHauOTJ02Umg/ygAkayQ8Cnf3rYU7HsoakA
Date: Mon, 8 Jul 2024 10:37:50 +0000
Message-ID: <20240708103736.a23yez2n3s526zdy@cab-wsm-0029881.sigma.sbrf.ru>
References: <20240607141242.2616580-1-avromanov@salutedevices.com>
In-Reply-To: <20240607141242.2616580-1-avromanov@salutedevices.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <FD5FF1BA27A64B48B90BDD07E871D796@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186370 [Jul 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;cab-wsm-0029881.sigma.sbrf.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;gist.github.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/08 10:00:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/08 10:00:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 09:16:00 #25900162
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_033754_567004_4201E6B1 
X-CRM114-Status: GOOD (  24.43  )
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

Hi guys, ping.

On Fri, Jun 07, 2024 at 05:12:19PM +0300, Alexey Romanov wrote:
> Hello!
> 
> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families:
> AXG, G12A, G12B, SM1, A1, S4.
> 
> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
> 
> Tested on GXL, AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests [1] and tcrypt module.
> 
> ---
> 
> Changes V1 -> V2 [2]:
> 
> - Rebased over linux-next.
> - Adjusted device tree bindings description.
> - A1 and S4 dts use their own compatible, which is a G12 fallback.
> 
> Changes V2 -> V3 [3]:
> 
> - Fix errors in dt-bindings and device tree.
> - Add new field in platform data, which determines
> whether clock controller should be used for crypto IP.
> - Place back MODULE_DEVICE_TABLE.
> - Correct commit messages.
> 
> Changes V3 -> V4 [4]:
> 
> - Update dt-bindings as per Krzysztof Kozlowski comments.
> - Fix bisection: get rid of compiler errors in some patches.
> 
> Changes V4 -> V5 [5]:
> 
> - Tested on GXL board:
>   1. Fix panic detected by Corentin Labbe [6].
>   2. Disable hasher backend for GXL: in its current realization
>      is doesn't work. And there are no examples or docs in the
>      vendor SDK.
> - Fix AES-CTR realization: legacy boards (gxl, g12, axg) requires
>   inversion of the keyiv at keys setup stage.
> - A1 now uses its own compatible string.
> - S4 uses A1 compatible as fallback.
> - Code fixes based on comments Neil Atrmstrong and Rob Herring.
> - Style fixes (set correct indentations)
> 
> Changes V5 -> V6 [7]:
> 
> - Fix DMA sync warning reported by Corentin Labbe [8].
> - Remove CLK input from driver. Remove clk definition
>   and second interrput line from crypto node inside GXL dtsi.
> 
> Changes V6 -> V7 [9]:
> 
> - Fix dt-schema: power domain now required only for A1.
> - Use crypto_skcipher_ctx_dma() helper for cipher instead of
>   ____cacheline_aligned.
> - Add import/export functions for hasher.
> - Fix commit message for patch 17, acorrding to discussion [10].
> 
> Changes V7 -> V8 [11]:
> 
> - Test patchset with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS: fix some bugs
>   in hasher logic.
> - Use crypto crypto_ahash_ctx_dma in hasher code.
> - Correct clock definition: clk81 is required for all SoC's.
> - Add fixed-clock (clk81) definition for A1/S4.
> - Add information (in commit messages) why different compatibles are used.
> 
> Links:
>   - [1] https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7
>   - [2] https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
>   - [3] https://lore.kernel.org/all/20240123165831.970023-1-avromanov@salutedevices.com/
>   - [4] https://lore.kernel.org/all/20240205155521.1795552-1-avromanov@salutedevices.com/
>   - [5] https://lore.kernel.org/all/20240212135108.549755-1-avromanov@salutedevices.com/
>   - [6] https://lore.kernel.org/all/ZcsYaPIUrBSg8iXu@Red/
>   - [7] https://lore.kernel.org/all/20240301132936.621238-1-avromanov@salutedevices.com/
>   - [8] https://lore.kernel.org/all/Zf1BAlYtiwPOG-Os@Red/
>   - [9] https://lore.kernel.org/all/20240326153219.2915080-1-avromanov@salutedevices.com/
>   - [10] https://lore.kernel.org/all/20240329-dotted-illusive-9f0593805a05@wendy/
>   - [11] https://lore.kernel.org/all/20240411133832.2896463-1-avromanov@salutedevices.com/
> 
> Alexey Romanov (23):
>   drivers: crypto: meson: don't hardcode IRQ count
>   drviers: crypto: meson: add platform data
>   drivers: crypto: meson: remove clock input
>   drivers: crypto: meson: add MMIO helpers
>   drivers: crypto: meson: move get_engine_number()
>   drivers: crypto: meson: drop status field from meson_flow
>   drivers: crypto: meson: move algs definition and cipher API to
>     cipher.c
>   drivers: crypto: meson: cleanup defines
>   drivers: crypto: meson: process more than MAXDESCS descriptors
>   drivers: crypto: meson: avoid kzalloc in engine thread
>   drivers: crypto: meson: introduce hasher
>   drivers: crypto: meson: add support for AES-CTR
>   drivers: crypto: meson: use fallback for 192-bit keys
>   drivers: crypto: meson: add support for G12-series
>   drivers: crypto: meson: add support for AXG-series
>   drivers: crypto: meson: add support for A1-series
>   dt-bindings: crypto: meson: correct clk and remove second interrupt
>     line
>   arch: arm64: dts: meson: gxl: correct crypto node definition
>   dt-bindings: crypto: meson: support new SoC's
>   arch: arm64: dts: meson: a1: add crypto node
>   arch: arm64: dts: meson: s4: add crypto node
>   arch: arm64: dts: meson: g12: add crypto node
>   arch: arm64: dts: meson: axg: add crypto node
> 
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   |  33 +-
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  15 +
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   8 +
>  .../boot/dts/amlogic/meson-g12-common.dtsi    |   8 +
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   7 +-
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  14 +
>  drivers/crypto/amlogic/Makefile               |   2 +-
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 632 ++++++++++++------
>  drivers/crypto/amlogic/amlogic-gxl-core.c     | 292 ++++----
>  drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 507 ++++++++++++++
>  drivers/crypto/amlogic/amlogic-gxl.h          | 118 +++-
>  11 files changed, 1277 insertions(+), 359 deletions(-)
>  create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
> 
> -- 
> 2.34.1
> 

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
