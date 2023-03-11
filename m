Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A188C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=parSw8KWsaYqrXFoW7B2I63fjACIrOrzKpN/2Nz2MrU=; b=RCWvg3RvelOh5/
	3rGcdQ/3USwK5hPmwxXZQAkaea9PWJPEzlRRJZYSeHSVmy42HTeLna/0etS/8O9MmHs4teUWqt5zU
	oVhCV29px0Tp0KTy0JbTxehaQuZBcJjwuOWjfISxjezdY3XP3wULTPmUSeBHwCQyxRRHtqTdu/9eY
	M80RQhQKIgF1rhUL6JkcUeFgMlFiZG5mTNp1WWL3AAlGkSoq3aw/ksRdBc1IPaAgwAy3UdUUxn4w0
	mrqRyhNuyaqHoQxyf6d7+DP5Ke18UThsAYVJGrvUVRTcvz4qrMLG/CyZE3hAySpm3F2gdKSNc5uCK
	YA0aTK2vJg6re21Wrqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paymf-000XrI-CR; Sat, 11 Mar 2023 12:57:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paymV-000Xnd-TM; Sat, 11 Mar 2023 12:57:05 +0000
Received: from tuc-211-071.hrz.tu-chemnitz.de ([134.109.211.71] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1paym9-0001uK-KX; Sat, 11 Mar 2023 13:56:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andi Shyti <andi@etezian.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 06/16] spi: rockchip: Drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 13:56:40 +0100
Message-ID: <11086237.nUPlyArG6x@phil>
In-Reply-To: <20230310222857.315629-6-krzysztof.kozlowski@linaro.org>
References:  <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <20230310222857.315629-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_045703_967334_AA9C651C 
X-CRM114-Status: UNSURE (   9.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QW0gRnJlaXRhZywgMTAuIE3DpHJ6IDIwMjMsIDIzOjI4OjQ3IENFVCBzY2hyaWViIEtyenlzenRv
ZiBLb3psb3dza2k6Cj4gVGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxl
IHNvIHRoZSB0YWJsZSBzaG91bGQgYmUgYWx3YXlzCj4gdXNlZCBhbmQgdGhlIG9mX21hdGNoX3B0
ciBkb2VzIG5vdCBoYXZlIGFueSBzZW5zZSAodGhpcyBhbHNvIGFsbG93cyBBQ1BJCj4gbWF0Y2hp
bmcgdmlhIFBSUDAwMDEsIGV2ZW4gdGhvdWdoIGl0IGlzIG5vdCByZWxldmFudCBoZXJlKS4KPiAK
PiAgIGRyaXZlcnMvc3BpL3NwaS1yb2NrY2hpcC5jOjEwNTE6MzQ6IGVycm9yOiDigJhyb2NrY2hp
cF9zcGlfZHRfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNv
bnN0LXZhcmlhYmxlPV0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJu
ZXIgPGhlaWtvQHNudGVjaC5kZT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
