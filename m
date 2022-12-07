Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F380C4708E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpzo5GnpcaI41g4vRu3GsxJtQChi1DOby7AXs8gxuYM=; b=mGlZBYTXYkzQwG
	eK1NAJ/Je7Tug6SFma7r4CmY+2CGVD6WTG5h84oZp+MJh2GauSSLZvgbpdfsZoPgsQJ+dGxq++0Zl
	hTaNPM2Fp/dVDf4w1W4KwTFDkuojOAgy0XlLmZ53RRhR1/gvUsEST3ov4NT3wLeAsbI+eL52bwZKZ
	5myDA0UzJH6Sh9COkMIKtx1dP3J7YlWQcCw/HGcRA8p5bI4NVE0oE/JkPr8dsSr79OYG9ux5oIFYp
	11SRIHJOZ7uV9pZDERMj1ZzP4m7GqKKGIaEmx4z1fC5ebOlXcQc/EIu8nU783DMJumHboEgCCTgGN
	LO5Eton2w0kYORiAnlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sWL-000fnp-L1; Wed, 07 Dec 2022 11:23:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sWH-000fgI-H6
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 11:23:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFFE9612ED;
	Wed,  7 Dec 2022 11:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B2CC433C1;
	Wed,  7 Dec 2022 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670412200;
	bh=3YU23InXjthWpJou6I3gazjFEz+Ws5zTsuXi0q/CsUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Plkgpwfny3LEbsm2Fa+F3Ljxa1i1Uu77HCkLB0BG7NOMe+JqQJ5F0SIqba9k1zNzy
	 Swo/kz4a2zc9dfWAiFSs2YEtK/rjckxS+VoHKr9cs6poavIsPhCN1+sW1qVG9Nmv/V
	 2VJOueAD2vIAq2klZqd24stHG96WkgEWlNtLBYkzWH1vwJHVPWRQpYLSK7vvnzIQrT
	 t6KfqqK6Qp19nEPwx0IUR+sudZ+MGH0AFo6SwdN6E2Y80fCPpkTBpe+FIkBzFdAkg/
	 QL6DG9tWzTjnYVmZmB3XI6Y7pMZ/qaPB3ebPleu1Z01dtM7n0g0kdldED3xHy9z1tS
	 vA1mA1Sj9fvcQ==
Date: Wed, 7 Dec 2022 11:23:14 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y5B3otGG06QCjldc@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
 <Y490W6k4N8iBxLHf@google.com>
 <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_032321_689196_381578F1 
X-CRM114-Status: GOOD (  31.40  )
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

T24gV2VkLCAwNyBEZWMgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IEhlbGxvIExl
ZSwKPiAKPiBPbiBUdWUsIERlYyAwNiwgMjAyMiBhdCAwNDo1Njo1OVBNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgRGVjIDA2LCAyMDIyIGF0IDA0OjEwOjUxUE0gKzAwMDAs
IExlZSBKb25lcyB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIDA2IERlYyAyMDIyLCBVd2UgS2xlaW5l
LUvDtm5pZyB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiA+IEhleSBMZWUsCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IE9uIE1vbiwgTm92IDIxLCAyMDIyIGF0IDA0OjUxOjIxUE0gKzAwMDAsIExlZSBKb25l
cyB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9uLCAyMSBOb3YgMjAyMiwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEhlbGxvIExlZSwKPiA+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gPiBPbiBNb24sIE5vdiAyMSwgMjAyMiBhdCAxMjozMjoxMFBNICsw
MDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiBGcmksIDE4IE5vdiAyMDIy
LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
ID4gPiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gVGhlIHByb2JlIGZ1bmN0
aW9uIGRvZXNuJ3QgbWFrZSB1c2Ugb2YgdGhlIGkyY19kZXZpY2VfaWQgKiBwYXJhbWV0ZXIgc28g
aXQKPiA+ID4gPiA+ID4gPiA+ID4gY2FuIGJlIHRyaXZpYWxseSBjb252ZXJ0ZWQuCj4gPiA+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+ID4gPiA+ID4gPiA+ID4gPiAt
LS0KPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWZkL2toYWRhcy1tY3UuYyB8IDUgKystLS0K
PiA+ID4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEFmdGVyIGEgd2VlayBv
ciBzbywgcGxlYXNlIGNvbGxlY3QtdXAgYWxsIHRoZSB0YWdzIHlvdSBoYXZlIHJlY2VpdmVkCj4g
PiA+ID4gPiA+ID4gPiBhbmQgc3VibWl0IGEgcGVyLXN1YnN5c3RlbSBzZXQgZm9yIG1lIHRvIGhv
b3ZlciB1cCwgdGhhbmtzLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEZvciBtZmQgSSdk
IGRvOgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IAlnaXQgY2hlY2tvdXQgbWZkL2Zvci1u
ZXh0Cj4gPiA+ID4gPiA+ID4gCWI0IGFtIC1QIDQxMy00ODEgMjAyMjExMTgyMjQ1NDAuNjE5Mjc2
LTEtdXdlQGtsZWluZS1rb2VuaWcub3JnCj4gPiA+ID4gPiA+ID4gCWdpdCBhbSAuLzIwMjIxMTE4
X3V3ZV9pMmNfY29tcGxldGVfY29udmVyc2lvbl90b19pMmNfcHJvYmVfbmV3Lm1ieAo+ID4gPiA+
ID4gPiA+IAlnaXQgc2VuZC1lbWFpbCAtLXRvIC4uLi4gLS1jYyAuLi4uIG1mZC9mb3ItbmV4dAo+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhhdCdzIGp1c3QgY3JhenkgZW5vdWdoIHRvIHdvcmsu
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGFua3MgZm9yIHRoZSB0aXAuCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IE9uIGlyYyB5b3Ugc2FpZCB5b3UnZCBjYXJlIGZvciBhcHBsaWNhdGlvbiBvZiB0
aGVzZSBwYXRjaGVzICgiSSBwbGFuIHRvCj4gPiA+ID4gPiBhdHRlbXB0IHRoZSBiNCBzb2x1dGlv
biIpLCB0aGV5IGRpZG4ndCBsYW5kIGluIG5leHQgeWV0LiBEbyB5b3UgbmVlZCBhCj4gPiA+ID4g
PiByZW1pbmRlcj8gU29tZXRoaW5nIGVsc2U/Cj4gPiA+ID4gCj4gPiA+ID4gSSBhcHBsaWVkIHRo
ZW0sIGJ1dCB0aGV5IGZhaWwgdG8gYnVpbGQgYW5kIEkgaGF2ZW4ndCBoYWQgdGltZSB0bwo+ID4g
PiA+IGludmVzdGlnYXRlLiAgSSBndWVzcyB0aGV5IGRlcGVuZCBvbiBzb21lIHBhdGNoZXMgdGhh
dCBoYXZlIGJlZW4KPiA+ID4gPiBhY2NlcHRlZCBpbnRvIGFub3RoZXIgKGlucHV0PykgYW5kIGFy
ZSBub3cgaW4gLW5leHQuICBBbnkgaWRlYSBpZiB0aGV5Cj4gPiA+ID4gYXJlIGF2YWlsYWJsZSBv
biBzb21lIGltbXV0YWJsZSBicmFuY2ggdGhhdCBJIGNhbiBwdWxsIGZyb20/Cj4gPiA+IAo+ID4g
PiBJZiBpbiB5b3VyIHRyZWUgaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lkKCkgaXMgbWlzc2luZywg
eW91IHdhbnQgdG8gcHVsbAo+ID4gPiAKPiA+ID4gCWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3dzYS9saW51eC5naXQgaTJjL2NsaWVudF9kZXZpY2VfaWRf
aGVscGVyLWltbXV0YWJsZQo+ID4gCj4gPiBJZGVhbCwgdGhhbmtzLgo+IAo+IEkgc2VlIHlvdSBh
ZGRlZCBteSBjb21taXRzIHRvIHlvdXIgdHJlZSBub3csIGhvd2V2ZXIgdGhlcmUgaXMgYSBwcm9i
bGVtOgo+IAo+ICAgJCBnaXQgbG9nIC0tb25lbGluZSAtLWdyYXBoIC0tYm91bmRhcnkgbGludXMv
bWFzdGVyLi5GRVRDSF9IRUFECj4gICAuLi4KPiAgICogICA3MjgxNDU4ZjQzOTYgTWVyZ2UgYnJh
bmNoZXMgJ2liLWkyYy1tZmQtY2xpZW50X2Rldl9pZF9oZWxwZXItNi4yJyBhbmQgJ2liLW1mZC11
d2VzLWkyYy1wcm9iZV9uZXctNi4yJyBpbnRvIGlicy1mb3ItbWZkLW1lcmdlZAo+ICAgfFwgIAo+
ICAgfCAqIGMwNjZhMTYzMmJjMyBtZmQ6IHdtODk5NC1jb3JlOiBDb252ZXJ0IHRvIGkyYydzIC5w
cm9iZV9uZXcoKQo+ICAgfCAqIDBmMjJjZjAwNzYyZCBtZmQ6IHdtODQwMC1jb3JlOiBDb252ZXJ0
IHRvIGkyYydzIC5wcm9iZV9uZXcoKQo+ICAgfCAqIDA5MGY0OWIyNTBlZSBtZmQ6IHdtODM1MC1p
MmM6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCj4gICB8ICogNzE3NGFmMWJlNDFkIG1m
ZDogd204MzF4LWkyYzogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKPiAgIHwgLi4uCj4g
ICB8ICogNjM5MDlmZWMxMzZlIG1mZDogYWRwNTUyMDogQ29udmVydCB0byBpMmMncyAucHJvYmVf
bmV3KCkKPiAgIHwgKiA1NDlkNGYzMjA3ZjggbWZkOiBhY3Q4OTQ1YTogQ29udmVydCB0byBpMmMn
cyAucHJvYmVfbmV3KCkKPiAgIHwgKiA2MjNmNzliYWJhZjEgbWZkOiBhYXQyODcwLWNvcmU6IENv
bnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCj4gICB8ICogY2U0MWU0YWU3Y2FjIG1mZDogODhw
bTgwNTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKPiAgIHwgKiAwMmFhNDgzZjFmOTgg
bWZkOiA4OHBtODAwOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQo+ICAgKiB8IDY2MjIz
MzczMWQ2NiBpMmM6IGNvcmU6IEludHJvZHVjZSBpMmNfY2xpZW50X2dldF9kZXZpY2VfaWQgaGVs
cGVyIGZ1bmN0aW9uCj4gICB8Lwo+ICAgbyA5YWJmMjMxM2FkYzEgKHRhZzogdjYuMS1yYzEpIExp
bnV4IDYuMS1yYzEKPiAKPiBUaGF0IG1lYW5zIHRoYXQgdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyBp
MmNfY2xpZW50X2dldF9kZXZpY2VfaWQoKSBpc24ndAo+IGFuIGFuY2VzdG9yIG9mIHRoZSBjb21t
aXRzIHRoYXQgbWFrZSB1c2Ugb2YgdGhlIG5ldyBmdW5jdGlvbi4gU28KPiA2MzkwOWZlYzEzNmUg
KHdoaWNoIGlzIHRoZSBmaXJzdCBjb21taXQgbWFraW5nIHVzZSBvZiB0aGUgbmV3IGZ1bmN0aW9u
KQo+IGxpa2VseSB3b24ndCBjb21waWxlOgo+IAo+IAkkIGdpdCBncmVwIGkyY19jbGllbnRfZ2V0
X2RldmljZV9pZCA2MzkwOWZlYzEzNmUKPiAJNjM5MDlmZWMxMzZlOmRyaXZlcnMvbWZkL2FkcDU1
MjAuYzogICAgIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCA9IGkyY19jbGllbnRfZ2V0
X2RldmljZV9pZChjbGllbnQpOwo+IAo+IFN0YXJ0aW5nIHdpdGggNzI4MTQ1OGY0Mzk2IGV2ZXJ5
dGhpbmcgaXMgZmluZSBhZ2FpbiwgYnV0IHN0aWxsIHRoaXMKPiBodXJ0cyBhIGJpc2VjdGlvbi4K
CkZhaXIgcG9pbnQgLSBJJ2xsIHJlYmFzZSB0aGUgbXkgdG9waWMgYnJhbmNoIG9uIHRvcCBvZiBX
b2xmcmFtJ3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
