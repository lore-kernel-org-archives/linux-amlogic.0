Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8806AC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Feb 2022 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPZAKEM7bXJITRyL1z/Bqvu24Mq7G5XzVMb2iK8gVpw=; b=iL93t1d7j68doX
	Cmi35FniMNFo4R1/cj2IFvTis3PwO9hTLNqksbMP77XzIIxzy1RXFj4w3Y1mt1w7fkg1beuaU6Zjf
	QK5rZDz+JJ7DKA3IMakjZORxtt8roXnfDVVE7uXdaeKS7+igCeaKjAh9wcbhTIClEVgTKe5jWnC0n
	Km7ho7sLwB0t72KzoeuhuGFTfjeoiCgClIyIU4sAPO4D0O1ok5Mwx5tVl/eOo26LlifxbnOvNOjrk
	yq8xKYPBME+pr6liqnnGlUs729/2Hc3pBMWXHpiEgFp+5ui8a4C8t2b5OgLJtThKsSv4EbX3YsuOY
	Lx2UnRz83HkMNH+mVTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFtnS-003kTS-0I; Fri, 04 Feb 2022 08:18:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFtnF-003kQG-0K
 for linux-amlogic@lists.infradead.org; Fri, 04 Feb 2022 08:18:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id s10so7237201wra.5
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Feb 2022 00:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HfHoyP2ABY9yW/Ao/Ah4oEqzly5C2xQEksuTsXyC+gM=;
 b=J7N82W8K3p0I29aXM6EtvyZx3jrhwgL4L5VxurdQNIDwquO0UshIpnxX1dhAWU06KX
 ICSE6ib6b/YMzbgflc7pf+rlqXl1+2bEqyynw2rQB5q9GoXo0pyPpJnUMAgGDRjXev0V
 nBpjMtUz3ZcVD5MIiIe0Es1WGw1HaOqubBwXxPwmycXS5y9Gp6rw46wUlHIavOuLkjj/
 KhKGzs30jdYYe3lTCLDmG+5Zv4EluuzMdCjsKkm+lZeXzD+ASrPWWvN8/fN4qPj8DVd2
 F7v779RhAQ//eVGZHq5g6pDXOVeuIGSxbTPkavAeym01c4zaIqRn49euF6+KJMYXps9Z
 uSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HfHoyP2ABY9yW/Ao/Ah4oEqzly5C2xQEksuTsXyC+gM=;
 b=0zqNCsUlUI3uPXsfXVuZ8/4wcKSgbFoN1tAQFmmfxE1VO2Fo/vZlkP0R+Gp/pgWTHk
 V07Q1WUQBR5I8FY3iIBAvVG+ZjKI4voUDSiKguH9e+frX2F3vyw3x7AAcxikt81PtJav
 NanlIhP8V04Wt8dz634S/Z66QMKjMSDZtjofDaC+58kkO42uRpl5WPICetmAcuJjqyAi
 0jWz2VwhcNpeSZpCk2Uy89jQ6pyrLW/xvHd7i88Qc2af8hTdi7CdYvoyUgRWpogl2ctV
 EVooHiS3mf1YkPdZ+q/CXIZpb7xvZiHz3nRrXGTwPkGrodzuaxvt4TH8FFKirjUp6Tkz
 wKew==
X-Gm-Message-State: AOAM5326RNG1nZCZaQ0NU0cCcSHuP/AxmsyEtYcS/rXAbN9xfjD5U+Yi
 yfhOJfzBFX2uRpbH1FQm3I1GkA==
X-Google-Smtp-Source: ABdhPJw7tuMWwShA8NOUIvBTMIX9+DFL82EcpoCHH4devEPiTIMb1ToUcUKtZLilH8nndfpDV+Au8A==
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr1444470wrz.34.1643962686794; 
 Fri, 04 Feb 2022 00:18:06 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:3fbe:ff10:110:739?
 ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id r2sm1381781wrz.76.2022.02.04.00.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 00:18:05 -0800 (PST)
Message-ID: <5cbe1d1e-1e80-26d9-ec39-2137f7e9e576@baylibre.com>
Date: Fri, 4 Feb 2022 09:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: meson-sm1-odroid: fix boot loop after reboot
Content-Language: en-US
To: Lutz Koschorreck <theleks@ko-hh.de>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220128193150.GA1304381@odroid-VirtualBox>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220128193150.GA1304381@odroid-VirtualBox>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_001809_086620_9C57D542 
X-CRM114-Status: GOOD (  15.38  )
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

