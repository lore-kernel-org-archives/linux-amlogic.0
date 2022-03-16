Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04D8C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 00:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pldaZ2OOpJCfxsePfX9NPTNE8OsUIogurrgjvDznekI=; b=ayce8NXvO3r/R4
	C12mqVJYxN+UUquihrgMu16KRLJogIcysAS0pUwNozaNHc9Z5ZijNiJv0mg5h0I5VkVuFVB7GFk+b
	jOgCgbVUtAsDdMrQvMOZ7Ap3fF/K9C0ZpuOyRtad8hyMsOUSnXTT6CurDqgFWLdpYaoNJ3iP7PXBw
	0b4Xj2CKYeQQDaNZSFceiO/8r+bcOo6V0reNimJTEO/iLJ0smTGS60vNEO6L5SuVQAcIUqvduRaJN
	ln1vuJr+t5d0VGcZTpu7A9oNrpHFRK73ekRYi5Gn8fedcU/hlecVm68hAWER0jwfWRUgPB7Hqa06V
	YY8qF9hQrqKZQKmn1ozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUHgo-00B0jR-9w; Wed, 16 Mar 2022 00:38:58 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUHgk-00B0im-NF; Wed, 16 Mar 2022 00:38:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA8661476;
 Tue, 15 Mar 2022 17:38:52 -0700 (PDT)
