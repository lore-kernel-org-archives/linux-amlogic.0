Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1B2C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Mar 2022 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS+z+1ZHLFCXC4PAtDC6KTrOhFEpZ5ZEHVq959pPaMs=; b=vrWqWXH1zHEUW/
	V87ySt/OQlbLi861KgaMxyis9B9lGNwI38SkhKd8nSSu2kkoO0nEv9BVPp60BiC17Eq9B7Yx1wdjc
	GWZzJENw68kCo3ckmZbZw9hL8IU4OnYkj1TJxksneO59y+MRqjfLDfV0vKYJ1uxdQPCwT1mCReml6
	mtbPZ+8NUsOTblw9e2/G4Yjhhsco00tObvCkCo9/Tzqy1o3/2mQKDhZMXx8re6GFGmPWsGyqbPVqO
	6i2AaiVu2xkcUrIpaTLdcJSWKXFaIHB1/tHJ8abuz4Sv5lerJdbtEHPewh+K55lTNZWIrUTTAd2hy
	1I9fzzWSR4R3+/FPUlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPKLF-001rP0-8N; Wed, 02 Mar 2022 08:28:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPKLA-001rNy-Ur
 for linux-amlogic@lists.infradead.org; Wed, 02 Mar 2022 08:28:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so2144714wmq.4
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Mar 2022 00:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HxGOuYmY7LiA4iGOdF2v4hBw9/NxWKDxW/pX0o8XeQY=;
 b=0U55S0NEEaImFGWugryXcG5PJIByCAy7/NHh6Eu7A5Fj3ar/XFGG/uye977EUG+E53
 kmdrPzzzSePStaFeGuLpLY2hHoFjIRoU/xwcRAwJAS/hG83UxMJBVPfLBJJy8LDwWpAc
 yG8h8lLC/S0UmDDny122K5dphkBrswi91zslmzK9vgxt3L21VTrbVLjWTOVpxTaMIgB5
 eZdTkaCO56H4Wwga0+YVUP2hgG4d/IPLBO9ow/0cDogK3HIXK+mTQdFeOtdAzznTWP1J
 7hjIrgn4MtunhIoWwOkohx5hPhkVX0UuyTXkkz/QfRTNE1SKlCXyjEj3ean/VfH4mPKz
 LinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HxGOuYmY7LiA4iGOdF2v4hBw9/NxWKDxW/pX0o8XeQY=;
 b=K/l4ymcjKDGbTuf5HzbZKw/d4vwTDfXug1356Hb5IdlM3HRdzVDSm8/KMGrjjmWeBS
 iaouRcah8mf0gb7HUvLH8IgUpJW9sRBKpJtKtHrfqcEWQvxMqov2geDd1VYlkz6SqiXO
 dc3PFJaNWHy5scMq2G2oyVoTjJYPLsCHdbHa9TF9cw0lmJ0aB+yM3WqXDfVFSD5GRUqV
 OqLNY2rXVWf5+My5dS/kH3d5cnzKp/hEOC9yQm+IfR9iaU/6Hmii7rC95qxdBtCBr95l
 1c9dae10WK+/Q3oU56GTqHGIETvWzbdrYM//SPg2FkTWPclYkWjXcXn2ul+Cdcwn5C5j
 rzxQ==
X-Gm-Message-State: AOAM532Nk98PttXbeZ7kG3DMTdACNrZYxcS45QClXeAyfjrhqzsPgXSh
 /IeQSpHRcoahvOwE5ZE7B21lWg==
X-Google-Smtp-Source: ABdhPJw+rAizsnXWw82JpOop6PVVpVwgNfC4DCBaFHUIX7R//EsA8IkQlLb3ax3IfwmPlq0Qpu7x5w==
X-Received: by 2002:a05:600c:3b10:b0:381:3b9f:e382 with SMTP id
 m16-20020a05600c3b1000b003813b9fe382mr18332369wms.9.1646209687407; 
 Wed, 02 Mar 2022 00:28:07 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:3530:ddb:a61:e8db?
 ([2001:861:44c0:66c0:3530:ddb:a61:e8db])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d550a000000b001e30e81afd1sm15903883wrv.2.2022.03.02.00.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 00:28:07 -0800 (PST)
Message-ID: <09756faa-5bfd-beac-0c77-976601141ad1@baylibre.com>
Date: Wed, 2 Mar 2022 09:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 0/2] Power: meson-s4: add s4 power domain driver
Content-Language: en-US
To: "shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, khilman <khilman@baylibre.com>,
 jbrunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "jianxin.pan" <jianxin.pan@amlogic.com>
References: <20220301015849.827634-1-shunzhou.jiang@amlogic.com>
 <9c35b653-6cf4-a13e-ce7b-b186cf4b68f4@baylibre.com>
 <2022030211175891410963@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <2022030211175891410963@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_002809_102311_133E11C0 
X-CRM114-Status: GOOD (  14.80  )
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

