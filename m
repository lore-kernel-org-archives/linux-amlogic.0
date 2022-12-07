Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABCCC4708E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfOLzh48/uQtsPTnst5o7cP8KPu1Y+J3SMpRqaDrt4c=; b=tbp6N8DfI5eCFv
	t6/2XejoeCDYSiSeHkehIZvkiq23dSG2tjZCx5T57miWzPeQHPqpIxqFSkrBRcIX+4di45xPkkp+t
	nMUxepd4z//igaueMbZ4E7sAafDrSos2wTSTykTn4AGxePEn/v3IlAxrvV/ImZbNuviuG6c98kPpq
	h3POoggbv7DGhP0ooUNjyu1LcQjheI59gYAYYJO26ZXbfIe62dWyqlTo2Du25rNCQQuGzbzJqetYt
	tuMbqH1wSaCrrqNxS8QkBqSnX1FDa5Uz/ImZbZ11G8r3/Ds7G8LpLjc7sbISfHua6ctVAiE+jIiMU
	wQ2g0i0vzTGXyXT3rR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uYu-003dx7-1I; Wed, 07 Dec 2022 13:34:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uYq-003dor-SG
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 13:34:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E1796170C;
	Wed,  7 Dec 2022 13:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA25C433D6;
	Wed,  7 Dec 2022 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670420047;
	bh=elr2HDuqjRRmOQhV34eBsyYESMXGtjl2XNUUUrkaqDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8ku8GNOfJyWBcx1vpcCk/gqTAD1OeLVCBOJxydgHKXE6GtJTC230Fk1/N1+lafVT
	 +agnxRYIX9/2Bs4kRL6CezS2rl91XYk0ZeotTnibqkLc28yjq5/rpmXFt6RUFMydGv
	 rcFywx27xbM0yMCXkuDg3eepOD2iQFNq+wzsMVCL0aCT1kdpAIBTgTWhgGEPN0nLnT
	 AnuzekHsSuIYuk1tLB7tpq0NXHqg/AKobEn5V57tPMx8H/nSAsdGesN5JITh04uemj
	 iOdog1CTDxfjk/k4sBIEpcJ4up4iX8j/ryivCadE0T+ffNSgPed379V2iPGQf4BWTU
	 irppfU69unGfQ==
Date: Wed, 7 Dec 2022 13:34:01 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y5CWSZpndGi4mU5e@google.com>
References: <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
 <Y490W6k4N8iBxLHf@google.com>
 <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
 <Y5B3otGG06QCjldc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5B3otGG06QCjldc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_053409_009671_CA96F8D5 
X-CRM114-Status: GOOD (  32.74  )
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

