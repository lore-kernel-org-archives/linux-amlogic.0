Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F124C25B74
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2024 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhG1n/o59mxgPynNFBkluk8M+1grF9Fqh7vU5hyYRRY=; b=I9P2NAkd1Zq7LY
	xLePXd6Vabvg53EInRYpjIKQLX/v7TND0FA2QWFmuRyO2rFu6sSm1W/jSzYnErkonqJhWuPqbfUvV
	0o9ZGf1FkbzUY2vCQIxqzNbhcZKrAKT/c9eCNxNRVDR4vskp3tnnahlcQfn394m0sFvjnQX6lIaXa
	Xvmy0JCg7q81cplNhAlAvbCnMCV5kB4lQrbZ523dPBjYFt0rxmZw2bxKtSVMF3xhX7RZc+99rsXSg
	4IHmmvufAllk6G6IWitAx9w8njmRVSUlnwNuDtaxgk3tNlPoJY3hUWjVi7IzFgFLL8LYHqaZurEl0
	cTwh/XXPE3mVcSPVazNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUiI-0000000E38Q-0Wy1;
	Mon, 27 May 2024 07:24:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUiE-0000000E371-1qLX
	for linux-amlogic@lists.infradead.org;
	Mon, 27 May 2024 07:24:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sBUhx-0007Uf-So; Mon, 27 May 2024 09:23:49 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sBUhw-0039iX-Er; Mon, 27 May 2024 09:23:48 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sBUhw-0001dI-1H;
	Mon, 27 May 2024 09:23:48 +0200
Message-ID: <9b7e1a88a812f5c86ada75b094c95b9cf65891c3.camel@pengutronix.de>
Subject: Re: [PATCH 0/3] reset: Convert to platform remove callback
 returning void
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nishanth Menon <nm@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Tero Kristo <kristo@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,  Santosh Shilimkar
 <ssantosh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 27 May 2024 09:23:48 +0200
In-Reply-To: <3emqw7comsegnkso6o3srb3ebeoa7n2m5ckv2ycznu6muh7ydz@krrx33tn4vyv>
References: <cover.1709674157.git.u.kleine-koenig@pengutronix.de>
	 <f35398925846addb282df9c8a6f09d24ecc5c6fc.camel@pengutronix.de>
	 <3emqw7comsegnkso6o3srb3ebeoa7n2m5ckv2ycznu6muh7ydz@krrx33tn4vyv>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_002406_866059_ECB853EF 
X-CRM114-Status: GOOD (  16.23  )
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

SGkgVXdlLAoKT24gU2EsIDIwMjQtMDUtMjUgYXQgMTI6MTQgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2
bmlnIHdyb3RlOgo+IEhlbGxvIFBoaWxpcHAsCj4gCj4gT24gVHVlLCBNYXIgMTIsIDIwMjQgYXQg
MDk6NDc6MjRBTSArMDEwMCwgUGhpbGlwcCBaYWJlbCB3cm90ZToKPiA+IE9uIERpLCAyMDI0LTAz
LTA1IGF0IDIyOjMyICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gdGhpcyBz
ZXJpZXMgY29udmVydHMgYWxsIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9yZXNldCB0
byBzdHJ1Y3QKPiA+ID4gcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVfbmV3KCkuIFNlZSBjb21taXQg
NWM1YTc2ODBlNjdiICgicGxhdGZvcm06Cj4gPiA+IFByb3ZpZGUgYSByZW1vdmUgY2FsbGJhY2sg
dGhhdCByZXR1cm5zIG5vIHZhbHVlIikgZm9yIGFuIGV4dGVuZGVkCj4gPiA+IGV4cGxhbmF0aW9u
IGFuZCB0aGUgZXZlbnR1YWwgZ29hbC4KPiA+ID4gCj4gPiA+IEFsbCBjb252ZXJzYXRpb25zIGFy
ZSB0cml2aWFsLCBiZWNhdXNlIHRoZWlyIC5yZW1vdmUoKSBjYWxsYmFja3MKPiA+ID4gcmV0dXJu
ZWQgemVybyB1bmNvbmRpdGlvbmFsbHkuCj4gPiA+IAo+ID4gPiBUaGVyZSBhcmUgbm8gaW50ZXJk
ZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGVzZSBwYXRjaGVzLCBzbyB0aGV5IGNvdWxkIGJlCj4gPiA+
IHBpY2tlZCB1cCBpbmRpdmlkdWFsbHkuIEJ1dCBJJ2QgaG9wZSB0aGF0IHRoZXkgZ2V0IHBpY2tl
ZCB1cCBhbGwKPiA+ID4gdG9nZXRoZXIgYnkgUGhpbGlwcC4KPiA+IAo+ID4gVGhhbmsgeW91LCBJ
J2xsIHBpY2sgdGhlbSB1cC4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gVGhlc2UgcGF0Y2hlcyBtYWRlIGl0IGludG8gbmV4
dCAoYXMgdjYuOS1yYzEuLjZkODlkZjYxNjUwZCksIGJ1dCBub3QgeWV0Cj4gaW50byBMaW51cydz
IHRyZWUgZm9yIHY2LjEwLXJjMS4gSSBpbnRlbmQgdG8gc2VuZCBhIFBSIHRvIEdyZWcgZWFybHkg
bmV4dCB3ZWVrIGNoYW5naW5nCj4gcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmUgdG8gbWF0Y2ggcmVt
b3ZlX25ldyB0byBjb29rCj4gbG9uZyBpbiBuZXh0IGZvciB2Ni4xMS1yYzEuIElmIHRoZXNlIHJl
c2V0IGNvbW1pdHMgZG9uJ3QgbWFrZSBpdCBpbiBpbiB0aW1lLAo+IEknbGwgYmUgc28gYm9sZCBh
bmQganVzdCBpbmNsdWRlIHRoZSBjb21taXRzIGZyb20geW91ciBmb3ItbmV4dCBicmFuY2gKPiBp
biBteSBQUi4KClBsZWFzZSBkbywgdGhhbmsgeW91LgoKQWNrZWQtYnk6IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
