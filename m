Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42F0C0015E
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOD+adSmkXJNXeGEoNYdJNO+6w+Noe27tjRqniepVEc=; b=SLjma/DnXbfbZJ
	3y9p395FC20tqlqbtTAsLkcYqk49Q3qaWQrnl1K9PviaHSvgnRnXJb1Y3VG8SIwnksookNohvAZe0
	6AMdy7ftjB6rFsycfAseFymSBpbeVH5qMeQsQWyCsoijW1T2sz8LLP2610ejURZM7tN/PD9FbKu94
	O4IsUyT8OBQzKowkzqDNGgABXzycX3e9t7rhezHEAN3JgB63aYWjFOMnO2RShh7kACj6K9jVP4ssO
	0GnhWR3Dx2sJ0KV2UyL2/HfClXYEg6jgyBZ1kAS8b8t+Qd/55No0NOaag32/9XLdzVUR+Xo5gwEQg
	BFTfV2joNN8/8jGlngrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhVz-0093YR-1r;
	Sat, 15 Jul 2023 15:48:59 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhVw-0093WU-0V;
	Sat, 15 Jul 2023 15:48:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 713BCFF802;
	Sat, 15 Jul 2023 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689436130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Un+ufkhrXfZqLrVbDU6HeKyr3kcyHpaOW08JuHJOTAQ=;
	b=FqWexEyC5/ncjoaJwBj4G53wiu8VDHhDUUmjeiui8D15gl2UK0/z1/JhojGPaXb7myBHt0
	+m0+8luEUYwOnP8t5sbvBF01u6wPPDP8ekc+E+xiI5dXBEOsZg27UBqN6/Cx2Ykd/d38zY
	Uxi4xN1DsWH3172+Q9prP3vN3AfuAUnTk0v/cqkvsBuezHKkylG8hSiaysYLY7BLSvc/OK
	X/4nONxCNA9EoFF0A6ADkUMqN/54fCJrQYuzSAtxsbm00dNaTjHSMLlKGNk9Pa5uVm4JDa
	KtHa+BsMQbwWPxRZR03AmaWLttL4j4jDIfE8mWV10b4zCsVL6+eAIvNGObilXQ==
Date: Sat, 15 Jul 2023 17:48:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Kyungmin Park
 <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Liang
 Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Michal Simek
 <michal.simek@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Vladimir
 Zapolskiy <vz@mleia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] mtd: Explicitly include correct DT includes
Message-ID: <20230715174804.6fc2a4c1@xps-13>
In-Reply-To: <20230714174751.4060439-1-robh@kernel.org>
References: <20230714174751.4060439-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_084856_328534_BDFBE1EB 
X-CRM114-Status: GOOD (  11.18  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMTQgSnVsIDIwMjMgMTE6NDc6
NDkgLTA2MDA6Cgo+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJh
Y2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFzIG1l
cmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KCgkJCQkgd2FzPwoKT3RoZXJ3aXNl
IExHVE0sIEkgd2lsbCBmaXggaXQgd2hlbiBhcHBseWluZy4KCj4gQXMgcGFydCBvZiB0aGF0IG1l
cmdlIHByZXBwaW5nIEFybSBEVCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ICJ0ZW1wb3Jh
cmlseSIgaW5jbHVkZSBlYWNoIG90aGVyLiBUaGV5IGFsc28gaW5jbHVkZSBwbGF0Zm9ybV9kZXZp
Y2UuaAo+IGFuZCBvZi5oLiBBcyBhIHJlc3VsdCwgdGhlcmUncyBhIHByZXR0eSBtdWNoIHJhbmRv
bSBtaXggb2YgdGhvc2UgaW5jbHVkZQo+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJlZS4g
SW4gb3JkZXIgdG8gZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiByZXBsYWNlIHRoZSBpbXBs
aWNpdCBpbmNsdWRlcyB3aXRoIHN0cnVjdCBkZWNsYXJhdGlvbnMsIHVzZXJzIG5lZWQgdG8KPiBl
eHBsaWNpdGx5IGluY2x1ZGUgdGhlIGNvcnJlY3QgaW5jbHVkZXMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
