Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2534C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1VDYtc8DifuPXquPXdF0Ii27NZxvqzHvDCABPvgAo4=; b=jAmuNgndiEwg5g
	XGct53IBQNKdkByPABERkSrYuVNxpI42FnAd5CO4WFBotZo9f0k2jPOqvn5DLXWIi0OZqHo9u1Opi
	78HJ92AfxiXcXeK49GL+UqzCJHp1anjumeK0jNQSQf33H5vjcqtyZcZBUh+jZ4EbceaCq8+ve97m/
	5Kar4k5LqsR/HQ1FzHa+ROt8yGHPMKn5ARJiM5a49IFeGIhWZj64IINCk8d79RgxjEq3gLm1odnTW
	1QoBDFO2RciqbkK+X88rKQIjZ4sj0QlGW9G6atlhqzXyUQVs3Y0UhNELI6+RQwqtxgtcgxDhydUeO
	M6KjXtz4XOQoOIsuxOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np8D1-00BsCr-FX; Thu, 12 May 2022 12:46:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np8Cy-00BsBq-VB; Thu, 12 May 2022 12:46:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90B5E106F;
 Thu, 12 May 2022 05:46:19 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D0D03F66F;
 Thu, 12 May 2022 05:46:17 -0700 (PDT)
Message-ID: <695be0af-b642-af0c-052a-f4c05df7424f@arm.com>
Date: Thu, 12 May 2022 13:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-GB
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <CANiq72m+OVcX1gPit94D1hjzkduyVFoCWXKSXTxpUDFtKs8z6g@mail.gmail.com>
 <aa97c09e-aa82-e2c4-326e-991330e65de7@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <aa97c09e-aa82-e2c4-326e-991330e65de7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_054621_084952_813F9F7C 
X-CRM114-Status: GOOD (  11.98  )
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

T24gMjAyMi0wNC0yNCAxMDowNiwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDIzLjA0LjIw
MjIgMjI6NTcsIE1pZ3VlbCBPamVkYSB3cm90ZToKPj4gT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQg
MTA6MDkgUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVGl0YW5tZWMgVE0xNjI4IDcg
c2VnbWVudCBkaXNwbGF5Cj4+PiBjb250cm9sbGVyLiBJdCdzIGJhc2VkIG9uIHByZXZpb3VzIFJG
QyB3b3JrIGZyb20gQW5kcmVhcyBGw6RyYmVyLgo+Pgo+PiBBRkFJVSB0aGUgZGlzY3Vzc2lvbiBo
YXMgY29udmVyZ2VkIGF0IHRoaXMgcG9pbnQsIGNvcnJlY3Q/IElzIHRoZXJlCj4+IGFueSBmZWVk
YmFjayBsZWZ0IHRvIGFkZHJlc3M/Cj4+Cj4gU3RpbGwgb3BlbiBpcyB0byBkZWZpbmUgRFQgYmlu
ZGluZ3MgdGhhdCBjYW4gc3VwcG9ydCBhbHNvIHRoZSBrZXkgaW5wdXQKPiBmZWF0dXJlIG9mIHRo
ZSBjaGlwLiBSb2JpbiBwaWNrZWQgdXAgdGhpcyB0b3BpYyBhbmQgaGFzIHNvbWUgaWRlYXMuCgpT
b3JyeSB0aGlzIHNsaXBwZWQgdGhyb3VnaCB0aGUgY3JhY2tzIGFnYWluLi4uIDooCgpBcyBtZW50
aW9uZWQsIEkgdGhpbmsgdGhlIGRpc2NvdmVyeSBvZiB0aGUgImxpbnV4LGtleW1hcCIgYWxsZXZp
YXRlcyB0aGUgCmNvbmNlcm4gSSBoYWQgd2l0aCB0aGUgYmluZGluZyAtIGl0IHNlZW1lZCB1Z2x5
IHRvIGhhdmUgdG8gaW52ZW50IGEgCmRldmljZS1zcGVjaWZpYyBwcm9wZXJ0eSB0aGF0IHdvcmtl
ZCB0aGF0IHdheSwgYnV0IGlmIGEgY29tbW9uIG9uZSAKYWxyZWFkeSBleGlzdHMgdGhhdCdzIGEg
ZGlmZmVyZW50IG1hdHRlci4gSSdtIHByZXR0eSBjb25maWRlbnQgbm93IHRoYXQgCnRoZSBpZGVh
cyBJIGhhdmUgZm9yIHN1cHBvcnRpbmcgdGhlIGlucHV0IHNpZGUgb2YgdGhpbmdzIGFuZCB0aGUg
b3RoZXIgCjE2eDggY2hpcHMgdGhhdCBJIGhhdmUgaGVyZSBjYW4gYWxsIGJlIGRvbmUgYXMgcHVy
ZSBhZGRpdGlvbnMgd2l0aCBubyAKY29tcGF0aWJpbGl0eSBjb25jZXJucywgc28gZnJvbSBteSBQ
b1YgSSdtIGhhcHB5IGlmIHlvdSB3YW50IHRvIGdvIGFoZWFkIAphbmQgbGFuZCB0aGlzIGFzLWlz
IGZvciA1LjE5LCBhbmQgSSBjYW4gc2VuZCBwYXRjaGVzIGxhdGVyLgoKQ2hlZXJzLApSb2Jpbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
