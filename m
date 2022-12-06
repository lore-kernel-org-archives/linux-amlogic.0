Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04C1C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRxwNcR2t81W85QgOCq3ZvPxW3txxnlE62FJDbslJQQ=; b=Mpm6LVQYVUf8qI
	UtaA9KG2oo9sFMhXO9DBo7UHKo2C8osSnQ9dn0cDxotQA5wtKI16TOdB2cVtQ0BmdevM7moO6QP+w
	5MirETpEvkqK2VdyfHmFkJhfC6UuRvhy3AE4HpnIoPEm88ZIAR4ClIgafKYsh1GXAdoKDytpJik9h
	V+Ez+dcWss6N6R5iaw2cIPoux9KZrxFko7dB4f/CaZ5AJ1X/xj4ce5urUIzL3W7Q/znVLA3oz3vl/
	hXliBtLYLH14Bb48bQm8P0E6Z0ACJC2oPPLs3Z198YX6Gqz9CtUkajbv718OZKK//koTn/s5A0+Jk
	DLpHlDyCOpTyzNhTc4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2bFn-00FX7U-Tt; Tue, 06 Dec 2022 16:57:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2bFl-00FX50-70
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 16:57:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CE369B81ACD;
	Tue,  6 Dec 2022 16:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DCDC433C1;
	Tue,  6 Dec 2022 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670345825;
	bh=fiUZBItsIAyK+jAMIGNz3fSXYzREKztDb3GufaNBNhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnxEhZdA5VKyk53pDOuFbgYwJsTOx4Vg5dWwHZQaraMMJ/xbTXISKf5d1sGwEAz1U
	 ATyrFA1yTURMPJdFmDDCSXcoicjWOKRgCZnPtVvlZZDH5Miz437R/AD9M1vMrPTrdm
	 TreNWutBQ/l/koa+MfEnw0H85qR72HOXUplbQwVwybfXAP+ohyyWtbxf31FB9iIHq7
	 aKG/04trW9ZErW+KBBPd/a+qiLrplRreb0aBbxqvN5ou2buRhL5Dm8V6e/gd2yKWOa
	 0cHKS4kyaFYFkz9O6NR9Qk9jyx5fFTQcNqtkFodYNGyFZyo65hixFh2Z5Wgp6f02e/
	 VnnCgzeK5k76A==
Date: Tue, 6 Dec 2022 16:56:59 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y490W6k4N8iBxLHf@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221206163516.i6rzewxts7do75y5@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_085709_558082_9343B0F6 
X-CRM114-Status: GOOD (  26.03  )
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

T24gVHVlLCAwNiBEZWMgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IE9uIFR1ZSwg
RGVjIDA2LCAyMDIyIGF0IDA0OjEwOjUxUE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9u
IFR1ZSwgMDYgRGVjIDIwMjIsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gCj4gPiA+IEhl
eSBMZWUsCj4gPiA+IAo+ID4gPiBPbiBNb24sIE5vdiAyMSwgMjAyMiBhdCAwNDo1MToyMVBNICsw
MDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCAyMSBOb3YgMjAyMiwgVXdlIEts
ZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gPiBIZWxsbyBMZWUsCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IE9uIE1vbiwgTm92IDIxLCAyMDIyIGF0IDEyOjMyOjEwUE0gKzAwMDAsIExl
ZSBKb25lcyB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCAxOCBOb3YgMjAyMiwgVXdlIEtsZWlu
ZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEZyb206IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gVGhlIHByb2JlIGZ1bmN0aW9uIGRvZXNuJ3QgbWFrZSB1c2Ugb2YgdGhl
IGkyY19kZXZpY2VfaWQgKiBwYXJhbWV0ZXIgc28gaXQKPiA+ID4gPiA+ID4gPiBjYW4gYmUgdHJp
dmlhbGx5IGNvbnZlcnRlZC4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+
ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL21mZC9raGFkYXMtbWN1LmMg
fCA1ICsrLS0tCj4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBZnRlciBhIHdlZWsgb3Ig
c28sIHBsZWFzZSBjb2xsZWN0LXVwIGFsbCB0aGUgdGFncyB5b3UgaGF2ZSByZWNlaXZlZAo+ID4g
PiA+ID4gPiBhbmQgc3VibWl0IGEgcGVyLXN1YnN5c3RlbSBzZXQgZm9yIG1lIHRvIGhvb3ZlciB1
cCwgdGhhbmtzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGb3IgbWZkIEknZCBkbzoKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gCWdpdCBjaGVja291dCBtZmQvZm9yLW5leHQKPiA+ID4gPiA+IAliNCBhbSAt
UCA0MTMtNDgxIDIwMjIxMTE4MjI0NTQwLjYxOTI3Ni0xLXV3ZUBrbGVpbmUta29lbmlnLm9yZwo+
ID4gPiA+ID4gCWdpdCBhbSAuLzIwMjIxMTE4X3V3ZV9pMmNfY29tcGxldGVfY29udmVyc2lvbl90
b19pMmNfcHJvYmVfbmV3Lm1ieAo+ID4gPiA+ID4gCWdpdCBzZW5kLWVtYWlsIC0tdG8gLi4uLiAt
LWNjIC4uLi4gbWZkL2Zvci1uZXh0Cj4gPiA+ID4gCj4gPiA+ID4gVGhhdCdzIGp1c3QgY3Jhenkg
ZW5vdWdoIHRvIHdvcmsuCj4gPiA+ID4gCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgdGlwLgo+ID4g
PiAKPiA+ID4gT24gaXJjIHlvdSBzYWlkIHlvdSdkIGNhcmUgZm9yIGFwcGxpY2F0aW9uIG9mIHRo
ZXNlIHBhdGNoZXMgKCJJIHBsYW4gdG8KPiA+ID4gYXR0ZW1wdCB0aGUgYjQgc29sdXRpb24iKSwg
dGhleSBkaWRuJ3QgbGFuZCBpbiBuZXh0IHlldC4gRG8geW91IG5lZWQgYQo+ID4gPiByZW1pbmRl
cj8gU29tZXRoaW5nIGVsc2U/Cj4gPiAKPiA+IEkgYXBwbGllZCB0aGVtLCBidXQgdGhleSBmYWls
IHRvIGJ1aWxkIGFuZCBJIGhhdmVuJ3QgaGFkIHRpbWUgdG8KPiA+IGludmVzdGlnYXRlLiAgSSBn
dWVzcyB0aGV5IGRlcGVuZCBvbiBzb21lIHBhdGNoZXMgdGhhdCBoYXZlIGJlZW4KPiA+IGFjY2Vw
dGVkIGludG8gYW5vdGhlciAoaW5wdXQ/KSBhbmQgYXJlIG5vdyBpbiAtbmV4dC4gIEFueSBpZGVh
IGlmIHRoZXkKPiA+IGFyZSBhdmFpbGFibGUgb24gc29tZSBpbW11dGFibGUgYnJhbmNoIHRoYXQg
SSBjYW4gcHVsbCBmcm9tPwo+IAo+IElmIGluIHlvdXIgdHJlZSBpMmNfY2xpZW50X2dldF9kZXZp
Y2VfaWQoKSBpcyBtaXNzaW5nLCB5b3Ugd2FudCB0byBwdWxsCj4gCj4gCWh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3dzYS9saW51eC5naXQgaTJjL2NsaWVu
dF9kZXZpY2VfaWRfaGVscGVyLWltbXV0YWJsZQoKSWRlYWwsIHRoYW5rcy4KCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
