Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30280C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Mar 2022 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JwnpQ5vfX8InpZSxat1SVNym9Q7zEBwzOixJEL7N5Y=; b=I/PRkeTGP5cjBy
	UxchQYb+8e4YRMO4mDOzqSCTABg1bocsGgzQk5FjNASzpkXYl3YdjBosiI8eN3KM28uAExzrCU+sz
	AMair91HQw9S4cPgRUgLj8YhFKxOaGJkPJTlOLZwwaisOO77X439UUMWVewf4sDdYmNFVuPjzIx6L
	k2zZTCv6lPAxxsIioKtQAbFsLPMrANZWzszH1ZNgjDyIgFnpvRHCMM+qbkFTPrQ7XSybtyoEuo8RZ
	AsrSq8yCxh400+CSGYFIQqI85WX92HwY0GqbdAkTRtBa/y4ApRuSC7+XdYX3dRbMDKsxVIkhc0GEQ
	LdB5cb6dW+54BvoBNQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWDV6-0072nO-G7; Mon, 21 Mar 2022 08:34:52 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWDUt-0072kr-PJ; Mon, 21 Mar 2022 08:34:41 +0000
Received: by mail-ej1-f44.google.com with SMTP id o10so9521284ejd.1;
 Mon, 21 Mar 2022 01:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WKB7432viqtAA43yhCKLQso3FafKoMqrO0twMiULF00=;
 b=ZNIhOaopHOcsusqffbEXE9X6Z3cWqo9+FpQmke9+c9Np3+kH8yiBICEghayqi0pbtG
 eI30Oarrr4la8/COiIpLcF/Nac5PTkWxhPAInqEsR+WJBroNSzVcmABGHYkHNYOOX1Xl
 fDCKj0rPF6JvfkH4zs9sMjuDYHrxJy9PEhSOnXY8ESeg3HBjMrL3tgREn4BMzVe5gboR
 oXyC9U9bEOoE2VPU9cijWBf93jG56cG/SGcrRN9B0XxgxpD8/9OAWmop8ZLu5he+fBI3
 bB2/zLgAn3u9Io+MpCMbTpfiou6Jxi2y9FsAjSGd5IVSjMBnbNzDINtncPvUL6j4n2VC
 k6Hg==
X-Gm-Message-State: AOAM532OMjyuPv9uTkfUGZyHHRmwl9RlqY1s/cu+3WAgAtZ5IPIgoTwO
 uWaZOjuEiYCWk+zbqoblk1A=
X-Google-Smtp-Source: ABdhPJy5vP3fVx572rAjjMQUjnDlowieOOjQSE5TgMjj/0D5UCRS0lP0lT8J0nUQdAZGDMKyrNAqgA==
X-Received: by 2002:a17:907:3e94:b0:6d1:d64e:3141 with SMTP id
 hs20-20020a1709073e9400b006d1d64e3141mr19018004ejc.213.1647851675791; 
 Mon, 21 Mar 2022 01:34:35 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 20-20020a17090601d400b006caff964e30sm6772407ejj.19.2022.03.21.01.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 01:34:34 -0700 (PDT)
Message-ID: <9e2fc38a-a51e-7635-970c-64948fc6eae4@kernel.org>
Date: Mon, 21 Mar 2022 09:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_013439_849110_D41B3DF4 
X-CRM114-Status: GOOD (  22.53  )
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

