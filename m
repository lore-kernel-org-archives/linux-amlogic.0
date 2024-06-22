Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E474C27C53
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jun 2024 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlby7MiwCU8tR7jO7Phj6YgvSv6cXEnAEWsSR0klLYM=; b=jjPsi5qV43OuSi
	cwXSCMrytlyrGFG+zQR3PcPSLL8rAdISQdFlwuvuJxMHdQ0sq8zHs/sJ+pJBcCjnKLQ3NxEcFDF6n
	VoxKGTCnUelQj+SshubC8PNZts7ibXC0khCSv4Fi5+iH15559uG12unq38JQAizAyb1UYjNDoJ0wE
	Jqt5pK0rVnUpSn699ikLO6wWj1k2/J8hUuzdKWnnw3A6hg5AQMxUxcB0fhWaG1RchA7rJ8eCW50w7
	68JyKOlbZitcqNjMiRV93tnvGTsdJy/FL29by0EFJ/a+DSoMXz7ZwsR+12z7XPONrYSSbnNNDjOjU
	RcNDl7Q0JcY0nsVwUeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL592-0000000CZad-0fzm;
	Sat, 22 Jun 2024 18:07:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL590-0000000CZa9-0Ngo;
	Sat, 22 Jun 2024 18:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00AEB61760;
	Sat, 22 Jun 2024 18:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F603C3277B;
	Sat, 22 Jun 2024 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719079640;
	bh=OtT1Bdv6RV8ExcvkSroMHalr66r6ej9Rmqb6rUMOMI4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=slBSHExp0Uwe7g9gxR6wtZtx9GvEjsaR/9tW7T7D7ThM65vtbu5NwRtXOWZLb/A6Z
	 x4vzB//x6l8e4m/dKCQqux2wTtNYCkhB0sPnsVA49iVVQpmQ8/6HKwHmZEjeGxQQ66
	 +En2No/IKyo4TyARnNnRLLs9Nlw+Wx1OIGZR/8G+Zs7XxL5ECp2Dn79Bh9vAwRcAGW
	 Q8Y8kd5QjhT3h2nHvtxpe7LJn/2WOfoj1p1f/BnDGUBk5Elm13U0NGXZWsbU0pwaet
	 y4XEQJhRSJfiNLyG4NPQ9Gvmck4nLZjpuik3GoyfpXf0YXq3k6IOE95ZnJLrkxyDjj
	 eGKmdj2tsObmA==
Date: Sat, 22 Jun 2024 19:07:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jean-Baptiste Maneyrol
 <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 00/41] iio: simplify with regmap_set_bits(),
 regmap_clear_bits()
Message-ID: <20240622190706.670224da@jic23-huawei>
In-Reply-To: <mv3deevgf3pp6ojy3pa4zgc5z74ajroe26sayhzvrbua2dqrdu@enqs7sobbew5>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
	<mv3deevgf3pp6ojy3pa4zgc5z74ajroe26sayhzvrbua2dqrdu@enqs7sobbew5>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_110722_238253_DCC0E932 
X-CRM114-Status: GOOD (  16.22  )
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

T24gTW9uLCAxNyBKdW4gMjAyNCAxNzoxNzoyNyArMDIwMApVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIFRyZXZvciwKPiAKPiBP
biBNb24sIEp1biAxNywgMjAyNCBhdCAwOTo0OTo0MEFNIC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3
cm90ZToKPiA+IFNpbXBsaWZ5IHRoZSB3YXkgcmVnbWFwIGlzIGFjY2Vzc2VkIGluIGlpbyBkcml2
ZXJzLgo+ID4gCj4gPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBw
YXNzaW5nIHRoZSBtYXNrIHR3aWNlLCB1c2UKPiA+IHJlZ21hcF9zZXRfYml0cygpLgo+ID4gCj4g
PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNzaW5nIHZhbCA9
IDAsIHVzZQo+ID4gcmVnbWFwX2NsZWFyX2JpdHMoKS4KPiA+IAo+ID4gVGhlIHNlcmllcyBpcyBt
YXJrZWQgYXMgdjMsIGJ1dCB0aGUgcHJldmlvdXMgdHdvIHJldmlzaW9ucyB3ZXJlIHNpbmdsZQo+
ID4gcGF0Y2hlcy4gVGhlcmUgd2FzIGFsc28gYSByZXNlbmQgb2YgdjEgZHVlIHRvIG5vdCBwcm9w
ZXJseSBDQ2luZyB0aGUKPiA+IG1haWxpbmcgbGlzdHMgb24gdGhlIGZpcnN0IGF0dGVtcHQuIFRy
YWlsZXJzIHdlcmUgcHVsbGVkIGluIGZyb20gdGhvc2UKPiA+IHdoZXJlIHJlbGV2YW50Lgo+ID4g
Cj4gPiBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1paW8vMjAyNDA2
MTMxMzM5MjcuMzg1MTM0NC0xLXRnYW1ibGluQGJheWxpYnJlLmNvbS8KPiA+IExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlpby8yMDI0MDYxMTE2NTIxNC40MDkxNTkx
LTEtdGdhbWJsaW5AYmF5bGlicmUuY29tLwo+ID4gCj4gPiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+ICAKPiAKPiBBY2tlZC1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4gClNl
cmllcyBhcHBsaWVkIHdpdGggYSBmZXcgd3JhcHBpbmcgdHdlYWtzLgoKQXBwbGllZCB0byB0aGUg
dG9ncmVnIGJyYW5jaCBvZiBpaW8uZ2l0IGFuZCBwdXNoZWQgb3V0IGFzIHRlc3RpbmcgZm9yIDAt
ZGF5CnRvIHRha2UgYSBsb29rICsgYmVjYXVzZSBJIG1pZ2h0IHJlYmFzZSB0aGF0IHRyZWUgYWZ0
ZXIgc29tZSBmaXhlcwptYWtlIGl0IHVwc3RyZWFtIG9uIHdoaWNoIEkgaGF2ZSBvdGhlciBkZXBl
bmRlbmNpZXMgYW5kIEkgZG9uJ3QgbGlrZSBkb2luZwp0aGF0IG9uY2UgaXQgaXMgaW4gdGhlIHB1
YmxpYyB2ZXJzaW9uIG9mIHRoZSB0b2dyZWcgYnJhbmNoLgoKVGhhbmtzCgpKb25hdGhhbgoKPiBU
aGFua3MKPiBVd2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
