Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26441C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1g6KeAFTNlRwQ4XUTFYrqkZK5ooHgy4o42LDkGv4sg=; b=ptrbxRWIQgs7zy
	NidmD0Ab7Ib8EHOCEHiyt56PjO2CGobX12Xw4qJ/353zjRXyEribsKc4oeiJ3XcggYKdhCv6Nyv+p
	/s3sLuXpQPsAqV1yizq/yigQY40xhqXJy2onuKqkQl5JTs7i39/TI7UzBvW7hJ9D8i73XyxcvQxqv
	3BgOiGeUlJgT790U58sHh60FLX3Q6sknWQCQe1Cz4Be8UJ5zGOzQ78y35a1BvTXq9fOeym0OaWQ0O
	QO+duF9hPW0n9+exqIzkaH5eMxWCaGd5/ogEMjjK0gd1tFPdFnhv5m+jKaSG1VQ1R87HFwHHx5K9D
	LSZ5Xe3fXULK/eSbNpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngwOF-006WYM-UR; Tue, 19 Apr 2022 22:32:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngwOC-006WWo-Hh; Tue, 19 Apr 2022 22:32:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B68D21477;
 Tue, 19 Apr 2022 15:31:58 -0700 (PDT)
Received: from [10.57.41.251] (unknown [10.57.41.251])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DAB03F5A1;
 Tue, 19 Apr 2022 15:31:56 -0700 (PDT)
Message-ID: <543820f8-5e93-eedb-e409-0cb13d092f07@arm.com>
Date: Tue, 19 Apr 2022 23:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
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
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
 <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
 <CAMuHMdV8iy4vMASuUgeQmjHdAMNzvCikwheyQO1-AQH0yYk0RQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAMuHMdV8iy4vMASuUgeQmjHdAMNzvCikwheyQO1-AQH0yYk0RQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_153204_722311_16C7881D 
X-CRM114-Status: GOOD (  24.35  )
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

