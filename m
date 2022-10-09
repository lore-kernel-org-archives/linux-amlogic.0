Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94ECC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Oct 2022 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Afi8R8OTivK4TZvv7JCBGFavB0kj/Hbkeja3Le0Cifg=; b=V1Lxebx/3t+Ifi
	Co8YK51C/g1KOeobcbJmKre++xS9eBPqgdLLPPXcHt6lAMdRwara4/aZPmxX+lv6CFQX9WV7LCo4L
	mTJmbj9rJeiKvS3HWQQgbg09Dq+zU7KXTQLQ4/khUBe9v8nX+y5pfKmPnejeljYToilYIfZBbQbJX
	vbyJ13WHNMOaHo2aU6OQ61+sTnKGR/nKGK6GaAomS5jZoKSOsfjvU9Y1RQfxoeG3XzMNgtAD4E5KH
	uYp41dElh2Cd2BmxYkd4eWN6j0Kw0oIL2sY/190wf1RqcBXd4NtohizZ3xl5icyKgbZ7HwGygAvmf
	NZaaqzWm+LbwzEMW44YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohV8e-00FW1f-HT; Sun, 09 Oct 2022 12:10:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohV8b-00FW0E-TA; Sun, 09 Oct 2022 12:10:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F1E32B80C90;
	Sun,  9 Oct 2022 12:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F614C433D6;
	Sun,  9 Oct 2022 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665317430;
	bh=ZeIrQu9oB0CDR0Z9aoiHCQq9wYylwX/q/3WhMIMNbJM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eoAuPCL6ltefEACMxNzHCx4dRc/nLGvz82fV/q00356YmopaWTlUMndjUr9i5i44g
	 H+YC9zYA2bQbAcX0l9I332sGYiNbXb4L3IAFXRlSp7ZlphCJWyKm+BDbc84wM2IIiF
	 6wrbcw9cjHlbh6sXqBJJsDCEak95+8G5wveeaMxdcO1UY+kNeZAABjg85HmaoPYZ3Y
	 YismVVqATjPiAjCXDD2dzPsTBu+aS535N3fbW89Xstj8jgVXECzMDNIv9H9WqsKIbz
	 iX0v22JiKhIwFB0Vi5jA2MmGZjl0HZdI0clDijllDP0D1ScmJHXSzbUrgO/XW2CAFk
	 og3U0Z7VHYf8g==
Date: Sun, 9 Oct 2022 13:10:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <linux-amlogic@lists.infradead.org>, <linux-imx@nxp.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Jyoti Bhayana <jbhayana@google.com>, Hans de
 Goede <hdegoede@redhat.com>, Andriy Tryshnivskyy
 <andriy.tryshnivskyy@opensynergy.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Cixi
 Geng <cixi.geng1@unisoc.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ciprian Regus <ciprian.regus@analog.com>, Fabio Estevam
 <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Alexandru
 Ardelean <aardelean@deviqon.com>, Florian Boor
 <florian.boor@kernelconcepts.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Orson Zhai <orsonzhai@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Haibo Chen <haibo.chen@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 12/16] iio: gyro: itg3200_core: do not use internal
 iio_dev lock
Message-ID: <20221009131046.3f55c691@jic23-huawei>
In-Reply-To: <20221004134909.1692021-13-nuno.sa@analog.com>
References: <20221004134909.1692021-1-nuno.sa@analog.com>
	<20221004134909.1692021-13-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_051034_116494_F32FE355 
X-CRM114-Status: UNSURE (   8.05  )
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

T24gVHVlLCA0IE9jdCAyMDIyIDE1OjQ5OjA1ICswMjAwCk51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+IHdyb3RlOgoKPiBUaGUgaWlvX2RldmljZSBsb2NrIGlzIG9ubHkgbWVhbnQgZm9yIGlu
dGVybmFsIHVzZS4gSGVuY2UgZGVmaW5lIGEKPiBkZXZpY2UgbG9jYWwgbG9jayB0byBwcm90ZWN0
IGFnYWluc3QgY29uY3VycmVudCBhY2Nlc3Nlcy4KPiAKPiBXaGlsZSBhdCBpdCwgcHJvcGVybHkg
aW5jbHVkZSAibXV0ZXguaCIgZm9yIG11dGV4IHJlbGF0ZWQgQVBJcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgpBcHBsaWVkLCBidXQgb25seSBwdXNo
ZWQgb3V0IGFzIHRlc3RpbmcgKHdoaWNoIHdpbGwgYmUgcmViYXNlZCkKdW50aWwgYWZ0ZXIgcmMx
LgoKSm9uYXRoYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
