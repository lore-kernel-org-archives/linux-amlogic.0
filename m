Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D6C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 22:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cqxsYMMddCsRde70sQtsnqMqpxv0c/gBKc6lY30uRg=; b=ZrEoeevmhzbh72
	D6SnuVHcU7LGODqvqjoc0SV5Yg++Rrm0D7WY2zlP6CNEoeGFtE4JdK74q5ou6QXgqnzjDyHFmb2yF
	bCC6s/8arWu7/PJjTQRmsQPwf03X9Bl62GAemMZLfpHXZwdNA+gPEImxmVQ8NCQ01kr017gV5fhzU
	+KUduUwnJJfCw4cvF8MTfrnJF3ujsZJ+zCuJanS7toYVSfDn7tpoPr98KRVR3ZVzVes6MerbzKELS
	66p+/TeCVU3+r2qDziYBmAp9HCaOuEzl+p2f9qIwW90DiSQ53g7XMgH92IIRWwgxdByNVO/d5si1Q
	1NisPz1Z5zL9HP/jPnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNMH7-002X0b-VB; Thu, 24 Feb 2022 22:07:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNMGv-002WyU-9B; Thu, 24 Feb 2022 22:07:39 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x5so4797402edd.11;
 Thu, 24 Feb 2022 14:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Um1yRfMDWXUuFfQXYDQ7mGRJt1MWUpTswbY6Fanwzx4=;
 b=J3Y6HcyfV2w4WTEu/48kbdR/GH8u5Nn+CiUCxsIucbIjTgPIMRWbSehfPmC7K+QUCt
 ZoFF/pg615+tM7r/uuVu+aCQFESZtjOwo3hCqqhpO41gfo4i9MdkvFSryU63zpPZHfDj
 Fhm11iiVl2u+rm9wEHZpKp1m0usji4+hPKixgQcOj5GKaAeDB3WTAz8FOypvdlFK8tOu
 5Mjmq9tPLfRZRW1ixdGGjFzh++E123s6IepiqhVn/RxupWdk/+jHmnzOjljdIglYmhfE
 5PrA4xTTONVcBv4MKEIs7OXr1X6LROB6mtrxlvQo9F3Nm8mj54N4AFRZwa4qgi8fATwO
 /4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Um1yRfMDWXUuFfQXYDQ7mGRJt1MWUpTswbY6Fanwzx4=;
 b=o6pktpQhs+zhuBTMsjNA95ZvkKZbg54VWOoH7gQxJzoWZl7mUvkSVbD82yIli7oAt5
 MdQb39Wzb+hSWNeozDO2vmHAJNcdcOBPI4D0YYmcLTYgkGwIk2bHMI7R7KfTUiGFGpmb
 a+cPthtIB1xfozFkNUYag1AJQjvnGaKM20lf0G3OGj7icTqOiy3GmqWZYoXoIGqvSIlU
 sPXCqm40FTNlX1k+CDSyMl4RtoNfKXq/wNjwx3N+ERKpXy9L3WmRqeRduc17Xv7RliKR
 UE8OTh4x179rxe00MZh3s3LBtkU9IUTy3j2ZKzalWcaWFi+lihu2KqljzTrEDJ0uAKEn
 DZNw==
X-Gm-Message-State: AOAM531rkHDW7GtFHFm+JqIk85lP+OqAO532N2IkfMIP5JkCZ4Jm3VJ2
 GTCihHz43vXIwmLu84kYoJo=
X-Google-Smtp-Source: ABdhPJz1LPKIUx1LCybG9WCyGLvIak/xf78F7LgkyGZ0/KcFOpP/HB3xWDJuFSUl1yvkESDm0u/sOQ==
X-Received: by 2002:aa7:c983:0:b0:410:d314:6451 with SMTP id
 c3-20020aa7c983000000b00410d3146451mr4215887edt.56.1645740450708; 
 Thu, 24 Feb 2022 14:07:30 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 ey10-20020a1709070b8a00b006d1cb2eb221sm219172ejc.170.2022.02.24.14.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 14:07:30 -0800 (PST)
