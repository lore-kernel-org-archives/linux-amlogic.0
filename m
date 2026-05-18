Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCACACD343F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 19:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceRMU3wJRA8x9+4/CsLv7rzqsd4cWW4SvbKbsVOY9OE=; b=4ilnFkpmZRd6gC
	8kIAYSbGj6VzJEtFI4UOJRID1yjToWXRzWBuJ4a8tWILFmNIZQsRqP/vz2k/1pPaAyPYnyQxP2KKt
	rZlCrzm6ZlQ+VB3HPtolM7vT/M9eje5OWpl9LiCiDrwojCOwWcZj6W20fAKjlGbOpv33zHAT65csJ
	6jaOD7wMMEVEmiTa0B/dtQcVEebzqyFIWbgT2nFcZmSoO4Hi5rp0CTaGRav/z2Doi9Fzo0Pf2GBY0
	O+x7PsQjljjnq4N1wzL02Ew42GbAX7nKGkEjmSbBVuMOZ+NeRmipzmf7V1tmVoc1qgT+oDkP5QRyf
	AIsKBXk/zK2LARlMOUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3MF-0000000GeKQ-1amT;
	Mon, 18 May 2026 19:10:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3ME-0000000GeK6-0USF
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 19:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91B99600CB;
	Mon, 18 May 2026 19:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF63C2BCB7;
	Mon, 18 May 2026 19:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779131429;
	bh=Bwv+BgLJuHTq8aF8CwXAVLmYYbnE+UrJQ/WHylP55zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HcLzFk/l/IqonkXMNaRFHVJejMtT+xMMbB3z6cOJDRA0WdNXtdTQa0ITp6yha13YX
	 bNUhWSxEORRML0n7pYSZjr42KeMwr7Xf4uh18VFyK9FmY2tGqGLkIJ4mQZQbwkQHch
	 czq1qjScQtIWVUIXRJlQFZEPWj061cYoZGI7nLak+gASCrtcPZx+UWGK1yU3EpajmH
	 oQ05ByeLN11MPBWUA9lJuwq3jsKlBFfc28KCa6pKrigZ/Ci77C0t7Smu3fI8h18aVq
	 7bF3O+ppU16JoOPmo+CkTXUAuvp7qf6XZQBxiImQn2Cppu9xmxEpP/+2Nngop9VE/p
	 IU2eR4V2vx0uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 23/23] drm: bridge: dw_hdmi: Merge top and bottom
 half IRQ handlers
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260518180206.2480119-24-jonas@kwiboo.se>
References: <20260518180206.2480119-24-jonas@kwiboo.se>
Date: Mon, 18 May 2026 19:10:28 +0000
Message-Id: <20260518191028.CBF63C2BCB7@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIENsZWFyaW5nIHRoZSBI
UEQgaW50ZXJydXB0IHN0YXR1cyBhZnRlciBtb2RpZnlpbmcgdGhlIGludGVycnVwdCBwb2xhcml0
eSBjcmVhdGVzIGEgcmFjZSB3aW5kb3cgd2hlcmUgYW4gZWRnZSB0cmFuc2l0aW9uIGlzIG1pc3Nl
ZCwgYnJlYWtpbmcgaG90cGx1ZyBkZXRlY3Rpb24uCi0tCgpjb21taXQgYjRjNzQzOTM1ZWI5ODky
YzBlMmE2YTk2MmE1MjQ0MGEzN2U5ODVkZQpBdXRob3I6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3
aWJvby5zZT4KZHJtOiBicmlkZ2U6IGR3X2hkbWk6IE1lcmdlIHRvcCBhbmQgYm90dG9tIGhhbGYg
SVJRIGhhbmRsZXJzCgpUaGlzIGNvbW1pdCBzaW1wbGlmaWVzIElSUSBoYW5kbGluZyBieSBtZXJn
aW5nIHRoZSB0b3AgYW5kIGJvdHRvbSBoYWxmIElSUQpoYW5kbGVycyBpbnRvIGEgc2luZ2xlIGhh
bmRsZXIuIEl0IHRyYW5zaXRpb25zIEhQRCBldmVudCBoYW5kbGluZyB0byB1c2UgYQpkZWxheWVk
IHdvcmsgcXVldWUgaW5zdGVhZCBvZiBhbiBJUlEgdGhyZWFkLgoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiBAQCAtMjk5MywzMCArMjk5MywxOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qg
ZHdfaGRtaV9oYXJkaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKWyAuLi4gXQo+IC0JaW50cl9z
dGF0ID0gaGRtaV9yZWFkYihoZG1pLCBIRE1JX0lIX1BIWV9TVEFUMCk7Cj4gLQlpZiAoaW50cl9z
dGF0ICYgSERNSV9JSF9QSFlfU1RBVDBfSFBEKSB7Cj4gKwlpbnRyX3N0YXQgPSBoZG1pX3JlYWRi
KGhkbWksIEhETUlfSUhfUEhZX1NUQVQwKSAmIEhETUlfSUhfUEhZX1NUQVQwX0hQRDsKPiArCWlm
IChpbnRyX3N0YXQpIHsKPiAgCQllbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIHN0YXR1czsKPiAg
Cj4gKwkJaGRtaV93cml0ZWIoaGRtaSwgfjAsIEhETUlfSUhfTVVURV9QSFlfU1RBVDApOwo+ICsK
PiAgCQkvKiBTZXQgSFBEIGludGVycnVwdCBwb2xhcml0eSBiYXNlZCBvbiBjdXJyZW50IEhQRCBz
dGF0dXMuICovCj4gIAkJc3RhdHVzID0gZHdfaGRtaV9waHlfcmVhZF9ocGQoaGRtaSwgaGRtaS0+
cGh5LmRhdGEpOwo+ICAJCWhkbWlfbW9kYihoZG1pLCBzdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1
c19jb25uZWN0ZWQgPwo+IEBAIC0zMDI4LDEyICszMDE2LDEzIEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBkd19oZG1pX2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gIAo+ICAJCW1vZF9kZWxheWVk
X3dvcmsoc3lzdGVtX3BlcmNwdV93cSwgJmhkbWktPmhwZF93b3JrLAo+ICAJCQkJIG1zZWNzX3Rv
X2ppZmZpZXMoSE9UUExVR19ERUJPVU5DRV9NUykpOwo+IC0JfQo+ICAKPiAtCWhkbWlfd3JpdGVi
KGhkbWksIGludHJfc3RhdCwgSERNSV9JSF9QSFlfU1RBVDApOwo+IC0JaGRtaV93cml0ZWIoaGRt
aSwgfkhETUlfSUhfUEhZX1NUQVQwX0hQRCwgSERNSV9JSF9NVVRFX1BIWV9TVEFUMCk7Cj4gKwkJ
aGRtaV93cml0ZWIoaGRtaSwgaW50cl9zdGF0LCBIRE1JX0lIX1BIWV9TVEFUMCk7CgpEb2VzIGNs
ZWFyaW5nIHRoZSBIUEQgaW50ZXJydXB0IHN0YXR1cyBhZnRlciBtb2RpZnlpbmcgdGhlIGludGVy
cnVwdCBwb2xhcml0eQpjcmVhdGUgYSByYWNlIHdpbmRvdyB3aGVyZSBhbiBlZGdlIHRyYW5zaXRp
b24gaXMgbWlzc2VkPwoKV2hpbGUgdGhpcyBpc24ndCBhIG5ldyByZWdyZXNzaW9uIGludHJvZHVj
ZWQgYnkgdGhpcyBwYXRjaCwgaXQgcGVyc2lzdHMgaW4KdGhlIG5ldyBtZXJnZWQgaGFuZGxlcjoK
CjEuIFRoZSBJU1IgcmVhZHMgSERNSV9JSF9QSFlfU1RBVDAgYW5kIGZpbmRzIHRoZSBIUEQgYml0
IHNldC4KCjIuIEl0IHJlYWRzIHRoZSBjdXJyZW50IFBIWSBzdGF0ZSAoZS5nLiBDT05ORUNURUQp
IGFuZCB1cGRhdGVzIHRoZSBwb2xhcml0eQpIRE1JX1BIWV9QT0wwIHRvIGxvb2sgZm9yIHRoZSBv
cHBvc2l0ZSBlZGdlIChlLmcuIFBMVUdPVVQpLgoKMy4gSWYgYSBmYXN0IGJvdW5jZSBvY2N1cnMg
cmlnaHQgaGVyZSAodGhlIGNhYmxlIGlzIHVucGx1Z2dlZCksIHRoZSBoYXJkd2FyZQpkZXRlY3Rz
IHRoZSBlZGdlIGFuZCBzZXRzIHRoZSBIUEQgc3RpY2t5IGJpdCB0byAxIGFnYWluLgoKNC4gVGhl
IElTUiB0aGVuIHdyaXRlcyB0aGUgb3JpZ2luYWwgaW50cl9zdGF0ICh3aXRoIHRoZSBIUEQgYml0
IHNldCkgYmFjayB0bwpIRE1JX0lIX1BIWV9TVEFUMCAoYSB3cml0ZS0xLXRvLWNsZWFyIHJlZ2lz
dGVyKS4gVGhpcyBjbGVhcnMgdGhlIG5ld2x5IGxhdGNoZWQKdW5wbHVnIGV2ZW50LgoKVGhpcyBs
ZWF2ZXMgdGhlIGhhcmR3YXJlIHdhaXRpbmcgZm9yIGEgUExVR09VVCBldmVudCwgYnV0IHRoZSBj
YWJsZSBpcyBhbHJlYWR5CmRpc2Nvbm5lY3RlZC4gV2hlbiB0aGUgY2FibGUgaXMgcGx1Z2dlZCBi
YWNrIGluLCB0aGUgaGFyZHdhcmUgaWdub3JlcyB0aGUKUExVR0lOIGVkZ2UgYmVjYXVzZSBpdCBp
cyBzdGlsbCBsb29raW5nIGZvciBhIFBMVUdPVVQuCgpDb3VsZCB0aGlzIGxlYWQgdG8gYSByZWdy
ZXNzaW9uIHdoZXJlIGhvdHBsdWcgaW50ZXJydXB0cyBicmVhayB1bnRpbCB0aGUgbmV4dApyZWJv
b3Q/IFNob3VsZCB0aGUgVzFDIHJlZ2lzdGVyIGJlIGNsZWFyZWQgYmVmb3JlIHJlYWRpbmcgdGhl
IFBIWSBzdGF0dXMgYW5kCnVwZGF0aW5nIHRoZSBwb2xhcml0eT8KCj4gKwkJaGRtaV93cml0ZWIo
aGRtaSwgfkhETUlfSUhfUEhZX1NUQVQwX0hQRCwgSERNSV9JSF9NVVRFX1BIWV9TVEFUMCk7Cj4g
KwkJcmV0ID0gSVJRX0hBTkRMRUQ7Cj4gKwl9Cj4gIAo+IC0JcmV0dXJuIElSUV9IQU5ETEVEOwo+
ICsJcmV0dXJuIHJldDsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxODE4MDIwNi4yNDgwMTE5LTEtam9uYXNAa3dpYm9v
LnNlP3BhcnQ9MjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
