Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B98C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlJ/g9DwD1Ks4vmVKXHUZkpbDcsvUm1np5y4jwo20dk=; b=rR4raLFJRYjxg+
	72jfbFIKL9wY2OJd6czqQo/93bs2MEhLZs9ElAiqoAQyX39wIVI8XjvsxCcvLQMXkCqL19Xbst7V0
	5l5DBRns0LFxSF7UaKkqOnDIz08MMC+gahblZ6NL3Tlrjmh7cDVLP4Jw61bhTK6NPKjK4jhaHAnUR
	foKpuE5hPXL1d1WEKoA8wvpceH8mZqtU9E/HXk4Fsu/Q6ksW5IXsmg7e5qnLjlIhEUoL0Fq8izbpP
	DPGXffBH2dZIZaFSryXCN8Ak28s1oIRCwX+RxjnQR6sN1iYoTrqblM7bnYOBjGT8yfHQvsvbwWL8x
	C000s5eLOmR6M5JZ3ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMEp7-0076W9-Rq; Mon, 21 Feb 2022 19:58:17 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMEov-0076VL-Sb; Mon, 21 Feb 2022 19:58:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id z22so31604569edd.1;
 Mon, 21 Feb 2022 11:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HSpBNSxjUcjevRPRuq5jzLPR/q4LolR4J0lICROk6aA=;
 b=jzZm4VRSsa6RUfToQpF+JE8MNOdjqq3fTROt6yQK84Bb5vtaOpTt3hpORwrBn6WTe9
 dEq3ae8aC9tv/ldl9YlbY5Pio4XeirB2H6XCWvVVFY+XjJJpD4musZTwJh1utI/qUaKZ
 G24q64LqJd0depkZHJyP/ptue82oxNIfoWkpfR0Ws6xdgUFonPMZnerejr2bzmP8kdnU
 DLX050cE8JS8Cszp7v0+XC/5trSBsvDmJFs9aMSreJyMAUpLf0KFha+gsvyIbYlOo4Rp
 RNbkIJubgsMYOpiawrURh3iPSflJ6+L8fmcJU0S9Mzv3gXTGkllgMXM1BeV7FswnmNqY
 vEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HSpBNSxjUcjevRPRuq5jzLPR/q4LolR4J0lICROk6aA=;
 b=S3Wqo946ji7VEURW0EaclMGBhJ8DFdmQnkLJDVj00ami2LamYz1MwPZrmdHf9VuT28
 L61Lsg8JO+ZlvhjTcoN20A3WmB6nBvL6rImviEQou+unP1JnCmwXuXvMP0JvY6I7UjdP
 9HxoSx3hvb/jCgTdoZu2H29z1cfYkydNcrl/lUmci9zUcijhANmwhF0gTnN7Y/0/pxFm
 zx9mOsSsL7ISpeFDnXMI8Gk0QCNVNWQTNJEVedx+hkahmXfVgNlppgOODgKW9YynQPvZ
 DYgg08/LMhXpl7v4YagO1ea+7KBLGU4yHqE7ajMX2BFkssT+8/Dk9mH58vPdVMZNbIxa
 ifEg==
X-Gm-Message-State: AOAM532Oqc9D9CoBx1ImWvht7qj8LtjcLt1ihuAF9dsHWM68k6TJYBb4
 gVpn2VhoxMVxGBt4l2wP7cM=
X-Google-Smtp-Source: ABdhPJzUsFIRO4A9bMmAHao7eSN/v43SjbKA8y5+BzAuuiwxJ65BA3NqfLLsGUpT4Nwdxp/tYlZn8g==
X-Received: by 2002:a50:c30f:0:b0:410:ef84:f718 with SMTP id
 a15-20020a50c30f000000b00410ef84f718mr22817590edb.128.1645473484294; 
 Mon, 21 Feb 2022 11:58:04 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:b141:a0d:4aad:2a06?
 (p200300ea8f4d2b00b1410a0d4aad2a06.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:b141:a0d:4aad:2a06])
 by smtp.googlemail.com with ESMTPSA id j8sm9568670edw.40.2022.02.21.11.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 11:58:03 -0800 (PST)
Message-ID: <9b7b175c-148f-c7ff-0e77-ad1d9d0bdaf8@gmail.com>
Date: Mon, 21 Feb 2022 20:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <5B4B8165-5D64-4336-A149-DF55C47D5ACE@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <5B4B8165-5D64-4336-A149-DF55C47D5ACE@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_115805_980117_BCBF8C81 
X-CRM114-Status: GOOD (  29.55  )
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