Received: from [10.57.42.204] (unknown [10.57.42.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AA973F73D;
 Tue, 15 Mar 2022 17:38:50 -0700 (PDT)
Message-ID: <8d138801-5447-5e88-25d2-3eb13d294530@arm.com>
Date: Wed, 16 Mar 2022 00:38:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-GB
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
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
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_173854_896511_DEEAFB1A 
X-CRM114-Status: GOOD (  29.54  )
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

T24gMjAyMi0wMi0yNSAyMTowOSwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IFRoaXMgc2VyaWVz
IGFkZHMgc3VwcG9ydCBmb3IgdGhlIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQgZGlzcGxheQo+
IGNvbnRyb2xsZXIuIEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJvbSBBbmRyZWFz
IEbDpHJiZXIuCj4gVGhlIFJGQyB2ZXJzaW9uIHBsYWNlZCB0aGUgZHJpdmVyIGluIHRoZSBMRUQg
c3Vic3lzdGVtLCBidXQgdGhpcyB3YXMKPiBOQUsnZWQgYnkgdGhlIExFRCBtYWludGFpbmVyLiBU
aGVyZWZvcmUgSSBtb3ZlZCB0aGUgZHJpdmVyIHRvCj4gL2RyaXZlcnMvYXV4ZGlzcGxheSB3aGF0
IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4KPiAKPiBGdXJ0aGVyIGNoYW5nZXMgdG8gdGhl
IFJGQyB2ZXJzaW9uOgo+IC0gRHJpdmVyIGNhbiBiZSBidWlsdCBhbHNvIHcvbyBMRUQgY2xhc3Mg
c3VwcG9ydCwgZm9yIGRpc3BsYXlzIHRoYXQKPiAgICBkb24ndCBoYXZlIGFueSBzeW1ib2xzIHRv
IGJlIGV4cG9zZWQgYXMgTEVEJ3MuCj4gLSBTaW1wbGlmaWVkIHRoZSBjb2RlIGFuZCByZXdyb3Rl
IGEgbG90IG9mIGl0Lgo+IC0gRHJpdmVyIGlzIG5vdyBraW5kIG9mIGEgTVZQLCBidXQgZnVuY3Rp
b25hbGl0eSBzaG91bGQgYmUgc3VmZmljaWVudAo+ICAgIGZvciBtb3N0IHVzZSBjYXNlcy4KPiAt
IFVzZSB0aGUgZXhpc3RpbmcgNyBzZWdtZW50IHN1cHBvcnQgaW4gdWFwaS9saW51eC9tYXBfdG9f
N3NlZ21lbnQuaAo+ICAgIGFzIHN1Z2dlc3RlZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4uCj4gCj4g
Tm90ZTogVGhlcmUncyBhIG51bWJlciBvZiBjaGlwcyBmcm9tIG90aGVyIG1hbnVmYWN0dXJlcnMg
dGhhdCBhcmUKPiAgICAgICAgYWxtb3N0IGlkZW50aWNhbCwgZS5nLiBGRDYyOCwgU00xNjI4LiBP
bmx5IGRpZmZlcmVuY2UgSSBzYXcgc28KPiAgICAgICAgZmFyIGlzIHRoYXQgdGhleSBwYXJ0aWFs
bHkgc3VwcG9ydCBvdGhlciBkaXNwbGF5IG1vZGVzLgo+ICAgICAgICBUTTE2Mjg6IDZ4MTIsIDd4
MTEKPiAgICAgICAgU00xNjI4QzogNHgxMywgNXgxMiwgNngxMSwgN3gxMAo+ICAgICAgICBGb3Ig
dHlwaWNhbCBkaXNwbGF5cyBvbiBkZXZpY2VzIHVzaW5nIHRoZXNlIGNoaXBzIHRoaXMKPiAgICAg
ICAgZGlmZmVyZW5jZSBzaG91bGRuJ3QgbWF0dGVyLgo+IAo+IFN1Y2Nlc3NmdWxseSB0ZXN0ZWQg
b24gYSBUWDMgTWluaSBUViBib3ggdGhhdCBoYXMgYW4gU00xNjI4QyBhbmQgYQo+IGRpc3BsYXkg
d2l0aCA0IGRpZ2l0cyBhbmQgNyBzeW1ib2xzLgoKRldJVyBJIGdhdmUgdGhpcyBhIGdvIG9uIG15
IEJlZWxpbmsgQTEsIHdoaWNoIGhhcyBhbiBBaVAxNjE4IGFuZCBhIGNsb2NrIApkaXNwbGF5IHdo
aWNoIHdvdWxkIG1hcHBlZCBsaWtlIHNvOgoKCXRpdGFubWVjLHNlZ21lbnQtbWFwcGluZyA9IC9i
aXRzLyA4IDwxIDIgMyAxMyAxMiA1IDQ+OwoJdGl0YW5tZWMsZ3JpZCA9IC9iaXRzLyA4IDw1IDQg
MiAxPjsKCihncmlkIDMgc2VnbWVudCAyIGlzIHVzZWQgZm9yIGEgY29sb24gaW4gdGhlIG1pZGRs
ZSkKCklmIEkgYm9kZ2UgYXJvdW5kIHRoZSBsYWNrIG9mIHN1cHBvcnQgZm9yIG5vbi1jb250aWd1
b3VzIGdyaWRzLCBpdCBkb2VzIApvdGhlcndpc2Ugd29yayBmYWlybHkgd2VsbCwgb3RoZXIgdGhh
biBiZWluZyA2LXNlZ21lbnQgZGlzcGxheXMgYmVjYXVzZSAKaXQgbmVlZHMgdG8gYmUgaW4gZGlz
cGxheSBtb2RlIDEgdG8gZHJpdmUgU0VHMTMgcmF0aGVyIHRoYW4gR1JJRDYuIEkgCndvbmRlciBp
ZiB3ZSBjb3VsZCBiZSBhIGJpdCBjbGV2ZXJlciBhYm91dCBwaWNraW5nIGEgZGlzcGxheSBtb2Rl
IGJhc2VkIApvbiB0aGUgZ3JpZC9zZWdtZW50IG51bWJlcnMgdXNlZD8KCkkgYWxzbyBoYXZlIGEg
Y291cGxlIG9mIHRob3NlIFRNMTYzOCBicmVha291dCBib2FyZHMgd2l0aCA4IGRpZ2l0cywgOCAK
c2luZ2xlIExFRHMgYW5kIDggYnV0dG9ucyB0aGF0IEkgbWlnaHQgaGF2ZSBhIGdvIHdpdGggdG9v
LiBIYXZlIHlvdSAKZ2l2ZW4gYW55IHRob3VnaHQgdG8gaG93IHRoZSBEVCBiaW5kaW5nIG1pZ2h0
IHN1cHBvcnQgaW5wdXRzIGFzIHdlbGw/IAooVGhlIGJlc3QgdGltZSB0byBiZSBmdXR1cmUtcHJv
b2YgaXMgYmVmb3JlIGl0J3MgbWVyZ2VkLi4uKQoKQ2hlZXJzLApSb2Jpbi4KCj4gdjI6Cj4gLSAo
cmUtKWFkZCBBbmRyZWFzJyBTb0IgdG8gdHdvIHBhdGNoZXMKPiAtIGZpeCBZQU1MIGlzc3Vlcwo+
IC0gaW5jbHVkZSBjdHlwZS5oIGV4cGxpY2l0bHkKPiAtIGFkZCBpbmZvIG1lc3NhZ2UgaW4gcHJv
YmUoKQo+IAo+IHYzOgo+IC0gcmVtb3ZlIHBhdGNoIDEgYmVjYXVzZSBpdCBoYXMgYmVlbiBhcHBs
aWVkIHZpYSB0aGUgU1BJIHRyZWUgYWxyZWFkeQo+IC0gZml4IHJlbWFpbmluZyBZQU1MIGlzc3Vl
cyBpbiBwYXRjaCAyCj4gLSBmb2xsb3cgTWlndWVsJ3Mgc3VnZ2VzdGlvbiBvbiB1c2FnZSBvZiBD
by1EZXZlbG9wZWQtYnkKPiAKPiB2NDoKPiAtIGFkZCBwYXRjaCBmb3IgTUFJTlRBSU5FUlMgZW50
cnkKPiAtIGluY29ycG9yYXRlIE1pZ3VlbCdzIHJldmlldyBjb21tZW50cwo+IC0gUmVwbGFjZSBD
by1EZXZlbG9wZWQtYnkgd2l0aCBDby1kZXZlbG9wZWQtYnkgKGNoZWNrcGF0Y2gpCj4gdjU6Cj4g
LSBhZGQgdmVuZG9yIHByZWZpeCB0byBkcml2ZXItc3BlY2lmaWMgZHQgcHJvcGVydGllcwo+IAo+
IEFuZHJlYXMgRsOkcmJlciAoMSk6Cj4gICAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczog
QWRkIFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzCj4gCj4gSGVpbmVyIEthbGx3ZWl0ICg1KToKPiAg
ICBkdC1iaW5kaW5nczogYXV4ZGlzcGxheTogQWRkIFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzIFRN
MTYyOAo+ICAgIGRvY3M6IEFCSTogZG9jdW1lbnQgdG0xNjI4IGF0dHJpYnV0ZSBkaXNwbGF5LXRl
eHQKPiAgICBhdXhkaXNwbGF5OiBhZGQgc3VwcG9ydCBmb3IgVGl0YW5tZWMgVE0xNjI4IDcgc2Vn
bWVudCBkaXNwbGF5Cj4gICAgICBjb250cm9sbGVyCj4gICAgYXJtNjQ6IGR0czogbWVzb24tZ3hs
LXM5MDV3LXR4My1taW5pOiBhZGQgc3VwcG9ydCBmb3IgdGhlIDcgc2VnbWVudAo+ICAgICAgZGlz
cGxheQo+ICAgIE1BSU5UQUlORVJTOiBBZGQgZW50cnkgZm9yIHRtMTYyOCBhdXhkaXNwbGF5IGRy
aXZlcgo+IAo+ICAgLi4uL3Rlc3Rpbmcvc3lzZnMtZGV2aWNlcy1hdXhkaXNwbGF5LXRtMTYyOCAg
IHwgICA3ICsKPiAgIC4uLi9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1s
ICB8ICA5MiArKysrKwo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwgIHwgICAyICsKPiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgNyArCj4gICAuLi4vZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM5MDV3LXR4My1t
aW5pLmR0cyAgfCAgNTkgKysrCj4gICBkcml2ZXJzL2F1eGRpc3BsYXkvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgfCAgMTEgKwo+ICAgZHJpdmVycy9hdXhkaXNwbGF5L01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPiAgIGRyaXZlcnMvYXV4ZGlzcGxheS90bTE2MjguYyAgICAg
ICAgICAgICAgICAgICB8IDM3NiArKysrKysrKysrKysrKysrKysKPiAgIDggZmlsZXMgY2hhbmdl
ZCwgNTU1IGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L0FCSS90ZXN0aW5nL3N5c2ZzLWRldmljZXMtYXV4ZGlzcGxheS10bTE2MjgKPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90
aXRhbm1lYyx0bTE2MjgueWFtbAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvYXV4ZGlz
cGxheS90bTE2MjguYwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