Message-ID: <c7a32a58-a38a-8c77-4124-5954899ef373@gmail.com>
Date: Thu, 24 Feb 2022 23:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/5] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
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
 <29fcdfe3-1b8e-f466-6e20-919c6ab2a7ae@gmail.com>
 <CAL_JsqL-yFJkq9Uj9XAzfcN=yD9AGUQEGk7f-h81P7MNj7p==A@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAL_JsqL-yFJkq9Uj9XAzfcN=yD9AGUQEGk7f-h81P7MNj7p==A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_140737_331939_82F4AC9B 
X-CRM114-Status: GOOD (  18.01  )
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

T24gMjQuMDIuMjAyMiAyMjozMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjQs
IDIwMjIgYXQgMjo1NiBQTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3
cm90ZToKPj4KPj4gT24gMjQuMDIuMjAyMiAyMToyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBP
biBXZWQsIEZlYiAyMywgMjAyMiBhdCAwNjo1OTozMVBNICswMTAwLCBIZWluZXIgS2FsbHdlaXQg
d3JvdGU6Cj4+Pj4gQWRkIGEgWUFNTCBzY2hlbWEgYmluZGluZyBmb3IgVE0xNjI4IGF1eGRpc3Bs
YXkKPj4+PiAoNy8xMS1zZWdtZW50IExFRCkgY29udHJvbGxlci4KPj4+Pgo+Pj4+IFRoaXMgcGF0
Y2ggaXMgcGFydGlhbGx5IGJhc2VkIG9uIHByZXZpb3VzIHdvcmsgZnJvbQo+Pj4+IEFuZHJlYXMg
RsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4uCj4+Pj4KPj4+PiBDby1EZXZlbG9wZWQtYnk6IEFu
ZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+Pj4gQ28tRGV2ZWxvcGVkLWJ5OiBIZWlu
ZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEhl
aW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gdjM6Cj4+
Pj4gLSBmaXggcmVtYWluaW5nIFlBTUwgaXNzdWVzCj4+Pj4gLSB1c2UgQ28tRGV2ZWxvcGVkLWJ5
Cj4+Pj4gLS0tCj4+Pj4gIC4uLi9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55
YW1sICB8IDkyICsrKysrKysrKysrKysrKysrKysKPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDkyIGlu
c2VydGlvbnMoKykKPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4+Pj4KPj4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkv
dGl0YW5tZWMsdG0xNjI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+Pj4gaW5kZXggMDAwMDAwMDAwLi4yYTFlZjY5MmMKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5t
ZWMsdG0xNjI4LnlhbWwKPj4+PiBAQCAtMCwwICsxLDkyIEBACj4+Pj4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wLW9yLWxhdGVyIE9SIEJTRC0yLUNsYXVzZSkKPj4+PiArJVlB
TUwgMS4yCj4+Pj4gKy0tLQo+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwjCj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+ICsKPj4+PiArdGl0bGU6
IFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzIFRNMTYyOCBMRUQgY29udHJvbGxlcgo+Pj4+ICsKPj4+
PiArbWFpbnRhaW5lcnM6Cj4+Pj4gKyAgLSBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2Uu
ZGU+Cj4+Pj4gKyAgLSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+Pj4+
ICsKPj4+PiArYWxsT2Y6Cj4+Pj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9zcGkvc3BpLXBlcmlwaGVy
YWwtcHJvcHMueWFtbCMKPj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4gKyAgY29tcGF0aWJs
ZToKPj4+PiArICAgIGNvbnN0OiB0aXRhbm1lYyx0bTE2MjgKPj4+PiArCj4+Pj4gKyAgcmVnOgo+
Pj4+ICsgICAgbWF4SXRlbXM6IDEKPj4+PiArCj4+Pgo+Pj4+ICsgIGdyaWQ6Cj4+Pj4gKyAgICBk
ZXNjcmlwdGlvbjoKPj4+PiArICAgICAgTWFwcGluZyBvZiBkaXNwbGF5IGRpZ2l0IHBvc2l0aW9u
IHRvIGdyaWQgbnVtYmVyLgo+Pj4+ICsgICAgICBUaGlzIGltcGxpY2l0bHkgZGVmaW5lcyB0aGUg
ZGlzcGxheSBzaXplLgo+Pj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDgtYXJyYXkKPj4+PiArICAgIG1pbkl0ZW1zOiAxCj4+Pj4gKyAgICBtYXhJdGVt
czogNwo+Pj4+ICsKPj4+PiArICBzZWdtZW50LW1hcHBpbmc6Cj4+Pj4gKyAgICBkZXNjcmlwdGlv
bjoKPj4+PiArICAgICAgTWFwcGluZyBvZiA3IHNlZ21lbnQgZGlzcGxheSBzZWdtZW50cyBBLUcg
dG8gYml0IG51bWJlcnMgMS0xMi4KPj4+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQ4LWFycmF5Cj4+Pj4gKyAgICBtaW5JdGVtczogNwo+Pj4+ICsgICAg
bWF4SXRlbXM6IDcKPj4+Cj4+PiBBcmUgdGhlc2UgcHJvcGVydGllcyB1c2VmdWwgZm9yIGFueSA3
IHNlZ21lbnQgZGlzcGxheSBvciBzcGVjaWZpYyB0bwo+Pj4gdGhpcyBjb250cm9sbGVyPwo+Pj4K
Pj4gQm90aCBhcmUgY29udHJvbGxlci1zcGVjaWZpYy4gRS5nLiB0aGUgZnVuY3Rpb25hbGx5IHNp
bWlsYXIgZHJpdmVyCj4+IGh0MTZrMzMgdXNlcyBkaWZmZXJlbnQgcHJvcGVydGllcy4KPiAKPiBU
aGVuIHRoZXkgYm90aCBuZWVkIGEgdmVuZG9yIHByZWZpeC4KPiAKT0ssIHdpbGwgYWRkIHRoZSBw
cmVmaXguIFRoYW5rcyBmb3IgdGhlIGhpbnQuCgo+Pj4gVGhlIGNvbW1pdCBtc2cgbWVudGlvbnMg
MTEgc2VnbWVudCBkaXNwbGF5LiBEb2VzIHRoaXMgbmVlZCB0byBiZT86Cj4+Pgo+Pj4gb25lT2Y6
Cj4+PiAgIC0gbWluSXRlbXM6IDcKPj4+ICAgICBtYXhJdGVtczogNwo+Pj4gICAtIG1pbkl0ZW1z
OiAxMQo+Pj4gICAgIG1heEl0ZW1zOiAxMQo+Pj4KPj4gVGhlIGNvbnRyb2xsZXIgd291bGQgYmUg
YWJsZSB0byBkcml2ZSAxMSBzZWdtZW50cywgYnV0IHRoZSBkcml2ZXIKPj4gc3VwcG9ydHMgNyBz
ZWdtZW50cyBvbmx5IChhdCBsZWFzdCBmb3Igbm93KS4gVGhlcmVmb3JlIGEgMTEgc2VnbWVudAo+
PiBkaXNwbGF5IGNhbiBiZSB1c2VkLCBidXQgb25seSB0aGUgNyBzZWdtZW50IHBhcnQgd2lsbCBi
ZSBhY3RpdmUuCj4+IEFsbCBkZXZpY2VzIHdpdGggdGhpcyBjb250cm9sbGVyIEkndmUgc2VlbiBh
bmQgaGVhcmQgb2YgaGF2ZQo+PiA3IHNlZ21lbnQgZGlzcGxheXMuCj4gCj4gQmluZGluZ3Mgc2hv
dWxkIGJlIGNvbXBsZXRlLCBub3QganVzdCB3aGF0IGEgcGFydGljdWxhciB2ZXJzaW9uIG9mIGEK
PiBkcml2ZXIgc3VwcG9ydHMuIEhvd2V2ZXIsIGlmIGFsbCBrbm93biBoL3cgaXMganVzdCA3IHNl
ZywgdGhlbiBpdCBpcwo+IGZpbmUuCj4gCj4gUm9iCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
