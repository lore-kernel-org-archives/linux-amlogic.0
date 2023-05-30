Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0305C77B73
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1yK7otpS1fsTdlVykR0qp+bt6UAWI5RD+iH6TWiOt0=; b=bwsV3OFU5gDSw+
	VQTzmoaS4gdEIwjdr3JfcOLPbAyWupPNMgyc7Y+1ZiO9wriU665TSRQhk3YYWRA5FzDI8tn036SNU
	8ZEfrTAi8BphtUkjulklxUt588W4uuamL8tmf9ICIiYvnNJM1Ls2kYAPEYrPtS9qST5OPrhbFNmgg
	C7ifXX5/7XXQ0+AWajNH3ALBCjjHiMzcbwfwO8GeDG11lrd7F02oFELlU3SYh4nKX65I13xbB52/m
	MGNQTOvgmQ8XogW2WMWgYS7XnxTu4onUNq0BpOueHSm8fskfyhLPNMFNgTXLCyJ2E2yK1dK8PoZAy
	2xtrOjMVN68SeG9JPU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45RN-00F2V7-1M;
	Tue, 30 May 2023 19:55:33 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45RL-00F2TS-0j;
	Tue, 30 May 2023 19:55:32 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5147f5efeb5so8158600a12.0;
        Tue, 30 May 2023 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685476527; x=1688068527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JosYzEY1lGmppLDev48gkCgWxDTfd3euZCE7PWnGECE=;
        b=JRMxSf2z2l5ohNt0RMgYCYxWjbyqpDdm1OrbpPj43wHx4EBfg1PjnEt9XDhLl9nwIS
         jMOsDOPB6K3tKj7imM/7qXNSCr69jY0ngoXTrHdI6pn3ItphR4sLe2+POS3Mw/Mltmey
         1f7/+oTEhumsfTLYumWWb26roMeyb+JoxfysZ2q0nm/GHAhZfp7KoKR/l7PdLZ0j30hn
         +dDsVpOAc0kCrbrGIcjGUlbkIZMLjN3zjdwQX8zsflGGMjEQYfyjIaTvTocfKaPY8wSe
         Z97RtyYlmM4r1mpbMSm/x0TCIzz/d2I8tatGJSZU9h2ylaZ9w4Ii3bLPRUM49TlQOwHL
         HdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476527; x=1688068527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JosYzEY1lGmppLDev48gkCgWxDTfd3euZCE7PWnGECE=;
        b=W6zRAvwVKHaU7lVj10NEg3jY6JsU79vq3qjNWop5YmOwpikYA5cAqhh0pNLPmy5m5U
         Zj7bjxO7+JLtXG/VsqrK19rmg1L0zhR9nKZKRBpGnuG7a61L0HKG5W2sTl1kJ5yD9/UE
         WiMPT6YCLKEbp6NuDI5D5LJ1QUASomTMIwQVdpmYyikDGlpZ7dM8zyqQ+AOirJb8J42d
         k9xXHzI2tTUMbamVk3tKuUfTKqKsXVdLb9EAQWHjrezQPPmIxveYHIO63RCwcA9YYHE+
         Fxg5M6dvgGCezyookUS44UEDC1MwnsBYy4f5bT2WTVIBMtoF8pHEGk5JXpV8gGqJF4Z4
         CEMQ==
X-Gm-Message-State: AC+VfDwE2MQSsJP0+OLpddddF7OoY+lt/QDyrpEn2pfCskTu88W81F8+
	auxNSHHszF7fdmcLcfT7qliG5u51EeVJ8xPsoxM=
X-Google-Smtp-Source: ACHHUZ4P8r71ifJ+3o1ntKGm5WKvUQG9mQEAudtmzYAquTKx6MuMQE9ysPL3S5YD6wpSRL7NZm6o//GZQRb4UWb/U9Y=
X-Received: by 2002:a17:907:318d:b0:961:69a2:c8d6 with SMTP id
 xe13-20020a170907318d00b0096169a2c8d6mr3858560ejb.69.1685476527225; Tue, 30
 May 2023 12:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
 <20230517133309.9874-6-ddrokosov@sberdevices.ru> <CAFBinCC3kQ9Nz3R2W-Qj9tbPJfS8JsB_4AkmPgS6xpQ96DBy2w@mail.gmail.com>
 <20230522130033.a47vlybocme66rev@CAB-WSD-L081021> <CAFBinCAk9+Km3BssA8d8nc_Z_GbhY87FD3qQRpZ2k7ChKt7TBg@mail.gmail.com>
 <20230530-illusive-pushpin-1e35d0a50e0d@wendy> <20230530160334.z6sclbmqccs6ju4y@CAB-WSD-L081021>
