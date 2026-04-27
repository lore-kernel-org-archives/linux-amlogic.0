Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9181EFF8861
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2026 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv3nPUvYCDCb9rnRaxTbHTNctZDEpJYDf59Y/NFlWM4=; b=uIkh6TMZ0eDM+x
	EuNAuFeFVQryWxh9tc3VnQ7djxgFeV2vIV2eRS8Ucf0CeYq1TV5VOXSHONvT4Rj71r6XjNMfRX/VB
	+ObHngs6VG+bFy9l5CPzcDEnB7WVDZWD8x5pnI2vKIL4tiDGextnavNYnbfVIysztWb6yTYSUX21/
	cpHMLs090CqCAq8HcgEK/JrUFEOwECrPFwTjdmVKv52bcZpHSZB9hGjRiHCOEGJl+CGJ6mA7+4cpx
	LCRiHDscKrLLJ56/Oy/unQgbBOE5Sj2el5fA1/HAcuRA7eTlH/zIBc76AiQKdJnrFrKiMH1KD8frL
	34FjFbbuChB07ObqILAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIfz-0000000GcHM-1OYm;
	Mon, 27 Apr 2026 09:54:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIfy-0000000GcHC-463n;
	Mon, 27 Apr 2026 09:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2902260145;
	Mon, 27 Apr 2026 09:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD6DC19425;
	Mon, 27 Apr 2026 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777283689;
	bh=3GJbd01BMV46KOqmSsQTOMiZH5IiF+nQeyc2rgr2Oy0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N0e1xCma1Yv/JFQEVHz6rAqbo4SzecdgubW5eAeuFBxPfZLFcSpHZifv3smJyUZL4
	 wLX+78hNXVoT6Us5dXRipin+RcIYZEnW0Nc87BCRW7eJGKnV+3E46tVwFrj672qevA
	 cBfkymnQOHyjd7cH5I+NxJHloek91K2y156YPIVQ9g07CgGrd/RBlJS5tVYNmVJBwH
	 0LL49GtkSA7wTOsuTxWqeCgpW6da9FIc3lwpnrt7SSpHsDlUEvdjULzHYeX7safi59
	 T4hMOD87cDj4NWOjQ0hA6Xxs5AmhqbAaDaxj3AvBdtKD7jE11dz222IpZr0ITdM/6I
	 XD1R17oZGM81g==
Date: Mon, 27 Apr 2026 10:54:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rosen Penev <rosenp@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <20260427105438.2a9541f6@jic23-huawei>
In-Reply-To: <CAN4SLj1_45OG+1AdzCfNiV7T3VX9tpQTcX8krsTDruhtYLzEGw@mail.gmail.com>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
	<CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
	<20260426114118.7ad8b130@jic23-huawei>
	<CAN4SLj1_45OG+1AdzCfNiV7T3VX9tpQTcX8krsTDruhtYLzEGw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

T24gU3VuLCAyNiBBcHIgMjAyNiAyMzoyNjozMyArMDgwMApGZWxpeCBHdSA8dXN0Yy5ndUBnbWFp
bC5jb20+IHdyb3RlOgoKPiBPbiBTdW4sIEFwciAyNiwgMjAyNiBhdCA2OjQx4oCvUE0gSm9uYXRo
YW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhhdCBpcyB0aGUg
bWluaW1hbCBmaXgsIHNvIHdlIHNob3VsZCBwcm9iYWJseSBkbyB0aGF0IGZpcnN0Cj4gPiBldmVu
IGlmIHdlIHRoZW4gY2lyY2xlIGJhY2sgdG8gY29uc2lkZXIgaWYgX19mcmVlKCkgbWFnaWMgaXMg
d29ydGggdXNpbmcgaGVyZS4KPiA+Cj4gPiBKICAKPiAKPiBIaSBKb25hdGhhbiwKPiBZb3UgcHJl
ZmVyIGEgbWluaW1hbCBmaXggaGVyZT8KWWVzIHBsZWFzZS4gIFRoZW4gaWYgeW91IGxpa2Ugd2Ug
Y2FuIGNhcnJ5IG9uIGRpc2N1c3Npb24gYWJvdXQgd2hldGhlcgpfX2ZyZWUoKSBpcyBhIGdvb2Qg
Y2hhbmdlIGhlcmUgYXMgYSBmb2xsb3cgdXAuCgpUaGF0IGNhbiBpbmNsdWRlIHRoZSBmYWN0IHRo
YXQgaXQgd291bGQgaGF2ZSBhdm9pZGVkIHRoaXMgYnVnIGV2ZXIgYmVpbmcKaW50cm9kdWNlZC4K
ClRoYW5rcywKCkpvbmF0aGFuCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBGZWxpeAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
