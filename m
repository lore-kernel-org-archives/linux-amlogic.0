Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E22CC7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wa+AjF5SuHqKJQ8BG3X0DLljkUv92Cnm+AXDEr2CLkc=; b=V5XqQnxu1ZWUwI
	B8GSQ4biqMxSZj1mr4/81dFwZaGc5+pZLR0dsovycN3hcW0kpzNWTZypJfJVC1aGfHzYlN0kB9K/9
	8EdTIpjJHncm3JRtr07qHoh9pgsPt0wnvLtGpAP9CShGUfgf6Yi6+rH8SeEHkPjZpa2exN+/dMMtK
	wTjYWst9PcXDuceZRfpRFcHzicDjeFdszAAC1euhw9IXmUGvsWVRGXv2oHfQYClUsPy2AC62UKd01
	S3vIiHVlEGu62hqQwAWKEVQbcZASeyPqxjNDp0uOTp8jIF+RJQhqrRRRVLwJYlltdRoAEE8Uv32q9
	ADrHXCK8fGd2Y2VYjlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV9G-0028HE-0f;
	Wed, 12 Apr 2023 07:44:10 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV9D-0028GH-1i;
	Wed, 12 Apr 2023 07:44:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DF8E310000A;
	Wed, 12 Apr 2023 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681285445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttYY5/+4QqV7NXlfKfRlva9VOIYN8wHJIRXRSp4/nsU=;
	b=VOWhGv9pQZHkbQZKW1Fo1DPNbnsXCPKJvakyqc1sFhk61XWz+3f33Y8+rOGAsmKHl3Omg1
	oyDuNClMrZTwqvJqIFZJ+ZO4J1teqUkK/k2NHKa8oTEvOfvXpBcgKAy9Mbl9UqlUspUVOk
	6D944OrPB6zlH8MAxqUON02U8X8Vc1SgY8ak5Qo7LZXNg2CH4oXZdDrEdqVnlbjViA5y39
	vctZlBWs1SE/PAf/qlu1KWTu1lWJQfbMkjS0+ulmf/VMSQxqsu1kYP0034hnJ2R4EMWNdX
	aLk8ETAVrNdfgvWpzBhNrPhYB1a24wCXYaXrXzWrCUfEG7TVfJlYHPgXBr/VZw==
Date: Wed, 12 Apr 2023 09:44:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230412094400.3c82f631@xps-13>
In-Reply-To: <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_004407_701253_B988B8B5 
X-CRM114-Status: GOOD (  14.77  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFw
ciAyMDIzIDA5OjE2OjU4ICswMzAwOgoKPiBUaGlzIE5BTkQgcmVhZHMgb25seSBmZXcgdXNlcidz
IGJ5dGVzIGluIEVDQyBtb2RlIChub3QgZnVsbCBPT0IpLCBzbwoKIlRoaXMgTkFORCByZWFkcyIg
ZG9lcyBub3QgbG9vayByaWdodCwgZG8geW91IG1lYW4gIlN1YnBhZ2UgcmVhZHMgZG8Kbm90IHJl
dHJpZXZlIGFsbCB0aGUgT09CIGJ5dGVzLCI/Cgo+IGZpbGwgT09CIGJ1ZmZlciB3aXRoIHplcm9l
cyB0byBub3QgcmV0dXJuIGdhcmJhZ2UgZnJvbSBwcmV2aW91cyByZWFkcwo+IHRvIHVzZXIuCj4g
T3RoZXJ3aXNlICduYW5kZHVtcCcgdXRpbGl0eSBwcmludHMgc29tZXRoaW5nIGxpa2UgdGhpcyBm
b3IganVzdCBlcmFzZWQKPiBwYWdlOgo+IAo+IC4uLgo+IDB4MDAwMDA3ZjA6IGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4gICBPT0IgRGF0YTogZmYgZmYg
ZmYgZmYgMDAgMDAgZmYgZmYgODAgY2YgMjIgOTkgY2IgYWQgZDMgYmUKPiAgIE9PQiBEYXRhOiA2
MyAyNyBhZSAwNiAxNiAwYSAyZiBlYiBiYiBkZCA0NiA3NCA0MSA4ZSA4OCA2ZQo+ICAgT09CIERh
dGE6IDM4IGExIDJkIGU2IDc3IGQ0IDA1IDA2IGYyIGE1IDdlIDI1IGViIDM0IDdjIGZmCj4gICBP
T0IgRGF0YTogMzggZWEgZGUgMTQgMTAgZGUgOWIgNDAgMzMgMTYgNmEgY2MgOWQgYWEgMmYgNWUK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNl
cy5ydT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgNSArKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYwo+IGluZGV4IGY4NGExMDIzOGU0ZC4uZjJmMjQ3MmNiNTExIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L21lc29uX25hbmQuYwo+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQg
bWVzb25fbmZjX3JlYWRfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiAgc3RhdGlj
IGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAq
YnVmLAo+ICAJCQkJICAgaW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCj4gIHsKPiArCXN0cnVj
dCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQobmFuZCk7Cj4gIAl1OCAqb29iX2J1ZiA9IG5h
bmQtPm9vYl9wb2k7Cj4gIAlpbnQgcmV0Owo+ICAKPiArCW1lbXNldChvb2JfYnVmLCAwLCBtdGQt
Pm9vYnNpemUpOwoKSSdtIHN1cnByaXNlZCByYXcgcmVhZHMgZG8gbm90IHJlYWQgdGhlIGVudGly
ZSBPT0I/Cgo+ICsKPiAgCXJldCA9IG1lc29uX25mY19yZWFkX3BhZ2Vfc3ViKG5hbmQsIHBhZ2Us
IDEpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+IEBAIC04ODEsNiArODg0LDggQEAg
c3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX2h3ZWNjKHN0cnVjdCBuYW5kX2NoaXAgKm5h
bmQsIHU4ICpidWYsCj4gIAl1OCAqb29iX2J1ZiA9IG5hbmQtPm9vYl9wb2k7Cj4gIAlpbnQgcmV0
LCBpOwo+ICAKPiArCW1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOwo+ICsKPiAgCXJl
dCA9IG1lc29uX25mY19yZWFkX3BhZ2Vfc3ViKG5hbmQsIHBhZ2UsIDApOwo+ICAJaWYgKHJldCkK
PiAgCQlyZXR1cm4gcmV0OwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
