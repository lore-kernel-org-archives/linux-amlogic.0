Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF491CD4F39
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2026 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEXb0cvOQghWTgNnBjRo/STWV7pcqM/X1m3fV9TAxMg=; b=EmCqrsJ7WBWZwS
	v5PjyXvhNAq1YHnklG+LjGF/1kiOgvTY/emoTna8EGkdokieTHFaQD2s2338Qp3dMcccGOa0KKPOV
	WulLik0ch4PI68ANbd525Ilf10I4yADRZzjyZJeqzoiNPR/cKvcDi81IxGGN+MJ5gKrmyGyG9pjV9
	3rSaZ1iV4HphqSE2bshD1U4DpBBGMUX7e+96kYmpnBoa4fU/csxn1EapIvWkr00OjJb5jeDW9lQW4
	DCxLAwI5m62ZQFfb0fEjJUtdSirC0rrjSRNtnjxFIjERcEB5jub/u85diZ/ZHaAE138Il3E5gqH+L
	5FCNgt3UNA6aLaWtUE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUpH-00000005PdI-2pt7;
	Thu, 14 May 2026 12:06:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUpG-00000005Pd9-1zt7
	for linux-amlogic@lists.infradead.org;
	Thu, 14 May 2026 12:06:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3B4460008;
	Thu, 14 May 2026 12:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54231C2BCB3;
	Thu, 14 May 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760361;
	bh=mHwpC34GSg4nq7ejyvMuZ7YkuybEAvPacy18lbrY2Is=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RJ8wiMYVzMD8f1BbwIkHlJhlUVt23JRp59WRcFsxHEnLNvIqqE9WKkLtWse0MZnjr
	 J5Psgvze0ELu/Q/pe+5qR+0AwxTdMYHdCkoFuZ6+fSjb3SmIX0Al7GqpSevXYtO6x4
	 r3FjEcigEvshN7RFg1XtAyoi6VN+uNbn1GqVKDAoGnXnVeL1r3FnlU8FFwcF+KQM/0
	 ags8QJhqbFdU65AlN6p13uHj1X4gf2Rp+KmLvdHDrpzhjWVlW7EUVYK/+mViU8ASG0
	 7fpyd9I3M27qFVTrqnq1pVNqgFV66H8RddLDNEdCYmbZ8taxaXguLakZQBSRbrztgF
	 Q2jw7A6aTcbMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 4/6] drm/msm: dp: handle the IRQ_HPD events
 reported by USB-C
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260513-hpd-irq-events-v3-4-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-4-086857017f16@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:06:00 +0000
Message-Id: <20260514120601.54231C2BCB3@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVuYm91bmRlZCBlbnF1
ZXVlaW5nIG9mIEVWX0lSUV9IUERfSU5UIGV2ZW50cyBjYW4gZXhoYXVzdCB0aGUgc21hbGwgZXZl
bnQgcXVldWUsIGNhdXNpbmcgY3JpdGljYWwgaG90cGx1ZyBldmVudHMgdG8gYmUgZHJvcHBlZCBh
bmQgZGVhZGxvY2tpbmcgdGhlIERQIGRyaXZlci4KLS0KCmNvbW1pdCAwM2QwNTE0NGE0Y2Q1N2Nm
YzBjNmE4ODM3N2VlNzY0ZjQyMjRlMmI0CkF1dGhvcjogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5
LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgoKZHJtL21zbTogZHA6IGhhbmRsZSB0aGUgSVJR
X0hQRCBldmVudHMgcmVwb3J0ZWQgYnkgVVNCLUMKCkxldCB0aGUgTVNNIERpc3BsYXlQb3J0IGRy
aXZlciBwcm9wZXJseSB0cmFjayBhbmQgaGFuZGxlIElSUV9IUEQKZGVsaXZlcmVkIG92ZXIgdGhl
IE9PQiBldmVudHMgKGUuZy4gZnJvbSB0aGUgVVNCLUMgQWx0TW9kZSBoYW5kbGVyKS4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rw
L2RwX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5j
Cj4gQEAgLTE4MDAsNCArMTgwMCw3IEBAIHZvaWQgbXNtX2RwX2JyaWRnZV9ocGRfbm90aWZ5KHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIAkJbXNtX2RwX2FkZF9ldmVudChkcCwgRVZfSFBE
X1BMVUdfSU5ULCAwLCAwKTsKPiAgCWVsc2UgaWYgKG1zbV9kcF9kaXNwbGF5LT5saW5rX3JlYWR5
ICYmIHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZCkKPiAgCQltc21fZHBf
YWRkX2V2ZW50KGRwLCBFVl9IUERfVU5QTFVHX0lOVCwgMCwgMCk7Cj4gKwo+ICsJaWYgKGV4dHJh
X3N0YXR1cyA9PSBEUk1fQ09OTkVDVE9SX0RQX0lSUV9IUEQpCj4gKwkJbXNtX2RwX2FkZF9ldmVu
dChkcCwgRVZfSVJRX0hQRF9JTlQsIDAsIDApOwoKQ291bGQgdGhpcyB1bmJvdW5kZWQgZW5xdWV1
ZWluZyBvZiBFVl9JUlFfSFBEX0lOVCBldmVudHMgZXhoYXVzdCB0aGUgZXZlbnQKcXVldWU/CgpU
aGUgTVNNIERQIGRyaXZlcidzIGV2ZW50IHF1ZXVlIGhhcyBhIGZpeGVkIGNhcGFjaXR5IG9mIDcg
aXRlbXMsIGFzCkRQX0VWRU5UX1FfTUFYIGlzIDguIEFkZGluZyBFVl9JUlFfSFBEX0lOVCBldmVu
dHMgZGlyZWN0bHkgZnJvbSBvdXQtb2YtYmFuZAptZXNzYWdlcyB3aXRob3V0IGRlZHVwbGljYXRp
b24gY291bGQgZmlsbCB0aGUgcXVldWUgaWYgbXVsdGlwbGUgZXZlbnRzIGFycml2ZQpxdWlja2x5
LgoKSWYgdGhlIGRpc3BsYXkgc3RhdGUgaXMgU1RfTUFJTkxJTktfUkVBRFkgb3IgU1RfRElTQ09O
TkVDVF9QRU5ESU5HLAptc21fZHBfaXJxX2hwZF9oYW5kbGUoKSBkZWZlcnMgdGhlIGV2ZW50IGJ5
IHJlLWFkZGluZyBpdCB0byB0aGUgcXVldWUgd2l0aApkZWxheSA9IDEuCgpUaGUgaHBkX2V2ZW50
X3RocmVhZCBoYW5kbGVzIGRlbGF5ID0gMSBldmVudHMgYnkgY29udmVydGluZyB0aGVtIHRvIGRl
bGF5ID0gMCwKcGxhY2luZyB0aGVtIGJhY2sgaW4gdGhlIHF1ZXVlLCBhbmQgc2xlZXBpbmcgZm9y
IDEwMG1zIGJlZm9yZSBjYWxsaW5nCm1zbV9kcF9pcnFfaHBkX2hhbmRsZSgpIGFnYWluLiBUaGlz
IGNhdXNlcyB0aGUgZXZlbnQgdG8gY3ljbGUgZW5kbGVzc2x5LApwZXJwZXR1YWxseSBvY2N1cHlp
bmcgYSBzbG90LgoKSWYgYSBzaW5rIHNlbmRzIDcgcmFwaWQgSVJRX0hQRCBzaWduYWxzIHdoaWxl
IHRoZSBkcml2ZXIgaXMgcGFya2VkIGluClNUX01BSU5MSU5LX1JFQURZLCB0aGUgcXVldWUgbWln
aHQgYmVjb21lIGVudGlyZWx5IGZ1bGwgd2l0aCA3IGN5Y2xpbmcsCnVuY29uc3VtZWQgZXZlbnRz
LgoKSWYgdGhlIHF1ZXVlIGlzIGZ1bGwsIHdvdWxkIGNyaXRpY2FsIGV2ZW50cyBsaWtlIEVWX0hQ
RF9VTlBMVUdfSU5UIGJlIGxvc3QKc2luY2UgbXNtX2RwX2FkZF9ldmVudCgpIHJldHVybnMgLUVQ
RVJNPyBMb3NpbmcgdGhlIHVucGx1ZyBldmVudCBjb3VsZCB0cmFwCnRoZSBEUk0gZnJhbWV3b3Jr
IGluIGEgY29ubmVjdGVkIHN0YXRlIGRlc3BpdGUgcGh5c2ljYWwgZGlzY29ubmVjdGlvbi4KCi0t
IApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA1MTMtaHBkLWlycS1ldmVudHMtdjMtMC0wODY4NTcwMTdmMTZAb3NzLnF1YWxjb21tLmNvbT9w
YXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
