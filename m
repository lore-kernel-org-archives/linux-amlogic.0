Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC01C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEa4swzKJQ1n6juib6XozjuovT+2Xy98qM1IZrQqLVE=; b=l41gV1ZGo7fqQs
	cfBCVNYg8u/cyK6ONNKScTEFAFE1ORz+hU1kef2rFqH/DzvH4XsSJatWizZGVNbBAV2bI51vdaCZB
	uG4Dl8FBnJ63FuOI7Y+Wh8VE3TTWd27m2/42v8g42WmLnP+enxobVMA1jCcINCFn6dfbtkxTh+2Va
	EOHEc2bEvy0xSWluu5EIzvsc5d9IhWibibRf8VozIxusLh+DmaUkmlfT7Bcl8wxvriZemyCmPTFsE
	8Un0gXOWwN7SZtyyLoyA7V82RDfMPN2+K2LwPLV5cErGnLLMI/f/pDr/zBkEBcF45ckRbaGM8NXeK
	GsJdGcp0Fys4FhYaN1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLTLn-00HN2P-U3; Sat, 19 Feb 2022 17:16:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLTLb-00HN1U-9K; Sat, 19 Feb 2022 17:16:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id s24so14548254edr.5;
 Sat, 19 Feb 2022 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=T9EQL5ZXNiD+KSv8P5NAsXTQao5/V3noUXFDN8MuNzk=;
 b=I4x2sSs28bNnRdwIYHiDEpgJ0QStGbZFXjcOyVyb+rfJrG8t9CDV7vIiDpJM/UroJD
 GbvJzZkAlulVPXeWjl0u7yr569mLS3iv1sJMUm5+96eKHdK3yLy7xrA8l4vr60XbaQMr
 vwwK+i7ymWcIgSZQzflUhiqz9SlTstmVP3n9Kvnk0hgU8m9PSXKbmRc4ESbzK6al/Lai
 LTCFRXKcU4rPFWOaRfc8RVKszeqj+HA/P8n89Nf3jYYksC2yP4NVhB1eiyMTvnEDsSk9
 Z/97v0BE9JfNSCbgX6752MWjmjJJ8mp62RIZFzb2cB4rNKalA1VEN5SaVgmO7LXV1rki
 T/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=T9EQL5ZXNiD+KSv8P5NAsXTQao5/V3noUXFDN8MuNzk=;
 b=Z2Fnn8NFtptm0PW4Rd4fNDAZS0Zaf1nosgpAN7CP3ikCTf1YvsVlhsdPvbkmpkI0uY
 zc4Cne8zeEc4qJM09eGrBS+jVs0ykKwxS9uz+BHlXWUoQqrjaXsyHMtIKvuPoX51LdNs
 o7npNuUpVqAEdmuPmYwu/I2UsxLl021mzy9lio++lm3nqXL7Mo0Oq7gT02NrEET7GhG2
 uosBl+o+Uj1kebRCKprH79pPDnhYUepTTLtC8GgqDseQ6R05PU4W2YqMvrXH9bo9WkTo
 kWmcebfx4ZhqraX6AS2V36IDAhcuHnaei3uWSwapBXoJQ55aYBYxJAC2IKgR0dz8kCT7
 gm1w==
X-Gm-Message-State: AOAM531jCWUVOP0sLcoVbXMj3XB9E0uGj8PLxNxxIoEp9wGGqSleVi3c
 RlbRs0NyCq6OC2dPqs+QG+c=
X-Google-Smtp-Source: ABdhPJykHTjW+gWjmanRPCbVfqty60bJcp6S25QsAeOqUloeISYFvnm09pvUhltBBk0suYWV78hO3Q==
X-Received: by 2002:a05:6402:3549:b0:412:b31c:5509 with SMTP id
 f9-20020a056402354900b00412b31c5509mr11051717edd.224.1645290997226; 
 Sat, 19 Feb 2022 09:16:37 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d?
 (p200300ea8f4d2b005cf9df09c1b3d44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d])
 by smtp.googlemail.com with ESMTPSA id z22sm6522838edd.45.2022.02.19.09.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 09:16:36 -0800 (PST)
