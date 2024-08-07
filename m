Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F17AC3DA7F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxoiCKb9ghTvNUTJTcKHYkVYnYivk1aoPswFyNk3zdU=; b=Ar8rr07iHQYvyQ
	HlWtuj4gAxqGJvB2BE1qNZq1wGEGEtsk27CPjWQ3VGGoKJalwUVDi/zzrI3va1fpbH8IT20BXGPP4
	8ybgFyD2Mwd2r6FtDRmrkQBGr7VD9oJuVP5FwQNZITTsm7HAaoRfebwq3Cj2ScYLMk6+Dpp9xOzVX
	ImtVcHKWh4cv7ZHsjFozfKPaMIpFaNn/fA5Wrg4m9gUV3ow5MsZ+/RPSPP9AHCZP/GC9fAEw8gt7l
	sMVV3adkiLf31dxzQEn5zsPK2hSf8dbIBkxalB+nwrJVguETRxUexaX9/hCeaPpP4qxxHjkFzAZxV
	PfxKvV319n0UmF0nIefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbcmC-00000004VPm-3Hde;
	Wed, 07 Aug 2024 09:16:12 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbcj1-00000004UTP-1bcQ
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 09:12:58 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso15898121fa.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2024 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723021973; x=1723626773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXJcefWBGwCjqo+n8nUM/WZjz4KUu6Dr7gpS34TWtOM=;
        b=qxb/v0/oJ9FJkrJ0Y8qyW+9fUwHHqaToxTnGj3n+PdZpePXF+L3IRVP54IFZ/GLIWO
         UDwpib4uisZEMzK8vtvfG2RXN2MA6Fzs8jp07DmVgSzqLitPAUaYGWjI0R4P7JV34/Wt
         K8hBwXG8Kha6wuwMwj+wdy+un4I/QbjRc2Isr8l6YWK4sRxKDU5HVQZ8tePTiUBcqkl/
         QqPKUYkTBHw7FOqkmeWZDZ5B0Id8YYwZQTldQoaC8YrNpUvw8UC0vEIWga0rbw/Y98Tf
         SicS0z3RKLmJujDeRHj78a9GjOpfUYHMej/r+7iWbSkr6zKI8MEazxPVAeo8qMWNh9sR
         xerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021973; x=1723626773;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXJcefWBGwCjqo+n8nUM/WZjz4KUu6Dr7gpS34TWtOM=;
        b=Q7awCKz3bmKGHhcfIz72mJZ1XfiY6X8+JoxwMZfCVKkG0Qh61C3fEvsbv71lpofIyq
         D7RiiNnOSCVIeOCpu0NsC21cwW6FOGryAqs08O25l74Pvp41tsBMDAnU04Nt4MWNesy8
         EiB6s9+9C2K9fsZXHSBJfMhUj3Tlm2qtVUqEAsv/FWuZC7oamZ+oJwLjqt+UDZoPO5qJ
         HXnGqBzrW7eKHFgIEbZRFwhl7v4GAEqFy+7H4IsDES9vhYyE54QSN4RyWhK9uG6DP4XD
         o9XoK23z+ciUO77IuZKwB7/jOZ6RmkTEBl0/iXsKDS9q+BEgFosh5d+Jn3ZG+5/6FbXK
         hgww==
X-Forwarded-Encrypted: i=1; AJvYcCUpSvIP7ZOXpu7g2I2GOUAV+wCVffGFtiCxmey4RnaH7WVAPG4pcrTGQ/f7B5/+xoVuL/QYz3UzMjN4OlUHfk9HpGV8Me23TgFAeL50CqOFyQg=
X-Gm-Message-State: AOJu0YzCY4pRK55UK5eKaqUE5KPXJYTF3ByOLso5VdpHosNcm28ICi0W
	KCEmblehNLisJjPHM3N9QQW4sXOTvD+ISVWtq628u/teRa1tCMzDml1U58tMGxs=
X-Google-Smtp-Source: AGHT+IFQOHCltwKQCBXQPLStP2Dg6b510B5NipglQzmC2gXIAhpoliwnnvlnRgikWAIyVrNs5a43UQ==
X-Received: by 2002:a2e:91d0:0:b0:2ef:1c0f:d490 with SMTP id 38308e7fff4ca-2f15ab0c2a1mr126633751fa.39.1723021973213;
        Wed, 07 Aug 2024 02:12:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cbfaesm17923005e9.42.2024.08.07.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:12:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Kevin Hilman
 <khilman@baylibre.com>,  dri-devel@lists.freedesktop.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] drm/meson: dw-hdmi: use matched data
