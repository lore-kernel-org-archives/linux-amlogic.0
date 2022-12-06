Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE71CC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjuU6SCA2qsXQ5tM+iOZK5SHu1aCX6a6/wciZvOcuQw=; b=EBfr9UKFvivu3j
	gMhso7OG6Cj76CX4zFUdD6pe9j3bii+eoY0GvlcGD0Kb1dBUNBQI3ga7B56f4+qOg5OeG3uo4LXVF
	GA6CVJKKzLmi0sapDcCY2nN/mA9ZoLp553Fw9Pk4e2eWc8CBq5okTFdkl/CjjcpWO8UFbybrUfK9S
	5/lwrPj+8dAm4jzdepBIClf3MpbK6gXHI0Am6e+LEWTxNVs1yMF1w78968erVZI1zKuFXI6/dq52V
	D4GozWJ0eJHmo1wm/jaV3qXlP0AtiR3/sts7TCLbl5oEGT0fnXuLMddOcBAdgIqdri++6txeqakjK
	vqPrwXwgf8JOrthfBhtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aX9-00EIPs-Ez; Tue, 06 Dec 2022 16:11:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aX6-00EI95-J2
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 16:11:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81B5C6124F;
	Tue,  6 Dec 2022 16:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF46C433C1;
	Tue,  6 Dec 2022 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670343056;
	bh=F6DcxtiqCeG4B6wmN9I+pwVih4zHP19OF/1oftcy+cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tK7IUkXUxWrHWCQOObPIW+bVrPjFl8vpJ3Zhe5rh4Nh8hqPo0VHuyHpMGVdXRQ7Wv
	 E+OdNwSvW0sNShK1BLGCd2/9gd72c4JUyoGQEBAJQYDcVY0BFcmYnIVpfHUL/GdCIi
	 wxw4NnkziVMmdl9WOD8Nvfdq6E+Weabtmlc9d6plnsAhGjIeyr5LgxCkKgQDo4t0RV
	 h90lBD5Ghn1C1QXRyoK5G4ZmU6zUk0AlzNiXZzi/89bVE8hDWV5JU84ybVcyQYsgw3
	 PjTPVf7ZyrifZtgOZZLigTL7ulhd8IMg7gzgDxwT7rMmFbuu1pCcRUDJVCGVHyE9xC
	 F2Qye+z+lAXaw==
Date: Tue, 6 Dec 2022 16:10:51 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y49pi54DKsvLOzvb@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221206105908.jzcdnast3yw22eel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_081100_704536_2664FBF5 
X-CRM114-Status: GOOD (  22.69  )
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

T24gVHVlLCAwNiBEZWMgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IEhleSBMZWUs
Cj4gCj4gT24gTW9uLCBOb3YgMjEsIDIwMjIgYXQgMDQ6NTE6MjFQTSArMDAwMCwgTGVlIEpvbmVz
IHdyb3RlOgo+ID4gT24gTW9uLCAyMSBOb3YgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6
Cj4gPiAKPiA+ID4gSGVsbG8gTGVlLAo+ID4gPiAKPiA+ID4gT24gTW9uLCBOb3YgMjEsIDIwMjIg
YXQgMTI6MzI6MTBQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgMTgg
Tm92IDIwMjIsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+ID4gRnJv
bTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gVGhlIHByb2JlIGZ1bmN0aW9uIGRvZXNuJ3QgbWFrZSB1c2Ugb2Yg
dGhlIGkyY19kZXZpY2VfaWQgKiBwYXJhbWV0ZXIgc28gaXQKPiA+ID4gPiA+IGNhbiBiZSB0cml2
aWFsbHkgY29udmVydGVkLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiAgZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jIHwgNSArKy0tLQo+ID4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+
ID4gCj4gPiA+ID4gQWZ0ZXIgYSB3ZWVrIG9yIHNvLCBwbGVhc2UgY29sbGVjdC11cCBhbGwgdGhl
IHRhZ3MgeW91IGhhdmUgcmVjZWl2ZWQKPiA+ID4gPiBhbmQgc3VibWl0IGEgcGVyLXN1YnN5c3Rl
bSBzZXQgZm9yIG1lIHRvIGhvb3ZlciB1cCwgdGhhbmtzLgo+ID4gPiAKPiA+ID4gRm9yIG1mZCBJ
J2QgZG86Cj4gPiA+IAo+ID4gPiAJZ2l0IGNoZWNrb3V0IG1mZC9mb3ItbmV4dAo+ID4gPiAJYjQg
YW0gLVAgNDEzLTQ4MSAyMDIyMTExODIyNDU0MC42MTkyNzYtMS11d2VAa2xlaW5lLWtvZW5pZy5v
cmcKPiA+ID4gCWdpdCBhbSAuLzIwMjIxMTE4X3V3ZV9pMmNfY29tcGxldGVfY29udmVyc2lvbl90
b19pMmNfcHJvYmVfbmV3Lm1ieAo+ID4gPiAJZ2l0IHNlbmQtZW1haWwgLS10byAuLi4uIC0tY2Mg
Li4uLiBtZmQvZm9yLW5leHQKPiA+IAo+ID4gVGhhdCdzIGp1c3QgY3JhenkgZW5vdWdoIHRvIHdv
cmsuCj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIHRpcC4KPiAKPiBPbiBpcmMgeW91IHNhaWQgeW91
J2QgY2FyZSBmb3IgYXBwbGljYXRpb24gb2YgdGhlc2UgcGF0Y2hlcyAoIkkgcGxhbiB0bwo+IGF0
dGVtcHQgdGhlIGI0IHNvbHV0aW9uIiksIHRoZXkgZGlkbid0IGxhbmQgaW4gbmV4dCB5ZXQuIERv
IHlvdSBuZWVkIGEKPiByZW1pbmRlcj8gU29tZXRoaW5nIGVsc2U/CgpJIGFwcGxpZWQgdGhlbSwg
YnV0IHRoZXkgZmFpbCB0byBidWlsZCBhbmQgSSBoYXZlbid0IGhhZCB0aW1lIHRvCmludmVzdGln
YXRlLiAgSSBndWVzcyB0aGV5IGRlcGVuZCBvbiBzb21lIHBhdGNoZXMgdGhhdCBoYXZlIGJlZW4K
YWNjZXB0ZWQgaW50byBhbm90aGVyIChpbnB1dD8pIGFuZCBhcmUgbm93IGluIC1uZXh0LiAgQW55
IGlkZWEgaWYgdGhleQphcmUgYXZhaWxhYmxlIG9uIHNvbWUgaW1tdXRhYmxlIGJyYW5jaCB0aGF0
IEkgY2FuIHB1bGwgZnJvbT8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
