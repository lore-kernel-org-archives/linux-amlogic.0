Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07A4CCF9EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 20:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVpNAyVmdfM9cY5H8Zxv4SdfQiwxHicgoSif5YyKqUk=; b=GA3ZYB1RMpPeh2
	WLldfb66KgLvKpziDLxxcEVA0UZvzmHIwBgaZOi+NSimM74s87jVZb5D1XWghukn9ODGcB45hpjRI
	Bh8FimSzP80Y8OdbJICt/yRPnYbDnwuGo+DNBdAnuim9wrMYVo4A9eDYb5gvh+RV2jupqEqp3TQyd
	EjD+KJRN4JrYTyxrh34VFTrHt+ahh/EnwTpCInCgo+ATpg4lYHDLyxUkOA1TE/1MsSYqNxd42WbLz
	MMJZ03bcASJcRy7nCObcdcCaKCX/aPPrqeO+1V2Lnqlwc0Q5junv8CEPwE7HamXdkMJMqX8nPL9F1
	PxFUE3qVV7Tkzjv1dSJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stYLQ-00000006TKt-3SEF;
	Wed, 25 Sep 2024 20:10:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stYLN-00000006TKC-3V1k;
	Wed, 25 Sep 2024 20:10:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20aff65aa37so1694375ad.1;
        Wed, 25 Sep 2024 13:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727295037; x=1727899837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0Q4FugCe7sn8SMQy2y1X+wwncOJwqePtQZMDheIXf4=;
        b=bg7dEiz9ji7g6MU2uoO5r8Cecg65h2KHEhtoQkkJ5PooTrCFc6V+7v1H8oZCBgnaCB
         lDw02NIJvQbBXfmqHUvAjJyPM3IChw9d/3SahhmauzWgZTSZ7HX4SKu5jnSFAh6iPeu9
         brhBwJTDOzLzSew6S2+kIDlh9rUYOlWmTQivEemxnE93vlsj9Eo9vSJnjF3Tw5/YOsC/
         A5I8DerwW6XX/xYINIzk+gFkYr+Ob4tp0aYnYFyKHFUycCvVH0qICqRZeqQir0zJbZ8V
         zxvm3MB4yIyrgtO5T3r6Vj89adsGKwPlVR1M0WpZRyWl6MIyZYv5y/7uhNA0BRU831Eo
         +h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727295037; x=1727899837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0Q4FugCe7sn8SMQy2y1X+wwncOJwqePtQZMDheIXf4=;
        b=IdzPvHms2p2+tnleBIpvxlJlfsu+qyOEwXLPgusN2nqf3u9T/VoEEUC7l6eG6qvWUc
         LHRrxqanAsrVFptHt5jInHN0ZC7vY1OM8qjbx5mmAUzhxIoBOrvTyHZaYwZZ7B8ym2hJ
         b773oABmOe3IFp9JIdF4Nl+KAVRbE7srzhdD3c7Yw4NFgAYmY00dG25hlTFTX9NfT5sz
         EkFeoTOCsL1Zul6XldcX/Ftt88heDlKNegzhu8+RJu0naVMoAnoNYbY72ybTUf1L1Rw8
         QMf6Kq4qv01aWcjgxoOVXU282XcGGHeFP/uMuB3256Z2vCXwiJgI+hK9p3bQZmtTAH6u
         jUxA==
X-Forwarded-Encrypted: i=1; AJvYcCU47VkVyVs0487Wh+YDBcOBrpNgZjkLjKAAhUmXVIY+t4lggcdZhyBTO6yBs0eYc50PgxfP8py/bsMJHI9H@lists.infradead.org, AJvYcCUTYztEpYyn9OIuee93xQCMoYCLXlbb8iwGEKWTt8MwMdqyMZl01Cgh4pP9XQpKnN82vmO4xFitdSlQyFh1RhxSVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuvZ3jQW6ooII5s1O409BIAscDxFsg2NpV+Q+mgZ8/9J1+y0IE
	L7dqxfV06w5/L7UjDIZw2HSOvfeI3xuggXTh/edhBow9Uc15XMpvbyLwIopcb0ZZf9LCBc4JpF0
	BMy6fK1UNsjdZAuq//fE+AQze/x/s2vhE
X-Google-Smtp-Source: AGHT+IGCOWvHWEUBxGxHoNzs8SQWmesgz6UsMD49z3Jmcc4GwM6UD45zyniAE253U3751P7pVRLYxBPXbonaOjby/mw=
X-Received: by 2002:a17:902:d4c6:b0:205:7e3f:9e31 with SMTP id
 d9443c01a7336-20afc6429a0mr39006245ad.60.1727295036833; Wed, 25 Sep 2024
 13:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <bd0b8d63-f543-480e-85b4-2b8cec178c38@linaro.org> <20240910151600.18659-1-abelova@astralinux.ru>
