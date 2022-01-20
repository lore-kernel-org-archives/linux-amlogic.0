Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D53C43219
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xIyralJiqmirVqX5B+bz5pPGvROVt8kDs60pCHtY0yI=; b=vZm7akeSz9J++7m9AYfs4QRRFT
	YifS5PZOwiGDTDLIaxcb0v12oZ5OppVc3kfzs/f4JNk3B9Q88K1BixvF8R0owQisOSW3mFmCI7YgM
	qVssqzcPxl59y0RXp8F1PFXSwMPXQjoCUamA3D3R6LJXPFq4U0WN6mylGvvkMNL88drEtYCm2EKaV
	UlAqY6PP3ImI0K5HYPs1UOzf6OmIjxJrAFIKfxhO9IRREUqO4tE3Z/us2BUy8zHo2ZasY8S8vO5SV
	u9qOBHcuJ8t9MQkuSlsWNq9xy+xMmX2vnyJXqnbCeGYdb00BRU0QKXKMqGbwzRb4dkjm0UqpSJ78P
	RZ1rTCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATHi-009z87-M5; Thu, 20 Jan 2022 08:59:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATHe-009z4n-F6
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 08:59:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso20228533wmj.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 00:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O6MuI7SsqszCT6dHJwGjuSM8vW2g5WMyA/pZW/T09Zw=;
 b=hJFDOOFgaKOqgdtNJRQEo7IXj6jeWlgcHxxjxdukf7yCqtzuzrDP1u129dGygW8baw
 CwYJ6SR34rlmZEnr/KDZ8LX+y7by6WhALOC/eR7/IBFzCUjE82j/Kolg2b2tZHAkbuJ0
 gTIn3Fx3PZ/+WIc5e2kyzlfotD5OI4//iRCZZGfIAcP4T+uS4avtVCKTertwsBuk4tFI
 97lbxS+H+R1uUA6S2UWtc7QMMm/BNV2Gglt/C5fQpc12BfwCKlWyqmrx/+322Shce6aZ
 049vPeP0Rhcu8NoqlccG5phKbbfqRlXzC94s9LdzAYH28h+vRQN+2JPup9xLxnYTmp5U
 25hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O6MuI7SsqszCT6dHJwGjuSM8vW2g5WMyA/pZW/T09Zw=;
 b=EA/rHHTkn6+6eKkDq6+CPMcqsraSqHYfJp4nCnEwsKuy9KGG9ABLLoHz9WDUhh7Tst
 uGht5YQYIfhnNkZxT5K7WGq+0+VD60y3drl9dxuEz3jOr0Aot0RLkAYlahbNE8QnfDHs
 YsN/Hwpt1GQYYMEkPCjxRduyxfTyeBDct79Lvbw/wsqjx1X1KftcPk1tnGILXFjK7ha6
 xXPYIz8ccEa8cg4locIGhClGFeItKHszs6HiZP6+KjWEwns+ZnvRqKJDJ00PedrjU88b
 p4UUNeIHu7Cgbg5coS3cmkPRTI27mZqXRVFpHtWWCDLXXhHwn7JdIEQBxD/okSdCYlPv
 Q3zA==
X-Gm-Message-State: AOAM533ilQTlOt9s3MfL51ag+gdD1pYwWLnedFakgYUryl1Li91x+VzV
 Qc8voDXXdFT4tuzWVWrevYApRIz9UelODw==
X-Google-Smtp-Source: ABdhPJxCGgo/8i3LdrVH3ebCgZ3lyoA8QSkMvL/WbdZ+9l0sPlt+Wyf1hjAPkvQqGcCjp9nUM2hOHg==
X-Received: by 2002:adf:9dc7:: with SMTP id q7mr8992802wre.148.1642669144502; 
 Thu, 20 Jan 2022 00:59:04 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5?
 ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id l17sm1870017wms.0.2022.01.20.00.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 00:59:03 -0800 (PST)
Subject: Re: [PATCH V2 2/2] soc: s4: Add support for power domains controller
To: "shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, khilman <khilman@baylibre.com>,
 jbrunet <jbrunet@baylibre.com>
References: <20211230094434.3053195-1-shunzhou.jiang@amlogic.com>
 <20211230094434.3053195-3-shunzhou.jiang@amlogic.com>
 <CAFBinCALAOJz16=u7r8tLM6ditriq=-NOACS2HRLrWs5B_FkVA@mail.gmail.com>
 <b2a9b8f0-2b12-c49f-9609-21999b1fffc8@baylibre.com>
 <2022011810264745683311@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b846de5f-cf30-c000-ea37-61d79bcd4e7e@baylibre.com>
