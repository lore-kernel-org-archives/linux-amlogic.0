Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E093FC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuI/Ljs8dPwnt+n1yJ/byW1SZmfq68MBloGsSc+1M98=; b=0Hnau5fbmGvZ7N
	jZ0q3GU4nhP1ZAvxHSz8OVDP58dEwUW76EBbjuwEsUVczNKt0VpbaW0AnBj6EhOA6hmo3Hhn3y6ZW
	9DXu7GS4BuDPbnKe7MJrRb7a5rPs5PYEyB9Pc17WjYTLSYR04vXgEv/7rV6tfTsXI/jdt1rNte9/0
	mmnzyb15JhzQhY6pBfsPLgqoA7gljKr93YbEc053G7w0wUCHwqOOenfPgGuq+W+hpxzhTb/f4Q0hS
	gv4bkfUSd0CX4m8WMgde6jDZ+Dh4FXbii9HLTe+oN9g8I2eSyKXN32HkCvZPp7wxgkBjMn7O4g4/8
	dXWzbG9kG7qZKIFnd66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNL9q-002ORq-En; Thu, 24 Feb 2022 20:56:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNL9d-002OP2-01; Thu, 24 Feb 2022 20:56:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id x5so4584865edd.11;
 Thu, 24 Feb 2022 12:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=K1S+dkGXla6DPwP9+HUMJY7KzgDw3fLye//5M521t5Y=;
 b=iT+vDVItk7xh9Vt/m+bemAMLNeNxiQxvamy17piq4IiAKAYGY0C/CBfYpSIUbilLZC
 VEkhHXspz+obbGO9E+YeoU15zgAnhKfjjahCdM09HNtf6RHCehOWIVON8rPpA8U6Ez0w
 P4OOND3dnwIEW1PxAY0IqRcST42FDQzaNCN5mVoNvZJ3A6rlSJ740JGYm5Nq4mK+UW7r
 aNjWQFgJr1rFAEj2UWpgBuBsx8hDEOYlhTzYylCNk6yZTHtoz4OTi/y2jrcSrRqN6go4
 1b11T30RZKpDd0MG0Ix+3hSGznq8QSWsgnMQdZUtc6FDw2BheWCBV2hQ+/wOATIAM96a
 /2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=K1S+dkGXla6DPwP9+HUMJY7KzgDw3fLye//5M521t5Y=;
 b=GUNH6s6OX1jWZ7uhFi6zM8HXqTlASCn6+fA3mN9uaXR+3O96C5NPX83Ywb6IdTzZoJ
 ZkR1pxlSRewerOgIYFcRsHwPkq/F7w6E+vVK9ZG9uJJ3i5mlwbirt/kTNMPA9CFBL7A1
 ZwoiqiNvNg/93xzXUShnA4NG4RZJzVAuLLwerlT6nfIoa3aUBwZvQjdOqAPmEgVfe3AE
 SiJman0RIwcKh+tvmz5qmcDXicuwpEgcZFoUFwzRB7EaG56bodVOkqk6J8S3ab90sTjz
 de8DwbssjGccxNHIDNBo23e+AqpysMJ/1Ws3ZwNqBY1R+ltZ8UHLrm6S2r/M12qhTkL5
 ft3Q==
X-Gm-Message-State: AOAM531c1uKwIJqgfUeuYU++ErG04Ub1P1mYTSvkeeNRvRovLOwJqzch
 ODwjoFTR4DWqnFmY1w/4EXMdukHhQnA=
X-Google-Smtp-Source: ABdhPJyrnO/rfnaKxFhFPI5qjYojw1jBjGlfYgPUDqUpas/l5AM5e4QdIGXdZc27ocNn3rIKBUkunQ==
X-Received: by 2002:aa7:cad3:0:b0:410:b188:a49a with SMTP id
 l19-20020aa7cad3000000b00410b188a49amr4078432edt.416.1645736159628; 
 Thu, 24 Feb 2022 12:55:59 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 g2-20020aa7c842000000b0041314b98872sm298873edt.22.2022.02.24.12.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:55:59 -0800 (PST)
Message-ID: <29fcdfe3-1b8e-f466-6e20-919c6ab2a7ae@gmail.com>
Date: Thu, 24 Feb 2022 21:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
 <2b7f0011-8872-70fa-b9b7-50b7817e7084@gmail.com>
 <YhfpD9qfcuAlC+wp@robh.at.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
