Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D51C282DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 18:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D6B20675
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 18:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0IOAgt9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sGTswi86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D6B20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXMMCNpIKL/5Jg7ZPqe4Jt/+MWfrf4aLns7ooQuoZdA=; b=m0IOAgt9HCSm/w
	m/rtlWoFkU0iDnZwge79SEl4JJP9wvG2pBwI1Nta7NhTDV2O+NPxD65QjlWM6be3LECOe76AX5/IS
	sopK9WMoXzZUfBGKLYEdfdmVO6PchOcLO3uO0ICV95Xo/Batbx5E1ewgCfF+xxndl9RKVzxJijjs8
	Fhwi/SoHjJoD9oO5KmekmraM7tb5yxybrL5Ig+UvckFfOzXJLrRCSD+kMUMvIjBOqqfYUa/Xy3wsx
	+ESakIW1VKVTkNq2VdsD7JVCJGFGuK/v+Xs7V48AvpWZe+YKeptXdRHAQF6GYDWb6LsuLZ6c4Wq1D
	wEWy7qNWv++UBGLI5yDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGpGb-00034z-Ib; Wed, 17 Apr 2019 18:26:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGpGS-0002xR-AV
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 18:26:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id t17so33155416wrw.13
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=la7ztfbZTDiHYGYXUERkr7bmbktNQu8VIfVisqRnTVo=;
 b=sGTswi867/OmlG0RvsR+iJTiSk729hTtavxg0Or0zryYXlGOW0784hbcE+KJSAiCT8
 XAFvpwOIibV7VL1Nr5pDNMcu0W67qIPnoGPxYYEMO7ZSYToZUBsGLb249qrLsahuV7AM
 7hofNLvF3sZ3B8sL0I38hhG3UE4MuiiS7SOy6BbGPtfWydx5BgQ1yfcKEt5cqSSLRVri
 97itJGK8xazWVLM1S+XewJjy/NfXZUGNGHVKI12YTw52nqONU2AeebdvjBD7woEjnB3h
 tWdtaREYoSe2I6zGhHzDUh26fM4dIMhMNOHy7kvuH/Vmfnsz21shCHx8bAeXwwIE4LSU
 ca6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=la7ztfbZTDiHYGYXUERkr7bmbktNQu8VIfVisqRnTVo=;
 b=FTZnFTUtXO4+RB86KAjMMo+ThYGpd9jJCjxhurOoUBV7skgnqvHJ23GXFnY6DpX2X/
 OSzTgZ6r6UW5WOeuwPxnqiw1WZFJJYWZemx/pBGunDjoBHbcGij2vPpG4xgHFbTji7nz
 7MduzxgovlCitUqYdTzxj++4+mGl+8BXazlua4avwkkeK1CIWZ2A1rFodWwkKNvgw/jD
 VLJrJFlg2JXMORKFRWmzsY50QwKGw4gU/NNAUewUwsEh48cjSFHYcsXOncx9z5tNtDzU
 9otPXV1u+Bm/USAbf5Sz6f01N82iaQwXSA13BGssZexUvYMFvmqgPpqh6+2OHA9AA2cg
 ZXiw==
X-Gm-Message-State: APjAAAVymFV2il3VqSotajiYK3nWapx0m+ndHVLulLGlt+WFO1oy0/y+
 FZnkkV+XveDo4LGii0gvNy7hkA==
X-Google-Smtp-Source: APXvYqxE8Elmis7xcARMPJTpe4deJ4vdaH2+6rQr1bnAyRbfHGL9777pltStiDBR5fI5pz+HNGpSiA==
X-Received: by 2002:a05:6000:1292:: with SMTP id
 f18mr14511914wrx.115.1555525590318; 
 Wed, 17 Apr 2019 11:26:30 -0700 (PDT)
Received: from [192.168.1.62] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 61sm182853341wre.50.2019.04.17.11.26.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 11:26:29 -0700 (PDT)
Subject: Re: [PATCH -next] drm/meson: Make some functions static
From: Neil Armstrong <narmstrong@baylibre.com>
To: Yue Haibing <yuehaibing@huawei.com>, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com
References: <20190413141455.34020-1-yuehaibing@huawei.com>
 <5CB5BB43.5040007@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <4195f74e-a531-c216-534f-a56786b88ce6@baylibre.com>
