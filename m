Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45478C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 May 2022 07:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kHKm1dGlLq8+RM6jGVx8kfSnCtvMUm3v0DLItipvSY=; b=wmsob7IRhET6bg/STyOcLAJ5p2
	9V0xwXuZiKxvQKTKEWwHO6BtDubHqnj044aK74+4jaO2LmfYmNp7v5j3iu3uA0bTI9buigfJZ7mAV
	bGq5HSo5lOUk6t218e78AzRivg8nBXCa5bVcjmiHi7piMzHv916Zmwf4RpV0WGTVMwqh+hz2GWV9p
	LtUU2sGQEVwKh0F3Vme3YNcfL4Xr7BToaY5+vk0DelYv1+HnDYeJWfCzqlG+bZhta6wspVzn3YJhY
	NCtHv0+lEx8c345rSiYoNQ7xhYL7aY2ho48HcmaE0dr/jgTPalgx1QsJ1Z2E9pfcU0uHe/mqECBvk
	pH1ysxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUvz-006NSS-QL; Mon, 16 May 2022 07:14:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUvx-006NQE-2B
 for linux-amlogic@lists.infradead.org; Mon, 16 May 2022 07:14:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id g17so1022431wrb.11
 for <linux-amlogic@lists.infradead.org>; Mon, 16 May 2022 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=zQsNNvUNi+z3KjnydWQZCY9VMHgpS2nBISZRem1ZpSM=;
 b=vG/J3EG4nIFFaIKEdNPZV0O+mo+pq//rR2qKLtQdzLDK92bNE3KRGzEqtPqMSQ3MGt
 5g45Mcf/8QFQx7o03NP5dXNIaDaMDoiaXT9i/4bh62p6jvEA8fNbuvSYVFKJxRflDRlZ
 M1ln9a2GoQraK/6fW8JKxzmpkTo7YIVCwYLohiczvkJRRq0T3jsAJ5HutJrdfXjKk0eB
 0he+v26QZ4F4brAdZVmHrOat4xGym01wm3/SjOtcfdsOK2U5sfEPhFvAWuqq0Uy+uQbj
 haXQ3ZRS6FnJumK4kI2YilQZrwZAd8N41PM/mTdVp2emI26gSVw4gHdR7S6gYnGvlDfp
 F+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zQsNNvUNi+z3KjnydWQZCY9VMHgpS2nBISZRem1ZpSM=;
 b=BYsOOK8jozSL0n1JOT+PAZFEGeaWxyD8Z+17YZlEHSNdWvVdHnMrvif8uoxvzi1vV7
 BHJivtU2K/BRcmlVxdO2bHgEgDAgRyPB81lKIWQE6QucJkjZDtyYZa2AxAMyA5jxawOQ
 jBG3F1sk/xiZYYk86T+KTo5dzWyiYheEWK1F+TBOu+L5x141E5CWH/NeQJRb1boqKMIv
 B7LndbIMp/kQ7Md9poKmvseEQ2bBj/49udL3qBpNt2AS4G/di8USemIHFy4wMBQFtbig
 a1gbiVvA0IMpfQm1vxqWC1O6Ng//sVsot/7UMuTeaub73LzLYazraAgMhsEccxIlUdqk
 nLKQ==
X-Gm-Message-State: AOAM5315QCLWqcrf9l4ENBJxOrfXd/UbWiQBseBC1gnOTGHiYREycLLz
 t6SB+9Bqw5q3hxRB4BiiSj+3E7CqWPqaIZdT
