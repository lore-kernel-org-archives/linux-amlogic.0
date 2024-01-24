Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5EDC46CD2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 10:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONPS1IGWEnWbKKtpZ2VHuRb71ZR/rQCsbo3kqSYG+vg=; b=W6OqPMbPEUzfmI
	cfd5Kio4kc4ug5sYlarNxf/9bepx/yuRVq2gsh4gVcj7gKhwz6x2fFs52WOhtoYb/obyr8IhxAFZE
	+TFbKpXj4+E8bRqsGv6WZn///1aeiqg1+EUJKVaN8hXEfARdZ6/caIsLLGUCMoCQ7XVXbKkQLsJY/
	srndZacmS3a6U9bG4hgfv7rpRDELL8tiT5K3CE9yV9XAzraybqo8ulYjJJRUToRJVdEhL1ZvQYjhK
	UUev/HBN9+I9+/ElA7NlRR5ldTHvldDwt5zJIBDUYyxVWwQB/6fbBfL0BY+/jBDEFZN3V4WmtGAWO
	+eoBNtWaolS3QqlKfyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSa6r-002Pqs-2x;
	Wed, 24 Jan 2024 10:03:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSa6n-002Pow-30
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 10:03:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so31371715e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jan 2024 02:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706090625; x=1706695425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylAoGxhXjDFqaYPg56D086JPamwyHBJVeEcnnDZC84g=;
        b=rFuZLmsSggfSpTEz7B/fvZCgUQ9T27enONZe6HYhGEm/MmYn/++nA3pluZu75bbRHm
         jkhkq8iS786elxYPkxZSZXQrEhDHlqwC6Q/S8n9/CJXQSCvNhHq9otu4ZrBkcMR8v83S
         vwKYhGapgV1nqDmcck8a0MWFQ+QJG7nyUt92LORE1dSD4V59ioQ3ur7PZ3erx6yFtH4u
         083uqsxKmm7xhvcxAgkP06vKkTCIgyIet6AYqaKEtL3/3E0yMDQtvzkThm/rCTbb4sT1
         qJ+S1RoF56k8PIMkNXsYJHX+yu63FGj8julnW+29U7sWHhkX8c/oOUHWLIomGsZj92no
         4R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706090625; x=1706695425;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylAoGxhXjDFqaYPg56D086JPamwyHBJVeEcnnDZC84g=;
        b=RoUXeGk0X17/4IPd3JcwhhVJv9JzDqZFH1RpfMPTn1X6i6vk8MwR4HvC1NWrCKP6WF
         iPv6DoCfRdFE4YQrK3mzh1A5y7e2v8FDiUpxDDCuEF9WvMBiLSVFhT3odSqaZg1eBFAs
         bahsYLuWX8GeDtSiBSyoUvLu2aTvbn7iuisZw56EWSUsTm0pinb1aqUwoLqyYJmh4WhJ
         WDjlcCwhUUUhVsymlzikNBXVoxE6TvyRbWKwsdWErKew39IATKNZLZLW3JGR0N/OyjSC
         e1CzuermYnttCbv/GjP63YO7Q5otp9fxzt7hWfipVl+0Qqqs65SdkONxjtuj9Li0Ce5E
         1w/A==
X-Gm-Message-State: AOJu0YyZEVz2qkpkDzfFqoC1c7OTA62J2KBoUNr5amc7eAltsTEMDssi
	k+haX2IRateGzTq87yOi5z14NYNlGm5IKFUTqcit8A029n5LEhoqRMFl21mlK34=
X-Google-Smtp-Source: AGHT+IHbyjH7B2GFBvJGGOPU1aqUewQxShHkvh6RyljGkkNcEOx7iIT+dYXvVczFG/zpv8jbH8B9yw==
X-Received: by 2002:a05:600c:a44:b0:40e:6710:c147 with SMTP id c4-20020a05600c0a4400b0040e6710c147mr1079130wmq.98.1706090624943;
        Wed, 24 Jan 2024 02:03:44 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d8b6:17b6:386f:c67b])
        by smtp.gmail.com with ESMTPSA id g4-20020a05600c310400b0040e88d1422esm25142441wmo.31.2024.01.24.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 02:03:44 -0800 (PST)
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-6-jbrunet@baylibre.com>
 <gyhea42rtydw3g45lfkfbxfm6xcbwibz67vw7xke2sm7powz2a@i33g4pyanu4l>
 <1jttn3w0ja.fsf@starbuckisacylon.baylibre.com>
 <jlrptw2norojxgpfmsybv6b5aq3epkdkqvri2l2rkvtx5qofjd@q4ggezt47a42>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Thierry Reding
 <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 5/6] pwm: meson: don't carry internal clock elements
 around
Date: Wed, 24 Jan 2024 10:59:43 +0100
In-reply-to: <jlrptw2norojxgpfmsybv6b5aq3epkdkqvri2l2rkvtx5qofjd@q4ggezt47a42>
Message-ID: <1jplxrvyin.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_020350_178339_438AD3D0 
X-CRM114-Status: GOOD (  21.85  )
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

