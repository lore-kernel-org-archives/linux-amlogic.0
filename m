Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB4C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 05:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV/CfF7Tyks/+FikgK+sUbUOZG1uiMz71ha/N2nIUTY=; b=UNn3wa07Skbggf
	dDtWdBIGWF/yg7UDThBi+mnWFVI1hLKaL2YUlugvd4uxtloIOfTy1H+M3W3mj4FyUl4D8xZcoSbRU
	zGTwRVxccyJNmhaxvL36s1uxGUtsjyiEIR8rFuU8gPs5nP29SMiCvWr2Nn8G6uSakfFZXr4UXjG4F
	NqTu6S7wC18pjLz63wj8d+SHgm8M0mndc8g/j4W23oR5v7c83xVVHcBPdTCdS32pXEERviG0bOdHB
	bRpIwIipSLWY9K/vQoBPuo2svPJ6keMNO+Vscmq3O8JgmQxO1JhozCXdFpJ3XfEr67/P5Qaz3N57g
	UB0PFG/Ge4SXQPfXSj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZRIA-00ENcW-Ro; Wed, 30 Mar 2022 05:54:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZRHx-00ENb6-BV; Wed, 30 Mar 2022 05:54:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id dr20so39265874ejc.6;
 Tue, 29 Mar 2022 22:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:from:to:cc
 :references:subject:in-reply-to:content-transfer-encoding;
 bh=DHKF29KIzeu21L0gO/jkIT7rciW0MBMKRGkMqwSkDA0=;
 b=Ka5X1JVLEP0R3joHzsWSElvFQxffajrDIUQlqK5XvxpfUlxsa/PJ1rLYEgsbwAb8j+
 kA2zZhTIX1Er0ykvpGGsYJo4SUPRQza1ZQFAzmt17/YV2TvWv4l/x11EwZOAOmgcGYzG
 pa8JHsF4hM8wgXzOAW58vPT1IpVo4W0MSbGLSyWQXLlN4BupFCA6HK45ufqT3DK11peL
 WCjxB7iJ2Sq3r7KDCUWvz5IxOX2OjsDitHMmXJINZM1euPE1bAj1xDIx7ucVEKRoIM5/
 d+lMZH5rT/Gm/LtgsG9nqYZuED1t9yF0f6MKQX/FFgC0la3Ndji7Pmkv8syMMd6Rb2WQ
 Jmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:references:subject:in-reply-to
 :content-transfer-encoding;
 bh=DHKF29KIzeu21L0gO/jkIT7rciW0MBMKRGkMqwSkDA0=;
 b=qcQz7pxkMbvWIbe25fjnmHSaKmkYn0VAuxzf5V9PG9BZHs97LZZoqtYbE4YQXAXEls
 KZ9XoEX71cVmzMzgZdKr8/MEzwdcOGNwJumkShACv/SgW5DkBSaXfR3rgbcOE5POfOIe
 tvnWb68GoGlxG9DFPOy0qBadgbnv2Qe4H4/Ybm9I4JjSR6D2lJ/k4xa7JuBZBmI73XO0
 Tq792Qobx9Mx38fEOlIPUehS5J0EsAZBfUaenCnm5oJgupuKDermbE/yRbcKEkkrhTXg
 ncas7gax6FSz1wevoLfR+Rlc77QNXri9RsQCu0kxBiOJY5QeE10kf4oP8mUMOJBtbXoT
 /lcQ==
X-Gm-Message-State: AOAM530WXX4KfFqgK8xjWpNg0eCNk83ZLJ3QJ+SVvG0cIxuvdMcnMUCf
 42mTCcFyBN2tHpm9TKTw0rM=
X-Google-Smtp-Source: ABdhPJx3zKca4J+605kYrlBKsx3Agjbdbik/tUx18mN6k4hHx3s9efeCcz7wXHpt280FBFx5m/EQ3w==
X-Received: by 2002:a17:907:6093:b0:6e0:dabf:1a9f with SMTP id
 ht19-20020a170907609300b006e0dabf1a9fmr23497528ejc.424.1648619674852; 
 Tue, 29 Mar 2022 22:54:34 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7297:6000:c4c:6238:939a:937?
 (dynamic-2a01-0c22-7297-6000-0c4c-6238-939a-0937.c22.pool.telefonica.de.
 [2a01:c22:7297:6000:c4c:6238:939a:937])
 by smtp.googlemail.com with ESMTPSA id
 hq15-20020a1709073f0f00b006dfc0fe42b1sm8009085ejc.177.2022.03.29.22.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 22:54:33 -0700 (PDT)
