Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2682ECD4F25
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2026 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Px71dfGbJ4zJW4Wa0Z715qqiV4dVu9+ICFKCpBDpWVk=; b=m0eJqJ5mHolss1
	adAHOlXvd0EMEXouqf36lZbUYgmipEgHbhaErmj4tBzbFefRgCyQ8Yr3UgwAt3wMBSnqVm+4DqrZ6
	gnJ/W5Sc38+qQZ8scqB+tplrJIqKf8xncXEYPr2Hl4G+9R3cQWumPhjEX7QINX96/K+OKrticE2OG
	AtrTdV/PnN9kVWaAbjDhMHW7UyfY08uo7lZ5rJdJImoKtpo1uJbUPoJp/28nMvj4T1rS9NHu2z6p7
	xyVQ+d3DC3UC7earjOK7JngegOVKACBMuJiyC1btzd5yv6ZJDPio6u9tZETbhV+fSMy2u2mNTS988
	WX8AssXxKD50pmHgLRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTYI-00000005EOm-3PtN;
	Thu, 14 May 2026 10:44:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTYH-00000005EOI-1fWU
	for linux-amlogic@lists.infradead.org;
	Thu, 14 May 2026 10:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7712B60008;
	Thu, 14 May 2026 10:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B3FC2BCB3;
	Thu, 14 May 2026 10:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755464;
	bh=6/zcIGtaMzl1B6ZSgRN/Ge8BzoqMj1RTT+oy6A5rTPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sAKJqiyPNAyU7oZeRsOUaC343Y3W9iU8dHltVItam5ZJlXYLzNq4ezAU+mlwVcLD2
	 HAwoJIBaXH8hpk3c83jBcoKJDeHq9IIoieVG59Xs/3SbA787WIJB43PdleXfIoMlpy
	 uwhy707pkp6WQBtPgIuDLVNCuliCnV2qUTA59FndGS+/sm4+l/Zy8HxYYlca+IS8p8
	 Vr37ONatxUEr3zoLBzWkTphvJfCxj7JI6Xl1hJ9iAeY0jF9zxKM5YQELAbfSrgfrT3
	 K3djRnkp5M4U6v/CCDcYRckgTPjM5Lhd3d/yz1ja9IuyBoSWdwMrYoQrIOOWayhtWN
	 ae6ATX1vQfLHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:44:23 +0000