In-Reply-To: <YhfpD9qfcuAlC+wp@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_125601_072009_128956CA 
X-CRM114-Status: GOOD (  17.81  )
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

T24gMjQuMDIuMjAyMiAyMToyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBGZWIgMjMs
IDIwMjIgYXQgMDY6NTk6MzFQTSArMDEwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+PiBBZGQg
YSBZQU1MIHNjaGVtYSBiaW5kaW5nIGZvciBUTTE2MjggYXV4ZGlzcGxheQo+PiAoNy8xMS1zZWdt
ZW50IExFRCkgY29udHJvbGxlci4KPj4KPj4gVGhpcyBwYXRjaCBpcyBwYXJ0aWFsbHkgYmFzZWQg
b24gcHJldmlvdXMgd29yayBmcm9tCj4+IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5k
ZT4uCj4+Cj4+IENvLURldmVsb3BlZC1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNl
LmRlPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+
Cj4+IENvLURldmVsb3BlZC1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNv
bT4KPj4gU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNv
bT4KPj4gLS0tCj4+IHYzOgo+PiAtIGZpeCByZW1haW5pbmcgWUFNTCBpc3N1ZXMKPj4gLSB1c2Ug
Q28tRGV2ZWxvcGVkLWJ5Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5t
ZWMsdG0xNjI4LnlhbWwgIHwgOTIgKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDkyIGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAo+Pgo+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3Bs
YXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAuLjJhMWVmNjkyYwo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRt
MTYyOC55YW1sCj4+IEBAIC0wLDAgKzEsOTIgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9yLWxhdGVyIE9SIEJTRC0yLUNsYXVzZSkKPj4gKyVZQU1MIDEuMgo+PiAr
LS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2F1eGRpc3BsYXkvdGl0
YW5tZWMsdG0xNjI4LnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IFRpdGFuIE1pY3JvIEVsZWN0cm9u
aWNzIFRNMTYyOCBMRUQgY29udHJvbGxlcgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBB
bmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+ICsgIC0gSGVpbmVyIEthbGx3ZWl0
IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPj4gKwo+PiArYWxsT2Y6Cj4+ICsgIC0gJHJlZjogL3Nj
aGVtYXMvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwjCj4+ICsKPj4gK3Byb3BlcnRpZXM6
Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHRpdGFubWVjLHRtMTYyOAo+PiArCj4+
ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4gCj4+ICsgIGdyaWQ6Cj4+ICsgICAg
ZGVzY3JpcHRpb246Cj4+ICsgICAgICBNYXBwaW5nIG9mIGRpc3BsYXkgZGlnaXQgcG9zaXRpb24g
dG8gZ3JpZCBudW1iZXIuCj4+ICsgICAgICBUaGlzIGltcGxpY2l0bHkgZGVmaW5lcyB0aGUgZGlz
cGxheSBzaXplLgo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQ4LWFycmF5Cj4+ICsgICAgbWluSXRlbXM6IDEKPj4gKyAgICBtYXhJdGVtczogNwo+PiAr
Cj4+ICsgIHNlZ21lbnQtbWFwcGluZzoKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4gKyAgICAgIE1h
cHBpbmcgb2YgNyBzZWdtZW50IGRpc3BsYXkgc2VnbWVudHMgQS1HIHRvIGJpdCBudW1iZXJzIDEt
MTIuCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDgt
YXJyYXkKPj4gKyAgICBtaW5JdGVtczogNwo+PiArICAgIG1heEl0ZW1zOiA3Cj4gCj4gQXJlIHRo
ZXNlIHByb3BlcnRpZXMgdXNlZnVsIGZvciBhbnkgNyBzZWdtZW50IGRpc3BsYXkgb3Igc3BlY2lm
aWMgdG8gCj4gdGhpcyBjb250cm9sbGVyPwo+IApCb3RoIGFyZSBjb250cm9sbGVyLXNwZWNpZmlj
LiBFLmcuIHRoZSBmdW5jdGlvbmFsbHkgc2ltaWxhciBkcml2ZXIKaHQxNmszMyB1c2VzIGRpZmZl
cmVudCBwcm9wZXJ0aWVzLgoKPiBUaGUgY29tbWl0IG1zZyBtZW50aW9ucyAxMSBzZWdtZW50IGRp
c3BsYXkuIERvZXMgdGhpcyBuZWVkIHRvIGJlPzoKPiAKPiBvbmVPZjoKPiAgIC0gbWluSXRlbXM6
IDcKPiAgICAgbWF4SXRlbXM6IDcKPiAgIC0gbWluSXRlbXM6IDExCj4gICAgIG1heEl0ZW1zOiAx
MQo+IApUaGUgY29udHJvbGxlciB3b3VsZCBiZSBhYmxlIHRvIGRyaXZlIDExIHNlZ21lbnRzLCBi
dXQgdGhlIGRyaXZlcgpzdXBwb3J0cyA3IHNlZ21lbnRzIG9ubHkgKGF0IGxlYXN0IGZvciBub3cp
LiBUaGVyZWZvcmUgYSAxMSBzZWdtZW50CmRpc3BsYXkgY2FuIGJlIHVzZWQsIGJ1dCBvbmx5IHRo
ZSA3IHNlZ21lbnQgcGFydCB3aWxsIGJlIGFjdGl2ZS4KQWxsIGRldmljZXMgd2l0aCB0aGlzIGNv
bnRyb2xsZXIgSSd2ZSBzZWVuIGFuZCBoZWFyZCBvZiBoYXZlCjcgc2VnbWVudCBkaXNwbGF5cy4K
Cj4gCj4+ICsKPj4gKyAgIiNhZGRyZXNzLWNlbGxzIjoKPj4gKyAgICBjb25zdDogMgo+PiArCj4+
ICsgICIjc2l6ZS1jZWxscyI6Cj4+ICsgICAgY29uc3Q6IDAKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+
ICsgIC0gY29tcGF0aWJsZQo+PiArICAtIHJlZwo+PiArCj4+ICtwYXR0ZXJuUHJvcGVydGllczoK
Pj4gKyAgIl4uKkBbMS03XSwoWzEtOV18MVswLTZdKSQiOgo+PiArICAgIHR5cGU6IG9iamVjdAo+
PiArICAgICRyZWY6IC9zY2hlbWFzL2xlZHMvY29tbW9uLnlhbWwjCj4+ICsgICAgdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4+ICsgICAgICBQcm9w
ZXJ0aWVzIGZvciBhIHNpbmdsZSBMRUQuCj4+ICsKPj4gKyAgICBwcm9wZXJ0aWVzOgo+PiArICAg
ICAgcmVnOgo+PiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAgICAgIDEtYmFzZWQg
Z3JpZCBudW1iZXIsIGZvbGxvd2VkIGJ5IDEtYmFzZWQgc2VnbWVudCBiaXQgbnVtYmVyLgo+PiAr
ICAgICAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgICAgcmVxdWlyZWQ6Cj4+ICsgICAgICAtIHJl
Zwo+PiArCj4+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVz
Ogo+PiArICAtIHwKPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaD4K
Pj4gKwo+PiArICAgIHNwaSB7Cj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiAr
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPj4gKwo+PiArICAgICAgICBsZWQtY29udHJvbGxl
ckAwIHsKPj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGl0YW5tZWMsdG0xNjI4IjsKPj4g
KyAgICAgICAgICAgIHJlZyA9IDwwPjsKPj4gKyAgICAgICAgICAgIHNwaS0zLXdpcmU7Cj4+ICsg
ICAgICAgICAgICBzcGktbHNiLWZpcnN0Owo+PiArICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVu
Y3kgPSA8NTAwMDAwPjsKPj4gKyAgICAgICAgICAgIGdyaWQgPSAvYml0cy8gOCA8NCAzIDIgMT47
Cj4+ICsgICAgICAgICAgICBzZWdtZW50LW1hcHBpbmcgPSAvYml0cy8gOCA8NCA1IDYgMSAyIDMg
Nz47Cj4+ICsgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+Owo+PiArCj4+ICsgICAgICAgICAgICBhbGFybW5ANSw0IHsKPj4g
KyAgICAgICAgICAgICAgICByZWcgPSA8NSA0PjsKPj4gKyAgICAgICAgICAgICAgICBmdW5jdGlv
biA9IExFRF9GVU5DVElPTl9BTEFSTTsKPj4gKyAgICAgICAgICAgIH07Cj4+ICsgICAgICAgIH07
Cj4+ICsgICAgfTsKPj4gKy4uLgo+PiAtLSAKPj4gMi4zNS4xCj4+Cj4+Cj4+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