SGksDQoNCk9uIDAyLzAzLzIwMjIgMDQ6MTcsIHNodW56aG91LmppYW5nQGFtbG9naWMuY29tIHdy
b3RlOg0KPiBIaSwNCj4gT0ssIHRoYW5rcyB5b3VyIHJlcGx5DQo+IEkgd2lsbCBjaGVjayB0aGlz
IGlzc3VlDQoNCkFub3RoZXIgeDggc2V0IG9mIG1haWxzIGFycml2ZWQgb24gdGhlIG1haWxpbmct
bGlzdCBmcm9tIHlvdXIgc2lkZSwgcGxlYXNlIGZpeCB0aGUgcHJvYmxlbS4NCg0KTmVpbA0KDQo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBTaHVuemhvdSBKaWFuZw0KPiBTVyBEZXBhcnRtZW50
DQo+IA0KPiAgICAgKkZyb206KiBOZWlsIEFybXN0cm9uZyA8bWFpbHRvOm5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPg0KPiAgICAgKkRhdGU6KsKgMjAyMi0wMy0wMcKgMTY6MzkNCj4gICAgICpUbzoq
IFNodW56aG91IEppYW5nIDxtYWlsdG86c2h1bnpob3UuamlhbmdAYW1sb2dpYy5jb20+DQo+ICAg
ICAqQ0M6KiBsaW51eC1hcm0ta2VybmVsIDxtYWlsdG86bGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnPjsgbGludXgtYW1sb2dpYyA8bWFpbHRvOmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZz47IGxpbnV4LWtlcm5lbCA8bWFpbHRvOmxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+OyBkZXZpY2V0cmVlIDxtYWlsdG86ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+
OyBraGlsbWFuIDxtYWlsdG86a2hpbG1hbkBiYXlsaWJyZS5jb20+OyBqYnJ1bmV0IDxtYWlsdG86
amJydW5ldEBiYXlsaWJyZS5jb20+OyBtYXJ0aW4uYmx1bWVuc3RpbmdsIDxtYWlsdG86bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT47IGppYW54aW4ucGFuIDxtYWlsdG86amlhbnhp
bi5wYW5AYW1sb2dpYy5jb20+DQo+ICAgICAqU3ViamVjdDoqwqBSZTogW1BBVENIIFY1IDAvMl0g
UG93ZXI6IG1lc29uLXM0OiBhZGQgczQgcG93ZXIgZG9tYWluIGRyaXZlcg0KPiAgICAgWyBFWFRF
Uk5BTCBFTUFJTCBdDQo+ICAgICBIaSwNCj4gICAgIE9uIDAxLzAzLzIwMjIgMDI6NTgsIFNodW56
aG91IEppYW5nIHdyb3RlOg0KPiAgICAgID4gVGhpcyBwYXRjaHNldCBhZGRzIFBvd2VyIGNvbnRy
b2xsZXIgZHJpdmVyIHN1cHBvcnQgZm9yIE1lc29uLVM0IFNvQw0KPiAgICAgID4gTGlrZXMgTWVz
b24tQTEsIHRoZSBwb3dlciBkb21haW5zIHJlZ2lzdGVyIG9ubHkgY2FuIGFjY2VzcyBpbiBzZWN1
cmUgd29ybGQNCj4gICAgICA+DQo+ICAgICAgPiBTaHVuemhvdSBKaWFuZyAoMik6DQo+ICAgICAg
PsKgwqDCoCBkdC1iaW5kaW5nczogcG93ZXI6IGFkZCBBbWxvZ2ljIHM0IHBvd2VyIGRvbWFpbnMg
YmluZGluZ3MNCj4gICAgICA+wqDCoMKgIHNvYzogczQ6IEFkZCBzdXBwb3J0IGZvciBwb3dlciBk
b21haW5zIGNvbnRyb2xsZXINCj4gICAgICA+DQo+ICAgICAgPsKgwqAgLi4uL3Bvd2VyL2FtbG9n
aWMsbWVzb24tc2VjLXB3cmMueWFtbMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKystDQo+ICAgICAg
PsKgwqAgZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jwqDCoMKgwqDCoMKg
IHwgMjIgKysrKysrKysrKysrKysrKysrKw0KPiAgICAgID7CoMKgIGluY2x1ZGUvZHQtYmluZGlu
Z3MvcG93ZXIvbWVzb24tczQtcG93ZXIuaMKgwqDCoCB8IDE5ICsrKysrKysrKysrKysrKysNCj4g
ICAgICA+wqDCoCAzIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gICAgICA+wqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9w
b3dlci9tZXNvbi1zNC1wb3dlci5oDQo+ICAgICAgPg0KPiAgICAgID4NCj4gICAgICA+IGJhc2Ut
Y29tbWl0OiAzNDQ4YTAxOGRlZDAzY2NkNDA5M2Q2Njc1ZjRhMzllYjJkMWExOGVmDQo+ICAgICBJ
IHRoaW5rIHlvdSBoYXZlIGFuIGlzc3VlIHdpdGggeW91ciBtYWlsIHNldHVwLCB5b3Ugc2VudCA1
IHRpbWVzIHRoZSBzYW1lICJbUEFUQ0ggVjUgMC8yXSBQb3dlcjogbWVzb24tczQ6IGFkZCBzNCBw
b3dlciBkb21haW4gZHJpdmVyIiBwYXRjaHNldC4NCj4gICAgIFBsZWFzZSBmaXggaXQgYW5kIG1h
a2VyIGl0IGRvZXNuJ3QgaGFwcGVuIGFnYWluLg0KPiAgICAgVGhhbmtzLA0KPiAgICAgTmVpbA0K
PiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
