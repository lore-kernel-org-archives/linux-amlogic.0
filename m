Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F81BC71145
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCQ+zusnxzn3M/Xfg8dqrplvJFT2h+/0OmXrE9UutR0=; b=yTyxqaQrtSkUm8
	9ykQXyjfjTaSUqczBwUnJdXixe+f/9dSeoSY34JcDAZIGjyRGGOdVte6vzF9KfSLpoQjrwmBfwBE6
	O35K0FJc/S2RD9klePrEw5l5ssLjyABXGv1BMvBERVba9bbWi4s1ivhZ5lI6+OKVk0pu8wlJiPSLT
	226/5ymSmOQ0x/hCLVzvffV6yFDnkx4zwXkJQF9FVho8CaPHyVIkb7GkLEvW5pP353gmEkhhohczh
	yHQT3tr8tARppmf6a4fZ7FvRt/66IPhd3pZI3vP+ajixKfKaEJIvHIyuR7iAQ2yP319Lv0J+r/HW7
	TuVF+OrUB8SOsT4iYWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ68R-002dP9-1e;
	Thu, 24 Aug 2023 08:56:11 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ68O-002dO2-0q;
	Thu, 24 Aug 2023 08:56:09 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RWcPT715Jz4wy7;
	Thu, 24 Aug 2023 18:55:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RWcPD1WXsz4wxn;
	Thu, 24 Aug 2023 18:55:43 +1000 (AEST)
Message-ID: <4450e65b-5de4-e503-ea2e-da95410f4c50@kaod.org>
Date: Thu, 24 Aug 2023 10:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 03/25] spi: aspeed: Use helper function
 devm_clk_get_enabled()
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>, broonie@kernel.org,
 chin-ting_kuo@aspeedtech.com, joel@jms.id.au, andrew@aj.id.au,
 florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com,
 olteanv@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 linus.walleij@linaro.org, heiko@sntech.de
Cc: linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230822131237.1022815-4-lizetao1@huawei.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230822131237.1022815-4-lizetao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_015608_466001_C0AC4B30 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gOC8yMi8yMyAxNToxMiwgTGkgWmV0YW8gd3JvdGU6Cj4gU2luY2UgY29tbWl0IDdlZjk2NTFl
OTc5MiAoImNsazogUHJvdmlkZSBuZXcgZGV2bV9jbGsgaGVscGVycyBmb3IgcHJlcGFyZWQKPiBh
bmQgZW5hYmxlZCBjbG9ja3MiKSwgZGV2bV9jbGtfZ2V0KCkgYW5kIGNsa19wcmVwYXJlX2VuYWJs
ZSgpIGNhbiBub3cgYmUKPiByZXBsYWNlZCBieSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIHdoZW4g
ZHJpdmVyIGVuYWJsZXMgKGFuZCBwb3NzaWJseQo+IHByZXBhcmVzKSB0aGUgY2xvY2tzIGZvciB0
aGUgd2hvbGUgbGlmZXRpbWUgb2YgdGhlIGRldmljZS4gTW9yZW92ZXIsIGl0IGlzCj4gbm8gbG9u
Z2VyIG5lY2Vzc2FyeSB0byB1bnByZXBhcmUgYW5kIGRpc2FibGUgdGhlIGNsb2NrcyBleHBsaWNp
dGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29tPgoK
ClJldmlld2VkLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKVGhhbmtzLAoK
Qy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