Message-ID: <09bf3d8a-2902-723b-80d2-0c4d1c24f53d@gmail.com>
Date: Sat, 19 Feb 2022 18:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
 <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
 <862fc0e3-6c76-8dea-6725-a6c45ade1ecd@suse.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
In-Reply-To: <862fc0e3-6c76-8dea-6725-a6c45ade1ecd@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_091639_365185_1E0A6C68 
X-CRM114-Status: GOOD (  26.53  )
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

T24gMTkuMDIuMjAyMiAxNzowNywgQW5kcmVhcyBGw6RyYmVyIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDE5LjAyLjIyIDE0OjM3LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjIg
MTQ6MjcsIE1pZ3VlbCBPamVkYSB3cm90ZToKPj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDI6
MTMgUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4K
Pj4+PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBUaXRhbm1lYyBUTTE2MjggNyBz
ZWdtZW50IGRpc3BsYXkKPj4+PiBjb250cm9sbGVyLiBJdCdzIGJhc2VkIG9uIHByZXZpb3VzIFJG
QyB3b3JrIGZyb20gQW5kcmVhcyBGw6RyYmVyLgo+Pj4+IFRoZSBSRkMgdmVyc2lvbiBwbGFjZWQg
dGhlIGRyaXZlciBpbiB0aGUgTEVEIHN1YnN5c3RlbSwgYnV0IHRoaXMgd2FzCj4+Pj4gTkFLJ2Vk
IGJ5IHRoZSBMRUQgbWFpbnRhaW5lci4gVGhlcmVmb3JlIEkgbW92ZWQgdGhlIGRyaXZlciB0bwo+
Pj4+IC9kcml2ZXJzL2F1eGRpc3BsYXkgd2hhdCBzZWVtcyBtb3N0IHJlYXNvbmFibGUgdG8gbWUu
Cj4+Pgo+Pj4gQ291bGQgeW91IHBsZWFzZSBsaW5rIHRvIHRoZSBkaXNjdXNzaW9uIGFuZC9vciBz
dW1tYXJpemUgdGhlIHJhdGlvbmFsZQo+Pj4gYmVoaW5kIHRoZSBOQUs/Cj4+Pgo+Pgo+PiArUGF2
ZWwKPj4KPj4gSSBkaWRuJ3QgZmluZCBhbiBleHBsaWNpdCByZWFzb24sIGJ1dCBJIHN1cHBvc2Ug
UGF2ZWwgc2VlcyB0aGlzIGRyaXZlciBhcwo+PiBvbmUgdGhhdCBtYWtlcyB1c2Ugb2YgdGhlIExF
RCBzdWJzeXN0ZW0sIGJ1dCBkb2Vzbid0IGJlbG9uZyB0byBpdC4KPj4gSW4gdGhlIGZvbGxvd2lu
ZyBtYWlsIGhlJ3MgZXhwcmVzc2luZyBoaXMgb3BpbmlvbiB0aGF0IHRoZSBkcml2ZXIgc2hvdWxk
Cj4+IGJlIGJlc3QgcGxhY2VkIHVuZGVyIGF1eGRpc3BsYXkuCj4+Cj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMDAyMjYxMzAzMDAuR0IyODAwQGR1by51Y3cu
Y3ovCj4gCj4gQW5kIEkgZGlzYWdyZWVkLiBJdCBkb2VzIG5vdCBmaXQgd2l0aCB0aGUgb3RoZXIg
ZHJpdmVycyBpbiBhdXhkaXNwbGF5Cj4gdGhhdCB3ZXJlIG9wZXJhdGluZyBvbiBhIG11Y2ggaGln
aGVyIGxldmVsLgo+IAoKV2UgbmVlZCB0byBmaW5kIGEgcGxhY2UuIEFuZCBpZiBQYXZlbCBoYXMg
Z29vZCByZWFzb25zIHRoYXQgaXQgZG9lc24ndApmaXQgaW50byB0aGUgTEVEIHN1YnN5c3RlbSwg
YW5kIE1pZ3VlbCBzaG91bGQgYmUgZmluZSB3aXRoIGhhdmluZwppdCBpbiBhdXhkaXNwbGF5LCB0
aGVuIEknZCBzZWUgbm8gcmVhc29uIHRvIG5vdCBnbyB0aGlzIHdheS4KCj4gSSdkIGFsc28gbGlr
ZSB0byBwb2ludCBvdXQgdGhhdCBJIGRpZCBpbXBsZW1lbnQgdGhlIG1hcF90b183c2VnbWVudCBB
UEksCgpMb29raW5nIGF0IHRoZSBoaXN0b3J5IG9mIGluY2x1ZGUvdWFwaS9saW51eC9tYXBfdG9f
N3NlZ21lbnQuaCBJIHNlZSBubwpjb21taXQgZnJvbSB5b3UuIFNlZW1zIEknbSBtaXNzaW5nIHNv
bWV0aGluZyBoZXJlLgoKPiBhcyB3YXMgc3VnZ2VzdGVkLCBhcyB5b3Ugd2lsbCBmaW5kIGluIG15
IHRyZWUgLSB3aGljaCB5b3UgbWF5IGhhdmUKPiBtaXNzZWQsIHJlZmVyZW5jaW5nIG9ubHkgdGhl
IFJGQyBwYXRjaHNldCBhbmQgcHV0dGluZyB5b3VyIGF1dGhvcnNoaXAgb24KPiBpdCBleGNsdXNp
dmVseT8gQSBtb3ZlIGZyb20gb25lIGRpcmVjdG9yeSB0byBhbm90aGVyIHNob3VsZCBub3Qgd2Fy
cmFudAo+IG15IGF1dGhvciBhbmQgU29CIGdldHRpbmcgcmVtb3ZlZCBmcm9tIHRoZSBhY3R1YWwg
ZHJpdmVyLgo+IApUaGUgZHJpdmVyIGluY2x1ZGVzIG1ham9yIGNoYW5nZXMgYW5kIEkgbWVudGlv
bmVkIHlvdXIgd29yayBpbiB0aGUgY29tbWl0Cm1lc3NhZ2UuIEFsc28geW91ciBzdGlsbCBsaXN0
ZWQgYXMgTU9EVUxFX0FVVEhPUi4gTXkgaW50ZW50aW9uIGlzIHRvCmdldCBhIGRyaXZlciB1cHN0
cmVhbSwgbm90IHRvIGVhcm4gY3JlZGl0cyBmb3Igc29tZXRoaW5nLgpTbyBzdXJlLCB5b3VyIFNv
QiBjYW4gYmUgKHJlLSlhZGRlZC4KCj4gR2l2ZW4gdGhhdCB3ZSBuZWVkIHRvIG1hbmFnZSBhIGJ1
ZmZlciB3aXRoIGJpdHMgcGVyIHNlZ21lbnQgb3IgTEVECj4gc3ltYm9sLCBvbmUgaWRlYSB0aGF0
IEkgaGF2ZW4ndCBmb3VuZCB0aW1lIGZvciB5ZXQgd2FzIHRvIGltcGxlbWVudCBpdAo+IGFzIGZy
YW1lYnVmZmVyIG9yIGRybSBkZXZpY2UgaW5zdGVhZC4gKEFuZCBtb3N0IFJlYWx0ZWsgcGxhdGZv
cm1zIGdvdAo+IGJyb2tlbiBieSByZW1vdmluZyB0aGUgYWRqdXN0YWJsZSB0ZXh0IGJhc2UgZGVm
aW5lcy4pCj4gCkknbSBub3QgYXdhcmUgb2YgdGhlIFJlYWx0ZWsgcGxhdGZvcm0gaXNzdWUsIGRv
IHlvdSBoYXZlIGEgbGluayB0byBhCnJlbGF0ZWQgZGlzY3Vzc2lvbj8gQW5kIHdvdWxkbid0IHlv
dSB0aGluayBpdCdzIG92ZXJlbmdpbmVlcmluZyB0bwp3cml0ZSBhIERSTSBkcml2ZXIgZm9yIGEg
NyBzZWdtZW50IGRpc3BsYXkgd2l0aCA0IGRpZ2l0cz8KRnJhbWVidWZmZXIgc2VlbXMgdG8gYmUg
ZGVwcmVjYXRlZCBiYXNlZCBvbiBteSBleHBlcmllbmNlIHdpdGgKcHlnYW1lIC8gU0RMMi4KCj4g
UmVnYXJkcywKPiBBbmRyZWFzCj4gCgpIZWluZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