Message-ID: <5fde764f-4caf-8017-3cbd-3918f3390b6a@gmail.com>
Date: Wed, 30 Mar 2022 07:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
 <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
 <9e2fc38a-a51e-7635-970c-64948fc6eae4@kernel.org>
 <80937566-6455-b1bf-0a5d-a7b54dd3adc5@gmail.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
In-Reply-To: <80937566-6455-b1bf-0a5d-a7b54dd3adc5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_225437_437127_5DBC5660 
X-CRM114-Status: GOOD (  18.68  )
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

T24gMjMuMDMuMjAyMiAyMTozMywgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDIxLjAzLjIw
MjIgMDk6MzQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDE4LzAzLzIwMjIgMjE6
NTAsIFJvYmluIE11cnBoeSB3cm90ZToKPj4+IE9uIDIwMjItMDItMjUgMjE6MTMsIEhlaW5lciBL
YWxsd2VpdCB3cm90ZToKPj4+PiBBZGQgYSBZQU1MIHNjaGVtYSBiaW5kaW5nIGZvciBUTTE2Mjgg
YXV4ZGlzcGxheQo+Pj4+ICg3LzExLXNlZ21lbnQgTEVEKSBjb250cm9sbGVyLgo+Pj4+Cj4+Pj4g
VGhpcyBwYXRjaCBpcyBwYXJ0aWFsbHkgYmFzZWQgb24gcHJldmlvdXMgd29yayBmcm9tCj4+Pj4g
QW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPi4KPj4+Pgo+Pj4+IENvLWRldmVsb3Bl
ZC1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+IHY1
Ogo+Pj4+IC0gYWRkIHZlbmRvciBwcmVmaXggdG8gZHJpdmVyLXNwZWNpZmljIHByb3BlcnRpZXMK
Pj4+PiAtLS0KPj4+PiAgIC4uLi9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55
YW1sICB8IDkyICsrKysrKysrKysrKysrKysrKysKPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5MiBp
bnNlcnRpb25zKCspCj4+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxh
eS90aXRhbm1lYyx0bTE2MjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAuLjJhMWVmNjkyYwo+Pj4+IC0tLSAvZGV2L251bGwKPj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRh
bm1lYyx0bTE2MjgueWFtbAo+Pj4+IEBAIC0wLDAgKzEsOTIgQEAKPj4+PiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb3ItbGF0ZXIgT1IgQlNELTItQ2xhdXNlKQo+Pj4+ICsl
WUFNTCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCMKPj4+PiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4gKwo+Pj4+ICt0aXRs
ZTogVGl0YW4gTWljcm8gRWxlY3Ryb25pY3MgVE0xNjI4IExFRCBjb250cm9sbGVyCj4+Pj4gKwo+
Pj4+ICttYWludGFpbmVyczoKPj4+PiArICAtIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3Vz
ZS5kZT4KPj4+PiArICAtIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4+
Pj4gKwo+Pj4+ICthbGxPZjoKPj4+PiArICAtICRyZWY6IC9zY2hlbWFzL3NwaS9zcGktcGVyaXBo
ZXJhbC1wcm9wcy55YW1sIwo+Pj4+ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArICBjb21wYXRp
YmxlOgo+Pj4+ICsgICAgY29uc3Q6IHRpdGFubWVjLHRtMTYyOAo+Pj4+ICsKPj4+PiArICByZWc6
Cj4+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArICB0aXRhbm1lYyxncmlkOgo+Pj4+
ICsgICAgZGVzY3JpcHRpb246Cj4+Pj4gKyAgICAgIE1hcHBpbmcgb2YgZGlzcGxheSBkaWdpdCBw
b3NpdGlvbiB0byBncmlkIG51bWJlci4KPj4+PiArICAgICAgVGhpcyBpbXBsaWNpdGx5IGRlZmlu
ZXMgdGhlIGRpc3BsYXkgc2l6ZS4KPj4+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQ4LWFycmF5Cj4+Pj4gKyAgICBtaW5JdGVtczogMQo+Pj4+ICsgICAg
bWF4SXRlbXM6IDcKPj4+PiArCj4+Pj4gKyAgdGl0YW5tZWMsc2VnbWVudC1tYXBwaW5nOgo+Pj4+
ICsgICAgZGVzY3JpcHRpb246Cj4+Pj4gKyAgICAgIE1hcHBpbmcgb2YgNyBzZWdtZW50IGRpc3Bs
YXkgc2VnbWVudHMgQS1HIHRvIGJpdCBudW1iZXJzIDEtMTIuCj4+Pj4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQo+Pj4+ICsgICAgbWluSXRl
bXM6IDcKPj4+PiArICAgIG1heEl0ZW1zOiA3Cj4+Pj4gKwo+Pj4+ICsgICIjYWRkcmVzcy1jZWxs
cyI6Cj4+Pj4gKyAgICBjb25zdDogMgo+Pj4+ICsKPj4+PiArICAiI3NpemUtY2VsbHMiOgo+Pj4+
ICsgICAgY29uc3Q6IDAKPj4+PiArCj4+Pj4gK3JlcXVpcmVkOgo+Pj4+ICsgIC0gY29tcGF0aWJs
ZQo+Pj4+ICsgIC0gcmVnCj4+Pgo+Pj4gV291bGQgaXQgYmUgZmFpciB0byBzYXkgdGhhdCAic3Bp
LWxzYi1maXJzdCIgYW5kICJzcGktM3dpcmUiIGFyZSBhbHNvIAo+Pj4gcmVxdWlyZWQ/IFRoZSBj
aGlwcyBhcmVuJ3QgY29uZmlndXJhYmxlIHNvIHdvbid0IGV4YWN0bHkgYmUgdXNhYmxlIGFueSAK
Pj4+IG90aGVyIHdheS4gRnVydGhlcm1vcmUgSSBiZWxpZXZlIHRoZSB0cmFuc21pc3Npb24gZm9y
bWF0IGFjdHVhbGx5IHdvcmtzIAo+Pj4gb3V0IGVxdWl2YWxlbnQgdG8gU1BJIG1vZGUgMywgc28g
c2hvdWxkIHdhcnJhbnQgInNwaS1jcGhhIiBhbmQgCj4+PiAic3BpLWNwb2wiIGFzIHdlbGwuCj4+
Pgo+Pj4+ICsKPj4+PiArcGF0dGVyblByb3BlcnRpZXM6Cj4+Pj4gKyAgIl4uKkBbMS03XSwoWzEt
OV18MVswLTZdKSQiOgo+Pj4+ICsgICAgdHlwZTogb2JqZWN0Cj4+Pj4gKyAgICAkcmVmOiAvc2No
ZW1hcy9sZWRzL2NvbW1vbi55YW1sIwo+Pj4+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQo+Pj4+ICsgICAgZGVzY3JpcHRpb246IHwKPj4+PiArICAgICAgUHJvcGVydGllcyBmb3Ig
YSBzaW5nbGUgTEVELgo+Pj4+ICsKPj4+PiArICAgIHByb3BlcnRpZXM6Cj4+Pj4gKyAgICAgIHJl
ZzoKPj4+PiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+Pj4+ICsgICAgICAgICAgMS1iYXNlZCBn
cmlkIG51bWJlciwgZm9sbG93ZWQgYnkgMS1iYXNlZCBzZWdtZW50IGJpdCBudW1iZXIuCj4+Pj4g
KyAgICAgICAgbWF4SXRlbXM6IDEKPj4+PiArCj4+Pj4gKyAgICByZXF1aXJlZDoKPj4+PiArICAg
ICAgLSByZWcKPj4+Cj4+PiBJJ20gY29uY2VybmVkIHRoYXQgdGhpcyBsZWF2ZXMgdXMgbm8gcm9v
bSB0byBzdXBwb3J0IHRoZSBhZGRpdGlvbmFsIAo+Pj4ga2V5cGFkIGZ1bmN0aW9uYWxpdHkgaW4g
ZnV0dXJlLiBIYXZpbmcgbm93IGRvdWJsZS1jaGVja2VkIGEgZGF0YXNoZWV0LCAKPj4+IHRoZSBp
bnB1dHMgYXJlIGFsc28gYSB0d28tZGltZW5zaW9uYWwgbXV4IChzaGFyaW5nIHRoZSBzZWdtZW50
IGxpbmVzKSwgCj4+PiBzbyB0aGUgZGV2aWNlIGVmZmVjdGl2ZWx5IGhhcyB0d28gZGlzdGluY3Qg
YnV0IG51bWVyaWNhbGx5LW92ZXJsYXBwaW5nIAo+Pj4gY2hpbGQgYWRkcmVzcyBzcGFjZXMgLSBv
bmUgYWRkcmVzc2VkIGJ5IChncmlkLHNlZ21lbnQpIGFuZCB0aGUgb3RoZXIgYnkgCj4+PiAoc2Vn
bWVudCxrZXkpLgo+Pj4KPj4+IFJvYiwgS3J5c3p0b2YsIGFueSB0aG91Z2h0cyBvbiB0aGUgYmVz
dCBEVCBpZGlvbSB0byBsZWF2ZSBhY2NvbW1vZGF0aW9uIAo+Pj4gZm9yIHRoYXQ/IEknbSB0aGlu
a2luZyBlaXRoZXIgcmVxdWlyZSBhbiBpbnRlcm1lZGlhdGUgbm9kZSB0byBjb250YWluIAo+Pj4g
ZWFjaCBub3Rpb25hbCBhZGRyZXNzIHNwYWNlLCBvciBwZXJoYXBzIGFkZCBhbm90aGVyIGxlYWRp
bmcgYWRkcmVzcyBjZWxsIAo+Pj4gdG8gc2VsZWN0IGJldHdlZW4gdGhlbT8gSSBkb24ndCBiZWxp
ZXZlIGFueSBvZiB0aGVzZSB0aGluZ3MgaGF2ZSBmdXJ0aGVyIAo+Pj4gZnVuY3Rpb25hbGl0eSBi
ZXlvbmQgdGhhdC4KPj4KPj4gSSB0aGluayBpbnRlcm1lZGlhdGUgbm9kZXMgLSBsZWRzLCBrZXlz
IC0gYXJlIG1vcmUgYXBwcm9wcmlhdGUsIGJlY2F1c2UKPj4gaXQgaXMgc2VsZi1kZXNjcmliaW5n
LiBBZGRpdGlvbmFsIGFkZHJlc3Mgc3BhY2UgbnVtYmVyIHdvdWxkIHJlcXVpcmUKPj4gZGVjb2Rp
bmcgdGhpcyAiMCIgb3IgIjEiIGludG8gTEVEL2tleS4gRm9yIGNvbXBsZXggZGV2aWNlcyAtIGxp
a2UgUE1JQ3MKPj4gd2l0aCByZWd1bGF0b3JzLCBSVEMgYW5kIGNsb2NrcyAtIHdlIGFscmVhZHkg
aGF2ZSBzdWNoIHBhdHRlcm5zLgo+Pgo+IFRoZW4gaXQncyBqdXN0IHRoZSBxdWVzdGlvbiB3aG8g
Y2FuIGltcGxlbWVudCBzdWNoIGFuIGludGVybWVkaWF0ZSBub2RlCj4gYmFzZWQgb24gd2hhdCBo
YXMgYmVlbiBkb25lIHNvIGZhci4KPiAKQXMgaXQgaXMgbm93IGl0IHNlZW1zIHdlIGVuZCB1cCB3
aXRoIGVtcHR5IGhhbmRzIGFnYWluIGFuZCBoYXZlIHRvIHdhaXQKZnVydGhlciB0d28geWVhcnMg
Zm9yIHRoZSBuZXh0IG9uZSB0byBtYWtlIGFuIGF0dGVtcHQuClRoYXQncyBhIHBpdHkgYmVjYXVz
ZSBmb3IgbW9zdCB1c2VycyB0aGUgcmVsZXZhbnQgdXNlIGNhc2VzIGFyZSBzdXBwb3J0ZWQuCgo+
PiBCZXN0IHJlZ2FyZHMsCj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