SGksCgpPbiAyOC8wMS8yMDIyIDIwOjMxLCBMdXR6IEtvc2Nob3JyZWNrIHdyb3RlOgo+IFNpbmNl
IHRoZSBjb3JyZWN0IGdwaW8gcGluIGlzIHVzZWQgZm9yIGVuYWJsaW5nIHRmLWlvIHJlZ3VsYXRv
ciB0aGUKPiBzeXN0ZW0gZGlkIG5vdCBib290IGNvcnJlY3RseSBhZnRlciBjYWxsaW5nIHJlYm9v
dC4KPiAKPiBbICAgMzYuODYyNDQzXSByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVtCj4gYmwzMSBy
ZWJvb3QgcmVhc29uOiAweGQKPiBibDMxIHJlYm9vdCByZWFzb246IDB4MAo+IHN5c3RlbSBjbWQg
IDEuCj4gU00xOkJMOjUxMWY2Yjo4MWNhMmY7RkVBVDpBMEY4MzE4MDoyMDI4MjAwMDtQT0M6QjtS
Q1k6MDtTUElOT1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4MTtTRD86MDtTRDowO1JFQUQ6MDsw
LjA7Q0hLOjA7Cj4gYmwyX3N0YWdlX2luaXQgMHgwMQo+IGJsMl9zdGFnZV9pbml0IDB4ODEKPiBo
dyBpZDrilpJTTTE6Qkw6NTExZjZiOjgxY2EyZjtGRUFUOkEwRjgzMTgwOjIwMjgyMDAwO1BPQzpC
O1JDWTowO1NQSU5PUjowO0NISzoxRjtFTU1DOjgwMDtOQU5EOjgxO1NEPzowO1NEOjQwMDtVU0I6
ODtMT09QOjE7U1BJTk9SOjA7Q0hLOjFGO0VNTUM6ODAwO05BTkQ6ODE7U0Q/OjA7U0Q6NDAwO1VT
Qjo4O0xPT1A6MjtTUElOT1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4MTtTRD86MDtTRDo0MDA7
VVNCOjg7TE9PUDozO1NQSU5PUjowO0NISzoxRjtFTU1DOjgwMDtOQU5EOjgxO1NEPzowO1NEOjQw
MDtVU0I6ODtMT09QOjQ7U1BJTk9SOjA7Q0hLOjFGO0VNTUM6ODAwO05BTkQ6ODE7U0Q/OjA7U0Q6
NDAwO1VTQjo4O0xPT1A6NTtTUElOT1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4MTtTRD86MDtT
RDo0MDA7VVNCOjg7Cj4gCj4gU2V0dGluZyB0aGUgZ3BpbyB0byBvcGVuIGRyYWluIHNvbHZlcyB0
aGUgaXNzdWUuCj4gCgpGaXhlczogMWY4MGE1Y2Y3NGE2ICgiYXJtNjQ6IGR0czogbWVzb24tc20x
LW9kcm9pZDogYWRkIG1pc3NpbmcgZW5hYmxlIGdwaW8gYW5kIHN1cHBseSBmb3IgdGZfaW8gcmVn
dWxhdG9yIikKCj4gU2lnbmVkLW9mZi1ieTogTHV0eiBLb3NjaG9ycmVjayA8dGhlbGVrc0Brby1o
aC5kZT4KPiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEtb2Ry
b2lkLmR0c2kgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLXNtMS1vZHJvaWQuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1z
bTEtb2Ryb2lkLmR0c2kKPiBpbmRleCBlZDdjZDVmNTMwNDYuLmRkYjFiMzQ1Mzk3ZiAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLW9kcm9pZC5kdHNp
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1vZHJvaWQuZHRz
aQo+IEBAIC00OCw3ICs0OCw3IEBAIHRmX2lvOiBncGlvLXJlZ3VsYXRvci10Zl9pbyB7Cj4gICAJ
CXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+ICAgCQl2aW4tc3VwcGx5ID0g
PCZ2Y2NfNXY+Owo+ICAgCj4gLQkJZW5hYmxlLWdwaW8gPSA8JmdwaW9fYW8gR1BJT0VfMiBHUElP
X0FDVElWRV9ISUdIPjsKPiArCQllbmFibGUtZ3BpbyA9IDwmZ3Bpb19hbyBHUElPRV8yIEdQSU9f
T1BFTl9EUkFJTj47Cj4gICAJCWVuYWJsZS1hY3RpdmUtaGlnaDsKPiAgIAkJcmVndWxhdG9yLWFs
d2F5cy1vbjsKPiAgIAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
