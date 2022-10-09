Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E712C433FE
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Oct 2022 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OSHwm/gaAt2HJHkoJijG5gZpQIGnePRIooS7Xjq52A=; b=0t8Ev0RQ2lof3f
	V5igXeLzyXyVRmbhwTWqNpwgusw8ETTid8VqN7S9zffDHMMQ7JHqYy3Uyu6CI6NeW9D6EyrCCvf7n
	mOWXnyP29qEqvFLQ41SMra+xt9QTKaqJs96I3nlVx9Sn4QbNSOlDwMEsHWauKFB5yNwitw7313lRp
	zBgYcMLgvEqciepQzk/kSm04I4I6t0xUh0yK+xGnSOHf2/1q3leo7DKQax/Iu7mCFZqKX/j0njR1m
	2zyERmHn5KeUyWpiMdXXQ7sVaILFrU+yHLgSUA1QXw7H6HGnU14w7i3B2EMTQb38lO9ofKd49aCIX
	S27nusJKD/qMhLGD/WKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVGv-00FXnu-UG; Sun, 09 Oct 2022 12:19:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVGu-00FXnD-5z; Sun, 09 Oct 2022 12:19:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80CBD60BA7;
	Sun,  9 Oct 2022 12:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86897C433D6;
	Sun,  9 Oct 2022 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665317946;
	bh=46K+N2Rq12D06cfBVSAusbhWHnRLOD+ma36FofeZTRA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X4UdH3oEOI+LAMjto/LCAljWcOMFsCRUXlUPqPK05A+WTN6VwilyYLhabZTo6apW6
	 RHHIZuU7IR2fm0O29hNS7qprM3L2jNfYA3fLxKny8IniWDzEW/1A7OSohMjfIjanTj
	 OXOVKohTwRz//DzDUJoiHQcOj8yk65GwiIwaUAaM8Re2186rdIFv9jNyi0tZamYG3J
	 wjgtAOrPie/juBHnWf1Aqd4FZ+sFzc1D5o9AdHZ7JOH96aeVVefMCscZH+dRY+GYZ2
	 fI8s+IOgvnGARL98+wqGs2EOLtMKofbfS5iEl1WUZLRb3Qk5tixLUBapzlsRU++moA
	 x6dkP6Uvi+Y4w==
Date: Sun, 9 Oct 2022 13:19:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <linux-amlogic@lists.infradead.org>, <linux-imx@nxp.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Jyoti Bhayana <jbhayana@google.com>, Hans de
 Goede <hdegoede@redhat.com>, Andriy Tryshnivskyy
 <andriy.tryshnivskyy@opensynergy.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Cixi
 Geng <cixi.geng1@unisoc.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Ciprian Regus" <ciprian.regus@analog.com>, Fabio Estevam
 <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Alexandru
 Ardelean <aardelean@deviqon.com>, "Florian Boor"
 <florian.boor@kernelconcepts.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Orson Zhai <orsonzhai@gmail.com>, "Chen-Yu
 Tsai" <wens@csie.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, Haibo Chen <haibo.chen@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 16/16] iio: core: move 'mlock' to 'struct
 iio_dev_opaque'
Message-ID: <20221009131923.2cc18d37@jic23-huawei>
In-Reply-To: <20221004134909.1692021-17-nuno.sa@analog.com>
References: <20221004134909.1692021-1-nuno.sa@analog.com>
	<20221004134909.1692021-17-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_051908_283111_215282AF 
X-CRM114-Status: GOOD (  11.29  )
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

T24gVHVlLCA0IE9jdCAyMDIyIDE1OjQ5OjA5ICswMjAwCk51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+IHdyb3RlOgoKPiBOb3cgdGhhdCB0aGVyZSBhcmUgbm8gbW9yZSB1c2VycyBhY2Nlc3Np
bmcgJ21sb2NrJyBkaXJlY3RseSwgd2UgY2FuIG1vdmUKPiBpdCB0byB0aGUgaWlvX2RldiBwcml2
YXRlIHN0cnVjdHVyZS4gSGVuY2UsIGl0J3Mgbm93IGV4cGxpY2l0IHRoYXQgbmV3Cj4gZHJpdmVy
J3Mgc2hvdWxkIG5vdCBkaXJlY3RseSB0aGlzIGxvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogTnVu
byBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KVGhpcyBsb29rcyBnb29kIHRvIG1lLiAKU28gc2Vy
aWVzIHdpc2UsIEkgdGhpbmsgSSd2ZSBwaWNrZWQgdXAgMS0xMi4gClRvIHJlc29sdmUgaXMgcmVt
YWluaW5nIGRpc2N1c3Npb24gcGx1cyB0aGUgbWlzc21hdGNoIGluIGZ1bmN0aW9uIG5hbWUgdnMK
Y29tbWVudCBpbiAxMy4KClRoYW5rcyBmb3IgZ2V0dGluZyB0aGlzIHRpZGllZCB1cCEgIEl0J3Mg
dGhlIGVuZCBvZiBhIHZlcnkgbG9uZyBwcm9jZXNzLgpJIGFsbW9zdCBmZWVsIGxpa2Ugd2UgbmVl
ZCBhIHBhcnR5IC0gdGhlcmUgd291bGQgYmUgYSBxdWl0ZSBhIGNyb3dkIGdpdmVuCmhvdyBtYW55
IHBlb3BsZSBoYXZlIGJlZW4gaW52b2x2ZWQgaW4gdGhpcyBlZmZvcnQgb3ZlciB0aGUgeWVhcnMu
IDopCgpKb25hdGhhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