T24gMjEuMDIuMjAyMiAwNzozMiwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiByZXNlbmQgZnJv
bSBjb3JyZWN0IG1haWwgYWNjb3VudDoKPiAKPj4gT24gMTkgRmViIDIwMjIsIGF0IDU6MTMgcG0s
IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBUaGlz
IHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBUaXRhbm1lYyBUTTE2MjggNyBzZWdtZW50IGRp
c3BsYXkKPj4gY29udHJvbGxlci4gSXQncyBiYXNlZCBvbiBwcmV2aW91cyBSRkMgd29yayBmcm9t
IEFuZHJlYXMgRsOkcmJlci4KPj4gVGhlIFJGQyB2ZXJzaW9uIHBsYWNlZCB0aGUgZHJpdmVyIGlu
IHRoZSBMRUQgc3Vic3lzdGVtLCBidXQgdGhpcyB3YXMKPj4gTkFLJ2VkIGJ5IHRoZSBMRUQgbWFp
bnRhaW5lci4gVGhlcmVmb3JlIEkgbW92ZWQgdGhlIGRyaXZlciB0bwo+PiAvZHJpdmVycy9hdXhk
aXNwbGF5IHdoYXQgc2VlbXMgbW9zdCByZWFzb25hYmxlIHRvIG1lLgo+Pgo+PiBUbyBiZSBkZWNp
ZGVkIGlzIHRocm91Z2ggd2hpY2ggdHJlZSB0aGlzIHNlcmllcyBzaG91bGQgZ28uCj4+IEknZCB0
aGluayBTUEkgd291bGQgYmUgbW9zdCBzdWl0ZWQsIGJ1dCB0aGF0J3MgYSBkZWNpc2lvbiBJCj4+
IGxlYXZlIHVwIHRvIHRoZSByZXNwZWN0aXZlIG1haW50YWluZXJzLgo+Pgo+PiBGdXJ0aGVyIGNo
YW5nZXMgdG8gdGhlIFJGQyB2ZXJzaW9uOgo+PiAtIERyaXZlciBjYW4gYmUgYnVpbHQgYWxzbyB3
L28gTEVEIGNsYXNzIHN1cHBvcnQsIGZvciBkaXNwbGF5cyB0aGF0Cj4+IGRvbid0IGhhdmUgYW55
IHN5bWJvbHMgdG8gYmUgZXhwb3NlZCBhcyBMRUQncy4KPj4gLSBTaW1wbGlmaWVkIHRoZSBjb2Rl
IGFuZCByZXdyb3RlIGEgbG90IG9mIGl0Lgo+PiAtIERyaXZlciBpcyBub3cga2luZCBvZiBhIE1W
UCwgYnV0IGZ1bmN0aW9uYWxpdHkgc2hvdWxkIGJlIHN1ZmZpY2llbnQKPj4gZm9yIG1vc3QgdXNl
IGNhc2VzLgo+PiAtIFVzZSB0aGUgZXhpc3RpbmcgNyBzZWdtZW50IHN1cHBvcnQgaW4gdWFwaS9s
aW51eC9tYXBfdG9fN3NlZ21lbnQuaAo+PiBhcyBzdWdnZXN0ZWQgYnkgR2VlcnQgVXl0dGVyaG9l
dmVuLgo+Pgo+PiBOb3RlOiBUaGVyZSdzIGEgbnVtYmVyIG9mIGNoaXBzIGZyb20gb3RoZXIgbWFu
dWZhY3R1cmVycyB0aGF0IGFyZQo+PiAgICAgYWxtb3N0IGlkZW50aWNhbCwgZS5nLiBGRDYyOCwg
U00xNjI4LiBPbmx5IGRpZmZlcmVuY2UgSSBzYXcgc28KPj4gICAgIGZhciBpcyB0aGF0IHRoZXkg
cGFydGlhbGx5IHN1cHBvcnQgb3RoZXIgZGlzcGxheSBtb2Rlcy4KPj4gICAgIFRNMTYyODogNngx
MiwgN3gxMQo+PiAgICAgU00xNjI4QzogNHgxMywgNXgxMiwgNngxMSwgN3gxMAo+PiAgICAgRm9y
IHR5cGljYWwgZGlzcGxheXMgb24gZGV2aWNlcyB1c2luZyB0aGVzZSBjaGlwcyB0aGlzCj4+ICAg
ICBkaWZmZXJlbmNlIHNob3VsZG4ndCBtYXR0ZXIuCj4+Cj4+IFN1Y2Nlc3NmdWxseSB0ZXN0ZWQg
b24gYSBUWDMgTWluaSBUViBib3ggdGhhdCBoYXMgYW4gU00xNjI4QyBhbmQgYQo+PiBkaXNwbGF5
IHdpdGggNCBkaWdpdHMgYW5kIDcgc3ltYm9scy4KPiAKPiBUaGFua3MgZm9yIGR1c3Rpbmcgb2Zm
IHNvdXJjZXMgYW5kIHdvcmtpbmcgb24gdGhpcyEgLSBpdOKAmXMgYW5vdGhlciBwaWVjZQo+IG9m
IHRoZSB1cHN0cmVhbSBwdXp6bGUgZm9yIGRpc3Ryb3MgdGhhdCBpbnN0YWxsIG9uIEFuZHJvaWQg
Ym94ZXMuCj4gCj4gSSBuZWVkZWQgdGhlIGZvbGxvd2luZyBwYXRjaCB0byBhZGRyZXNzIGNvbXBp
bGUgaXNzdWVzIChtaXNzaW5nIGluY2x1ZGUsCj4gYW5kIHRoZSByZWNlbnQgdm9pZC9pbnQgY2hh
bmdlIGluIGxpbnV4LW5leHQgKEnigJltIHVzaW5nIDUuMTcueSk6Cj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYXV4ZGlzcGxheS90bTE2MjguYyBiL2RyaXZlcnMvYXV4ZGlzcGxheS90bTE2Mjgu
Ywo+IGluZGV4IGEzOWI2MzgyODJjMS4uYWIzNTU3ZjhiMzMwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYXV4ZGlzcGxheS90bTE2MjguYwo+ICsrKyBiL2RyaXZlcnMvYXV4ZGlzcGxheS90bTE2Mjgu
Ywo+IEBAIC01LDYgKzUsNyBAQAo+ICogQ29weXJpZ2h0IChjKSAyMDE5IEFuZHJlYXMgRsOkcmJl
cgo+ICovCj4gCj4gKyNpbmNsdWRlIDxsaW51eC9jdHlwZS5oPgo+ICNpbmNsdWRlIDxsaW51eC9k
ZWxheS5oPgo+ICNpbmNsdWRlIDxsaW51eC9sZWRzLmg+Cj4gI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgo+IEBAIC0zMjcsMTAgKzMyOCwxMSBAQCBzdGF0aWMgaW50IHRtMTYyOF9zcGlfcHJvYmUo
c3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgICAgICByZXR1cm4gZGV2aWNlX2NyZWF0ZV9maWxl
KCZzcGktPmRldiwgJmRldl9hdHRyX2Rpc3BsYXlfdGV4dCk7Cj4gfQo+IAo+IC1zdGF0aWMgdm9p
ZCB0bTE2Mjhfc3BpX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQo+ICtzdGF0aWMgaW50
IHRtMTYyOF9zcGlfcmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4gewo+ICAgICAgIGRl
dmljZV9yZW1vdmVfZmlsZSgmc3BpLT5kZXYsICZkZXZfYXR0cl9kaXNwbGF5X3RleHQpOwo+ICAg
ICAgIHRtMTYyOF9zZXRfZGlzcGxheV9jdHJsKHNwaSwgZmFsc2UpOwo+ICsgICAgICAgcmV0dXJu
IDA7Cj4gfQo+IAo+IHN0YXRpYyB2b2lkIHRtMTYyOF9zcGlfc2h1dGRvd24oc3RydWN0IHNwaV9k
ZXZpY2UgKnNwaSkKPiAKPiBJIGFsc28gbmVlZGVkIENPTkZJR19TUElfR1BJTz15IGluIGtlcm5l
bCBjb25maWcuIFdpdGggdGhpcyBhZGRlZCB0aGUKPiBkcml2ZXIgcHJvYmVzIG9uIG15IFRYMyBt
aW5pIGJveCBhbmQgdGhlIGRpc3BsYXkgZ29lcyBkYXJrIG92ZXJ3cml0aW5nCj4gdGhlIGRlZmF1
bHQg4oCYYm9vdOKAmSB0ZXh0LiBUaGUgZm9sbG93aW5nIHN5c3RlbWQgc2VydmljZSBhbmQgc2Ny
aXB0IHNldHMKPiB0aGUgY2xvY2sgYW5kIGZsYXNoZXMgdGhlIGNvbG9uIHNlcGFyYXRvciBvbi9v
ZmYgdG8gY291bnQgc2Vjb25kczoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9MaWJy
ZUVMRUMudHYvY29tbWl0L2M4ZjFlYmU2ZjZjMzY2MTg4ZjE4ZjlkMmI0MDFkZTZjMjk3OWZkZDcK
PiAKPiBXaXRoIHRoZSBpbmNsdWRlIGZpeHVwIGFuZCBtYXliZSBhIEtjb25maWcgdHdlYWssIGZv
ciB0aGUgc2VyaWVzOgo+IAo+IFRlc3RlZC1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFu
c2hld2l0dEBnbWFpbC5jb20+CgpUaGFua3MgZm9yIHRlc3RpbmchIApPbiBzb21lIHN5c3RlbXMg
dGhlIGRpc3BsYXkgY29udHJvbGxlciBtYXkgYmUgY29ubmVjdGVkIHRvIGEgSFcgU1BJCmludGVy
ZmFjZSBub3QgdXNpbmcgR1BJTydzLiBUaGVyZWZvcmUgSSdkIHByZWZlciB0byBub3QgbWFrZQp0
aGUgZHJpdmVyIGRlcGVuZGVudCBvbiBDT05GSUdfU1BJX0dQSU8uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
