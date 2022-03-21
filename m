Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D736C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Mar 2022 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9EAIizGJmPMRuK9iKkl+P/nhWxpYhgPa8oIvpQQhS4=; b=Dibhns9syuoAiI
	R0RNSMXXxNk4yhOCVzFtoSlh2Dz1HRWL3TGmkPmBly7YW2yHOVivShsaUDbQu5cyicCqwVXDW/Cul
	wcQY137RnRneFvD+Bl3B2odPmO+avkejaLtBI4PFwqRfHlImCUeXvOyD8MzGgYm8cthKRz6mF+ydY
	ldS7gMMlpFo+Z6P9W/488JUeRDxAryQcbSPCMnVd52LsnbdOmbjcCvVSAlDsgv2PwyjinFuOgiG1h
	pkpBfzrWDTCZtwItoune2ak7nGZp32w84Dm+RozEO4nlUoQWvip8tNg5i9O6TYdPxrkzG8o3PFruB
	hDmaWLh6vqtNcjoAE6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWD9b-006yWA-2v; Mon, 21 Mar 2022 08:12:39 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWD9P-006yT3-8x; Mon, 21 Mar 2022 08:12:28 +0000
Received: by mail-qv1-f47.google.com with SMTP id ke15so1989679qvb.11;
 Mon, 21 Mar 2022 01:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wICsFIN9ZJuas+sxL7xNcM8ZFAXB8Ijif9RKrDeIc3o=;
 b=tTv/hf7XPaqGTrlbqd2nkrnBo+OmrVUVQ6OVLEs9oG7Ert1o2NvICOCYcstsKidzqr
 SktQo5+sWUiz9phYKyAnfGHUTGd1f3q8XmnnFnf5eLon1i39rPe14nuNWN//7jc36FrL
 gLo70KVnUkGyNyTz/AqoQoLiRlmri37/VKDoOA8Th2tmpwdF5HqMub1dakCJdhpO6PDu
 6Ry9npHkDyHMaVsu9DuGuVFRbijbCX8dUHRtAGql7/6SKIc+AqGWHeTyq5c4tLgehPMp
 D/DgljNjhzwjVc2yTwd1pjAPAi1V1uHIZOrCY994AGITS63HFCHKdIP9sfsy4SZK+vQV
 rRkQ==
X-Gm-Message-State: AOAM532kzsB4bDcFXHF0izzAAXNn7PWsxb3qG/a2gEXrO3T0e3eU4tPg
 aSZto0RtDsnhFqRfni8bGZGh04zu+NOaOw==
X-Google-Smtp-Source: ABdhPJzMZ55eNUJ3Yimi5EZoTRxyLI2wbF0qZnPeXqFCC7ISL4P5Sc5zbhJNkVik+a/O/ID57qr2Ig==
X-Received: by 2002:ad4:5ba3:0:b0:441:32c:767b with SMTP id
 3-20020ad45ba3000000b00441032c767bmr9221473qvq.9.1647850345975; 
 Mon, 21 Mar 2022 01:12:25 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05622a13ce00b002e1fd7e0e3bsm7993305qtk.14.2022.03.21.01.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 01:12:25 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2e612af95e3so34851237b3.9; 
 Mon, 21 Mar 2022 01:12:25 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr22987805ywb.132.1647850345315; Mon, 21
 Mar 2022 01:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
 <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
In-Reply-To: <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Mar 2022 09:12:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8iy4vMASuUgeQmjHdAMNzvCikwheyQO1-AQH0yYk0RQ@mail.gmail.com>
Message-ID: <CAMuHMdV8iy4vMASuUgeQmjHdAMNzvCikwheyQO1-AQH0yYk0RQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
To: Robin Murphy <robin.murphy@arm.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_011227_339122_A650830A 
X-CRM114-Status: GOOD (  25.16  )
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