In-Reply-To: <CAFBinCAaZumGU6dOq0RrHRTQV=MejTJ=RW0P_6tQFOG9vybY6g@mail.gmail.com>
	(Martin Blumenstingl's message of "Tue, 6 Aug 2024 23:03:25 +0200")
References: <20240730125023.710237-1-jbrunet@baylibre.com>
	<20240730125023.710237-8-jbrunet@baylibre.com>
	<CAFBinCAaZumGU6dOq0RrHRTQV=MejTJ=RW0P_6tQFOG9vybY6g@mail.gmail.com>
Date: Wed, 07 Aug 2024 11:12:52 +0200
Message-ID: <1j5xsczoff.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_021255_468519_86DCC5E2 
X-CRM114-Status: GOOD (  20.84  )
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

T24gVHVlIDA2IEF1ZyAyMDI0IGF0IDIzOjAzLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGkgSmVyb21lLAo+Cj4gT24g
VHVlLCBKdWwgMzAsIDIwMjQgYXQgMjo1MOKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5
bGlicmUuY29tPiB3cm90ZToKPiBbLi4uXQo+PiArICAgICAgIH0sIHsKPj4gKyAgICAgICAgICAg
ICAgIC5saW1pdCA9IDI5NzAwMCwKPj4gKyAgICAgICAgICAgICAgIC5yZWdzID0gZ3hiYl8zZ19y
ZWdzLAo+PiArICAgICAgICAgICAgICAgLnJlZ19udW0gPSBBUlJBWV9TSVpFKGd4YmJfM2dfcmVn
cykKPiBKdXN0IGFzIGEgc2lkZS1ub3RlOiB0aGlzIGxvb2tlZCBvZGQgd2hlbiByZWFkaW5nIGZv
ciB0aGUgZmlyc3QgdGltZQo+IGFzIEkgdGhvdWdodCB0aGF0IGl0J3MgYSB0eXBvIChhbmQgaXQg
c2hvdWxkIGJlIGd4YmJfMmc5N19yZWdzIC0gYnV0Cj4gdGhhdCBuYW1lIGlzIG5vdCB1c2VkKS4K
Ckkga25vdyBpdCBsb29rcyBvZGQgYnV0IHRoZXJlIGlzIGEgKHBlcmhhcHMgc2lsbHkpIHJlYXNv
biBmb3IgaXQuCgpUaGUgbmFtZXMgYXJlIGRlcml2ZWQgZnJvbSBQSFkgbW9kZXMgdXNlZCBpbiB0
aGUgQW1sb2dpYyB2ZW5kb3IgdHJlZS4KVGhvc2UgYXJlIG1hZ2ljIHBva2VzIGFuZCB3ZSBkb24n
dCByZWFsbHkga25vdyBhbnl0aGluZyBhYm91dCBpdC4gVGhlCnZlbmRvciB0cmVlIG9mdGVuIHVw
ZGF0ZSBhbmQgbWFpbmxpbmUgZG9lcyBub3QgYWx3YXlzIGZvbGxvdy4gSSBrbm93CnRoYXQgd2Ug
YXJlIG5vdCAxMDAlIGFsaWduZWQgcmlnaHQgbm93LiBObyBvbmUga25vd3Mgd2hhdCBicmFuY2gg
aXMgdGhlCnJlZmVyZW5jZSB0byBmb2xsb3cgYW55d2F5LgoKVXNpbmcgdGhlIHNhbWUgbmFtZXMg
aXMgd2F5IHRvIGxlYXZlIGJyZWFkY3J1bWJzIHRoYXQgbWF5IGhlbHAgcGVvcGxlCmxpbmtpbmcg
dGhpcyB0byB2ZW5kb3IgY29kZSBsYXRlciBvbiAoaWYgbmVjZXNzYXJ5KQoKSSB0aGluayB0aGUg
bW9kZXMgYXJlIG5hbWVkIGFmdGVyIHRoZSAocm91bmRlZCkgYmFuZHdpZHRoIHRoZXkgcHJvdmlk
ZSwKbm90IG5lY2Vzc2FyaWx5IHRoZSBsaW1pdCB3ZSBhcmUgdXNpbmcgdG8gcGljayBpdCAuLi4g
ZXhjZXB0IGZvciBkZWYsCndoaWNoIG1pZ2h0IGp1c3QgbWVhbiAnZGVmYXVsdCcgSSBndWVzcy4K
Cmh0dHBzOi8vZ2l0aHViLmNvbS9raGFkYXMvbGludXgvYmxvYi9raGFkYXMtdmltcy01LjQueS9k
cml2ZXJzL2FtbG9naWMvbWVkaWEvdm91dC9oZG1pdHgvaGRtaV90eF8yMC9ody9od19nMTJhLmMj
TDU4OQoKSSBmb2N1c2VkIG9uIGtlZXBpbmcgbWFpbmxpbmUgYXMgaXQgd2FzIGZvciB0aGUgdmFs
dWUgcG9rZWQsIHJldGFpbmluZwphcyBtdWNoIGluZm9ybWF0aW9uIGFzIHBvc3NpYmxlIHRvIGZp
bmQgb3VyIHdheSBiYWNrLgoKWW91ciBwcm9wb3NlZCBuYW1pbmcgY29udmVudGlvbiBpcyBmaW5l
IGJ5IG1lIGFzIHdlbGwuCgo+Cj4gWy4uLl0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25f
ZHdfaGRtaV9zcGVlZCBneGxfc3BlZWRzW10gPSB7Cj4+ICsgICAgICAgewo+PiArICAgICAgICAg
ICAgICAgLmxpbWl0ID0gMzcxMjUwLAo+PiArICAgICAgICAgICAgICAgLnJlZ3MgPSBneGxfM2c3
X3JlZ3MsCj4+ICsgICAgICAgICAgICAgICAucmVnX251bSA9IEFSUkFZX1NJWkUoZ3hsXzNnN19y
ZWdzKQo+PiArICAgICAgIH0sIHsKPj4gKyAgICAgICAgICAgICAgIC5saW1pdCA9IDI5NzAwMCwK
Pj4gKyAgICAgICAgICAgICAgIC5yZWdzID0gZ3hsXzNnX3JlZ3MsCj4+ICsgICAgICAgICAgICAg
ICAucmVnX251bSA9IEFSUkFZX1NJWkUoZ3hsXzNnX3JlZ3MpCj4+ICsgICAgICAgfSwgewo+PiAr
ICAgICAgICAgICAgICAgLmxpbWl0ID0gMTQ4NTAwLAo+PiArICAgICAgICAgICAgICAgLnJlZ3Mg
PSBneGxfZGVmX3JlZ3MsCj4+ICsgICAgICAgICAgICAgICAucmVnX251bSA9IEFSUkFZX1NJWkUo
Z3hsX2RlZl9yZWdzKQo+IHRoaXMgaXMgbm90IGNvbnNpc3RlbnQgd2l0aCB3aGF0IHdlIGhhdmUg
YWJvdmUgb3IgYmVsb3cgc28gaXQgZWl0aGVyCj4gbmVlZHMgdG8gYmUgdXBkYXRlZCBvciBhIGNv
bW1lbnQuCj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBjYWxsZWQgZ3hsXzFnNDhfcmVncwo+Cj4+
ICsgICAgICAgfSwgewo+PiArICAgICAgICAgICAgICAgLnJlZ3MgPSBneGxfMjcwbV9yZWdzLAo+
PiArICAgICAgICAgICAgICAgLnJlZ19udW0gPSBBUlJBWV9TSVpFKGd4bF8yNzBtX3JlZ3MpCj4g
YW5kIHRoaXMgc2hvdWxkIGJlIGNhbGxlZCBneGxfZGVmX3JlZ3MKCmRlZiBpbiBub3QgdGhlIGxh
c3Qgb25lLCBpdCBpcyBhbm90aGVyIG5hbWUgdXNlZCBieSBBTUwKCkl0IHNvIGhhcHBlbnMgdGhh
dCBvbiBtYWlubGluZSB3aXRoIHdlIGhhdmUgb25seSBwdXQgdGhlIFNELzI3ME0gZm9yCmd4bC4g
SW4gdGhlIEFNTCB0cmVlLCBpdCBkb2VzIGV4aXN0IGZvciBHMTIgdG9vLiBNYXliZSBpdCB3aWxs
IGJlIG5lZWRlZCBzb21lZGF5LgoKPgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgotLSAK
SmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