In-Reply-To: <20240910151600.18659-1-abelova@astralinux.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 22:10:25 +0200
Message-ID: <CAFBinCCVL5idjip8NtDTimid+H0xmoMT1807SBj0-dFaH+hbkQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: switch to a managed drm device
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_131037_921560_25F8D6CD 
X-CRM114-Status: GOOD (  20.02  )
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

SGkgQW5hc3Rhc2lhLAoKdGhhbmsgeW91IGZvciBwaWNraW5nIHRoaXMgdXAgYW5kIGFwb2xvZ2ll
cyBmb3IgbXkgbGF0ZSByZXBseS4KCk9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDU6MTfigK9QTSBB
bmFzdGFzaWEgQmVsb3ZhIDxhYmVsb3ZhQGFzdHJhbGludXgucnU+IHdyb3RlOgpbLi4uXQo+IEBA
IC0yMTUsNyArMjEwLDcgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfYmluZF9tYXN0ZXIoc3RydWN0
IGRldmljZSAqZGV2LCBib29sIGhhc19jb21wb25lbnRzKQo+ICAgICAgICAgcmVncyA9IGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUocGRldiwgInZwdSIpOwo+ICAgICAgICAg
aWYgKElTX0VSUihyZWdzKSkgewo+ICAgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKHJlZ3Mp
Owo+IC0gICAgICAgICAgICAgICBnb3RvIGZyZWVfZHJtOwo+ICsgICAgICAgICAgICAgICBnb3Rv
IHJlbW92ZV9lbmNvZGVyczsKY2FuJ3Qgd2UganVzdCByZXR1cm4gUFRSX0VSUihyZWdzKSBoZXJl
IHNpbmNlIGFsbCByZXNvdXJjZXMgYWJvdmUgYXJlCm5vdyBhdXRvbWF0aWNhbGx5IGZyZWUgKGFz
IHRoZXkgYXJlIGRldm1fKiBtYW5hZ2VkKT8KCj4gICAgICAgICB9Cj4KPiAgICAgICAgIHByaXYt
PmlvX2Jhc2UgPSByZWdzOwo+IEBAIC0yMjMsMTMgKzIxOCwxMyBAQCBzdGF0aWMgaW50IG1lc29u
X2Rydl9iaW5kX21hc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMp
Cj4gICAgICAgICByZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVT
T1VSQ0VfTUVNLCAiaGhpIik7Cj4gICAgICAgICBpZiAoIXJlcykgewo+ICAgICAgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOwo+IC0gICAgICAgICAgICAgICBnb3RvIGZyZWVfZHJtOwo+ICsgICAg
ICAgICAgICAgICBnb3RvIHJlbW92ZV9lbmNvZGVyczsKc2FtZSBoZXJlLCBjYW4ndCB3ZSBqdXN0
IHJldHVybiAtRUlOVkFMIGRpcmVjdGx5PwoKPiAgICAgICAgIH0KPiAgICAgICAgIC8qIFNpbXBs
eSBpb3JlbWFwIHNpbmNlIGl0IG1heSBiZSBhIHNoYXJlZCByZWdpc3RlciB6b25lICovCj4gICAg
ICAgICByZWdzID0gZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShy
ZXMpKTsKPiAgICAgICAgIGlmICghcmVncykgewo+ICAgICAgICAgICAgICAgICByZXQgPSAtRUFE
RFJOT1RBVkFJTDsKPiAtICAgICAgICAgICAgICAgZ290byBmcmVlX2RybTsKPiArICAgICAgICAg
ICAgICAgZ290byByZW1vdmVfZW5jb2RlcnM7CmFsc28ganVzdCByZXR1cm4gLUVBRERSTk9UQVZB
SUwgZGlyZWN0bHkKCj4gICAgICAgICB9Cj4KPiAgICAgICAgIHByaXYtPmhoaSA9IGRldm1fcmVn
bWFwX2luaXRfbW1pbyhkZXYsIHJlZ3MsCj4gQEAgLTIzNywxOCArMjMyLDE4IEBAIHN0YXRpYyBp
bnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBoYXNfY29t
cG9uZW50cykKPiAgICAgICAgIGlmIChJU19FUlIocHJpdi0+aGhpKSkgewo+ICAgICAgICAgICAg
ICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJDb3VsZG4ndCBjcmVhdGUgdGhlIEhISSByZWdtYXBc
biIpOwo+ICAgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKHByaXYtPmhoaSk7CmVpdGhlciBy
ZXR1cm4gUFRSX0VSUihwcml2LT5oaGkpIGhlcmUgb3IgY29udmVydCB0aGUgZGV2X2VyciB0bwpk
ZXZfZXJyX3Byb2JlIGFuZCByZXR1cm4gaXQncyB2YWx1ZQoKPiAtICAgICAgICAgICAgICAgZ290
byBmcmVlX2RybTsKPiArICAgICAgICAgICAgICAgZ290byByZW1vdmVfZW5jb2RlcnM7Cj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIHByaXYtPmNhbnZhcyA9IG1lc29uX2NhbnZhc19nZXQoZGV2KTsK
PiAgICAgICAgIGlmIChJU19FUlIocHJpdi0+Y2FudmFzKSkgewo+ICAgICAgICAgICAgICAgICBy
ZXQgPSBQVFJfRVJSKHByaXYtPmNhbnZhcyk7Cj4gLSAgICAgICAgICAgICAgIGdvdG8gZnJlZV9k
cm07Cj4gKyAgICAgICAgICAgICAgIGdvdG8gcmVtb3ZlX2VuY29kZXJzOwpyZXR1cm4gUFRSX0VS
Uihwcml2LT5jYW52YXMpOwoKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0gbWVzb25fY2Fu
dmFzX2FsbG9jKHByaXYtPmNhbnZhcywgJnByaXYtPmNhbnZhc19pZF9vc2QxKTsKPiAgICAgICAg
IGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgIGdvdG8gZnJlZV9kcm07Cj4gKyAgICAgICAgICAg
ICAgIGdvdG8gcmVtb3ZlX2VuY29kZXJzOwptZXNvbl9jYW52YXNfYWxsb2MoKSBpcyB0aGUgZmly
c3Qgbm9uIGRldm1fKiBtYW5hZ2VkIGFsbG9jYXRpb24uCnNvIHRoaXMgaXMgdGhlIGxhc3QgdGlt
ZSB3ZSBjYW4gc2ltcGx5ICJyZXR1cm4gcmV0OyIsIHN0YXJ0aW5nIHdpdGgKdGhlIG5leHQgZXJy
b3IgY2FzZSB3ZSBuZWVkIGdvdG8gZm9yIGNsZWFuaW5nIHVwIHJlc291cmNlcy4KCj4gICAgICAg
ICByZXQgPSBtZXNvbl9jYW52YXNfYWxsb2MocHJpdi0+Y2FudmFzLCAmcHJpdi0+Y2FudmFzX2lk
X3ZkMV8wKTsKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9j
YW52YXNfb3NkMTsKKHN0YXJ0aW5nIGZyb20gaGVyZSB0aGUgZ290byBmcmVlXy4uLiBpcyBuZWVk
ZWQgYW5kIHRoaXMgb25lIGlzCmFjdHVhbGx5IGFscmVhZHkgY29ycmVjdCkKCj4gQEAgLTI2MSw3
ICsyNTYsNyBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9iaW5kX21hc3RlcihzdHJ1Y3QgZGV2aWNl
ICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMpCj4KPiAgICAgICAgIHByaXYtPnZzeW5jX2lycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4KPiAtICAgICAgIHJldCA9IGRybV92Ymxhbmtf
aW5pdChkcm0sIDEpOwo+ICsgICAgICAgcmV0ID0gZHJtX3ZibGFua19pbml0KCZwcml2LT5kcm0s
IDEpOwo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBmcmVlX2NhbnZh
c192ZDFfMjsKPgo+IEBAIC0yODQsMTAgKzI3OSwxMCBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9i
aW5kX21hc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMpCj4gICAg
ICAgICByZXQgPSBkcm1tX21vZGVfY29uZmlnX2luaXQoZHJtKTsKPiAgICAgICAgIGlmIChyZXQp
Cj4gICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9jYW52YXNfdmQxXzI7Cj4gLSAgICAgICBkcm0t
Pm1vZGVfY29uZmlnLm1heF93aWR0aCA9IDM4NDA7Cj4gLSAgICAgICBkcm0tPm1vZGVfY29uZmln
Lm1heF9oZWlnaHQgPSAyMTYwOwo+IC0gICAgICAgZHJtLT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZt
ZXNvbl9tb2RlX2NvbmZpZ19mdW5jczsKPiAtICAgICAgIGRybS0+bW9kZV9jb25maWcuaGVscGVy
X3ByaXZhdGUgPSAmbWVzb25fbW9kZV9jb25maWdfaGVscGVyczsKPiArICAgICAgIHByaXYtPmRy
bS5tb2RlX2NvbmZpZy5tYXhfd2lkdGggPSAzODQwOwo+ICsgICAgICAgcHJpdi0+ZHJtLm1vZGVf
Y29uZmlnLm1heF9oZWlnaHQgPSAyMTYwOwo+ICsgICAgICAgcHJpdi0+ZHJtLm1vZGVfY29uZmln
LmZ1bmNzID0gJm1lc29uX21vZGVfY29uZmlnX2Z1bmNzOwo+ICsgICAgICAgcHJpdi0+ZHJtLm1v
ZGVfY29uZmlnLmhlbHBlcl9wcml2YXRlID0gJm1lc29uX21vZGVfY29uZmlnX2hlbHBlcnM7Cj4K
PiAgICAgICAgIC8qIEhhcmR3YXJlIEluaXRpYWxpemF0aW9uICovCj4KPiBAQCAtMzA4LDkgKzMw
Myw5IEBAIHN0YXRpYyBpbnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRl
diwgYm9vbCBoYXNfY29tcG9uZW50cykKPiAgICAgICAgICAgICAgICAgZ290byBleGl0X2FmYmNk
Owo+Cj4gICAgICAgICBpZiAoaGFzX2NvbXBvbmVudHMpIHsKPiAtICAgICAgICAgICAgICAgcmV0
ID0gY29tcG9uZW50X2JpbmRfYWxsKGRldiwgZHJtKTsKPiArICAgICAgICAgICAgICAgcmV0ID0g
Y29tcG9uZW50X2JpbmRfYWxsKGRldiwgJnByaXYtPmRybSk7Cj4gICAgICAgICAgICAgICAgIGlm
IChyZXQpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRybS0+ZGV2LCAiQ291
bGRuJ3QgYmluZCBhbGwgY29tcG9uZW50c1xuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZGV2X2Vycihwcml2LT5kcm0uZGV2LCAiQ291bGRuJ3QgYmluZCBhbGwgY29tcG9uZW50c1xuIik7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgLyogRG8gbm90IHRyeSB0byB1bmJpbmQgKi8KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBoYXNfY29tcG9uZW50cyA9IGZhbHNlOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gZXhpdF9hZmJjZDsKanVzdCBiZWxvdyB0aGlzIHdlIGhhdmU6
CiAgICByZXQgPSBtZXNvbl9lbmNvZGVyX2hkbWlfcHJvYmUocHJpdik7CiAgICBpZiAocmV0KQog
ICAgICAgIGdvdG8gZXhpdF9hZmJjZDsKSSB0aGluayB0aGlzIGlzIHRoZSBwbGFjZSB3aGVyZSB3
ZSBuZWVkIHRvIGNhbGwgY29tcG9uZW50X3VuYmluZF9hbGwsCnNvIHdlIG5lZWQgc29tZSBraW5k
IG9mICJnb3RvIHVuYmluZF9jb21wb25lbnRzOyIgaGVyZS4KQWxsIG90aGVyICJnb3RvIGV4aXRf
YWZiY2Q7IiBiZWxvdyB3aWxsIG5lZWQgdG8gYmUgY29udmVydGVkIHRvICJnb3RvCnVuYmluZF9j
b21wb25lbnRzOyIgKG9yIHdoaWNoZXZlciBuYW1lIHlvdSBjaG9vc2UpIGFzIHdlbGwuCgpBbHNv
IHRoZSBvcmRlcmluZyB3aGVyZSBjb21wb25lbnRfdW5iaW5kX2FsbCgpIGlzIGluY29ycmVjdC4g
SXQncyBiZWVuCmluY29ycmVjdCBldmVuIGJlZm9yZSB5b3VyIHBhdGNoIC0gYnV0IG1heWJlIG5v
dyBpcyB0aGUgcmlnaHQgdGltZSB0bwpjbGVhbiBpdCB1cD8KCkkgaGFkIHRvIGRvdWJsZSBjaGVj
ayBiZWNhdXNlIEkgd2FzIHN1cnByaXNlZCBhYm91dCB0aGUgY2FsbHMgdG8KbWVzb25fZW5jb2Rl
cl97Y3Zicyxkc2ksaGRtaX1fcmVtb3ZlKHByaXYpOwpJdCB0dXJucyBvdXQgdGhhdCBpdCdzIHNh
ZmUgdG8gY2FsbCB0aGVzZSB0aHJlZSBmdW5jdGlvbnMgYXQgYW55IHRpbWUKYmVjYXVzZSB0aGV5
IG9ubHkgZXZlciBkbyBzb21ldGhpbmcgaWYgdGhlaXIgX3Byb2JlKCkgY291bnRlcnBhcnQgaGFz
CmJlZW4gY2FsbGVkLgoKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