SGkgUm9iaW4sCgpPbiBGcmksIE1hciAxOCwgMjAyMiBhdCA5OjUwIFBNIFJvYmluIE11cnBoeSA8
cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3RlOgo+IE9uIDIwMjItMDItMjUgMjE6MTMsIEhlaW5l
ciBLYWxsd2VpdCB3cm90ZToKPiA+IEFkZCBhIFlBTUwgc2NoZW1hIGJpbmRpbmcgZm9yIFRNMTYy
OCBhdXhkaXNwbGF5Cj4gPiAoNy8xMS1zZWdtZW50IExFRCkgY29udHJvbGxlci4KPiA+Cj4gPiBU
aGlzIHBhdGNoIGlzIHBhcnRpYWxseSBiYXNlZCBvbiBwcmV2aW91cyB3b3JrIGZyb20KPiA+IEFu
ZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4uCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIZWlu
ZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgoKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFu
bWVjLHRtMTYyOC55YW1sCgo+ID4gKwo+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gKyAgIl4u
KkBbMS03XSwoWzEtOV18MVswLTZdKSQiOgo+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+ICsgICAg
JHJlZjogL3NjaGVtYXMvbGVkcy9jb21tb24ueWFtbCMKPiA+ICsgICAgdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIFByb3BlcnRp
ZXMgZm9yIGEgc2luZ2xlIExFRC4KPiA+ICsKPiA+ICsgICAgcHJvcGVydGllczoKPiA+ICsgICAg
ICByZWc6Cj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAxLWJhc2Vk
IGdyaWQgbnVtYmVyLCBmb2xsb3dlZCBieSAxLWJhc2VkIHNlZ21lbnQgYml0IG51bWJlci4KPiA+
ICsgICAgICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiArICAgIHJlcXVpcmVkOgo+ID4gKyAgICAg
IC0gcmVnCj4KPiBJJ20gY29uY2VybmVkIHRoYXQgdGhpcyBsZWF2ZXMgdXMgbm8gcm9vbSB0byBz
dXBwb3J0IHRoZSBhZGRpdGlvbmFsCj4ga2V5cGFkIGZ1bmN0aW9uYWxpdHkgaW4gZnV0dXJlLiBI
YXZpbmcgbm93IGRvdWJsZS1jaGVja2VkIGEgZGF0YXNoZWV0LAo+IHRoZSBpbnB1dHMgYXJlIGFs
c28gYSB0d28tZGltZW5zaW9uYWwgbXV4IChzaGFyaW5nIHRoZSBzZWdtZW50IGxpbmVzKSwKPiBz
byB0aGUgZGV2aWNlIGVmZmVjdGl2ZWx5IGhhcyB0d28gZGlzdGluY3QgYnV0IG51bWVyaWNhbGx5
LW92ZXJsYXBwaW5nCj4gY2hpbGQgYWRkcmVzcyBzcGFjZXMgLSBvbmUgYWRkcmVzc2VkIGJ5IChn
cmlkLHNlZ21lbnQpIGFuZCB0aGUgb3RoZXIgYnkKPiAoc2VnbWVudCxrZXkpLgoKU291bmRzIHNp
bWlsYXIgdG8gSFQxNkszMz8KCj4gUm9iLCBLcnlzenRvZiwgYW55IHRob3VnaHRzIG9uIHRoZSBi
ZXN0IERUIGlkaW9tIHRvIGxlYXZlIGFjY29tbW9kYXRpb24KPiBmb3IgdGhhdD8gSSdtIHRoaW5r
aW5nIGVpdGhlciByZXF1aXJlIGFuIGludGVybWVkaWF0ZSBub2RlIHRvIGNvbnRhaW4KPiBlYWNo
IG5vdGlvbmFsIGFkZHJlc3Mgc3BhY2UsIG9yIHBlcmhhcHMgYWRkIGFub3RoZXIgbGVhZGluZyBh
ZGRyZXNzIGNlbGwKPiB0byBzZWxlY3QgYmV0d2VlbiB0aGVtPyBJIGRvbid0IGJlbGlldmUgYW55
IG9mIHRoZXNlIHRoaW5ncyBoYXZlIGZ1cnRoZXIKPiBmdW5jdGlvbmFsaXR5IGJleW9uZCB0aGF0
LgoKVGhlIHByb2JsZW0gd2l0aCB0aGVzZSBkZXZpY2VzIGlzIHRoYXQgdGhlcmUgYXJlIHRob3Vz
YW5kcyBvZiBkaWZmZXJlbnQKd2F5cyB0byB3aXJlIHRoZW0sIGFuZCBjb21pbmcgdXAgd2l0aCBh
IGdlbmVyaWMgd2lyaW5nIGRlc2NyaXB0aW9uIGluCkRUIGFuZCB3cml0aW5nIGNvZGUgdG8gaGFu
ZGxlIHRoYXQgY2FuIGJlIHZlcnkgaGFyZC4KCkZvciBIVDE2SzMzIG5vbi1kb3QtbWF0cml4IHdp
cmluZ3MsIEkganVzdCBhZGRlZCBleHRyYSBjb21wYXRpYmxlCnZhbHVlcyBtYXRjaGluZyB0aGUg
d2lyaW5nIG9mIGEgZmV3IGtub3duIGRldmljZXNbMV0uICBUaGF0IHdheSB0aGUKZHJpdmVyIGNh
biBoYW5kbGUgdGhlbSBlZmZpY2llbnRseS4KSXQgZG9lcyBoYXZlIHRoZSBkaXNhZHZhbnRhZ2Ug
dGhhdCBhZGRpbmcgc3VwcG9ydCBmb3IgbmV3IGRldmljZXMKbWVhbnMgaW50cm9kdWNpbmcgbW9y
ZSBjb21wYXRpYmxlIHZhbHVlcywgYW5kIGFkZGluZyBtb3JlIGNvZGUuCgpEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS9ob2x0ZWssaHQxNmszMy55YW1sCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