Ck9uIFdlZCAyNCBKYW4gMjAyNCBhdCAxMDo0OCwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gSGVsbG8gSmVyb21lLAo+Cj4gT24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgMTA6MTY6
MTdBTSArMDEwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gT24gV2VkIDI0IEphbiAyMDI0IGF0
IDEwOjAyLCBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PiB3cm90ZToKPj4gPiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAxMjoxNjo1M1BNICswMTAwLCBK
ZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiA+PiBAQCAtNDQyLDYgKzQzOSwxMyBAQCBzdGF0aWMgaW50
IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gPj4gIAkJc3Ry
dWN0IG1lc29uX3B3bV9jaGFubmVsICpjaGFubmVsID0gJm1lc29uLT5jaGFubmVsc1tpXTsKPj4g
Pj4gIAkJc3RydWN0IGNsa19wYXJlbnRfZGF0YSBkaXZfcGFyZW50ID0ge30sIGdhdGVfcGFyZW50
ID0ge307Cj4+ID4+ICAJCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKPj4gPj4gKwkJ
c3RydWN0IGNsa19kaXZpZGVyICpkaXY7Cj4+ID4+ICsJCXN0cnVjdCBjbGtfZ2F0ZSAqZ2F0ZTsK
Pj4gPj4gKwkJc3RydWN0IGNsa19tdXggKm11eDsKPj4gPj4gKwo+PiA+PiArCQltdXggPSBkZXZt
X2t6YWxsb2MoZGV2LCBzaXplb2YoKm11eCksIEdGUF9LRVJORUwpOwo+PiA+PiArCQlpZiAoIW11
eCkKPj4gPj4gKwkJCXJldHVybiAtRU5PTUVNOwo+PiA+Cj4+ID4gSSBkb24ndCBsaWtlIHRoaXMg
Y2hhbmdlLiBXaGlsZSBpdCBkb2Vzbid0IGluY3JlYXNlIHRoZSBtZW1vcnkgdXNlZCwgaXQKPj4g
PiBmcmFnbWVudHMgdGhlIHVzZWQgbWVtb3J5IGFuZCBpbmNyZWFzZXMgdGhlIG92ZXJoZWFkIG9m
IG1lbW9yeQo+PiA+IG1hbmFnZW1lbnQgYW5kIHRoZSBudW1iZXIgb2YgZGV2bSBhbGxvY2F0aW9u
cy4KPj4gPgo+PiA+IEFyZSB0aGVzZSBtZW1iZXJzIG9mIG1lc29uX3B3bV9jaGFubmVsIGluIHRo
ZSB3YXkgZm9yIGFueXRoaW5nIGxhdGVyPwo+PiAKPj4gTm90IHJlYWxseS4gSXQgaXMganVzdCBu
b3QgdXNlZnVsIG9uIHRoZSBTb0NzIHdoaWNoIGRvIHVzZSBpdCBhbmQgbm90Cj4+IHVzZWQgYXQg
YWxsIHN0YXJ0aW5nIGZyb20gczQvYTEuCj4KPiBUaGlzIHJlbWVtYmVycyBtZSBhYm91dCB0aGUg
b2xkIHB3bS1pbXggZHJpdmVyLiBUaGlzIHdhcyBlc3NlbnRpYWxseSBhCj4gc2luZ2xlIGZpbGUg
Y29udGFpbmluZyB0d28gZHJpdmVycyBqdXN0IGJlY2F1c2UgYm90aCB0eXBlcyBhcHBlYXJlZCBv
bgo+IGlteCBtYWNoaW5lcy4gTGF0ZXIgaXQgd2FzIHNwbGl0IGludG8gaW14MSBhbmQgaW14Mjcu
Cj4KPiBJIGRpZG4ndCBsb29rIGF0IHRoZSByZWxldmFudCBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRo
ZSBleGlzdGluZyBkcml2ZXIKPiBhbmQgdGhlIGNoYW5nZXMgbmVlZGVkIGZvciBzNCwgYnV0IHBs
ZWFzZSBkb24ndCByZXBlYXQgdGhpcyBpc3N1ZSBmb3IKPiBtZXNvbi4gTm90IHN1cmUgdGhpcyBm
ZWFyIGlzIGp1c3RpZmllZCwganVzdCBzYXlpbmcgLi4uCgpOb3RlZC4gRG9uJ3Qgd29ycnkuIHM0
IGlzIGluZGVlZCB0aGUgc2FtZSBQV00gYmxvY2sgYXMgYmVmb3JlLCBqdXN0Cm11eC9kaXYvZ2F0
ZSBtaWdyYXRlZCBmcm9tIHRoZSBwd20gSVAgdG8gdGhlIG1haW4gY2xrIGNvbnRyb2xsZXIuClRo
YXQncyBhbGwgLi4uIEkga25vdyA7KQoKT25seSB0aGUgY2xvY2sgcmVnaXN0cmF0aW9uIHNob3Vs
ZCBjaGFuZ2UgYW5kIHNpbXBsaWZ5LgoKPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKCi0tIApKZXJv
bWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
