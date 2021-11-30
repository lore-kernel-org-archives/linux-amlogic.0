Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD505C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vifv7m3gTakN4MiyA/L4u9tWrvzRB659X/HmbeBTPaY=; b=I/sQSxCHvAkDdl
	qBECJmh/9PyRiVhPnHDRton1QWS6eoMd7Hf4hKT4ZOjb9jn472K4EkKxCWpDTG2Dqa/v2jiJozI29
	uusdPGFcHdAKmuHXhTCMtouORvsc2rY76G4PpRfORCSm/SbA+F8egJ+zEoIa3XQFjBNean5zYZyKY
	qcMl5KrUXgm+DHC0eFg2uJNxdyZ6I43RovroLswzAXpUbf7g0uHCBoTvrhuRNNczGe4oDftR6s9xa
	3S8VKwUKS2qLK2y+MiD1cHFk+YVMVB3nokLVMADz6WuCGN4TIb66Z3biTSDKbxDYlbtU24DIXAQ7f
	WktSXgNVZl2XAM6IRsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0Kl-004bFr-NV; Tue, 30 Nov 2021 10:25:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms09d-004XQj-T9
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:14:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id o13so43071642wrs.12
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dBYQclrL1vKJA2hPRXt6KeF9g/jxE7KFkoJRa+VO53I=;
 b=1AfopWS6zkTVa6jdKQAeJJGCeMD6fHQz81yeyoe5PnEej7snZTuH+i2brOhwwuuAKl
 Ad415D20Z29yvG1BpKgjlqjo2EaqbXSgSqpXOvJRlMztKmI4bxG+dQAFegsm+RPTbBi2
 1skDls09LikfsHP40q7JVyi0tnfCtKX/flqYJzfbKJA9QZAatjWyotuq+3AfZANvvkKH
 jJviAflgtTO+clMQg9JcSbSzH129XygWrX/qjFVBFk6/TFo9Gtf3ye4oGKmIGB/K8Svb
 pxexwZQvUToX5cjLUqg2Zzv6hjlwyH9sZCoJtUtbPC7FVF74YUpuR6GQ4d7as9shHY4k
 hUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dBYQclrL1vKJA2hPRXt6KeF9g/jxE7KFkoJRa+VO53I=;
 b=tVDC8lnyQPyI3yWDR28oEuv7Xvb6T/aH3EA5L6tuRblZbs9O/cqXmiAfTuNX9hdDKm
 KKQXVnIoHg6EailmxQBNLqv2R3MS8QeH0tnry9SBYeEoKDo4JswPBnbAgCbycIVgAKVZ
 108y+exOLJpFdbqpW8Wbw/dHUrKSA7DRPkeouA9XdyjaYa+pBtfOlA8rtZgmjytP3qBw
 ZUH/PqqevZPP0PThPvpWhUmk/LB+WpXbysNb5LhMqpLJKRp78hnIYcVPBuIbv3eIZbe0
 pA7ezgG9G1ZPV6+jbi79ptZrM/UCKSK4B5hV0VxoJJ45QLm0As03xjSVBzRi3aUe7D31
 oA+w==
X-Gm-Message-State: AOAM5317R57XmrKYy9Id0Rz7Advq2qCR1A93blyqTlECVni85uPgXU5i
 LN+YWcZeRQ5e5X1k3eRxw+rGjw==
X-Google-Smtp-Source: ABdhPJxYuug+7fh9iF3Xer/mVNntASv0BCC/qpNTVPpvQln8yYOB0AEfumefDIRmDn+iSntMtA/T7g==
X-Received: by 2002:adf:a285:: with SMTP id s5mr40497412wra.468.1638267268433; 
 Tue, 30 Nov 2021 02:14:28 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id e24sm11990465wra.78.2021.11.30.02.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:14:28 -0800 (PST)
References: <20211130093617.103147-1-jbrunet@baylibre.com>
 <alpine.DEB.2.21.2111301104440.30606@lnxricardw1.se.axis.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ricard Wanderlof <ricardw@axis.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: meson: use dev_err_probe
Date: Tue, 30 Nov 2021 11:13:33 +0100
In-reply-to: <alpine.DEB.2.21.2111301104440.30606@lnxricardw1.se.axis.com>
Message-ID: <1jmtlmeyrg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_021429_998208_8C842E00 
X-CRM114-Status: GOOD (  14.60  )
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