Date: Thu, 20 Jan 2022 09:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2022011810264745683311@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_005906_586675_BEF3F27A 
X-CRM114-Status: GOOD (  27.65  )
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

SGkgU2h1bnpob3UsDQoNCk9uIDE4LzAxLzIwMjIgMDM6MjYsIHNodW56aG91LmppYW5nQGFtbG9n
aWMuY29tIHdyb3RlOg0KPiBEZWFycyBOZWlsICYgTWFydGluOg0KPiBTb3JyeSBmb3IgbXkgbGF0
ZSByZXBseQ0KPiBTNF9WUFVfSERNSTrCoCBmb3IgdnB1IGRvbWFpbizCoCB0aGlzIGRvbWFpbiBw
cm92aWRlIHBvd2VyIHRvIG1hbnkgbW91ZGxlcyhvc2QswqB2cHAswqBoZHIswqBkdizCoGRpKSwg
aWYgY2xvc2UsIHdpbGwgY2F1c2Ugc3lzdGVtIGNyYXNoDQo+IFM0X1VTQl9DT01CwqBkb21haW46
IGZvciB1c2IsIGlmIG5vdCBhbHdheXMgb24swqAgYWxsIHVzYiBzdGF0dXMgd2lsbCBjbGVhciB0
byAwLCB0aGF0J3Mgbm90IHJpZ2h0IHN0YXR1cyBmb3IgdXNiDQo+IFM0X0VUSDogZm9yIGV0aGVy
bmV0IG9ubGluZSB3YWtldXAsIGFuZCBpZiBwb3dlciBkb3duLCBzdGF0dXMgYWxzbyBub3Qgcmln
aHQNCj4+PiArwqDCoMKgwqDCoMKgIFNFQ19QRChTNF9WUFVfSERNSSzCoMKgwqDCoCBHRU5QRF9G
TEFHX0FMV0FZU19PTiksDQo+Pj4gK8KgwqDCoMKgwqDCoCBTRUNfUEQoUzRfVVNCX0NPTUIswqDC
oMKgwqAgR0VOUERfRkxBR19BTFdBWVNfT04pLA0KPj4+ICvCoMKgwqDCoMKgwqAgU0VDX1BEKFM0
X0dFMkQswqDCoMKgwqDCoMKgwqDCoCAwKSwNCj4+PiArwqDCoMKgwqDCoMKgIFNFQ19QRChTNF9F
VEgswqDCoMKgwqDCoMKgwqDCoMKgIEdFTlBEX0ZMQUdfQUxXQVlTX09OKSwNCg0KVGhhbmtzIGZv
ciBjbGFyaWZpY2F0aW9ucywgY2FuIHlvdSByZXNlbmQgdGhlIHBhdGNoc2V0IHdpdGggdGhvc2Ug
aW5mb3MgaW4gY29tbWVudHMgbGlrZSBpdCB3YXMgZG9uZSBmb3IgQTEgPw0KDQpUaGFua3MsDQpO
ZWlsDQoNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBTaHVuemhvdSBKaWFuZw0KPiBT
VyBEZXBhcnRtZW50DQo+IA0KPiAgICAgwqANCj4gICAgICpGcm9tOirCoE5laWwgQXJtc3Ryb25n
IDxtYWlsdG86bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+DQo+ICAgICAqRGF0ZToqwqAyMDIyLTAx
LTEywqAxNjozNg0KPiAgICAgKlRvOirCoE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1haWx0bzptYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPjsgU2h1bnpob3UuSmlhbmcgPG1haWx0bzpz
aHVuemhvdS5qaWFuZ0BhbWxvZ2ljLmNvbT4NCj4gICAgICpDQzoqwqBkZXZpY2V0cmVlIDxtYWls
dG86ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1hcm0ta2VybmVsIDxtYWlsdG86
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgtYW1sb2dpYyA8bWFp
bHRvOmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWtlcm5lbCA8bWFp
bHRvOmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBraGlsbWFuIDxtYWlsdG86a2hpbG1h
bkBiYXlsaWJyZS5jb20+OyBqYnJ1bmV0IDxtYWlsdG86amJydW5ldEBiYXlsaWJyZS5jb20+DQo+
ICAgICAqU3ViamVjdDoqwqBSZTogW1BBVENIIFYyIDIvMl0gc29jOiBzNDogQWRkIHN1cHBvcnQg
Zm9yIHBvd2VyIGRvbWFpbnMgY29udHJvbGxlcg0KPiAgICAgWyBFWFRFUk5BTCBFTUFJTCBdDQo+
ICAgICDCoA0KPiAgICAgSGkgU2h1bnpob3UsDQo+ICAgICDCoA0KPiAgICAgT24gMzAvMTIvMjAy
MSAyMzoxNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToNCj4gICAgID4gT24gVGh1LCBEZWMg
MzAsIDIwMjEgYXQgMTA6NDQgQU0gU2h1bnpob3UuSmlhbmcNCj4gICAgID4gPHNodW56aG91Lmpp
YW5nQGFtbG9naWMuY29tPiB3cm90ZToNCj4gICAgID4+DQo+ICAgICA+PiBGcm9tOiBTaHVuemhv
dSBKaWFuZyA8c2h1bnpob3UuamlhbmdAYW1sb2dpYy5jb20+DQo+ICAgICA+Pg0KPiAgICAgPj4g
QWRkIHN1cHBvcnQgczQgUG93ZXIgY29udHJvbGxlci4gSW4gczQsIHBvd2VyIGNvbnRyb2wNCj4g
ICAgID4+IHJlZ2lzdGVycyBhcmUgaW4gc2VjdXJlIGRvbWFpbiwgYW5kIHNob3VsZCBiZSBhY2Nl
c3NlZCBieSBzbWMuDQo+ICAgICA+Pg0KPiAgICAgPj4gU2lnbmVkLW9mZi1ieTogU2h1bnpob3Ug
SmlhbmcgPHNodW56aG91LmppYW5nQGFtbG9naWMuY29tPg0KPiAgICAgPiBBbHNvIGhlcmUgSSBk
b24ndCBoYXZlIGFueSBkYXRhc2hlZXQgdG8gY29tcGFyZSB0aGlzIHdpdGgsIHNvIHRoaXMgZ2V0
cyBteToNCj4gICAgID4gQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+DQo+ICAgICA+DQo+ICAgICA+IFsuLi5dDQo+ICAgICA+
PiArwqDCoMKgwqDCoMKgIFNFQ19QRChTNF9WUFVfSERNSSzCoMKgwqDCoCBHRU5QRF9GTEFHX0FM
V0FZU19PTiksDQo+ICAgICA+PiArwqDCoMKgwqDCoMKgIFNFQ19QRChTNF9VU0JfQ09NQizCoMKg
wqDCoCBHRU5QRF9GTEFHX0FMV0FZU19PTiksDQo+ICAgICA+PiArwqDCoMKgwqDCoMKgIFNFQ19Q
RChTNF9HRTJELMKgwqDCoMKgwqDCoMKgwqAgMCksDQo+ICAgICA+PiArwqDCoMKgwqDCoMKgIFNF
Q19QRChTNF9FVEgswqDCoMKgwqDCoMKgwqDCoMKgIEdFTlBEX0ZMQUdfQUxXQVlTX09OKSwNCj4g
ICAgID4gRm9yIHRoZSBBMSBTb0MncyBVQVJUIGVudHJ5IHdlIGhhdmUgdGhlIGZvbGxvd2luZyBj
b21tZW50IHdoaWNoDQo+ICAgICA+IGV4cGxhaW5zIHdoeSB3ZSB3YW50IHRvIHRvIGJlICJhbHdh
eXMgb24iOg0KPiAgICAgPsKgwqAgVUFSVCBzaG91bGQga2VlcCB3b3JraW5nIGluIEFURiBhZnRl
ciBzdXNwZW5kIGFuZCBiZWZvcmUgcmVzdW1lDQo+ICAgICA+DQo+ICAgICA+IElmIGZvciBzb21l
IHJlYXNvbiB5b3UgbmVlZCB0byByZS1zZW5kIHRoaXMgc2VyaWVzIHRoZW4gaXQgd291bGQgYmUN
Cj4gICAgID4gZ3JlYXQgaWYgeW91IGNvdWxkIGFkZCBhIGNvbW1lbnQgYWJvdmUgZWFjaCBlbnRy
eSB3aXRoDQo+ICAgICA+IEdFTlBEX0ZMQUdfQUxXQVlTX09OLg0KPiAgICAgPiBJdCB3aWxsIGhl
bHAgb3RoZXJzIChsaWtlIG1lKSB1bmRlcnN0YW5kIHRoZXNlIFNvQ3MgYmV0dGVyLg0KPiAgICAg
wqANCj4gICAgIENhbiB5b3UgcmVzZW5kIHdpdGggdGhvc2UgY29tbWVudHMgYWRkZWQgc28gSSBj
YW4gYXBwbHkgdGhlIHBhdGNoZXMgPw0KPiAgICAgwqANCj4gICAgIFRoYW5rcywNCj4gICAgIE5l
aWwNCj4gICAgIMKgDQo+ICAgICA+DQo+ICAgICA+DQo+ICAgICA+IEJlc3QgcmVnYXJkcywNCj4g
ICAgID4gTWFydGluDQo+ICAgICA+DQo+ICAgICDCoA0KPiANCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