T24gV2VkLCAwNyBEZWMgMjAyMiwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBXZWQsIDA3IERlYyAy
MDIyLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiAKPiA+IEhlbGxvIExlZSwKPiA+IAo+ID4g
T24gVHVlLCBEZWMgMDYsIDIwMjIgYXQgMDQ6NTY6NTlQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gPiA+IE9uIFR1ZSwgRGVjIDA2LCAyMDIyIGF0IDA0OjEwOjUxUE0gKzAwMDAsIExlZSBK
b25lcyB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgMDYgRGVjIDIwMjIsIFV3ZSBLbGVpbmUtS8O2
bmlnIHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEhleSBMZWUsCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBPbiBNb24sIE5vdiAyMSwgMjAyMiBhdCAwNDo1MToyMVBNICswMDAwLCBMZWUg
Sm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gTW9uLCAyMSBOb3YgMjAyMiwgVXdlIEtsZWlu
ZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBIZWxsbyBMZWUs
Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgTm92IDIxLCAyMDIyIGF0
IDEyOjMyOjEwUE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gT24g
RnJpLCAxOCBOb3YgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IEZyb206IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gPiA+ID4gVGhlIHByb2JlIGZ1bmN0aW9uIGRvZXNuJ3QgbWFrZSB1c2Ugb2YgdGhlIGkyY19k
ZXZpY2VfaWQgKiBwYXJhbWV0ZXIgc28gaXQKPiA+ID4gPiA+ID4gPiA+ID4gPiBjYW4gYmUgdHJp
dmlhbGx5IGNvbnZlcnRlZC4KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPgo+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ID4gPiA+ICBk
cml2ZXJzL21mZC9raGFkYXMtbWN1LmMgfCA1ICsrLS0tCj4gPiA+ID4gPiA+ID4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBBZnRlciBhIHdlZWsgb3Igc28sIHBsZWFzZSBjb2xs
ZWN0LXVwIGFsbCB0aGUgdGFncyB5b3UgaGF2ZSByZWNlaXZlZAo+ID4gPiA+ID4gPiA+ID4gPiBh
bmQgc3VibWl0IGEgcGVyLXN1YnN5c3RlbSBzZXQgZm9yIG1lIHRvIGhvb3ZlciB1cCwgdGhhbmtz
Lgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBGb3IgbWZkIEknZCBkbzoKPiA+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gCWdpdCBjaGVja291dCBtZmQvZm9yLW5leHQKPiA+
ID4gPiA+ID4gPiA+IAliNCBhbSAtUCA0MTMtNDgxIDIwMjIxMTE4MjI0NTQwLjYxOTI3Ni0xLXV3
ZUBrbGVpbmUta29lbmlnLm9yZwo+ID4gPiA+ID4gPiA+ID4gCWdpdCBhbSAuLzIwMjIxMTE4X3V3
ZV9pMmNfY29tcGxldGVfY29udmVyc2lvbl90b19pMmNfcHJvYmVfbmV3Lm1ieAo+ID4gPiA+ID4g
PiA+ID4gCWdpdCBzZW5kLWVtYWlsIC0tdG8gLi4uLiAtLWNjIC4uLi4gbWZkL2Zvci1uZXh0Cj4g
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhhdCdzIGp1c3QgY3JhenkgZW5vdWdoIHRvIHdv
cmsuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhhbmtzIGZvciB0aGUgdGlwLgo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gT24gaXJjIHlvdSBzYWlkIHlvdSdkIGNhcmUgZm9yIGFwcGxp
Y2F0aW9uIG9mIHRoZXNlIHBhdGNoZXMgKCJJIHBsYW4gdG8KPiA+ID4gPiA+ID4gYXR0ZW1wdCB0
aGUgYjQgc29sdXRpb24iKSwgdGhleSBkaWRuJ3QgbGFuZCBpbiBuZXh0IHlldC4gRG8geW91IG5l
ZWQgYQo+ID4gPiA+ID4gPiByZW1pbmRlcj8gU29tZXRoaW5nIGVsc2U/Cj4gPiA+ID4gPiAKPiA+
ID4gPiA+IEkgYXBwbGllZCB0aGVtLCBidXQgdGhleSBmYWlsIHRvIGJ1aWxkIGFuZCBJIGhhdmVu
J3QgaGFkIHRpbWUgdG8KPiA+ID4gPiA+IGludmVzdGlnYXRlLiAgSSBndWVzcyB0aGV5IGRlcGVu
ZCBvbiBzb21lIHBhdGNoZXMgdGhhdCBoYXZlIGJlZW4KPiA+ID4gPiA+IGFjY2VwdGVkIGludG8g
YW5vdGhlciAoaW5wdXQ/KSBhbmQgYXJlIG5vdyBpbiAtbmV4dC4gIEFueSBpZGVhIGlmIHRoZXkK
PiA+ID4gPiA+IGFyZSBhdmFpbGFibGUgb24gc29tZSBpbW11dGFibGUgYnJhbmNoIHRoYXQgSSBj
YW4gcHVsbCBmcm9tPwo+ID4gPiA+IAo+ID4gPiA+IElmIGluIHlvdXIgdHJlZSBpMmNfY2xpZW50
X2dldF9kZXZpY2VfaWQoKSBpcyBtaXNzaW5nLCB5b3Ugd2FudCB0byBwdWxsCj4gPiA+ID4gCj4g
PiA+ID4gCWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3dz
YS9saW51eC5naXQgaTJjL2NsaWVudF9kZXZpY2VfaWRfaGVscGVyLWltbXV0YWJsZQo+ID4gPiAK
PiA+ID4gSWRlYWwsIHRoYW5rcy4KPiA+IAo+ID4gSSBzZWUgeW91IGFkZGVkIG15IGNvbW1pdHMg
dG8geW91ciB0cmVlIG5vdywgaG93ZXZlciB0aGVyZSBpcyBhIHByb2JsZW06Cj4gPiAKPiA+ICAg
JCBnaXQgbG9nIC0tb25lbGluZSAtLWdyYXBoIC0tYm91bmRhcnkgbGludXMvbWFzdGVyLi5GRVRD
SF9IRUFECj4gPiAgIC4uLgo+ID4gICAqICAgNzI4MTQ1OGY0Mzk2IE1lcmdlIGJyYW5jaGVzICdp
Yi1pMmMtbWZkLWNsaWVudF9kZXZfaWRfaGVscGVyLTYuMicgYW5kICdpYi1tZmQtdXdlcy1pMmMt
cHJvYmVfbmV3LTYuMicgaW50byBpYnMtZm9yLW1mZC1tZXJnZWQKPiA+ICAgfFwgIAo+ID4gICB8
ICogYzA2NmExNjMyYmMzIG1mZDogd204OTk0LWNvcmU6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2Jl
X25ldygpCj4gPiAgIHwgKiAwZjIyY2YwMDc2MmQgbWZkOiB3bTg0MDAtY29yZTogQ29udmVydCB0
byBpMmMncyAucHJvYmVfbmV3KCkKPiA+ICAgfCAqIDA5MGY0OWIyNTBlZSBtZmQ6IHdtODM1MC1p
MmM6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCj4gPiAgIHwgKiA3MTc0YWYxYmU0MWQg
bWZkOiB3bTgzMXgtaTJjOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQo+ID4gICB8IC4u
Lgo+ID4gICB8ICogNjM5MDlmZWMxMzZlIG1mZDogYWRwNTUyMDogQ29udmVydCB0byBpMmMncyAu
cHJvYmVfbmV3KCkKPiA+ICAgfCAqIDU0OWQ0ZjMyMDdmOCBtZmQ6IGFjdDg5NDVhOiBDb252ZXJ0
IHRvIGkyYydzIC5wcm9iZV9uZXcoKQo+ID4gICB8ICogNjIzZjc5YmFiYWYxIG1mZDogYWF0Mjg3
MC1jb3JlOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQo+ID4gICB8ICogY2U0MWU0YWU3
Y2FjIG1mZDogODhwbTgwNTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKPiA+ICAgfCAq
IDAyYWE0ODNmMWY5OCBtZmQ6IDg4cG04MDA6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygp
Cj4gPiAgICogfCA2NjIyMzM3MzFkNjYgaTJjOiBjb3JlOiBJbnRyb2R1Y2UgaTJjX2NsaWVudF9n
ZXRfZGV2aWNlX2lkIGhlbHBlciBmdW5jdGlvbgo+ID4gICB8Lwo+ID4gICBvIDlhYmYyMzEzYWRj
MSAodGFnOiB2Ni4xLXJjMSkgTGludXggNi4xLXJjMQo+ID4gCj4gPiBUaGF0IG1lYW5zIHRoYXQg
dGhlIGNvbW1pdCBpbnRyb2R1Y2luZyBpMmNfY2xpZW50X2dldF9kZXZpY2VfaWQoKSBpc24ndAo+
ID4gYW4gYW5jZXN0b3Igb2YgdGhlIGNvbW1pdHMgdGhhdCBtYWtlIHVzZSBvZiB0aGUgbmV3IGZ1
bmN0aW9uLiBTbwo+ID4gNjM5MDlmZWMxMzZlICh3aGljaCBpcyB0aGUgZmlyc3QgY29tbWl0IG1h
a2luZyB1c2Ugb2YgdGhlIG5ldyBmdW5jdGlvbikKPiA+IGxpa2VseSB3b24ndCBjb21waWxlOgo+
ID4gCj4gPiAJJCBnaXQgZ3JlcCBpMmNfY2xpZW50X2dldF9kZXZpY2VfaWQgNjM5MDlmZWMxMzZl
Cj4gPiAJNjM5MDlmZWMxMzZlOmRyaXZlcnMvbWZkL2FkcDU1MjAuYzogICAgIGNvbnN0IHN0cnVj
dCBpMmNfZGV2aWNlX2lkICppZCA9IGkyY19jbGllbnRfZ2V0X2RldmljZV9pZChjbGllbnQpOwo+
ID4gCj4gPiBTdGFydGluZyB3aXRoIDcyODE0NThmNDM5NiBldmVyeXRoaW5nIGlzIGZpbmUgYWdh
aW4sIGJ1dCBzdGlsbCB0aGlzCj4gPiBodXJ0cyBhIGJpc2VjdGlvbi4KPiAKPiBGYWlyIHBvaW50
IC0gSSdsbCByZWJhc2UgdGhlIG15IHRvcGljIGJyYW5jaCBvbiB0b3Agb2YgV29sZnJhbSdzLgoK
T2theSwgdHJ5IG5vdy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
