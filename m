Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F4C5475B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Feb 2024 17:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfhO2Fe6gOCp8x31bsgVAGdzYWFPd0JkV6FXgfS4Sgk=; b=DCdpmVBMYViwdy
	SRk7jGTuf48BpRKwqvCL4OGXbfmVqI3DcEgnt/5nHs7tDdbPV0nS1Gzqnw7p1jISwNMBYeoEM2gh0
	LgVj5oegPKHU4k8GDVraxf05TSkuv/GtFllCqRgsqUjGwKeS/0zNmbxBs+XhRGQfuBU//i/O4btNC
	Pq3ywPa8dP3JdxyB5M5Rd5ru1Ox/UfId80cbQpOXZjvyGZ1epyRl/fq/61xxLsSL3ai66t9/m/feq
	3Y+daUmHPoH6oYC7f2qcD9XE9Nlfl1x7OOeEb5PlE/qNGt73gRtCEqB+omHDEC0WiPi77FmetVF6o
	074g9R4R3f1mAA7M24lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTek-0000000FaGQ-27bQ;
	Tue, 20 Feb 2024 17:11:46 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTeh-0000000FaFB-1j7I
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Feb 2024 17:11:45 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d24a727f78so11027731fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Feb 2024 09:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708449101; x=1709053901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBsPYOj4o/oYmqjND5mUcKc/lhfqBms3nMBFQ3ab9hc=;
        b=q1wCnPsvnNm1r44OCJbq0QhzRkEjLqs+qL+aWrfi3t276xbGSvlD0y6uzRgdmGzpVf
         uddo3PV0d+/jJrWPdPA5XjBa7+OvR0KZD50nocKUFM0oEnLnKwuu3YLOGUVROuxWOhva
         GpVUcGHGTQ+XMOLL8u6mjop4Kb0bVLo7AnxWcU+q7Xkt3xgSzK6/xipgAtl9dQA1MT9E
         Z/f6ToZz8iNVSfoaZXmkQC+fMfRUiThrnQQZRUcx3QcU8r9bobJgaXNTcE6RAaS4MczH
         2QVxx24gm7aljpKUELrUYkf+en2WJ2Xr0FSW9yIgn3JV6jAKOIQ52orjhLXNusHyJkVT
         AzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708449101; x=1709053901;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EBsPYOj4o/oYmqjND5mUcKc/lhfqBms3nMBFQ3ab9hc=;
        b=mnQwie7yC6dDF0aNObvzRppZawazJfCn//AYoWYhDB1wcaRFlJAd/u98KRdJegXN58
         liiAUJQKYFI1/3i/qBG7XwblbLRZutnOkdXT6Ex8Gm6rrow3MDrXO6GsqJGMLSWZ31zn
         i+YJ3/JaMbv69tyJ2CexIPjrg28HDx27S3a97DKfQG3FLXLg/y5j2Y+fEsvBWSQnnm3S
         yK5wVXHVQCuKqzNZ8m/6S60xtYPSHqLMvPjEU8eRZoUCWXf3KY+J8bFVHx4/KHobHq4H
         J5FCCoMwylqyDDMolWzeVcDXiMJG/Q2rD1hFTsBRb2KOS+ywk0asMKLfzNNcq6GSA0XK
         OVmw==
X-Forwarded-Encrypted: i=1; AJvYcCWeuC42D0l38zaRYK2U1sk1XIwzkx+HQWM+3F9KK/cqslQQbKXZcOOfAJPlQdT+o0GYNr45y+mKJMdVCQXfWy8sxe4j4FhBCXEhbx4lHnPJuPQ=
X-Gm-Message-State: AOJu0YwieJ0ZKvBc9eEaPNhPTNZhTwyDVYdmL2BX045ZDi10gBi1vSEe
	eAJpseBdPy6Q/DvTeaowOSZx8feu+VpGXfTnGOd4VNU6oHWcMYM4KYSdNCS59tA=