DQpPbiBUdWUgMzAgTm92IDIwMjEgYXQgMTE6MDYsIFJpY2FyZCBXYW5kZXJsb2YgPHJpY2FyZHdA
YXhpcy5jb20+IHdyb3RlOg0KDQo+IE9uIFR1ZSwgMzAgTm92IDIwMjEsIEplcm9tZSBCcnVuZXQg
d3JvdGU6DQo+DQo+PiBVc2UgZGV2X2Vycl9wcm9iZSgpIGhlbHBlciBmdW5jdGlvbiB0byBoYW5k
bGUgcHJvYmUgZGVmZXJyYWwuDQo+PiBJdCByZW1vdmVzIHRoZSBvcGVuIGNvZGVkIHRlc3QgZm9y
IC1FUFJPQkVfREVGRVIgYnV0IG1vcmUgaW1wb3J0YW50bHksIGl0DQo+PiBzZXRzIHRoZSBkZWZl
cnJhbCByZWFzb24gaW4gZGVidWdmcyB3aGljaCBpcyBncmVhdCBmb3IgZGVidWdnaW5nLg0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4N
Cj4+IC0tLQ0KPj4gwqBzb3VuZC9zb2MvbWVzb24vYWl1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMTcgKysrKysrKy0tLS0tLS0tLS0NCj4+IMKgc291bmQvc29jL21lc29uL2F4Zy1m
aWZvLmPCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKysrLS0tLS0tDQo+PiDCoHNvdW5kL3NvYy9t
ZXNvbi9heGctcGRtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArKystLS0tLS0NCj4+IMKg
c291bmQvc29jL21lc29uL2F4Zy1zcGRpZmluLmPCoMKgwqDCoMKgwqAgfMKgIDYgKystLS0tDQo+
PiDCoHNvdW5kL3NvYy9tZXNvbi9heGctc3BkaWZvdXQuY8KgwqDCoMKgwqAgfMKgIDYgKystLS0t
DQo+PiDCoHNvdW5kL3NvYy9tZXNvbi9heGctdGRtLWZvcm1hdHRlci5jIHwgMTggKysrKysrLS0t
LS0tLS0tLS0tDQo+PiDCoHNvdW5kL3NvYy9tZXNvbi9heGctdGRtLWludGVyZmFjZS5jIHzCoCA5
ICsrKy0tLS0tLQ0KPj4gwqBzb3VuZC9zb2MvbWVzb24vbWVzb24tY2FyZC11dGlscy5jwqAgfMKg
IDQgKystLQ0KPj4gwqBzb3VuZC9zb2MvbWVzb24vdDkwMTUuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgOCArKysrLS0tLQ0KPj4gwqA5IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMo
KyksIDU0IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21lc29u
L2FpdS5jIGIvc291bmQvc29jL21lc29uL2FpdS5jDQo+PiBpbmRleCBiYTE1ZDU3NjJiMGIuLjM3
MDM2YWRmMTRjZSAxMDA2NDQNCj4+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9haXUuYw0KPj4gKysr
IGIvc291bmQvc29jL21lc29uL2FpdS5jDQo+PiBAQCAtMjE5LDMxICsyMTksMjkgQEAgc3RhdGlj
IGludCBhaXVfY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiDCoA0KPj4gwqDCoMKgwqDC
oMKgwqDCoCBhaXUtPnBjbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAicGNsayIpOw0KPj4gwqDCoMKg
wqDCoMKgwqDCoCBpZiAoSVNfRVJSKGFpdS0+cGNsaykpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChQVFJfRVJSKGFpdS0+cGNsaykgIT0gLUVQUk9CRV9ERUZFUikNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRl
diwgIkNhbid0IGdldCB0aGUgYWl1IHBjbGtcbiIpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYWl1LT5wY2xrKSwNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiQ2Fu
J3QgZ2V0IHRoZSBhaXUgcGNsa1xuIik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gUFRSX0VSUihhaXUtPnBjbGspOw0KPj4gwqDCoMKgwqDCoMKgwqDCoCB9DQo+
DQo+IEEgbWlub3IgdGhpbmcsIGJ1dCBkZXZfZXJyX3Byb2JlIHJldHVybnMgaXRzIGVyciBhcmd1
bWVudCwgc28gdGhpcyANCj4gY29uc3RydWN0IGNhbiBiZSB3cml0dGVuIG1vcmUgdGVyc2VseSBh
czoNCj4NCj4gCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYWlvLT5wY2xrKSwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJDYW4ndCBnZXQgdGhlIGFp
byBwY2xrXG4iKTsNCj4NCj4gYW5kIHRoYXQgYWxzbyBzZWVtcyB0byBiZSBpbiBjb21tb24gdXNh
Z2Ugd2hlbiBicm93c2luZyBleGlzdGluZyBjb2RlLg0KDQpNaXNzZWQgdGhhdA0KVGhhbmtzIFJp
Y2FyZCwgSSdsbCB1cGRhdGUgdGhlIGNoYW5nZS4NCg0KPg0KPiAvUmljYXJkDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
