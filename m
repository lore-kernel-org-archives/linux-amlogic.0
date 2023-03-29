Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069EDC74A5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 04:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5L0T7JlQu8Ry+AL6hBXVQ7t1v6DM1NAY1vCiKEsGWHE=; b=sV5KM+DEEDKyv5Wb8hnQWEOhWL
	nvvgw8Xd0MfcBsHZ536+NTu/7NSH2eWXGYbykIpeSkbrm6n56O5MXzRSfyU8Cz1B3J0YKDBMRXA5g
	iwZkOA63W0saIYkmBvqK9QWhuLa7lUAI2qAI8KbWHRJZQIMu+0erp8hIW+xPSUq5Q9WKFJuSvrf11
	TDWzITz2hTSpL1fo9eEFB9W///V6d48wqye/ZbVd1WeW00ohL7i+9zabhyeuy8MIfzHvzU9OfLz0S
	p/QTwz9YBmjBiigmkEuc/U/YDXyRNN2OqdvRgT+qgj6bHzYei2qZyvvXefgcUReSF4r5/l+LqOm+B
	Pj89GEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNDJ-00GWnC-1A;
	Wed, 29 Mar 2023 04:15:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNDF-00GWlg-2Y;
	Wed, 29 Mar 2023 04:15:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3E2C4B81F88;
	Wed, 29 Mar 2023 04:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8988C433EF;
	Wed, 29 Mar 2023 04:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680063302;
	bh=OeZwGhdh1OhMyiKBDhpSCIDowglcrCZD9EdOvHs4euc=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=uSzeR7sCDnhf4k0KFCoVmxreYmsgU7LkeN3MdANZ3Z++Yrl4lZBXqmcOq0/1qGoYH
	 dnNJw5YysLkr92ae2gs7oc+qqCVBI7dZ03PvQfLpXFyPsZwuYs1JLL3SiOZ6GOeJhX
	 ZoO9kowVg5lYCoZTWxf/Y5eLVNILED0DxVSjJlDaWC7maen+Hzg9hvnqEZWg50Mx3H
	 6LNpwwB8CLkazqcf8BWE4jr+qMJvW/9GWd0ts91LOffixfAdwcx6V08sZbYShdgcr1
	 R4qxJh6W2zkAWr5qcMxYqWFHHNmzoJWO1NriwSQOA5If3XIuJZ75AWYdljD6Qu3Evd
	 NN9XT5jI8U1JQ==
Message-ID: <7cf9452c60f2b1c764b01a15a4d5c2f0.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org> <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
From: Stephen Boyd <sboyd@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi@etezian.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jerome Brunet <jbrunet@baylibre.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Date: Tue, 28 Mar 2023 21:15:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_211505_971614_017E603C 
X-CRM114-Status: GOOD (  10.21  )
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

VGhlIHN1YmplY3Qgc2F5cyAnc3BpJyBidXQgaXQncyBhY3R1YWxseSAnc3BtaScuCgpRdW90aW5n
IEtyenlzenRvZiBLb3psb3dza2kgKDIwMjMtMDMtMTAgMTQ6Mjg6NDMpCj4gVGhlIGRyaXZlciBj
YW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBzaG91bGQgYmUgYWx3
YXlzCj4gdXNlZCBhbmQgdGhlIG9mX21hdGNoX3B0ciBkb2VzIG5vdCBoYXZlIGFueSBzZW5zZSAo
dGhpcyBhbHNvIGFsbG93cyBBQ1BJCj4gbWF0Y2hpbmcgdmlhIFBSUDAwMDEsIGV2ZW4gdGhvdWdo
IGl0IGlzIG5vdCByZWxldmFudCBoZXJlKS4KPiAKPiAgIGRyaXZlcnMvc3BtaS9zcG1pLW10ay1w
bWlmLmM6NTE3OjM0OiBlcnJvcjog4oCYbXRrX3NwbWlfbWF0Y2hfdGFibGXigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+Cj4gLS0tCgpBY2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
