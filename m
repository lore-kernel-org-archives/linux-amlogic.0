Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5105CD4851
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRCYuB5tHA1R9p0CUY0U1PqI4+iAvniglbOEKtqFLF0=; b=iBw29BVCOcDoI+
	gSTU+SrFakJyT+hkU98HnAk5vn06934efwM6S9kWv4prQuHDYevzLseCua7eFJW1BgtAqi2NtebKl
	dc/NPXxsx5Y+/bfwlhfAmQ13JQevTnJOQ28XCLiKiaX3UWNHYhYfKA8OPIe7cew0GFcokarCalo3I
	c71AiccP8wkNwiNLnUxu8uU4mPGAKFYMaKquzC8Bso7s3KReTo10uG3DR74YTMcvaKWgic8g2u/dm
	p4lWtGF8SE8hrD9FuGG0I+2y3KX4uzB5nPZIKdNU4PgUK3SStmbPpTs1IPdAi/925n3P0NdqeEsz8
	lqFc6P/ZLNXNUFWDxWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKud-0000000BOhc-3G4M;
	Sat, 16 May 2026 19:43:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKuc-0000000BOhM-068Z
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09B656020F;
	Sat, 16 May 2026 19:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7F1C19425;
	Sat, 16 May 2026 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778960579;
	bh=u0edW2Gtyv5jHanYCumq/xDuYjuv8sL0Fo7LOdxkaSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fjtIbveDWdqFG4/4M+roeqe27fdlkZUJhILLLrYZwH+k3VB4uAEzSV/DyRumTcXy5
	 YdNbdAiynlw9PflSfRMcfP1J6s0649MNwxqlcKoccApKH8sxebyZlLHIvQ3MLlt+ME
	 HTbHM1v5QzHGy93PCNK98ln5I4OPE6vkOga71qAtGBvwG/LfhdCEH+N86QWGjVHnXA
	 QiAsL20M79aXBDUQKLOMdrhtfX3xRki7qfJG/1OF6iQL4WHyYORXFqOE1i9zkRqg7C
	 AEJ0u5pnWiXLGI9EFsPmDIInylSTqHMWWKSshc5Bwpt/dqAgMj8VFdS7BNrEBvIFbz
	 zbX6pi52JKZQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 18/22] drm: bridge: dw_hdmi: Use delayed_work to
 debounce hotplug event
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org
In-Reply-To: <20260516183838.2024991-19-jonas@kwiboo.se>
References: <20260516183838.2024991-19-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:42:59 +0000
Message-Id: <20260516194259.6D7F1C19425@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlbW92aW5nIHRoZSB0
b3AtbGV2ZWwgaW50ZXJydXB0IG11dGUgaW4gdGhlIHJlbW92ZSBwYXRoIGxlYXZlcyBhbHJlYWR5
LWxhdGNoZWQgaW50ZXJydXB0cyB1bm1hc2tlZCwgY2F1c2luZyBhbiB1bmhhbmRsZWQgaW50ZXJy
dXB0IHN0b3JtIGFmdGVyIHRoZSBJUlEgaXMgZnJlZWQuCi0tCgpjb21taXQgMDAyNTE1NmE0Nzhl
MjY1ZDJlYTYyNWIzNGI5MDRiODY0NWQ4MGJlZApBdXRob3I6IEpvbmFzIEthcmxtYW4gPGpvbmFz
QGt3aWJvby5zZT4KZHJtOiBicmlkZ2U6IGR3X2hkbWk6IFVzZSBkZWxheWVkX3dvcmsgdG8gZGVi
b3VuY2UgaG90cGx1ZyBldmVudAoKVGhpcyBjb21taXQgdXNlcyBhIGRlbGF5ZWQgd29yayBxdWV1
ZSB0byBkZWJvdW5jZSBIRE1JIGhvdHBsdWcgZGV0ZWN0IGV2ZW50cywKaW1wcm92aW5nIHRoZSBo
YW5kbGluZyBvZiBIUEQgbG93IHZvbHRhZ2UgbGV2ZWwgcHVsc2VzLiBJdCBhbHNvIHVwZGF0ZXMK
dGhlIGRyaXZlciByZW1vdmUgcGF0aCB0byBleHBsaWNpdGx5IG1hc2sgdGhlIFBIWSBpbnRlcnJ1
cHQgYW5kIGZyZWUgdGhlCklSUSBoYW5kbGVyIGVhcmxpZXIgZHVyaW5nIGNsZWFudXAuCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwoKWyAuLi4gXQoKPiBAQCAtMzUzMSw2ICszNTkyLDE0
IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGR3X2hkbWlfcHJvYmUpOwo+ICAKPiAgdm9pZCBkd19oZG1p
X3JlbW92ZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiAgewo+ICsJc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShoZG1pLT5kZXYpOwo+ICsJaW50IGlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gKwo+ICsJLyogRGlzYWJsZSBjYWJsZSBob3Qg
cGx1ZyBpcnEuICovCj4gKwloZG1pX3dyaXRlYihoZG1pLCB+MCwgSERNSV9QSFlfTUFTSzApOwo+
ICsJZGV2bV9mcmVlX2lycShoZG1pLT5kZXYsIGlycSwgaGRtaSk7Cj4gKwljYW5jZWxfZGVsYXll
ZF93b3JrX3N5bmMoJmhkbWktPmhwZF93b3JrKTsKPiArCj4gIAlkcm1fYnJpZGdlX3JlbW92ZSgm
aGRtaS0+YnJpZGdlKTsKPiAgCj4gIAlpZiAoaGRtaS0+YXVkaW8gJiYgIUlTX0VSUihoZG1pLT5h
dWRpbykpCj4gQEAgLTM1MzgsOSArMzYwNyw2IEBAIHZvaWQgZHdfaGRtaV9yZW1vdmUoc3RydWN0
IGR3X2hkbWkgKmhkbWkpCj4gIAlpZiAoIUlTX0VSUihoZG1pLT5jZWMpKQo+ICAJCXBsYXRmb3Jt
X2RldmljZV91bnJlZ2lzdGVyKGhkbWktPmNlYyk7Cj4gIAo+IC0JLyogRGlzYWJsZSBhbGwgaW50
ZXJydXB0cyAqLwo+IC0JaGRtaV93cml0ZWIoaGRtaSwgfjAsIEhETUlfSUhfTVVURV9QSFlfU1RB
VDApOwo+IC0KCkNhbiByZW1vdmluZyB0aGUgdG9wLWxldmVsIGludGVycnVwdCBtdXRlIGNhdXNl
IGFuIHVuaGFuZGxlZCBpbnRlcnJ1cHQgc3Rvcm0/CgpXaGlsZSB3cml0aW5nIHRvIEhETUlfUEhZ
X01BU0swIHN0b3BzIHRoZSBQSFkgZnJvbSBsYXRjaGluZyBuZXcgaW50ZXJydXB0cywKaXQgZG9l
cyBub3QgY2xlYXIgaW50ZXJydXB0cyB0aGF0IGFyZSBhbHJlYWR5IGxhdGNoZWQgaW4gdGhlCkhE
TUlfSUhfUEhZX1NUQVQwIHJlZ2lzdGVyLiBCZWNhdXNlIHRoZSB0b3AtbGV2ZWwgSERNSV9JSF9N
VVRFX1BIWV9TVEFUMAptdXRlIGlzIG5vIGxvbmdlciBhcHBsaWVkLCBhbnkgcHJldmlvdXNseSBs
YXRjaGVkIGludGVycnVwdCBtaWdodCBjb250aW51ZQp0byBhc3NlcnQgdGhlIHBoeXNpY2FsIElS
USBsaW5lLgoKSW1tZWRpYXRlbHkgYWZ0ZXIgd3JpdGluZyB0aGUgbWFzayBlYXJsaWVyIGluIHRo
ZSBmdW5jdGlvbiwgZGV2bV9mcmVlX2lycSgpCnJlbW92ZXMgdGhlIGRyaXZlcidzIGhhbmRsZXIg
ZnJvbSB0aGUgSVJRRl9TSEFSRUQgbGluZS4gV2l0aCB0aGUgaGFuZGxlcgpyZW1vdmVkLCB0aGUg
a2VybmVsIHdpbGwgbm90IGludm9rZSBkd19oZG1pX2hhcmRpcnEoKSB0byBjbGVhciB0aGUgZGV2
aWNlJ3MKcGVuZGluZyBpbnRlcnJ1cHQuCgpTaW5jZSB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIg
bWlnaHQgc2VlIHRoZSBsaW5lIGNvbnRpbnVvdXNseSBhc3NlcnRlZCwKb3RoZXIgZHJpdmVycyBz
aGFyaW5nIHRoZSBJUlEgd291bGQgcmV0dXJuIElSUV9OT05FLiBDb3VsZCB0aGlzIGxlYWQgdG8g
dGhlCmtlcm5lbCBsb2dnaW5nIGFuICdpcnEgbm9ib2R5IGNhcmVkJyBlcnJvciBhbmQgcGVybWFu
ZW50bHkgZGlzYWJsaW5nIHRoZQpzaGFyZWQgSVJRIGxpbmUsIGJyZWFraW5nIG90aGVyIGRldmlj
ZXM/CgpXb3VsZCBpdCBiZSBzYWZlciB0byByZXN0b3JlIHRoZSBIRE1JX0lIX01VVEVfUEhZX1NU
QVQwIHdyaXRlIHRvIGd1YXJhbnRlZQp0aGUgSVJRIGxpbmUgZHJvcHMgYmVmb3JlIHRoZSBoYW5k
bGVyIGlzIGZyZWVkPwoKPiAgCWlmIChoZG1pLT5pMmMpCj4gIAkJaTJjX2RlbF9hZGFwdGVyKCZo
ZG1pLT5pMmMtPmFkYXApOwo+ICAJZWxzZQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxNjE4MzgzOC4yMDI0OTkxLTEtam9uYXNA
a3dpYm9vLnNlP3BhcnQ9MTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