X-Google-Smtp-Source: AGHT+IE/S89tnO2LtN3j67GoQbINgLpjDYN7UkNP8HnGtOyZ+toxAR93pnkI/lei8Z5htDwisVq8kQ==
X-Received: by 2002:a2e:3e1a:0:b0:2d2:39a5:d190 with SMTP id l26-20020a2e3e1a000000b002d239a5d190mr5615387lja.1.1708449101050;
        Tue, 20 Feb 2024 09:11:41 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2f02:c7d6:1af5:7c37])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm4828605wrf.68.2024.02.20.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 09:11:40 -0800 (PST)
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-5-jbrunet@baylibre.com>
 <pqnl66xnct5lqua36iasqws4kowhqtn6vkq7fml76pomcnatj4@q66n3siflgoc>
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
Subject: Re: [PATCH v4 4/6] pwm: meson: use device data to carry information
 around
Date: Tue, 20 Feb 2024 18:10:59 +0100
In-reply-to: <pqnl66xnct5lqua36iasqws4kowhqtn6vkq7fml76pomcnatj4@q66n3siflgoc>
Message-ID: <1jcysrdpro.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_091143_481457_32BD223E 
X-CRM114-Status: GOOD (  25.21  )
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

Ck9uIE1vbiAwNSBGZWIgMjAyNCBhdCAxODoxMiwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MTY6NTJQTSArMDEwMCwgSmVyb21l
IEJydW5ldCB3cm90ZToKPj4gVXNlIHN0cnVjdCBkZXZpY2UgZGF0YSB0byBjYXJyeSB0aGUgaW5m
b3JtYXRpb24gZGF0YSBhcm91bmQsIGluc3RlYWQKPj4gb2YgZW1iZWRkZWQgdGhlIHB3bSBzdHJ1
Y3R1cmUgaW4gaXQgYW5kIHVzaW5nIGNvbnRhaW5lcl9vZigpCj4+IAo+PiBEb2luZyBzbyB3b3Jr
cyBqdXN0IGFzIHdlbGwgYW5kIG1ha2VzIGl0IGEgbGl0dGxlIGVhc2llciB0byBhZGQgc2V0dXAK
Pj4gY2FsbGJhY2sgZGVwZW5kaW5nIG9uIHRoZSBEVCBjb21wYXRpYmxlLgo+PiAKPj4gU2lnbmVk
LW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4+IC0tLQo+PiAg
ZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxNiBkZWxl
dGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2Ry
aXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+IGluZGV4IGVmNTBjMzM3ZjQ0NC4uMTVjNDQxODVkNzg0
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiArKysgYi9kcml2ZXJz
L3B3bS9wd20tbWVzb24uYwo+PiBAQCAtMTAxLDcgKzEwMSw2IEBAIHN0cnVjdCBtZXNvbl9wd21f
ZGF0YSB7Cj4+ICB9Owo+PiAgCj4+ICBzdHJ1Y3QgbWVzb25fcHdtIHsKPj4gLQlzdHJ1Y3QgcHdt
X2NoaXAgY2hpcDsKPj4gIAljb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2RhdGEgKmRhdGE7Cj4+ICAJ
c3RydWN0IG1lc29uX3B3bV9jaGFubmVsIGNoYW5uZWxzW01FU09OX05VTV9QV01TXTsKPj4gIAl2
b2lkIF9faW9tZW0gKmJhc2U7Cj4+IEBAIC0xMTQsNyArMTEzLDcgQEAgc3RydWN0IG1lc29uX3B3
bSB7Cj4+ICAKPj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IG1lc29uX3B3bSAqdG9fbWVzb25fcHdt
KHN0cnVjdCBwd21fY2hpcCAqY2hpcCkKPj4gIHsKPj4gLQlyZXR1cm4gY29udGFpbmVyX29mKGNo
aXAsIHN0cnVjdCBtZXNvbl9wd20sIGNoaXApOwo+PiArCXJldHVybiBkZXZfZ2V0X2RydmRhdGEo
Y2hpcC0+ZGV2KTsKPj4gIH0KPj4gIAo+PiAgc3RhdGljIGludCBtZXNvbl9wd21fcmVxdWVzdChz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20pCj4+IEBAIC0xNDYs
NiArMTQ1LDcgQEAgc3RhdGljIGludCBtZXNvbl9wd21fY2FsYyhzdHJ1Y3QgbWVzb25fcHdtICpt
ZXNvbiwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPj4gIAkJCSAgY29uc3Qgc3RydWN0IHB3bV9z
dGF0ZSAqc3RhdGUpCj4+ICB7Cj4+ICAJc3RydWN0IG1lc29uX3B3bV9jaGFubmVsICpjaGFubmVs
ID0gJm1lc29uLT5jaGFubmVsc1twd20tPmh3cHdtXTsKPj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSBwd20tPmNoaXAtPmRldjsKPj4gIAl1bnNpZ25lZCBpbnQgY250LCBkdXR5X2NudDsKPj4gIAl1
bnNpZ25lZCBsb25nIGZpbl9mcmVxOwo+PiAgCXU2NCBkdXR5LCBwZXJpb2QsIGZyZXE7Cj4+IEBA
IC0xNjgsMTkgKzE2OCwxOSBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0cnVjdCBtZXNv
bl9wd20gKm1lc29uLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+PiAgCj4+ICAJZmluX2ZyZXEg
PSBjbGtfcm91bmRfcmF0ZShjaGFubmVsLT5jbGssIGZyZXEpOwo+PiAgCWlmIChmaW5fZnJlcSA9
PSAwKSB7Cj4+IC0JCWRldl9lcnIobWVzb24tPmNoaXAuZGV2LCAiaW52YWxpZCBzb3VyY2UgY2xv
Y2sgZnJlcXVlbmN5XG4iKTsKPj4gKwkJZGV2X2VycihkZXYsICJpbnZhbGlkIHNvdXJjZSBjbG9j
ayBmcmVxdWVuY3lcbiIpOwo+PiAgCQlyZXR1cm4gLUVJTlZBTDsKPj4gIAl9Cj4+ICAKPj4gLQlk
ZXZfZGJnKG1lc29uLT5jaGlwLmRldiwgImZpbl9mcmVxOiAlbHUgSHpcbiIsIGZpbl9mcmVxKTsK
Pj4gKwlkZXZfZGJnKGRldiwgImZpbl9mcmVxOiAlbHUgSHpcbiIsIGZpbl9mcmVxKTsKPj4gIAo+
PiAgCWNudCA9IGRpdl91NjQoZmluX2ZyZXEgKiBwZXJpb2QsIE5TRUNfUEVSX1NFQyk7Cj4+ICAJ
aWYgKGNudCA+IDB4ZmZmZikgewo+PiAtCQlkZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgInVuYWJs
ZSB0byBnZXQgcGVyaW9kIGNudFxuIik7Cj4+ICsJCWRldl9lcnIoZGV2LCAidW5hYmxlIHRvIGdl
dCBwZXJpb2QgY250XG4iKTsKPj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAJfQo+PiAgCj4+IC0J
ZGV2X2RiZyhtZXNvbi0+Y2hpcC5kZXYsICJwZXJpb2Q9JWxsdSBjbnQ9JXVcbiIsIHBlcmlvZCwg
Y250KTsKPj4gKwlkZXZfZGJnKGRldiwgInBlcmlvZD0lbGx1IGNudD0ldVxuIiwgcGVyaW9kLCBj
bnQpOwo+PiAgCj4+ICAJaWYgKGR1dHkgPT0gcGVyaW9kKSB7Cj4+ICAJCWNoYW5uZWwtPmhpID0g
Y250Owo+PiBAQCAtMTkxLDcgKzE5MSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2NhbGMoc3Ry
dWN0IG1lc29uX3B3bSAqbWVzb24sIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4+ICAJfSBlbHNl
IHsKPj4gIAkJZHV0eV9jbnQgPSBkaXZfdTY0KGZpbl9mcmVxICogZHV0eSwgTlNFQ19QRVJfU0VD
KTsKPj4gIAo+PiAtCQlkZXZfZGJnKG1lc29uLT5jaGlwLmRldiwgImR1dHk9JWxsdSBkdXR5X2Nu
dD0ldVxuIiwgZHV0eSwgZHV0eV9jbnQpOwo+PiArCQlkZXZfZGJnKGRldiwgImR1dHk9JWxsdSBk
dXR5X2NudD0ldVxuIiwgZHV0eSwgZHV0eV9jbnQpOwo+PiAgCj4+ICAJCWNoYW5uZWwtPmhpID0g
ZHV0eV9jbnQ7Cj4+ICAJCWNoYW5uZWwtPmxvID0gY250IC0gZHV0eV9jbnQ7Cj4+IEBAIC0yMTQs
NyArMjE0LDcgQEAgc3RhdGljIHZvaWQgbWVzb25fcHdtX2VuYWJsZShzdHJ1Y3QgbWVzb25fcHdt
ICptZXNvbiwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKPj4gIAo+PiAgCWVyciA9IGNsa19zZXRf
cmF0ZShjaGFubmVsLT5jbGssIGNoYW5uZWwtPnJhdGUpOwo+PiAgCWlmIChlcnIpCj4+IC0JCWRl
dl9lcnIobWVzb24tPmNoaXAuZGV2LCAic2V0dGluZyBjbG9jayByYXRlIGZhaWxlZFxuIik7Cj4+
ICsJCWRldl9lcnIocHdtLT5jaGlwLT5kZXYsICJzZXR0aW5nIGNsb2NrIHJhdGUgZmFpbGVkXG4i
KTsKPj4gIAo+PiAgCXNwaW5fbG9ja19pcnFzYXZlKCZtZXNvbi0+bG9jaywgZmxhZ3MpOwo+PiAg
Cj4+IEBAIC00MjUsMTAgKzQyNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtZXNvbl9wd21fbWF0Y2hlc1tdID0gewo+PiAgfTsKPj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIG1lc29uX3B3bV9tYXRjaGVzKTsKPj4gIAo+PiAtc3RhdGljIGludCBtZXNvbl9wd21faW5p
dF9jaGFubmVscyhzdHJ1Y3QgbWVzb25fcHdtICptZXNvbikKPj4gK3N0YXRpYyBpbnQgbWVzb25f
cHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IGRldmljZSAqZGV2KQo+PiAgewo+PiAgCXN0cnVjdCBj
bGtfcGFyZW50X2RhdGEgbXV4X3BhcmVudF9kYXRhW01FU09OX05VTV9NVVhfUEFSRU5UU10gPSB7
fTsKPj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtZXNvbi0+Y2hpcC5kZXY7Cj4+ICsJc3RydWN0
IG1lc29uX3B3bSAqbWVzb24gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4gIAl1bnNpZ25lZCBp
bnQgaTsKPj4gIAljaGFyIG5hbWVbMjU1XTsKPj4gIAlpbnQgZXJyOwo+PiBAQCAtNDM4LDcgKzQz
OCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMoc3RydWN0IG1lc29uX3B3
bSAqbWVzb24pCj4+ICAJCW11eF9wYXJlbnRfZGF0YVtpXS5uYW1lID0gbWVzb24tPmRhdGEtPnBh
cmVudF9uYW1lc1tpXTsKPj4gIAl9Cj4+ICAKPj4gLQlmb3IgKGkgPSAwOyBpIDwgbWVzb24tPmNo
aXAubnB3bTsgaSsrKSB7Cj4+ICsJZm9yIChpID0gMDsgaSA8IE1FU09OX05VTV9QV01TOyBpKysp
IHsKPj4gIAkJc3RydWN0IG1lc29uX3B3bV9jaGFubmVsICpjaGFubmVsID0gJm1lc29uLT5jaGFu
bmVsc1tpXTsKPj4gIAkJc3RydWN0IGNsa19wYXJlbnRfZGF0YSBkaXZfcGFyZW50ID0ge30sIGdh
dGVfcGFyZW50ID0ge307Cj4+ICAJCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKPj4g
QEAgLTUxOSwyOCArNTE5LDM1IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHMo
c3RydWN0IG1lc29uX3B3bSAqbWVzb24pCj4+ICBzdGF0aWMgaW50IG1lc29uX3B3bV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgewo+PiAgCXN0cnVjdCBtZXNvbl9wd20g
Km1lc29uOwo+PiArCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsKPj4gIAlpbnQgZXJyOwo+PiAgCj4+
ICsJY2hpcCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmNoaXApLCBHRlBfS0VS
TkVMKTsKPj4gKwlpZiAoIWNoaXApCj4+ICsJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICAJbWVz
b24gPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCptZXNvbiksIEdGUF9LRVJORUwp
Owo+PiAgCWlmICghbWVzb24pCj4+ICAJCXJldHVybiAtRU5PTUVNOwo+PiAgCj4+ICsJcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgbWVzb24pOwo+PiArCj4+ICAJbWVzb24tPmJhc2UgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4+ICAJaWYgKElTX0VSUihtZXNv
bi0+YmFzZSkpCj4+ICAJCXJldHVybiBQVFJfRVJSKG1lc29uLT5iYXNlKTsKPj4gIAo+PiAgCXNw
aW5fbG9ja19pbml0KCZtZXNvbi0+bG9jayk7Cj4+IC0JbWVzb24tPmNoaXAuZGV2ID0gJnBkZXYt
PmRldjsKPj4gLQltZXNvbi0+Y2hpcC5vcHMgPSAmbWVzb25fcHdtX29wczsKPj4gLQltZXNvbi0+
Y2hpcC5ucHdtID0gTUVTT05fTlVNX1BXTVM7Cj4+ICsJY2hpcC0+ZGV2ID0gJnBkZXYtPmRldjsK
Pj4gKwljaGlwLT5vcHMgPSAmbWVzb25fcHdtX29wczsKPj4gKwljaGlwLT5ucHdtID0gTUVTT05f
TlVNX1BXTVM7Cj4+ICAKPj4gIAltZXNvbi0+ZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YSgmcGRldi0+ZGV2KTsKPj4gIAo+PiAtCWVyciA9IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzKG1l
c29uKTsKPj4gKwllcnIgPSBtZXNvbl9wd21faW5pdF9jaGFubmVscygmcGRldi0+ZGV2KTsKPj4g
IAlpZiAoZXJyIDwgMCkKPj4gIAkJcmV0dXJuIGVycjsKPj4gIAo+PiAtCWVyciA9IGRldm1fcHdt
Y2hpcF9hZGQoJnBkZXYtPmRldiwgJm1lc29uLT5jaGlwKTsKPj4gKwllcnIgPSBkZXZtX3B3bWNo
aXBfYWRkKCZwZGV2LT5kZXYsIGNoaXApOwo+PiAgCWlmIChlcnIgPCAwKQo+PiAgCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBlcnIsCj4+ICAJCQkJICAgICAiZmFpbGVkIHRvIHJl
Z2lzdGVyIFBXTSBjaGlwXG4iKTsKPgo+IFBhcnRzIG9mIHRoaXMgY2hhbmdlIG92ZXJsYXAgd2l0
aCBwbGFucyBJIGhhdmUgZm9yIHRoaXMgZHJpdmVyLiBJCgpJdCBkb2VzIG92ZXJsYXAgaW5kZWVk
LiBJJ2xsIGRyb3AgdGhpcyBvbmUgd2hpbGUgcmViYXNpbmcKCj4gcmV3b3JrZWQgdGhlIHNlcmll
cyBhIGJpdCBub3csIGFsc28gYWZmZWN0aW5nIHRoZSBtZXNvbiBkcml2ZXIsIHRoZQo+IHByZXZp
b3VzIHN1Ym1pc3Npb24gaXMgYXZhaWxhYmxlIGF0Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcHdtL2JmNmY3YzYyNTMwNDFmNjBlZThmMzViNWM5YzllOGQ1OTUzMzJmYjAuMTcwNjE4
MjgwNS5naXQudS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlCj4KPiBJIGRvbid0IHNlZSB0
aGUgbmljZSBiZW5lZml0IG9mIHRoaXMgcGF0Y2ggeWV0LCBidXQgSSBhc3N1bWUgdGhpcyB3aWxs
Cj4gYmVjb21lIGNsZWFyZXIgd2hlbiBJIGNoZWNrIHRoZSBuZXh0IHBhdGNoLgo+Cj4gQmVzdCBy
ZWdhcmRzCj4gVXdlCgoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