T24gMjAyMi0wMy0yMSAwODoxMiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIFJvYmlu
LAo+IAo+IE9uIEZyaSwgTWFyIDE4LCAyMDIyIGF0IDk6NTAgUE0gUm9iaW4gTXVycGh5IDxyb2Jp
bi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDIwMjItMDItMjUgMjE6MTMsIEhlaW5lciBL
YWxsd2VpdCB3cm90ZToKPj4+IEFkZCBhIFlBTUwgc2NoZW1hIGJpbmRpbmcgZm9yIFRNMTYyOCBh
dXhkaXNwbGF5Cj4+PiAoNy8xMS1zZWdtZW50IExFRCkgY29udHJvbGxlci4KPj4+Cj4+PiBUaGlz
IHBhdGNoIGlzIHBhcnRpYWxseSBiYXNlZCBvbiBwcmV2aW91cyB3b3JrIGZyb20KPj4+IEFuZHJl
YXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4uCj4+Pgo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBB
bmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIg
S2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+IAo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5t
ZWMsdG0xNjI4LnlhbWwKPiAKPj4+ICsKPj4+ICtwYXR0ZXJuUHJvcGVydGllczoKPj4+ICsgICJe
LipAWzEtN10sKFsxLTldfDFbMC02XSkkIjoKPj4+ICsgICAgdHlwZTogb2JqZWN0Cj4+PiArICAg
ICRyZWY6IC9zY2hlbWFzL2xlZHMvY29tbW9uLnlhbWwjCj4+PiArICAgIHVuZXZhbHVhdGVkUHJv
cGVydGllczogZmFsc2UKPj4+ICsgICAgZGVzY3JpcHRpb246IHwKPj4+ICsgICAgICBQcm9wZXJ0
aWVzIGZvciBhIHNpbmdsZSBMRUQuCj4+PiArCj4+PiArICAgIHByb3BlcnRpZXM6Cj4+PiArICAg
ICAgcmVnOgo+Pj4gKyAgICAgICAgZGVzY3JpcHRpb246IHwKPj4+ICsgICAgICAgICAgMS1iYXNl
ZCBncmlkIG51bWJlciwgZm9sbG93ZWQgYnkgMS1iYXNlZCBzZWdtZW50IGJpdCBudW1iZXIuCj4+
PiArICAgICAgICBtYXhJdGVtczogMQo+Pj4gKwo+Pj4gKyAgICByZXF1aXJlZDoKPj4+ICsgICAg
ICAtIHJlZwo+Pgo+PiBJJ20gY29uY2VybmVkIHRoYXQgdGhpcyBsZWF2ZXMgdXMgbm8gcm9vbSB0
byBzdXBwb3J0IHRoZSBhZGRpdGlvbmFsCj4+IGtleXBhZCBmdW5jdGlvbmFsaXR5IGluIGZ1dHVy
ZS4gSGF2aW5nIG5vdyBkb3VibGUtY2hlY2tlZCBhIGRhdGFzaGVldCwKPj4gdGhlIGlucHV0cyBh
cmUgYWxzbyBhIHR3by1kaW1lbnNpb25hbCBtdXggKHNoYXJpbmcgdGhlIHNlZ21lbnQgbGluZXMp
LAo+PiBzbyB0aGUgZGV2aWNlIGVmZmVjdGl2ZWx5IGhhcyB0d28gZGlzdGluY3QgYnV0IG51bWVy
aWNhbGx5LW92ZXJsYXBwaW5nCj4+IGNoaWxkIGFkZHJlc3Mgc3BhY2VzIC0gb25lIGFkZHJlc3Nl
ZCBieSAoZ3JpZCxzZWdtZW50KSBhbmQgdGhlIG90aGVyIGJ5Cj4+IChzZWdtZW50LGtleSkuCj4g
Cj4gU291bmRzIHNpbWlsYXIgdG8gSFQxNkszMz8KCi9tZSBzZWFyY2hlcyB1cCBhIGRhdGFzaGVl
dC4uLgoKS2V5cGFkLXdpc2UsIGl0IGFwcGVhcnMgc28sIGhvd2V2ZXIgdGhlIGRpc3BsYXkgc2lk
ZSBvZiB0aGlzIAoxNjE4LzE2MjgvMTYzOCBmYW1pbHkgaXMgdmVyeSBtdWNoIHR1bmVkIGZvciA3
LXNlZ21lbnQgZGlzcGxheXMgcmF0aGVyIAp0aGFuIGFyYml0cmFyeSBkb3QtbWF0cml4IG9uZXMu
CgpJIGRvIHJlY2FsbCB3aGVuIEkgd2FzIGRpZ2dpbmcgYSBmZXcgeWVhcnMgYWdvLCB0dXJuaW5n
IHVwIGFuIG9sZCBIb2x0ZWsgClZGRCBkcml2ZXIgd2hpY2ggbG9va2VkIHN1c3BpY2lvdXNseSBs
aWtlIGl0IG1pZ2h0IGJlIHRoZSBvcmlnaW4gb2YgdGhlIApwYXJ0aWN1bGFyIDMtd2lyZSBwcm90
b2NvbCBhbmQgY29tbWFuZCBzZXQgKGluY2x1ZGluZyB3ZWlyZCBub24tbGluZWFyIApicmlnaHRu
ZXNzIHNjYWxlKSB3aGljaCBhbGwgdGhlc2UgTEVEIGRyaXZlciBjbG9uZXMgc2VlbSB0byBib3Jy
b3cgZnJvbSwgCmJ1dCBJIGNhbid0IG5vdyByZW1lbWJlciB0aGUgcGFydCBudW1iZXIgOigKCj4+
IFJvYiwgS3J5c3p0b2YsIGFueSB0aG91Z2h0cyBvbiB0aGUgYmVzdCBEVCBpZGlvbSB0byBsZWF2
ZSBhY2NvbW1vZGF0aW9uCj4+IGZvciB0aGF0PyBJJ20gdGhpbmtpbmcgZWl0aGVyIHJlcXVpcmUg
YW4gaW50ZXJtZWRpYXRlIG5vZGUgdG8gY29udGFpbgo+PiBlYWNoIG5vdGlvbmFsIGFkZHJlc3Mg
c3BhY2UsIG9yIHBlcmhhcHMgYWRkIGFub3RoZXIgbGVhZGluZyBhZGRyZXNzIGNlbGwKPj4gdG8g
c2VsZWN0IGJldHdlZW4gdGhlbT8gSSBkb24ndCBiZWxpZXZlIGFueSBvZiB0aGVzZSB0aGluZ3Mg
aGF2ZSBmdXJ0aGVyCj4+IGZ1bmN0aW9uYWxpdHkgYmV5b25kIHRoYXQuCj4gCj4gVGhlIHByb2Js
ZW0gd2l0aCB0aGVzZSBkZXZpY2VzIGlzIHRoYXQgdGhlcmUgYXJlIHRob3VzYW5kcyBvZiBkaWZm
ZXJlbnQKPiB3YXlzIHRvIHdpcmUgdGhlbSwgYW5kIGNvbWluZyB1cCB3aXRoIGEgZ2VuZXJpYyB3
aXJpbmcgZGVzY3JpcHRpb24gaW4KPiBEVCBhbmQgd3JpdGluZyBjb2RlIHRvIGhhbmRsZSB0aGF0
IGNhbiBiZSB2ZXJ5IGhhcmQuCj4gCj4gRm9yIEhUMTZLMzMgbm9uLWRvdC1tYXRyaXggd2lyaW5n
cywgSSBqdXN0IGFkZGVkIGV4dHJhIGNvbXBhdGlibGUKPiB2YWx1ZXMgbWF0Y2hpbmcgdGhlIHdp
cmluZyBvZiBhIGZldyBrbm93biBkZXZpY2VzWzFdLiAgVGhhdCB3YXkgdGhlCj4gZHJpdmVyIGNh
biBoYW5kbGUgdGhlbSBlZmZpY2llbnRseS4KPiBJdCBkb2VzIGhhdmUgdGhlIGRpc2FkdmFudGFn
ZSB0aGF0IGFkZGluZyBzdXBwb3J0IGZvciBuZXcgZGV2aWNlcwo+IG1lYW5zIGludHJvZHVjaW5n
IG1vcmUgY29tcGF0aWJsZSB2YWx1ZXMsIGFuZCBhZGRpbmcgbW9yZSBjb2RlLgo+IAo+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L2hvbHRlayxodDE2azMzLnlh
bWwKCkkgdGhpbmsgdGhlIGRpc3BsYXkgc2lkZSBvZiBIZWluZXIncyBiaW5kaW5nIGlzIGZpbmUg
Zm9yIHdoYXQgdGhlc2UgCmNoaXBzIGNhbiBkbyAtIEkndmUgZmluYWxseSBoYWQgYSBiaXQgbW9y
ZSB0aW1lIHRvIHBsYXkgd2l0aCB0aGlzIApzZXJpZXMsIGFuZCAod2l0aCBtaW5vciBkcml2ZXIg
aGFja3MpIGl0IHdvcmtzIGp1c3QgZmluZSB0byBkZXNjcmliZSBteSAKVE0xNjM4IGJyZWFrb3V0
IGJvYXJkIHdpdGggYW4gOC1kaWdpdCBkaXNwbGF5LCB3aGVyZSBzZWdtZW50cyA4IGFuZCA5IG9m
IAplYWNoIGdyaWQgYXJlIHJlc3BlY3RpdmVseSBhIGRlY2ltYWwgcG9pbnQgYW5kIGEgZGlzY3Jl
dGUgaW5kaWNhdG9yIExFRCwgCm1hbmFnZWQgYXMgc2VwYXJhdGUgTEVEIG5vZGVzLgoKSG93ZXZl
ciwgSSB0aGluayB5b3UndmUgaW5kaXJlY3RseSBhZGRyZXNzZWQgbXkgb3V0c3RhbmRpbmcgY29u
Y2VybiAKdGhlcmUgLSBJIHdhc24ndCBhd2FyZSBvZiB0aGUgImxpbnV4LGtleW1hcCIgcHJvcGVy
dHksIGJ1dCBzaW5jZSB0aGF0IApicmluZ3MgaXRzIG93biBpbXBsaWNpdCAocm93LGNvbHVtbikg
YWRkcmVzc2VzIGRpc3RpbmN0IGZyb20gdGhlIERUIAphZGRyZXNzIHNwYWNlLCBpdCBsb29rcyBs
aWtlIHRoYXQgbWlnaHQgYmUgc3VmZmljaWVudCBhcyBhIG5lYXQgc3RhbmRhcmQgCndheSB0byBl
eHRlbmQgdGhpcyBiaW5kaW5nIGluIGZ1dHVyZSAqd2l0aG91dCogYW55IG90aGVyIGNoYW5nZXMu
CgpUaGFua3MsClJvYmluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
