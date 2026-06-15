Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE417CD98C5
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jun 2026 09:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjHQRX30Q8TghGkyupEEatOBTY686HRZP3igI883KLI=; b=M1GyJko+f4VKVE
	Odlhp6Q7fi//HBT+Hs046UYYhqN0gqac52ms2Q/o6ckwRN+V3ISGWDu2wgupm867KpNR/d4OTP870
	DGAMq+/xXZMXtWqsuA+4soez7hPQEm6afNfd/h3yVqoRmwX5yPrcEcVw+urnWRegjuJi3lUZijz8S
	LmFlAWiswXqzHylvwWA/jV8TXjz6kq/1rDuBfj/yxneqztwEF1RNroPoEBmBxY5B/TV2EpPJxhrI7
	h9vfQ10jJNsGUGT+YX0hRPmBnO437OrrycMi2Pr4M6Eyr6bXXbENWaLyjgWELxdwb+2kGf1kci2eK
	Cwxv55317zIUgTok0GKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3Ye-0000000Dxyr-0yAA;
	Mon, 15 Jun 2026 09:24:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3Yc-0000000Dxyj-3la2
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jun 2026 09:24:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D576060154;
	Mon, 15 Jun 2026 09:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671C31F000E9;
	Mon, 15 Jun 2026 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781515477;
	bh=0TUcVvQpEVXhLLql5qMpE0hm6UALvnl6qUvy4C4qs00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nRovPa1qqz08UA1UMhMswiq3r7unlLT4WoZPApldKVyG+dWlhmIgiSMwd5a7r3EpJ
	 TZmy1x8AdMaMCTKVvg2G6TqCaDJDlbyoOcxc1uoBaMrPPzwfz0S9T1Hhy3LVm2lZD9
	 OeVqXtAU8YEyvG9aXMq14Sfwrb0QYuoNUmpafJHxr9E7zwTL4TrbwTngXcc6cm9HSL
	 ENa7XTHl7sxYDq6JmTl4ZGdqnqZLFBsVtrS5NAyFPfwVZpYWWpgXW2mShXmiA4i1O4
	 WECierwGxzlwEtv1TbWzkjgFlTqeewM/hkmKN9fQ/FYq2+qdry1IuBKOxz8irde/P1
	 VMWifTztq5+6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] soc: amlogic: meson-clk-measure: remove debugfs tree
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260615091531.21964-1-pengpeng@iscas.ac.cn>
References: <20260615091531.21964-1-pengpeng@iscas.ac.cn>
Date: Mon, 15 Jun 2026 09:24:36 +0000
Message-Id: <20260615092437.671C31F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBFeHBvc2luZyB0aGUgYG1lYXN1cmVfc3VtbWFyeWAgZGVidWdmcyBmaWxlIGJlZm9y
ZSBpbml0aWFsaXppbmcgdGhlIGBwcml2YCBwb2ludGVycyBpbiB0aGUgYG1zcl90YWJsZWAgbGVh
ZHMgdG8gYSBwb3RlbnRpYWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgotLQoKY29tbWl0IGNm
NjZhZWJjYTYyOGRlYzkxMzkzMDI4YmM4NDMxMzBhMjFkYTY2YWQKQXV0aG9yOiBQZW5ncGVuZyBI
b3UgPHBlbmdwZW5nQGlzY2FzLmFjLmNuPgpTdWJqZWN0OiBzb2M6IGFtbG9naWM6IG1lc29uLWNs
ay1tZWFzdXJlOiByZW1vdmUgZGVidWdmcyB0cmVlCgpUaGlzIGNvbW1pdCBhZGRzIGEgcmVtb3Zl
IGNhbGxiYWNrIHRvIHRoZSBkcml2ZXIgdG8gcHJvcGVybHkgY2xlYW4gdXAgdGhlCmRlYnVnZnMg
dHJlZSBjcmVhdGVkIGR1cmluZyBwcm9iZS4gQnkgc3RvcmluZyB0aGUgZGVidWdmcyByb290IGFu
ZCByZW1vdmluZwppdCBvbiBkcml2ZXIgdW5iaW5kLCBpdCBwcmV2ZW50cyBsZWZ0b3ZlciBlbnRy
aWVzIGZyb20gcmVmZXJlbmNpbmcgZnJlZWQKcHJpdmF0ZSBkYXRhLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jIGIvZHJpdmVycy9zb2MvYW1s
b2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jCj4gaW5kZXggZDg2MmUzMGEyNDRlZC4uN2NhNDNiY2I2
MjJhMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJl
LmMKPiArKysgYi9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMKWyAuLi4g
XQo+IEBAIC05NTIsNiArOTU0LDcgQEAgc3RhdGljIGludCBtZXNvbl9tc3JfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCSAgICAgICBzaXplb2Yoc3RydWN0IG1zcl9yZWdf
b2Zmc2V0KSk7Cj4gIAo+ICAJcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcigibWVzb24tY2xrLW1z
ciIsIE5VTEwpOwo+ICsJcHJpdi0+ZGVidWdmc19yb290ID0gcm9vdDsKPiAgCWNsa3MgPSBkZWJ1
Z2ZzX2NyZWF0ZV9kaXIoImNsa3MiLCByb290KTsKPiAgCj4gIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxl
KCJtZWFzdXJlX3N1bW1hcnkiLCAwNDQ0LCByb290LAo+ICAJCQkgICAgcHJpdi0+ZGF0YS5tc3Jf
dGFibGUsICZjbGtfbXNyX3N1bW1hcnlfZm9wcyk7Cj4gIAo+ICAJZm9yIChpID0gMCA7IGkgPCBw
cml2LT5kYXRhLm1zcl9jb3VudCA7ICsraSkgewo+ICAJCWlmICghcHJpdi0+ZGF0YS5tc3JfdGFi
bGVbaV0ubmFtZSkKPiAgCQkJY29udGludWU7Cj4gIAo+ICAJCXByaXYtPmRhdGEubXNyX3RhYmxl
W2ldLnByaXYgPSBwcml2OwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5n
IGlzc3VlLCBidXQgZG9lcyBjcmVhdGluZyB0aGUgbWVhc3VyZV9zdW1tYXJ5IGRlYnVnZnMKZmls
ZSBoZXJlIGV4cG9zZSBpdCB0byB1c2Vyc3BhY2UgYmVmb3JlIHRoZSBwcml2IHBvaW50ZXJzIGlu
IG1zcl90YWJsZSBhcmUKaW5pdGlhbGl6ZWQ/CgpJZiBhIHVzZXItc3BhY2UgcHJvY2VzcyByZWFk
cyBtZWFzdXJlX3N1bW1hcnkgY29uY3VycmVudGx5IHdoaWxlIHRoZSBsb29wCmJlbG93IGlzIHN0
aWxsIGV4ZWN1dGluZywgY2xrX21zcl9zdW1tYXJ5X3Nob3coKSBjb3VsZCBkZXJlZmVyZW5jZSBh
IE5VTEwKcG9pbnRlciB2aWEgbXNyX3RhYmxlLT5wcml2OgoKY2xrX21zcl9zdW1tYXJ5X3Nob3co
KSB7CiAgICBzdHJ1Y3QgbWVzb25fbXNyX2lkICptc3JfdGFibGUgPSBzLT5wcml2YXRlOwogICAg
dW5zaWduZWQgaW50IG1zcl9jb3VudCA9IG1zcl90YWJsZS0+cHJpdi0+ZGF0YS5tc3JfY291bnQ7
CiAgICAuLi4KfQoKQ291bGQgdGhlIG1lYXN1cmVfc3VtbWFyeSBkZWJ1Z2ZzIGZpbGUgYmUgY3Jl
YXRlZCBhZnRlciB0aGUgcHJpdiBmaWVsZHMgYXJlCmZ1bGx5IGluaXRpYWxpemVkIGluIHRoZSBs
b29wIHRvIGF2b2lkIHRoaXMgcmFjZT8KCj4gIAkJZGVidWdmc19jcmVhdGVfZmlsZShwcml2LT5k
YXRhLm1zcl90YWJsZVtpXS5uYW1lLCAwNDQ0LCBjbGtzLAo+ICAJCQkJICAgICZwcml2LT5kYXRh
Lm1zcl90YWJsZVtpXSwgJmNsa19tc3JfZm9wcyk7Cj4gIAl9Cj4gIAo+ICsJcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgcHJpdik7Cj4gKwo+ICAJcmV0dXJuIDA7Cj4gIH0KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTUwOTE1
MzEuMjE5NjQtMS1wZW5ncGVuZ0Bpc2Nhcy5hYy5jbj9wYXJ0PTEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
