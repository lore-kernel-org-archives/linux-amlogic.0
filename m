Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C033C4321E
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQbccepfrvyV03XVAaMt0WuGXjUlTb69IKnLYOLb1hI=; b=CzX1K236XSxnF8
	hvclJUrDEN9Y3QF0CHh2Afe+LVuPs1VIaSuDgAzIYlNUaQGIk40yqZrWUp6DjvAoXsPbcLvlbszKw
	rGs6pzh6ICwsk2juBNyuOi6PpI+qbhUSgG7Fgk8aZE1lokqsPvibHrKUvBTZohO65P00tQkMhCg6L
	K8ZzJyoJVmnFnSaGkmYAo0apqPlaakMIRQeVUGz6uzrWX1x6Njc5eGuKFyVGBx9PP5HWSzRcjL25a
	A3yLvo8aJ6xc0+ftd6a5zxpFMBZF1lFThqg0tKycPegAJNOQu5SSijifTHhmPCJncNw2xxywOKYyX
	RG7BaE6VFLl5Mbki265g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0eu6-005pq4-D3; Thu, 01 Dec 2022 08:26:46 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0etu-005piz-Mt
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 08:26:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1p0etm-0004CZ-Nj; Thu, 01 Dec 2022 09:26:26 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1p0etk-001WI6-TJ; Thu, 01 Dec 2022 09:26:25 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1p0etk-0001Rt-Rs; Thu, 01 Dec 2022 09:26:24 +0100
Message-ID: <98517f65e600cddf585e53d1ca98cbb7b0b43aee.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: reset: meson-g12a: Add missing NNA
 reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: neil.armstrong@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson SoC
 support" <linux-amlogic@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 01 Dec 2022 09:26:24 +0100
In-Reply-To: <16c2c7e6-20bb-7593-3197-8925b40d6d77@linaro.org>
References: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
	 <20221129085047.49813-2-tomeu.vizoso@collabora.com>
	 <16c2c7e6-20bb-7593-3197-8925b40d6d77@linaro.org>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_002634_797187_A65CF1C5 
X-CRM114-Status: GOOD (  15.80  )
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

SGkgTmVpbCwKCk9uIERvLCAyMDIyLTEyLTAxIGF0IDA5OjIyICswMTAwLCBOZWlsIEFybXN0cm9u
ZyB3cm90ZToKPiBIaSBQaGlsaXBwLAo+IAo+IE9uIDI5LzExLzIwMjIgMDk6NTAsIFRvbWV1IFZp
em9zbyB3cm90ZToKPiA+IERvZXNuJ3QgYXBwZWFyIGluIHRoZSBUUk0gSSBoYXZlLCBidXQgaXQg
aXMgdXNlZCBieSB0aGUgZG93bnN0cmVhbQo+ID4gZ2FsY29yZSBkcml2ZXIuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4g
PiBBY2tlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4g
PiAtLS0KPiA+IMKgwqBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tZzEy
YS1yZXNldC5oIHwgNCArKystCj4gPiDCoMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5n
cy9yZXNldC9hbWxvZ2ljLG1lc29uLWcxMmEtcmVzZXQuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3Mv
cmVzZXQvYW1sb2dpYyxtZXNvbi1nMTJhLXJlc2V0LmgKPiA+IGluZGV4IDZkNDg3YzVlYmEyYy4u
NDVmNmI4YTk1MWQwIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9h
bWxvZ2ljLG1lc29uLWcxMmEtcmVzZXQuaAo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9hbWxvZ2ljLG1lc29uLWcxMmEtcmVzZXQuaAo+IAo+IDxzbmlwPgo+IAo+IFdpbGwgeW91
IG1pbmQgaWYgSSB0YWtlIHRoaXMgcGF0Y2ggc28gSSBjYW4gYXBwbHkgdGhlIHdob2xlCj4gcGF0
Y2hzZXQgYXQgb25jZSBhbmQgaGFuZGxlIHRoZSBiaW5kaW5ncyBkZXBzIGJldHdlZW4gbXkgZHJp
dmVycyBhbmQgRFQgdHJlZXMgPwoKQWNrZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVu
Z3V0cm9uaXguZGU+Cgp0byBiZSBtZXJnZWQgd2l0aCB0aGUgRFQgY2hhbmdlcyB0aGF0IGRlcGVu
ZCBvbiBpdC4KCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
