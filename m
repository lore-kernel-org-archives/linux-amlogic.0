Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D15C48BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Feb 2024 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRg9ZtJO4ZBouMIbvfg4Fxr9QJKnoKCtd5qh1YjnyR4=; b=Y3NKSxw0b7pRs4
	UuuB7FzrxLrxAicRu1mauCuRMzxmxh5nSD0Jj7Te3U5nytvcAF2kSy1gNfLgBqcHq/E31i7y8sbP6
	hIiAcRFcSDPg6NsSwzpyMSOWyBC5BeZCXf/GBhebr4vdtC0X0dlYhdjwrdyzESRwmSWYNQ/veEYk7
	KyJm99GoUsEK+KS/KF4vzgvfpVoUlIn6eUkTuDwDpSn24xOtazZqLY/BO6I1Kw11ErRC0WFKqfmS0
	L38+f+tl2lLrL6mW5LA7C3qAQmLcMUzbwVnLPAplbjx2F6VciczZiSvsqNkuIuPuzhERiVul/r9iH
	tkWW+8uMSGskOyRrTWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZD7-0000000FqPT-2oxW;
	Thu, 15 Feb 2024 10:43:21 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZD3-0000000FqKu-1cyt;
	Thu, 15 Feb 2024 10:43:20 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AE8E1100009;
	Thu, 15 Feb 2024 13:43:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AE8E1100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707993789;
	bh=JH0whwe9yMPahO4ftK676Nk9OMPAhJpwKYEfE7/kv2M=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=aC1Zn/hJKlJFXDVZ+wkACWbtJu26OlgtisJNavzTdaqoCPGYUN4lO/QLRkQCcaURI
	 eE2LcgzjrsLvFgCbQa8xOI8nOqxEYKyzF8kxac1+9Vqmg8XykHBJtZOiSVD3zC/iS2
	 qlZUAU/Ko7qhuwqRLAsznBaELJtQgTySt+o9C6uhF7CIQRaitc5raOUTuiR1DLPyRN
	 ffacTzCT1Zz4zJ41jbfeMS6iRi2KCSLmtJyrUw8l4y2FYFO3SB008uh4App2wq4tRd
	 S+tcJHTnHMBgHslg4YS8GY0CmRKdF1T4KHcjgaZeDCSeCzCWA8yuHJCSSo9M0LLyHg
	 njHIvT9R09hGw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 15 Feb 2024 13:43:09 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 13:43:09 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1%7]) with mapi id
 15.02.1118.040; Thu, 15 Feb 2024 13:43:09 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
