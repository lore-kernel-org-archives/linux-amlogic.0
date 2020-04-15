Return-Path: <SRS0=3iKr=57=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B14EC2BA19
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 07:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B18820768
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 07:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ondwe35G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yK6dX17+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B18820768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYU2hWHXDyVsidf8VykmnXjCwmJ0Yfi7fvdZpk96rKY=; b=Ondwe35Gv7tpu9
	Q02cTl1uR4P51pvGlsxlVnwGLNv9AMSmMJ/I4ul9cNYAV0aiZJsXk2dhivxR4Xt+E8SGUr4pudQoP
	ThfVOHsjRiJqK8vQi7Oh4nUETxQB53EefZGUuNu6WZ3lp/VcHi0YrNTrMivCwP7u8ftYZS4IdCFwL
	0VZgjjaOQoF3YIQRUqY3JeNcQaIqHhFs04UmmJtF8XZEaWP1LWempjmY+aNtCuXDdrDdV2sV2y8PM
	EY8tVrMApLJLQvhc3Z9dMWvfXW2qXW/GC2ijrx8fphvXyLJ3bE67LVvC35Uv5JZPiCVtZvSPnQtBR
	1rvk48ePaKpeS/UzQyZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOcub-00029c-NS; Wed, 15 Apr 2020 07:56:45 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOcuY-00028s-RD
 for linux-amlogic@lists.infradead.org; Wed, 15 Apr 2020 07:56:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id a201so17356778wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2020 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pSd8qbiYbAtfmst7OijulRMd3WJ5z01ypkQKLIZqZok=;
 b=yK6dX17+cvwnbEKilDfvRJgPysqPQaOhqOcDFnUWTwNTUcNlmft+jOZNDi292ntJ2l
 kj8MhwLARdLFZQKHh3vGVp8pk4X5eSRG7mpvhl9Gb1ncGcdh5wPScau0bBXWJRcizTkW
 YioEbcc+FfUtG7ehev32FVJAwfe17MnWO6TJgD4LRwjj0ThJPgtxI9iHU5CcXmobSssd
 j71TTX//G1saATx+Znj6E1Q5og5FR/Y6P6VELlqA1x8O4FO9kJlnZefTggiQsrpsNs6J
 ZMoViK/0WPcIZDWIQLZRE+70NvkJdbfBxXS+4zXAvJu+2FUMgCrIeRK28CnH0BoFyirJ
 kEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pSd8qbiYbAtfmst7OijulRMd3WJ5z01ypkQKLIZqZok=;
 b=kQHaEqFUGlKEuq54Nut7dVk8UzKwLu7EwsuKj23RD/CZ/Y9c6nvQXC7hbecFKf+9Qw
 GCymxd9sAY2Ha3+OkTbNbArftLQsAq9QwGwnH4zDR0mLXx20hsRGs50x5ElmKVkQnemY
 0jwXGsYBnF8MPd3R+HNG2dIoGjLV1luBI0y+vza9mHGT8lo5XOfeF9AlvDzzMwx28t6R
 O/LMQC6aKhOTBHjEsgd6xX2Hm15ZNqkr3/q/f/XLCW+lw13xUtZhlU8KoIuUSybfdsWB
 dJ9e+RdM3bU1+X0YtJLppVGF04cEzpqTITSp40yShpLM2wLBMwo9Qas2+kumim3iKJbo
 Hxgw==
X-Gm-Message-State: AGi0PuanDet0JNSIbsgcMrmbBTF3uzfUE22Z3aUEp32BXt6ovR3d6FCz
 1PDXvAN36ssp/Odn8s2XQqsF2A==
X-Google-Smtp-Source: APiQypJKOCIwnWh8GtFBc++8oLUPehct2YypJMuYQcUh6XPplOHdyOE52LPU3ioZ9kxnxcghDzsaVg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr1910534wmj.130.1586937401352; 
 Wed, 15 Apr 2020 00:56:41 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56?
 ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id k14sm22764484wrp.53.2020.04.15.00.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 00:56:40 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Delete an error message in meson_dw_hdmi_bind()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>
References: <76f24122-4d3f-7670-9f06-edb4731a0661@web.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <54e0b6e4-4a39-c567-7355-2b2330a95294@baylibre.com>
Date: Wed, 15 Apr 2020 09:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <76f24122-4d3f-7670-9f06-edb4731a0661@web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_005642_880628_A18DF516 
X-CRM114-Status: GOOD (  18.44  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAwNS8wNC8yMDIwIDEzOjIzLCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPiBGcm9tOiBN
YXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gRGF0ZTogU3Vu
LCA1IEFwciAyMDIwIDEzOjEzOjAzICswMjAwCj4gCj4gVGhlIGZ1bmN0aW9uIOKAnHBsYXRmb3Jt
X2dldF9pcnHigJ0gY2FuIGxvZyBhbiBlcnJvciBhbHJlYWR5Lgo+IFRodXMgb21pdCBhIHJlZHVu
ZGFudCBtZXNzYWdlIGZvciB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nIGluIHRoZQo+IGNhbGxpbmcg
ZnVuY3Rpb24uCj4gCj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2Np
bmVsbGUgc29mdHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJp
bmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fZHdfaGRtaS5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMK
PiBpbmRleCBlOGM5NDkxNWE0ZmMuLjY0Y2I2YmE0YmM0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX2R3X2hkbWkuYwo+IEBAIC0xMDM0LDEwICsxMDM0LDggQEAgc3RhdGljIGludCBt
ZXNvbl9kd19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0
ZXIsCj4gIAkJcmV0dXJuIFBUUl9FUlIoZHdfcGxhdF9kYXRhLT5yZWdtKTsKPiAKPiAgCWlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLQlpZiAoaXJxIDwgMCkgewo+IC0JCWRldl9l
cnIoZGV2LCAiRmFpbGVkIHRvIGdldCBoZG1pIHRvcCBpcnFcbiIpOwo+ICsJaWYgKGlycSA8IDAp
Cj4gIAkJcmV0dXJuIGlycTsKPiAtCX0KPiAKPiAgCXJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRl
ZF9pcnEoZGV2LCBpcnEsIGR3X2hkbWlfdG9wX2lycSwKPiAgCQkJCQlkd19oZG1pX3RvcF90aHJl
YWRfaXJxLCBJUlFGX1NIQVJFRCwKPiAtLQo+IDIuMjYuMAo+IAoKTWlzc2luZyBGaXhlcyB0YWcs
IGJ1dCBJJ2xsIGFwcGx5IG5ldmVydGhlbGVzczoKRml4ZXM6IDNmNjhiZTdkOGU5NiAoImRybS9t
ZXNvbjogQWRkIHN1cHBvcnQgZm9yIEhETUkgZW5jb2RlciBhbmQgRFctSERNSSBicmlkZ2UgKyBQ
SFkiKQoKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