T24gMTgvMDMvMjAyMiAyMTo1MCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjItMDItMjUg
MjE6MTMsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4gQWRkIGEgWUFNTCBzY2hlbWEgYmluZGlu
ZyBmb3IgVE0xNjI4IGF1eGRpc3BsYXkKPj4gKDcvMTEtc2VnbWVudCBMRUQpIGNvbnRyb2xsZXIu
Cj4+Cj4+IFRoaXMgcGF0Y2ggaXMgcGFydGlhbGx5IGJhc2VkIG9uIHByZXZpb3VzIHdvcmsgZnJv
bQo+PiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Lgo+Pgo+PiBDby1kZXZlbG9w
ZWQtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPj4gU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgo+PiBTaWduZWQtb2ZmLWJ5OiBI
ZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+PiAtLS0KPj4gdjU6Cj4+IC0g
YWRkIHZlbmRvciBwcmVmaXggdG8gZHJpdmVyLXNwZWNpZmljIHByb3BlcnRpZXMKPj4gLS0tCj4+
ICAgLi4uL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwgIHwgOTIgKysr
KysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
dXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVj
LHRtMTYyOC55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMC4u
MmExZWY2OTJjCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwKPj4gQEAgLTAsMCAr
MSw5MiBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb3ItbGF0ZXIg
T1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCMKPj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
PiArCj4+ICt0aXRsZTogVGl0YW4gTWljcm8gRWxlY3Ryb25pY3MgVE0xNjI4IExFRCBjb250cm9s
bGVyCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJi
ZXJAc3VzZS5kZT4KPj4gKyAgLSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29t
Pgo+PiArCj4+ICthbGxPZjoKPj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9zcGkvc3BpLXBlcmlwaGVy
YWwtcHJvcHMueWFtbCMKPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0aWJsZToKPj4g
KyAgICBjb25zdDogdGl0YW5tZWMsdG0xNjI4Cj4+ICsKPj4gKyAgcmVnOgo+PiArICAgIG1heEl0
ZW1zOiAxCj4+ICsKPj4gKyAgdGl0YW5tZWMsZ3JpZDoKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4g
KyAgICAgIE1hcHBpbmcgb2YgZGlzcGxheSBkaWdpdCBwb3NpdGlvbiB0byBncmlkIG51bWJlci4K
Pj4gKyAgICAgIFRoaXMgaW1wbGljaXRseSBkZWZpbmVzIHRoZSBkaXNwbGF5IHNpemUuCj4+ICsg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDgtYXJyYXkKPj4g
KyAgICBtaW5JdGVtczogMQo+PiArICAgIG1heEl0ZW1zOiA3Cj4+ICsKPj4gKyAgdGl0YW5tZWMs
c2VnbWVudC1tYXBwaW5nOgo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgTWFwcGluZyBv
ZiA3IHNlZ21lbnQgZGlzcGxheSBzZWdtZW50cyBBLUcgdG8gYml0IG51bWJlcnMgMS0xMi4KPj4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQo+
PiArICAgIG1pbkl0ZW1zOiA3Cj4+ICsgICAgbWF4SXRlbXM6IDcKPj4gKwo+PiArICAiI2FkZHJl
c3MtY2VsbHMiOgo+PiArICAgIGNvbnN0OiAyCj4+ICsKPj4gKyAgIiNzaXplLWNlbGxzIjoKPj4g
KyAgICBjb25zdDogMAo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsg
IC0gcmVnCj4gCj4gV291bGQgaXQgYmUgZmFpciB0byBzYXkgdGhhdCAic3BpLWxzYi1maXJzdCIg
YW5kICJzcGktM3dpcmUiIGFyZSBhbHNvIAo+IHJlcXVpcmVkPyBUaGUgY2hpcHMgYXJlbid0IGNv
bmZpZ3VyYWJsZSBzbyB3b24ndCBleGFjdGx5IGJlIHVzYWJsZSBhbnkgCj4gb3RoZXIgd2F5LiBG
dXJ0aGVybW9yZSBJIGJlbGlldmUgdGhlIHRyYW5zbWlzc2lvbiBmb3JtYXQgYWN0dWFsbHkgd29y
a3MgCj4gb3V0IGVxdWl2YWxlbnQgdG8gU1BJIG1vZGUgMywgc28gc2hvdWxkIHdhcnJhbnQgInNw
aS1jcGhhIiBhbmQgCj4gInNwaS1jcG9sIiBhcyB3ZWxsLgo+IAo+PiArCj4+ICtwYXR0ZXJuUHJv
cGVydGllczoKPj4gKyAgIl4uKkBbMS03XSwoWzEtOV18MVswLTZdKSQiOgo+PiArICAgIHR5cGU6
IG9iamVjdAo+PiArICAgICRyZWY6IC9zY2hlbWFzL2xlZHMvY29tbW9uLnlhbWwjCj4+ICsgICAg
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4+ICsg
ICAgICBQcm9wZXJ0aWVzIGZvciBhIHNpbmdsZSBMRUQuCj4+ICsKPj4gKyAgICBwcm9wZXJ0aWVz
Ogo+PiArICAgICAgcmVnOgo+PiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAgICAg
IDEtYmFzZWQgZ3JpZCBudW1iZXIsIGZvbGxvd2VkIGJ5IDEtYmFzZWQgc2VnbWVudCBiaXQgbnVt
YmVyLgo+PiArICAgICAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgICAgcmVxdWlyZWQ6Cj4+ICsg
ICAgICAtIHJlZwo+IAo+IEknbSBjb25jZXJuZWQgdGhhdCB0aGlzIGxlYXZlcyB1cyBubyByb29t
IHRvIHN1cHBvcnQgdGhlIGFkZGl0aW9uYWwgCj4ga2V5cGFkIGZ1bmN0aW9uYWxpdHkgaW4gZnV0
dXJlLiBIYXZpbmcgbm93IGRvdWJsZS1jaGVja2VkIGEgZGF0YXNoZWV0LCAKPiB0aGUgaW5wdXRz
IGFyZSBhbHNvIGEgdHdvLWRpbWVuc2lvbmFsIG11eCAoc2hhcmluZyB0aGUgc2VnbWVudCBsaW5l
cyksIAo+IHNvIHRoZSBkZXZpY2UgZWZmZWN0aXZlbHkgaGFzIHR3byBkaXN0aW5jdCBidXQgbnVt
ZXJpY2FsbHktb3ZlcmxhcHBpbmcgCj4gY2hpbGQgYWRkcmVzcyBzcGFjZXMgLSBvbmUgYWRkcmVz
c2VkIGJ5IChncmlkLHNlZ21lbnQpIGFuZCB0aGUgb3RoZXIgYnkgCj4gKHNlZ21lbnQsa2V5KS4K
PiAKPiBSb2IsIEtyeXN6dG9mLCBhbnkgdGhvdWdodHMgb24gdGhlIGJlc3QgRFQgaWRpb20gdG8g
bGVhdmUgYWNjb21tb2RhdGlvbiAKPiBmb3IgdGhhdD8gSSdtIHRoaW5raW5nIGVpdGhlciByZXF1
aXJlIGFuIGludGVybWVkaWF0ZSBub2RlIHRvIGNvbnRhaW4gCj4gZWFjaCBub3Rpb25hbCBhZGRy
ZXNzIHNwYWNlLCBvciBwZXJoYXBzIGFkZCBhbm90aGVyIGxlYWRpbmcgYWRkcmVzcyBjZWxsIAo+
IHRvIHNlbGVjdCBiZXR3ZWVuIHRoZW0/IEkgZG9uJ3QgYmVsaWV2ZSBhbnkgb2YgdGhlc2UgdGhp
bmdzIGhhdmUgZnVydGhlciAKPiBmdW5jdGlvbmFsaXR5IGJleW9uZCB0aGF0LgoKSSB0aGluayBp
bnRlcm1lZGlhdGUgbm9kZXMgLSBsZWRzLCBrZXlzIC0gYXJlIG1vcmUgYXBwcm9wcmlhdGUsIGJl
Y2F1c2UKaXQgaXMgc2VsZi1kZXNjcmliaW5nLiBBZGRpdGlvbmFsIGFkZHJlc3Mgc3BhY2UgbnVt
YmVyIHdvdWxkIHJlcXVpcmUKZGVjb2RpbmcgdGhpcyAiMCIgb3IgIjEiIGludG8gTEVEL2tleS4g
Rm9yIGNvbXBsZXggZGV2aWNlcyAtIGxpa2UgUE1JQ3MKd2l0aCByZWd1bGF0b3JzLCBSVEMgYW5k
IGNsb2NrcyAtIHdlIGFscmVhZHkgaGF2ZSBzdWNoIHBhdHRlcm5zLgoKQmVzdCByZWdhcmRzLApC
ZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