X-Google-Smtp-Source: ABdhPJyT80VIVYKakoVYMbo5yyYAJS5OFAiVAhpJg6cjylzXy0C/ppjROORvRHaZSdFn7EcshbfFpw==
X-Received: by 2002:adf:fb04:0:b0:20c:dcbb:95bc with SMTP id
 c4-20020adffb04000000b0020cdcbb95bcmr13130849wrr.393.1652685261581; 
 Mon, 16 May 2022 00:14:21 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a9c0:1a19:4204:1dc9?
 ([2001:861:44c0:66c0:a9c0:1a19:4204:1dc9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020adf8b0c000000b0020cdf6ecafbsm10730539wra.81.2022.05.16.00.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 00:14:20 -0700 (PDT)
Message-ID: <80bd164e-5ce9-7347-dc6b-39cef2da9df3@baylibre.com>
Date: Mon, 16 May 2022 09:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/meson: fix HDMI2 420 display mode selection logic
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20220515204412.2733803-1-adrian.larumbe@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220515204412.2733803-1-adrian.larumbe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_001425_182974_C6D2FA70 
X-CRM114-Status: GOOD (  19.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgoKT24gMTUvMDUvMjAyMiAyMjo0NCwgQWRyacOhbiBMYXJ1bWJlIHdyb3RlOgo+IENvbW1p
dCBlNjdmNjAzN2FlMWJlMzRiMmI2OCAoImRybS9tZXNvbjogc3BsaXQgb3V0IGVuY29kZXIgZnJv
bQo+IG1lc29uX2R3X2hkbWkiKSBpbnRyb2R1Y2VkIGEgbmV3IHdheSBvZiBjYWxjdWxhdGluZyB0
aGUgZGlzcGxheSdzIHBpeGVsCj4gY2xvY2suIEhvd2V2ZXIsIGl0IGxlYWRzIHRvIHRoZSB3cm9u
ZyB2YWx1ZSBiZWluZyByZWNrb25lZCBmb3IgT2Ryb2lkIE4yKwo+IGJvYXJkcywgd2hlcmUgY2xv
Y2sgZnJlcXVlbmN5IGlzIG5ldmVyIGhhbHZlZCB3aGVuIHRoZSBkaXNwbGF5J3MgdmlkZW9tb2Rl
Cj4gc3VwcG9ydHMgWUNCQ1I0MjAgb3V0cHV0IGZvcm1hdC4KClRoZSBjdXJyZW50IGxvZ2ljIGlz
IGRlc2lnbmVkIHRvIHNlbGVjdCBZVVY0MjAgZm9yOgotIEhETUkyIHNpbmtzIHdoZW4gdGhlIHNl
bGVjdGVkIG1vZGUgaXMgL29ubHkvIHl1NDIwCi0gbm9uLUhETUkyIHNpbmtzIHdoZW4gdGhlIHNl
bGVjdGVkIG1vZGUgaXMgL2Fsc28vIHl1djQyMAoKRm9yIHRoZSBsYXRlciwgaXQncyBtYWlubHkg
Zm9yIHByZS1IRE1JMiBUVnMgc3VwcG9ydGluZyA0a0AyNGh6LzMwSHogYnV0IGFsc28KNGtANjBI
eiBpbiB5dXY0MjAgbW9kZSwgdGhpcyBpcyBleHBvc2VkIHVzaW5nIHRoZSBkcm1fbW9kZV9pc180
MjBfYWxzbygpLgoKSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgeW91IHdhbnQgdG8gYWx3YXlz
IGVuYWJsZSB5dXY0MjAgd2hlbiBhIG1vZGUgL2Nhbi8KdXNlIHl1NDIwLCB3aGljaCBpcyBub3Qg
aG93IHRoZSBjb2RlIGlzIHdyaXR0ZW4gcmlnaHQgbm93LgoKVGhlIGN1cnJlbnQgY29kZSBjb2Rl
IHByaW9yaXRpemVzIFlVViB0aGVuIFJHQiBhbmQgNDQ0LT40MjI+NDIwIGluIGNhc2Ugb2YgWVVW
LAp0aGUgd2hlbiBhIEhETUkyIHNpbmsgaXMgY29ubmVjdGVkIGFuZCBzdXBwb3J0IDRrQDYwSHog
aW4gUkdCLCBZVVY0NDQgYW5kIFlVVjQyMCwKdGhlIGN1cnJlbnQgbG9naWMgd2lsbCBzZWxlY3Qg
NGtANjBIei1ZVVY0NDQgYmVjYXVzZSBpdCB0aGUgZGlyZWN0IG91dHB1dCAod2VsbApub3QgZXhh
Y3RseSwgdGhlIHBpcGVsaW5lIGlzIDEwYml0KSBvZiB0aGUgdmlkZW8gcGlwZWxpbmUgd2l0aCBu
byBjb2xvciBjb252ZXJzaW9uCmluIHRoZSBtaWRkbGUuCgpJZiB5b3Ugd2FudCB0byBpbnRyb2R1
Y2UgZGlmZmVyZW50IGJ1cyBmb3JtYXQgcHJpb3JpdHksIHlvdSBzaG91bGQgdGhlbgphZGQgSERN
SSBjb250ZW50IHR5cGUsIG9yIG5vbl9kZXNrdG9wIGNvbm5lY3RvciBjb25uZWN0b3IgcHJvcGVy
dGllcy4KCk5vdCB0aGlzIHNob3VsZCBiZSBkb25lIGluIG1lc29uIGRyaXZlciBhbmQgZHctaGRt
aS4KCk5laWwKCj4gCj4gRml4IHRoZSBzZWxlY3Rpb24gbG9naWMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQWRyacOhbiBMYXJ1bWJlIDxhZHJpYW4ubGFydW1iZUBjb2xsYWJvcmEuY29tPgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyB8IDIgKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X2hkbWkuYwo+IGluZGV4IDVjZDJiMmViYmJkMy4uNmM5NjQwZjRjODJl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gQEAgLTM4MCw3ICsz
ODAsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcGh5X2luaXQoc3RydWN0IGR3X2hkbWkgKmhkbWks
IHZvaWQgKmRhdGEsCj4gICAJCQkgbW9kZS0+Y2xvY2sgPiAzNDAwMDAgPyA0MCA6IDEwKTsKPiAg
IAo+ICAgCWlmIChkcm1fbW9kZV9pc180MjBfb25seShkaXNwbGF5LCBtb2RlKSB8fAo+IC0JICAg
ICghaXNfaGRtaTJfc2luayAmJgo+ICsJICAgIChpc19oZG1pMl9zaW5rICYmCj4gICAJICAgICBk
cm1fbW9kZV9pc180MjBfYWxzbyhkaXNwbGF5LCBtb2RlKSkpCj4gICAJCW1vZGVfaXNfNDIwID0g
dHJ1ZTsKPiAgIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
