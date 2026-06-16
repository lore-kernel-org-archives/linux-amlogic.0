Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1981FCD98DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBLKeyIHQ01AcUSHK3ivqseEKC7IsQ5LcqTOsyK6x54=; b=qoPFn2dLvdidnm
	UGTX9P1akj+jXXlAi6t+AGlRvoD0H8u03V+iffrcXWrcfuP7AiCx3f4ZNzYEdh9rk+gBCNIFAXbo9
	eMwN8aElgmQMkNotw3W4YqGnSaom+efUZ7Okhr4HU9ZouSdAEUwijIuxMveIAXvfTS5ZWUUKQipX6
	5x7td8kFzaOeBp8DAkniH+SSvzhat3bk9CujZZcQAwFfQrMWgUuUwJFMl3yb5fRFHVzBw/v4WVXUy
	2FuN7FmQeLD55/+gOchcpTauIg/sW9oR73sv043LrCQDqQr6b+Q5na5aDmQ8/IgBWBBuiQ0aceCB+
	wZqbr2g4tNmPajCDhLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZO4h-0000000FN0a-0ZRt;
	Tue, 16 Jun 2026 07:19:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZO4g-0000000FN0L-0J1Z
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jun 2026 07:19:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8824F40242;
	Tue, 16 Jun 2026 07:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311411F00A3D;
	Tue, 16 Jun 2026 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781594345;
	bh=HrXKZBSa4XfWGRUZ7aaZverlmkzMxQjwm29CfJP2Rx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ou6CA3A0Qf8h60/PqJJQwVGpXQ0aLOPi8sIL4x5/Cj9t5frsw5+7CbLnb5lTuj4YC
	 wWe77Rp/zY/RoOybp+M/Lf5BzJtN9NoqRmG8WvBuXTrRnKHY+WghAc01XYyYblKcbf
	 jcCQk7/UBxJ/CGaM/GFRYmvKlTlvHev60yGcMF798h5yBGicQFw50V7iZE3Ow7Rn3M
	 M68jwl9Regkd6wcGGHlisg7cKhF6XDo11oX+7L0Lcruw+aGlDmeJOlkjqFTk8SsEAJ
	 FzdOYvOY/iSycHEGBDY11CKtW200UphSTWcDFbjgs/JI1iRKfewfjLCT/u/9XuuZLE
	 ZQgMEotAfC9bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] PCI: dwc: meson: Fix reset GPIO initial state
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: neil.armstrong@linaro.org, linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
References: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
Date: Tue, 16 Jun 2026 07:19:04 +0000
Message-Id: <20260616071905.311411F00A3D@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIC5yZW1vdmUgY2FsbGJhY2sgbGVhZHMgdG8gVXNlLUFmdGVyLUZyZWUg
YW5kIHJlc291cmNlIGxlYWsgb24gdW5iaW5kL21vZHVsZSB1bmxvYWQuCi0tCgpjb21taXQgNmYz
NGIzNzE5ODA5NDJlZTc2Y2E1MzgzODI1ZGQ4ZWNhZmYyY2JmYgpBdXRob3I6IFJvbmFsZCBDbGF2
ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKUENJOiBkd2M6IG1lc29uOiBGaXggcmVz
ZXQgR1BJTyBpbml0aWFsIHN0YXRlCgpUaGlzIGNvbW1pdCBjaGFuZ2VzIHRoZSBpbml0aWFsIHN0
YXRlIG9mIHRoZSByZXNldCBHUElPIGZyb20gR1BJT0RfT1VUX0xPVwp0byBHUElPRF9PVVRfSElH
SC4gVGhpcyBmaXhlcyB0aGUgcmVzZXQgYXNzZXJ0aW9uIGxvZ2ljIHRoYXQgd2FzIGludmVydGVk
CmJ5IGEgcHJldmlvdXMgY29tbWl0LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLW1lc29uLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVz
b24uYwo+IGluZGV4IDA2OTQwODRmNjEyYjcuLjE1ZWQ1OWI4NzY0ZmIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMKPiArKysgYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwo+IEBAIC00MDAsNyArNDAwLDcgQEAgc3RhdGlj
IGludCBtZXNvbl9wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJ
cmV0dXJuIFBUUl9FUlIobXAtPnBoeSk7Cj4gIAl9Cj4gIAo+IC0JbXAtPnJlc2V0X2dwaW8gPSBk
ZXZtX2dwaW9kX2dldChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9MT1cpOwo+ICsJbXAtPnJlc2V0
X2dwaW8gPSBkZXZtX2dwaW9kX2dldChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9ISUdIKTsKCltT
ZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhp
cyBkcml2ZXIgbGFjayBhIC5yZW1vdmUgY2FsbGJhY2sKdG8gY2xlYW4gdXAgdGhlIFBDSWUgaG9z
dD8KCkxvb2tpbmcgYXQgbWVzb25fcGNpZV9wcm9iZSgpLCBpdCBpbml0aWFsaXplcyB0aGUgRFdD
IFBDSWUgaG9zdCBhbmQKcmVnaXN0ZXJzIHRoZSBQQ0kgcm9vdCBidXM6Cgpkcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYzptZXNvbl9wY2llX3Byb2JlKCkgewogICAgLi4uCiAg
ICByZXQgPSBkd19wY2llX2hvc3RfaW5pdCgmcGNpLT5wcCk7CiAgICBpZiAocmV0IDwgMCkgewog
ICAgLi4uCn0KCkhvd2V2ZXIsIG1lc29uX3BjaWVfZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCBh
IC5yZW1vdmUgY2FsbGJhY2sgdG8gY2FsbApkd19wY2llX2hvc3RfZGVpbml0KCksIG5vciBkb2Vz
IGl0IHNldCAuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUuCgpXaGVuIHRoZSBkcml2ZXIgaXMg
dW5ib3VuZCB2aWEgc3lzZnMgb3IgdW5sb2FkZWQsIGRldnJlcyBhdXRvbWF0aWNhbGx5IGZyZWVz
CnRoZSBtZW1vcnkgZm9yIHN0cnVjdCBtZXNvbl9wY2llIChhbmQgaXRzIGVtYmVkZGVkIHN0cnVj
dCBkd19wY2llKSBhbmQKZGlzYWJsZXMgY2xvY2tzIGFuZCByZXNldHMuCgpCZWNhdXNlIGR3X3Bj
aWVfaG9zdF9kZWluaXQoKSBpcyBuZXZlciBjYWxsZWQsIHRoZSBQQ0llIHJvb3QgYnVzIGFuZCBp
dHMgY2hpbGQKZGV2aWNlcyBhcHBlYXIgdG8gcmVtYWluIHJlZ2lzdGVyZWQgaW4gdGhlIFBDSSBj
b3JlLgoKQ291bGQgdGhpcyBsZWFkIHRvIGEgdXNlLWFmdGVyLWZyZWUgYW5kIHBhbmljIGlmIHN1
YnNlcXVlbnQgaW50ZXJhY3Rpb25zCndpdGggdGhlc2UgbGVha2VkIFBDSSBkZXZpY2VzIG9jY3Vy
IChmb3IgZXhhbXBsZSwgdmlhIHN5c2ZzIG9yIGxzcGNpKSBhZnRlcgp0aGUgbWVtb3J5IGhhcyBi
ZWVuIGZyZWVkPwoKPiAgCWlmIChJU19FUlIobXAtPnJlc2V0X2dwaW8pKSB7Cj4gIAkJZGV2X2Vy
cihkZXYsICJnZXQgcmVzZXQgZ3BpbyBmYWlsZWRcbiIpOwo+ICAJCXJldHVybiBQVFJfRVJSKG1w
LT5yZXNldF9ncGlvKTsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTYtZml4LW1lc29uLXBjaWUtcmVzZXQtZ3Bpby12MS0xLWZj
YTQwNGI0YzhiZUBhbGllbC5mcj9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
