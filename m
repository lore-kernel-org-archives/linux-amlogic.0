Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17059D711D5
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Dec 2025 07:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad6WB7WFfG9Yy0JSlTTacmRaABqlUEPUqt3ohSGiT8g=; b=dEyYZb5KeOqxLW
	Mmdm3WkDBPcCjcwiSsbgtM2pX+AneS0RfndWWmU2UMoxHl7q10HxMSvE4TQImuJepdxZDPyV5dgoj
	S+5cS9A2zFgz0dW0PyjBIGKiq+1c69C+pg1kFrzuduVhUPYe2c3g28TeOX0dn4t4ab6bh6zMvAL7K
	rfr7IrIJSmUi8WwZnS5LzFtEI5UYK0lpmsQVWuA0kXO1gB2QJU+ZvmjOMc4MG9aOEooptMnganTLR
	XSti2ctJLGSySyy31xqk1fH0YFl5wMdbRCPGQhTu7U0g9pX42AIZ+d2vhVAihCVw1dyQH97+2Pp6j
	jX/5CDAeW+d2IonkPkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXaNy-0000000DM2e-1rQc;
	Mon, 22 Dec 2025 07:31:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXaNu-0000000DM1u-0uSn
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Dec 2025 07:31:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0DEB21A2365;
	Mon, 22 Dec 2025 07:31:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D36DF606C1;
	Mon, 22 Dec 2025 07:31:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AED821037114E;
	Mon, 22 Dec 2025 08:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766388663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FhfvIIRgj6Aycs5UyhUwijnDEuwt7q2c8fX68qjbfxI=;
	b=dds3KG6i2S3Ix1WU4NKTXXyH21pMocW+PTkSDO3Egjok8yzK5zVeHJ3kbiumuGq3Yj2HRo
	NVBdWWaPxPlQBlayK1IYfKdtbQXz8UbiLzTmGWwtuOZNSfN1xHWHEl3OmAwjZph4aMysaY
	cOXQENMUe4sMpLVsi1J1TBSR80NIqn3DWJVvZC/1isGu4OQFATbvYVT/R8YGfEIQInjFwt
	LLS8tjB70jTmOZ7DJOZrqy6J6sHcEDqBiFm/SOzacWNl6J4KlwJBKTtIlEHYC5dxziUrrK
	IXQLQcVVwdUsfQWxqpQBhLDT9lQ5XYU+M8hgbzYw9WBfLx5gLgarvXMFQYCGbA==
Mime-Version: 1.0
Date: Mon, 22 Dec 2025 08:30:53 +0100
Message-Id: <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong
 LE" <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next
 bridge
X-Mailer: aerc 0.20.1
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com> <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com> <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
In-Reply-To: <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_233114_747660_F3F29A00 
X-CRM114-Status: UNSURE (   9.68  )
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

SGVsbG8gTWFydGluLAoKT24gU3VuIERlYyAyMSwgMjAyNSBhdCAxMDo1MSBQTSBDRVQsIE1hcnRp
biBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gT24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgNzowMOKAr1BN
IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+PiBU
aGlzIGRyaXZlciBvYnRhaW5zIGEgYnJpZGdlIHBvaW50ZXIgZnJvbSBvZl9kcm1fZmluZF9icmlk
Z2UoKSBpbiB0aGUgcHJvYmUKPj4gZnVuY3Rpb24gYW5kIHN0b3JlcyBpdCB1bnRpbCBkcml2ZXIg
cmVtb3ZhbC4gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgaXMKPj4gZGVwcmVjYXRlZC4gTW92ZSB0byBv
Zl9kcm1fZmluZF9hbmRfZ2V0X2JyaWRnZSgpIGZvciB0aGUgYnJpZGdlIHRvIGJlCj4+IHJlZmNv
dW50ZWQgYW5kIHVzZSBicmlkZ2UtPm5leHRfYnJpZGdlIHRvIHB1dCB0aGUgcmVmZXJlbmNlIG9u
Cj4+IGRlYWxsb2NhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVj
YS5jZXJlc29saUBib290bGluLmNvbT4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiBBbmQgYWRkaXRpb25hbGx5
IEkgcnVudGltZSB0ZXN0ZWQgdGhpcyBvbiBtZXNvbi1neGwtczkwNXgtbGlicmV0ZWNoLWNjCj4g
d2hlcmUgSSBzdGlsbCBoYXZlIEhETUkgb3V0cHV0LCBzbzoKPiBUZXN0ZWQtYnk6IE1hcnRpbiBC
bHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpUaGFuayB5
b3UgZm9yIHRoZSBxdWljayB0ZXN0aW5nIQoKSSB0aGluayBJIGNhbiBhcHBlbmQgJyMgbWVzb24t
Z3hsLXM5MDV4LWxpYnJldGVjaC1jYycgdG8geW91ciAnVGVzdGVkLWJ5OicKbGluZSB3aGVuIEkn
bGwgYXBwbHkgdGhlIHBhdGNoLCB0byBtYWtlIGl0IG1vcmUgaW5mb3JtYXRpdmUuCgpCZXN0IHJl
Z2FyZHMsCkx1Y2EKCi0tCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
