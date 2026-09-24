Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F158C9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0EI+36OFe+2FsG3vLKRT+PBG1WTQgME+UEZHrJPEBg=; b=i/YSH8HvJStCpQ
	jkTLtsPcRUX3TpZycUJV83EGpVKvr4IJHA/R1OzXJ5s2kQyDriW0CpsWT5m56KAkecROfSTAy5kTl
	YEjtl4sYwUV/Lbt35KmLOJiZfODKPNs8PTnZYMJDPI5NYYV7A/PSdY1JKhcYjvMxR8nqWdrT+Osii
	ktuukAWjiNZiKtqaK811Fu8qtNfHYUE1WmWPl9htahQPc5dm3Kt72OfDuT3p0mhDW+b1vtd+gCkgT
	tK+U9XTnNHJrgJi6l816XcpyoAAfQLxjdmhuYxP1aZvSfyOnDA6KXV2ae3QBGTNuXl1aMkKP6kA7v
	xJoYq5jzf6QPalIJSGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hNs-0000000ApRo-22Wm;
	Thu, 24 Sep 2026 11:13:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hNr-0000000ApRE-2zqL
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 11:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 283DA41FA0;
	Thu, 24 Sep 2026 11:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01F51F0089E;
	Thu, 24 Sep 2026 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790248379;
	bh=ftd3hjBZuJv2XcWtPiilr9WqzBFHF0QyClM2VQUAkOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g1SwadAkvLavBCPEa7GvHMwSD2msghhT5d3tEJzSW58KcFWnwqu8z1RqBMj0BvZ7T
	 4lGm1vVFDM2xmKqDoWm3heYg66coeq4egFv7Dk/x0UK7krGrSEmZWuZ1dRK4LsRaPs
	 qlSupe6sgJ3H3Tq9JpZEnohIvUoyKqbhqa2xaymLQJZ1HGeUuK1Xza4Y60c9fJraof
	 RPJaOgW8AZWtpx0d8Yw7WAlkM5FSPB8OpxmvjJcjR6VMkeBZl8EZQx3+vJxwatOscr
	 TNJEvbusSL0O6l8acuqlZ7WKXrruVoJq7HlnoYPkGPT313MBDIYHlIWDlai0Ra0k8r
	 MfSxXSqnpkOZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260924110429.1557653-1-lgs201920130244@gmail.com>
References: <20260924110429.1557653-1-lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 11:12:58 +0000
Message-Id: <20260924111258.D01F51F0089E@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHVzYjogZHdjMzogdW5i
YWxhbmNlZCByZWd1bGF0b3IgZGlzYWJsZSBpbiByZW1vdmUgcGF0aAotLQoKY29tbWl0IGQ3MGEx
ZGJjNDA1ODMyOGRjMTNiNDlmZWFiNmExODE2MmI3Mjg1NzAKQXV0aG9yOiBHdWFuZ3NodW8gTGkg
PGxnczIwMTkyMDEzMDI0NEBnbWFpbC5jb20+Cgp1c2I6IGR3YzM6IG1lc29uLWcxMmE6IGRpc2Fi
bGUgVkJVUyByZWd1bGF0b3Igb24gcmVtb3ZlCgpUaGlzIGNvbW1pdCBkaXNhYmxlcyBwcml2LT52
YnVzIGluIHRoZSByZW1vdmUgcGF0aCBiZWZvcmUgcmVhcm1pbmcgdGhlIHJlc2V0CmNvbnRyb2wg
dG8gbWF0Y2ggdGhlIGNsZWFudXAgcGVyZm9ybWVkIGJ5IHRoZSBwcm9iZSBlcnJvciBwYXRoLgoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW1lc29uLWcxMmEuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMKPiBpbmRleCA0ZDYxMWMwOGU4YTRjLi43Y2E2
ZmI4OTAyN2Y2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJh
LmMKPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jCj4gQEAgLTg1MSw2
ICs4NTEsOSBAQCBzdGF0aWMgdm9pZCBkd2MzX21lc29uX2cxMmFfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlwbV9ydW50aW1lX3B1dF9ub2lkbGUoZGV2KTsKPiAgCXBt
X3J1bnRpbWVfc2V0X3N1c3BlbmRlZChkZXYpOwo+ICAKPiArCWlmIChwcml2LT52YnVzKQo+ICsJ
CXJlZ3VsYXRvcl9kaXNhYmxlKHByaXYtPnZidXMpOwoKW1NldmVyaXR5OiBIaWdoXQpDb3VsZCB0
aGlzIGxlYWQgdG8gYW4gdW5iYWxhbmNlZCByZWd1bGF0b3IgZGlzYWJsZSBpZiB0aGUgZGV2aWNl
IGlzIGN1cnJlbnRseQppbiBkZXZpY2UgbW9kZT8KCklmIHRoZSBkZXZpY2UgaXMgb3BlcmF0aW5n
IGluIE9URyBtb2RlIGFuZCB0cmFuc2l0aW9ucyB0byBQSFlfTU9ERV9VU0JfREVWSUNFLApkd2Mz
X21lc29uX2cxMmFfb3RnX21vZGVfc2V0KCkgYWxyZWFkeSBhY3RpdmVseSBkaXNhYmxlcyB0aGUg
cmVndWxhdG9yOgoKZHdjM19tZXNvbl9nMTJhX290Z19tb2RlX3NldCgpIHsKICAgIC4uLgogICAg
aWYgKG1vZGUgPT0gUEhZX01PREVfVVNCX0RFVklDRSkKICAgICAgICByZXQgPSByZWd1bGF0b3Jf
ZGlzYWJsZShwcml2LT52YnVzKTsKICAgIC4uLgp9CgpJZiBkd2MzX21lc29uX2cxMmFfcmVtb3Zl
KCkgaXMgY2FsbGVkIHdoaWxlIHRoZSBkZXZpY2UgaXMgc3RpbGwgaW4gZGV2aWNlIG1vZGUsCndv
dWxkbid0IHRoaXMgdW5jb25kaXRpb25hbCByZWd1bGF0b3JfZGlzYWJsZSgpIGRyb3AgdGhlIGVu
YWJsZSBjb3VudCBiZWxvdwp6ZXJvPwoKPiArCj4gIAlyZXNldF9jb250cm9sX3JlYXJtKHByaXYt
PnJlc2V0KTsKPiAgCj4gIAljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5kcnZkYXRh
LT5udW1fY2xrcywKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA5MjQxMTA0MjkuMTU1NzY1My0xLWxnczIwMTkyMDEzMDI0NEBnbWFp
bC5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