Message-Id: <20260514104424.04B3FC2BCB3@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIElSUV9IUEQgZXZlbnRz
IGFyZSBzaWxlbnRseSBkcm9wcGVkIGlmIGEgc3RhdHVzIHVwZGF0ZSB0cmlnZ2VycyBhIHJlY29u
ZmlndXJhdGlvbiB3aGlsZSB0aGUgSFBEIHN0YXRlIHJlbWFpbnMgdW5jaGFuZ2VkLgotIFtIaWdo
XSBEZWZlcnJlZCBldmVudHMgaW4gYGRwX2FsdG1vZGVfY29uZmlndXJlZCgpYCB1bmNvbmRpdGlv
bmFsbHkgcmVwb3J0IHRoZSBkaXNwbGF5IGFzIGNvbm5lY3RlZCBhbmQgbGVhayBzdGFsZSBgcGVu
ZGluZ19pcnFfaHBkYCAvIGBwZW5kaW5nX2hwZGAgc3RhdGUuCi0tCgpjb21taXQgNTNkODJmOWE1
Mjg2YThmYTU1MzBjYTFiZTk0ZjYxOTQwNjM3NTg2YgpBdXRob3I6IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KCmRybS9jb25uZWN0b3I6IHJlcG9y
dCBJUlFfSFBEIGV2ZW50cyB0byBkcm1fY29ubmVjdG9yX29vYl9ob3RwbHVnX2V2ZW50KCkKClRo
aXMgY29tbWl0IGV4dGVuZHMgdGhlIGRybV9jb25uZWN0b3Jfb29iX2hvdHBsdWdfZXZlbnQoKSBp
bnRlcmZhY2UgdG8gcmVwb3J0CkRpc3BsYXlQb3J0IGlycSBldmVudHMuIFRoZXNlIGV2ZW50cyBh
cmUgbm93IGZvcndhcmRlZCB0aHJvdWdoIHRoZSBhbHQgbW9kZQptZXNzYWdlcyB0byB0aGUgc2lu
ayBkcml2ZXJzIHRvIHN1cHBvcnQgbXVsdGktc3RyZWFtIHRyYW5zcG9ydCBoYW5kbGluZy4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL2FsdG1vZGVzL2Rpc3BsYXlwb3J0LmMgYi9k
cml2ZXJzL3VzYi90eXBlYy9hbHRtb2Rlcy9kaXNwbGF5cG9ydC5jCj4gaW5kZXggMzVkOWMzMDg2
OTkwMC4uNzE4MmE4ZTJlNzEwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3VzYi90eXBlYy9hbHRt
b2Rlcy9kaXNwbGF5cG9ydC5jCj4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvYWx0bW9kZXMvZGlz
cGxheXBvcnQuYwpbIC4uLiBdCj4gQEAgLTIxMiw3ICsyMTQsMTAgQEAgc3RhdGljIGludCBkcF9h
bHRtb2RlX2NvbmZpZ3VyZWQoc3RydWN0IGRwX2FsdG1vZGUgKmRwKQo+ICAJICovCj4gIAlpZiAo
ZHAtPnBlbmRpbmdfaHBkKSB7Cj4gIAkJZHJtX2Nvbm5lY3Rvcl9vb2JfaG90cGx1Z19ldmVudChk
cC0+Y29ubmVjdG9yX2Z3bm9kZSwKPiAtCQkJCQkJY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQp
Owo+ICsJCQkJCQljb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCwKPiArCQkJCQkJZHAtPnBlbmRp
bmdfaXJxX2hwZCA/Cj4gKwkJCQkJCURSTV9DT05ORUNUT1JfRFBfSVJRX0hQRCA6Cj4gKwkJCQkJ
CURSTV9DT05ORUNUT1JfTk9fRVhUUkFfU1RBVFVTKTsKCkFyZSBpcnEgZXZlbnRzIHNpbGVudGx5
IGRyb3BwZWQgaWYgYSBzdGF0dXMgdXBkYXRlIHRyaWdnZXJzIGEKcmVjb25maWd1cmF0aW9uIHdo
aWxlIHRoZSBob3RwbHVnIGRldGVjdCBzdGF0ZSByZW1haW5zIHVuY2hhbmdlZD8KCkxvb2tpbmcg
YXQgZHBfYWx0bW9kZV9zdGF0dXNfdXBkYXRlKCksIGlmIGEgc3RhdHVzIHVwZGF0ZSByZXF1aXJl
cwpyZWNvbmZpZ3VyYXRpb24sIHRoZSBjb2RlIGF0dGVtcHRzIHRvIGJ1ZmZlciB0aGUgZXZlbnQ6
CgoJaWYgKCEoY29uICYgRFBfQ09ORl9DVVJSRU5UTFkoZHAtPmRhdGEuY29uZikpKSB7CgkJcmV0
ID0gZHBfYWx0bW9kZV9jb25maWd1cmUoZHAsIGNvbik7CgkJaWYgKCFyZXQpIHsKCQkJZHAtPnN0
YXRlID0gZHAtPnBsdWdfcHJpbWUgPyBEUF9TVEFURV9DT05GSUdVUkVfUFJJTUUgOgoJCQkJCQkg
ICAgIERQX1NUQVRFX0NPTkZJR1VSRTsKCQkJaWYgKGRwLT5ocGQgIT0gaHBkKSB7CgkJCQlkcC0+
aHBkID0gaHBkOwoJCQkJZHAtPnBlbmRpbmdfaHBkID0gdHJ1ZTsKCQkJfQoJCQlpZiAoZHAtPmhw
ZCAmJiBkcC0+cGVuZGluZ19ocGQgJiYgaXJxX2hwZCkKCQkJCWRwLT5wZW5kaW5nX2lycV9ocGQg
PSB0cnVlOwoJCX0KCX0KCkl0IG9ubHkgc2V0cyBkcC0+cGVuZGluZ19ocGQgPSB0cnVlIGlmIHRo
ZSBob3RwbHVnIGRldGVjdCBzdGF0ZSBoYXMgdG9nZ2xlZC4gSWYKaXQgcmVtYWlucyB1bmNoYW5n
ZWQsIGRwLT5wZW5kaW5nX2hwZCBzdGF5cyBmYWxzZS4gVGhpcyBwcmV2ZW50cwpkcC0+cGVuZGlu
Z19pcnFfaHBkIGZyb20gYmVpbmcgc2V0IGV2ZW4gaWYgaXJxX2hwZCBpcyB0cnVlLgoKQ291bGQg
dGhpcyBjYXVzZSBEaXNwbGF5UG9ydCBpcnEgZXZlbnRzIHRoYXQgYXJyaXZlIGNvbmN1cnJlbnRs
eSB3aXRoIGEKY29uZmlndXJhdGlvbiBjaGFuZ2UgdG8gYmUgbG9zdCwgcHJldmVudGluZyBkb3du
c3RyZWFtIG11bHRpLXN0cmVhbSB0cmFuc3BvcnQKdG9wb2xvZ3kgdXBkYXRlcyBhbmQgbGluayB0
cmFpbmluZz8KCkFkZGl0aW9uYWxseSwgZG9lcyB0aGlzIGRlZmVycmVkIGV2ZW50IHVuY29uZGl0
aW9uYWxseSByZXBvcnQgdGhlIGRpc3BsYXkgYXMKY29ubmVjdGVkIGFuZCBsZWFrIHN0YWxlIHN0
YXRlPwoKSWYgbXVsdGlwbGUgc3RhdHVzIHVwZGF0ZSBtZXNzYWdlcyBhcnJpdmUgYmVmb3JlIGNv
bmZpZ3VyYXRpb24KY29tcGxldGVzLCBkcC0+aHBkIGNhbiB0cmFuc2l0aW9uIHRvIGZhbHNlIHdo
aWxlIGRwLT5wZW5kaW5nX2hwZCBhbmQKZHAtPnBlbmRpbmdfaXJxX2hwZCByZW1haW4gdHJ1ZS4K
ClNpbWlsYXJseSwgaWYgdGhlIGFsdCBtb2RlIGlzIGV4aXRlZCB2aWEgQ01EX0VYSVRfTU9ERSB3
aGlsZQpkcC0+cGVuZGluZ19ocGQgaXMgdHJ1ZSwgdGhlc2UgcGVuZGluZyBmbGFncyBhcmUgbmV2
ZXIgY2xlYXJlZC4KCldpbGwgdGhpcyBjYXVzZSB0aGUgZHJtIGRyaXZlciB0byByZWNlaXZlIGEg
c3B1cmlvdXMgY29ubmVjdGlvbiBldmVudCBhbmQKaXJxIHdoZW4gY29uZmlndXJhdGlvbiBjb21w
bGV0ZXMgb3Igd2hlbiB0aGUgYWx0IG1vZGUgaXMgbGF0ZXIgcmUtZW50ZXJlZD8KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MTMt
aHBkLWlycS1ldmVudHMtdjMtMC0wODY4NTcwMTdmMTZAb3NzLnF1YWxjb21tLmNvbT9wYXJ0PTEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