Date: Wed, 17 Apr 2019 20:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CB5BB43.5040007@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_112632_413584_D6C2A7AF 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTYvMDQvMjAxOSAxMzoyMywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gCj4gCj4gTGUgMTMv
MDQvMjAxOSAxNjoxNCwgWXVlIEhhaWJpbmcgYSDDqWNyaXQgOgo+PiBGcm9tOiBZdWVIYWliaW5n
IDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4+Cj4+IEZpeCBzcGFyc2Ugd2FybmluZ3M6Cj4+Cj4+
IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92aXUuYzo5Mzo2OiB3YXJuaW5nOiBzeW1ib2wg
J21lc29uX3ZpdV9zZXRfZzEyYV9vc2QxX21hdHJpeCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxk
IGl0IGJlIHN0YXRpYz8KPj4gZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5jOjEyMTo2
OiB3YXJuaW5nOiBzeW1ib2wgJ21lc29uX3ZpdV9zZXRfb3NkX21hdHJpeCcgd2FzIG5vdCBkZWNs
YXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPj4gZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3ZpdS5jOjE5MDo2OiB3YXJuaW5nOiBzeW1ib2wgJ21lc29uX3ZpdV9zZXRfb3NkX2x1dCcgd2Fz
IG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPj4KPj4gU2lnbmVkLW9mZi1ieTog
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl92aXUuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdml1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdml1LmMKPj4gaW5kZXggMDE2OWM5OC4uYjU5MDcyMyAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl92aXUuYwo+PiBAQCAtOTAsOCArOTAsOCBAQCBzdGF0aWMgaW50IGVvdGZf
YnlwYXNzX2NvZWZmW0VPVEZfQ09FRkZfU0laRV0gPSB7Cj4+ICAJRU9URl9DT0VGRl9SSUdIVFNI
SUZUIC8qIHJpZ2h0IHNoaWZ0ICovCj4+ICB9Owo+PiAgCj4+IC12b2lkIG1lc29uX3ZpdV9zZXRf
ZzEyYV9vc2QxX21hdHJpeChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCBpbnQgKm0sCj4+IC0JCQkJ
ICAgYm9vbCBjc2Nfb24pCj4+ICtzdGF0aWMgdm9pZCBtZXNvbl92aXVfc2V0X2cxMmFfb3NkMV9t
YXRyaXgoc3RydWN0IG1lc29uX2RybSAqcHJpdiwKPj4gKwkJCQkJICAgaW50ICptLCBib29sIGNz
Y19vbikKPj4gIHsKPj4gIAkvKiBWUFAgV1JBUCBPU0QxIG1hdHJpeCAqLwo+PiAgCXdyaXRlbCgo
KG1bMF0gJiAweGZmZikgPDwgMTYpIHwgKG1bMV0gJiAweGZmZiksCj4+IEBAIC0xMTgsOCArMTE4
LDggQEAgdm9pZCBtZXNvbl92aXVfc2V0X2cxMmFfb3NkMV9tYXRyaXgoc3RydWN0IG1lc29uX2Ry
bSAqcHJpdiwgaW50ICptLAo+PiAgCQlwcml2LT5pb19iYXNlICsgX1JFRyhWUFBfV1JBUF9PU0Qx
X01BVFJJWF9FTl9DVFJMKSk7Cj4+ICB9Cj4+ICAKPj4gLXZvaWQgbWVzb25fdml1X3NldF9vc2Rf
bWF0cml4KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsCj4+IC0JCQkgICAgICBlbnVtIHZpdV9tYXRy
aXhfc2VsX2UgbV9zZWxlY3QsCj4+ICtzdGF0aWMgdm9pZCBtZXNvbl92aXVfc2V0X29zZF9tYXRy
aXgoc3RydWN0IG1lc29uX2RybSAqcHJpdiwKPj4gKwkJCQkgICAgIGVudW0gdml1X21hdHJpeF9z
ZWxfZSBtX3NlbGVjdCwKPj4gIAkJCSAgICAgIGludCAqbSwgYm9vbCBjc2Nfb24pCj4+ICB7Cj4+
ICAJaWYgKG1fc2VsZWN0ID09IFZJVV9NQVRSSVhfT1NEKSB7Cj4+IEBAIC0xODcsMTAgKzE4Nywx
MCBAQCB2b2lkIG1lc29uX3ZpdV9zZXRfb3NkX21hdHJpeChzdHJ1Y3QgbWVzb25fZHJtICpwcml2
LAo+PiAgI2RlZmluZSBPU0RfRU9URl9MVVRfU0laRSAzMwo+PiAgI2RlZmluZSBPU0RfT0VURl9M
VVRfU0laRSA0MQo+PiAgCj4+IC12b2lkIG1lc29uX3ZpdV9zZXRfb3NkX2x1dChzdHJ1Y3QgbWVz
b25fZHJtICpwcml2LCBlbnVtIHZpdV9sdXRfc2VsX2UgbHV0X3NlbCwKPj4gLQkJCSAgIHVuc2ln
bmVkIGludCAqcl9tYXAsIHVuc2lnbmVkIGludCAqZ19tYXAsCj4+IC0JCQkgICB1bnNpZ25lZCBp
bnQgKmJfbWFwLAo+PiAtCQkJICAgYm9vbCBjc2Nfb24pCj4+ICtzdGF0aWMgdm9pZAo+PiArbWVz
b25fdml1X3NldF9vc2RfbHV0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIGVudW0gdml1X2x1dF9z
ZWxfZSBsdXRfc2VsLAo+PiArCQkgICAgICB1bnNpZ25lZCBpbnQgKnJfbWFwLCB1bnNpZ25lZCBp
bnQgKmdfbWFwLAo+PiArCQkgICAgICB1bnNpZ25lZCBpbnQgKmJfbWFwLCBib29sIGNzY19vbikK
Pj4gIHsKPj4gIAl1bnNpZ25lZCBpbnQgYWRkcl9wb3J0Owo+PiAgCXVuc2lnbmVkIGludCBkYXRh
X3BvcnQ7Cj4+Cj4gCj4gQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbT4KPiAKCkFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