In-Reply-To: <20230530160334.z6sclbmqccs6ju4y@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 30 May 2023 21:55:16 +0200
Message-ID: <CAFBinCCZcT=7BZsgXDjzbcqAZpEkKYZRBDRwDX1poWZHa9Hxdg@mail.gmail.com>
Subject: Re: [PATCH v15 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Conor Dooley <conor.dooley@microchip.com>, jbrunet@baylibre.com, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_125531_262680_ACDEAF85 
X-CRM114-Status: GOOD (  22.08  )
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

SGksCgpPbiBUdWUsIE1heSAzMCwgMjAyMyBhdCA2OjAz4oCvUE0gRG1pdHJ5IFJva29zb3YgPGRk
cm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ClsuLi5dCj4gPiBJZiBJIGFtIHVuZGVyc3Rh
bmRpbmcgY29ycmVjdGx5LCB0aGlzIHNlcmllcyBpbXBsZW1lbnRzIHRoZSBjaGlsZAo+ID4gY29u
dHJvbGxlciBhbmQgYSBwYXJlbnQsIHdoaWNoIGlzIHVuaW1wbGVtZW50ZWQsIHByb3ZpZGVzIHRo
ZSBjaGlsZCB3aXRoCj4gPiBzeXNfcGxsX2RpdjE2Lgo+ID4gVGhlIHRoaW5nIEkgYW0gbWlzc2lu
ZyBpcyB3aGV0aGVyIHRoZSBjaGlsZCBjb250cm9sbGVyIGhhcyBzb21lIG91dHB1dHMKPiA+IHRo
YXQgZGVwZW5kIG9uIHRoaXMgc3lzX3BsbF9kaXYxNiBpbnB1dCAmIHdoZXRoZXIgdGhvc2UgYXJl
IGRvY3VtZW50ZWQKPiA+IGluIHRoaXMgc2VyaWVzLiBSZWdhcmRsZXNzLCB5b3Ugc2hvdWxkIGJl
IGFibGUgdG8gYWRkIG1vcmUgb3V0cHV0IGNsb2Nrcwo+ID4gd2l0aG91dCBjb21wYXRpYmlsaXR5
IGlzc3Vlcy4KQ29ub3IsIHRoZSBzaG9ydCBhbnN3ZXIgaXMgeWVzLCB0aGUgImdlbl9zZWwiIG11
eCAoc2VlIHBhdGNoIDYvNiBmcm9tCnRoaXMgc2VyaWVzLCB3aGljaCBpcyB0aGVuIHBhcnQgb2Yg
YSBjbG9jayB0cmVlIHRoYXQncyBhbiBvdXRwdXQgb2YKdGhlIHBlcmlwaGVyYWwgY2xvY2sgY29u
dHJvbGxlcikgdXNlcyBzeXNfcGxsX2RpdjE2IGFzIGlucHV0LgpEbWl0cnkgZ29lcyBpbnRvIG1v
cmUgZGV0YWlscyBiZWxvdy4KClsuLi5dCj4gQXMgZm9yIG5ldyBpbnB1dCBjbG9jayBjb25uZWN0
aW9ucywgc3VjaCBhcyB0aGUgY3B1X2Nsb2NrCj4gKHN5c19wbGxfZGl2MTYpLCB0aGVzZSBhcmUg
aGFuZGxlZCBieSBjbG9jayBtdXhpbmcgYWJzdHJhY3Rpb24sIGFsbG93aW5nCj4gQ0NGIHRvIGZp
bmQgdGhlIGNsb2NrIG9iamVjdCBieSBmdy5uYW1lIGFuZCByZXR1cm5pbmcgLUVOT0VOVCBpZiB0
aGUKPiBjb25uZWN0aW9uIGlzIG1pc3Npbmcgd2l0aG91dCBicmVha2luZyBhbnkgQ0NGIGZsb3cu
IEl0IGhhcHBlbnMgaW4gdGhlCj4ga2VybmVsIGZ1bmN0aW9uIGNsa19jb3JlX2ZpbGxfcGFyZW50
X2luZGV4KCkKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNl
L2RyaXZlcnMvY2xrL2Nsay5jI0w0MjQKPiBEZXNwaXRlIG5vdCBoYXZpbmcgdGhlIGNvbm5lY3Rp
b24gZm9yIHRoZSBuZXcgaW5wdXQgaW4gdGhlIG9sZCBEZXZpY2UKPiBUcmVlIHZlcnNpb24sIHRo
aXMgd2lsbCBub3QgYnJlYWsga2VybmVsIGJvb3QgZmxvdyBhbmQgd29ya2Zsb3csIGFuZCB0aGUK
PiBuZXcgY2xvY2sgb2JqZWN0IGp1c3Qgd291bGQgbm90IGJlIHV0aWxpemVkLgo+Cj4gQmFzZWQg
b24gdGhlIHByZXNlbnRlZCBhcmd1bWVudHMsIEkgZnVsbHkgYWdyZWUgd2l0aCBKZXJvbWUncyBw
b3NpdGlvbi4KPiBXZSBjYW4gYWRkIG5ldyBjb25uZWN0aW9ucyBhbmQgb2JqZWN0cyBpbiBuZXcg
ZHJpdmVyIHZlcnNpb25zLCBidXQgdGhlaXIKPiByZW1vdmFsIGlzIHByb2hpYml0ZWQuCj4KPiBJ
ZiBpdCdzIGFscmlnaHQgd2l0aCB5b3UsIEkgd291bGQgcHJlZmVyIHRvIGtlZXAgdGhlIFBlcmlw
aGVyYWxzIGFuZCBQTEwKPiBjbG9jayBkcml2ZXIgYW5kIHRoZWlyIGJpbmRpbmdzIGFzIHRoZXkg
YXJlLCBhbmQgY29udGludWUgd2l0aCB0aGUgQ1BVCj4gYW5kIEF1ZGlvIGNsb2NrIGNvbnRyb2xs
ZXJzIGluIGEgc2VwYXJhdGUgcGF0Y2ggc2VyaWVzLiBXb3VsZCB0aGF0IGJlCj4gZmVhc2libGUg
Zm9yIHlvdT8KVG8gbWUgdGhpcyBzb3VuZHMgZ29vZCEKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