CC: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
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
Subject: Re: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Thread-Topic: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Thread-Index: AQHaXbqRFptCyAwKyUyy1Cn5x5FmZLEHrLEAgANdAYA=
Date: Thu, 15 Feb 2024 10:43:09 +0000
Message-ID: <20240215104251.pcqj532ekhq5dfbt@cab-wsm-0029881.sigma.sbrf.ru>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <ZcsYaPIUrBSg8iXu@Red>
In-Reply-To: <ZcsYaPIUrBSg8iXu@Red>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <1F71700A325F53478901685FB02CFC10@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183458 [Feb 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;cab-wsm-0029881.sigma.sbrf.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/15 04:37:00 #23614209
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024318_126830_57BD5B72 
X-CRM114-Status: GOOD (  16.56  )
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

Hello,

On Tue, Feb 13, 2024 at 08:21:12AM +0100, Corentin Labbe wrote:
> Le Mon, Feb 12, 2024 at 04:50:48PM +0300, Alexey Romanov a 'ecrit :
> > Hello!
> > 
> > This patchset expand the funcionality of the Amlogic
> > crypto driver by adding support for more SoC families:
> > AXG, G12A, G12B, SM1, A1, S4.
> > 
> > Also specify and enable crypto node in device tree
> > for reference Amlogic devices.
> > 
> > Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> > custom tests [1] and tcrypt module.
> > 
> > ---
> > 
> 
> I started to test on Lepotato board and added patchs up to  "drivers: crypto: meson: process more than MAXDESCS descriptors"
> booting lead to:

Can you please give me your test cases?
Which tool are you using or is it something custom?

> [   18.559922] gxl-crypto c883e000.crypto: will run requests pump with realtime priority
> [   18.562492] gxl-crypto c883e000.crypto: will run requests pump with realtime priority
> [   18.570328] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
> [   18.581135] Mem abort info:
> [   18.581354]   ESR = 0x0000000096000006
> [   18.585138]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   18.593005]   SET = 0, FnV = 0
> [   18.593334]   EA = 0, S1PTW = 0
> [   18.597329]   FSC = 0x06: level 2 translation fault
> [   18.604250] Data abort info:
> [   18.604282]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> [   18.612243]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   18.614552]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   18.624249] user pgtable: 4k pages, 48-bit VAs, pgdp=000000007b8ab000
> [   18.626196] [0000000000000028] pgd=080000007b8ac003, p4d=080000007b8ac003, pud=080000007b8ad003, pmd=0000000000000000
> [   18.640426] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> [   18.642929] Modules linked in: of_mdio fixed_phy fwnode_mdio sm4_ce(-) sm4 meson_rng meson_canvas libphy rng_core meson_gxbb_wdt watchdog amlogic_gxl_crypto(+) ghash_generic gcm xctr xts cts essiv authenc cmac xcbc ccm
> [   18.662164] CPU: 3 PID: 264 Comm: cryptomgr_test Not tainted 6.8.0-rc1-00052-gf70f2b0814a0 #11
> [   18.670698] Hardware name: Libre Computer AML-S905X-CC (DT)
> [   18.676220] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   18.683118] pc : meson_get_engine_number+0x2c/0x50 [amlogic_gxl_crypto]
> [   18.689674] lr : meson_skencrypt+0x38/0x8c [amlogic_gxl_crypto]
> [   18.695539] sp : ffff800081393790
> [   18.698816] x29: ffff800081393790 x28: 0000000000000400 x27: ffff800080874a80
> [   18.705888] x26: ffff800081393830 x25: ffff800081393bd8 x24: ffff000001aaa000
> [   18.712961] x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000011b1c50
> [   18.720033] x20: ffff00007bac8248 x19: ffff0000011b1c00 x18: ffffffffffffffff
> [   18.727105] x17: 00000000000001a4 x16: ffff800078edc1f0 x15: ffff8000813938e0
> [   18.734178] x14: ffff800101393bd7 x13: 0000000000000000 x12: 0000000000000000
> [   18.741250] x11: 000000000000021c x10: fffffffff81213e0 x9 : 00000000000730d5
> [   18.748323] x8 : ffff0000011b1ca8 x7 : fefefefefefefefe x6 : fffffc000007a302
> [   18.755395] x5 : ffff800078eb4148 x4 : 0000000000000000 x3 : 0000000000000028
> [   18.762468] x2 : ffff000001aaa040 x1 : 0000000000000000 x0 : 0000000000000000
> [   18.769541] Call trace:
> [   18.771956]  meson_get_engine_number+0x2c/0x50 [amlogic_gxl_crypto]
> [   18.778167]  crypto_skcipher_encrypt+0xe0/0x124
> [   18.782651]  test_skcipher_vec_cfg+0x2a8/0x6b0
> [   18.787050]  test_skcipher_vec+0x80/0x1c4
> [   18.791017]  alg_test_skcipher+0xbc/0x1fc
> [   18.794985]  alg_test+0x140/0x628
> [   18.798262]  cryptomgr_test+0x24/0x44
> [   18.801885]  kthread+0x110/0x114
> [   18.805076]  ret_from_fork+0x10/0x20
> [   18.808617] Code: 1b008440 d65f03c0 9100a003 f9800071 (885f7c61) 
> [   18.814651] ---[ end trace 0000000000000000 ]---
> [   18.862270] meson8b-dwmac c9410000.ethernet: IRQ eth_wake_irq not found
> [   18.863897] meson8b-dwmac c9410000.ethernet: IRQ eth_lpi not found
> [   18.870349] meson8b-dwmac c9410000.ethernet: PTP uses main clock
> [   18.880548] meson8b-dwmac c9410000.ethernet: User ID: 0x11, Synopsys ID: 0x37
> [   18.882403] meson8b-dwmac c9410000.ethernet: 	DWMAC1000
> [   18.887926] meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
> [   18.895215] meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
> [   18.902627] meson8b-dwmac c9410000.ethernet: COE Type 2
> [   18.907756] meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
> [   18.914750] meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
> [   18.921246] meson8b-dwmac c9410000.ethernet: Normal descriptors
> [   18.927017] meson8b-dwmac c9410000.ethernet: Ring mode enabled
> [   18.932782] meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
