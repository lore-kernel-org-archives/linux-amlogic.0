Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B36C531FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2026 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtHSJxJ1bblqvHwaDKDMOdRmIPs6HNGjrhns4PiYRuY=; b=yGhWgdFzlFfkDs
	OKDjOJs/wBfc1iFUJFE1pCpqevGJ5Otux93Y5mp9OIH1s7PCJTrGclc6u75QoQ9UqaHMs4CjKAzjT
	LJY8/Odqtz8hAFEAmmCHv078eAZsv38mZ00Anzq/+r+0DXSUuMEfhZDY2lWtZdU7TaoCEf49BP1+S
	gHt4oWXlB4C6iaz2IfIMDur5csO+z5XvwZ6nMfrf34BkuMNVped0db6UaQReYUbBHh8H+lfwc2jc2
	UrD9L+Au2NI7Bz4RssBDZHNt70L9wkfhQ7yb04WxVjMueRoND4jpralTp8hPjgX7XFJy+Ta6UiPmx
	9uCddy+yDNLx8rF+QIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA96-0000000Ffq7-3Se1;
	Fri, 24 Jul 2026 07:16:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA95-0000000Ffpu-3SBZ
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Jul 2026 07:16:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F9E5600AA;
	Fri, 24 Jul 2026 07:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F30D1F00A3A;
	Fri, 24 Jul 2026 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877394;
	bh=6gAwAFLXES+/tcPY54PonDzfLnzSzsanD75SOyawZ68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n0Bd/aBNLQ3X32N+0DIO/m2ZPRarUqn/m2u4rvwSbkwgO6A4wm/gltlMa0/NiBvhl
	 9oANmTii7QhKEFuSEqB3hKGBj1VAugFVF9FO8zVUdKyH8ae6TiEvt+jbf3jW9WOVzh
	 dQOK27QrsOwcL+XV6MD95hk4I1buRTMi2MiU+WoLicO8v55apWMgDbqe9qordo9xzF
	 02hJ9woE9WR32LSD+d/7k05wsJdv68KS2QAHQeBtv8WdsyfYXlcw1QQDvoxc/xgSRk
	 lGetWowBffjGpglwPZm7cDX4xc/+qJHPUBSRaStLnmjYaoQrO/l/wtm0lLKQzboVZl
	 ktUGx9X008P7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-5-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-5-6072a7ee7428@amlogic.com>
Date: Fri, 24 Jul 2026 07:16:33 +0000
Message-Id: <20260724071634.5F30D1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVW5kb2N1bWVudGVk
IGFkZGl0aW9uIG9mIGFuIGBvcHRlZWAgbm9kZSBwbGFjZWQgYXQgdGhlIGluY29ycmVjdCBsZXZl
bCBpbiB0aGUgZGV2aWNldHJlZSBoaWVyYXJjaHkuCi0tCgotLS0gUGF0Y2ggWzVdOiBbUEFUQ0gg
djYgNS82XSBhcm02NDogZHRzOiBhbWxvZ2ljOiBBZGQgdmlkZW8gZGVjb2RlciBkcml2ZXIgc3Vw
cG9ydCBmb3IgUzQgU09DcyAtLS0KY29tbWl0IDYxM2IwYmJiMTc3MDM2MTA5MzRkYWE3NDY3Yjk0
MjQ3OGUxYmI5YzYKQXV0aG9yOiBaaGVudGFvIEd1byA8emhlbnRhby5ndW9AYW1sb2dpYy5jb20+
Cgphcm02NDogZHRzOiBhbWxvZ2ljOiBBZGQgdmlkZW8gZGVjb2RlciBkcml2ZXIgc3VwcG9ydCBm
b3IgUzQgU09DcwoKVGhpcyBjb21taXQgYWRkcyBhIHZkZWMgbm9kZSBhbmQgcmVsYXRlZCBjYW52
YXMgbm9kZSB0byBlbmFibGUgQW1sb2dpYwpWNEwyIHN0YXRlbGVzcyB2aWRlbyBkZWNvZGVyIHN1
cHBvcnQuIEl0IGFsc28gaW5jbHVkZXMgYW4gdW5kb2N1bWVudGVkCmFkZGl0aW9uIG9mIGFuIE9Q
LVRFRSBub2RlLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+
IGluZGV4IDJhNmZiZDUzMDgzNjIuLjA0ZmE1MmIzNTdhMjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+IEBAIC05Niw2ICs5NiwxMSBAQCBzYXJhZGM6
IGFkY0BmZTAyNjAwMCB7Cj4gIAkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCX07Cj4gIAo+ICsJ
b3B0ZWUgewo+ICsJCWNvbXBhdGlibGUgPSAibGluYXJvLG9wdGVlLXR6IjsKPiArCQltZXRob2Qg
PSAic21jIjsKPiArCX07Cj4gKwoKW1NldmVyaXR5OiBNZWRpdW1dCklzIHRoaXMgb3B0ZWUgbm9k
ZSBhZGRpdGlvbiBpbnRlbnRpb25hbCBpbiB0aGlzIHBhdGNoPyBUaGUgY29tbWl0IG1lc3NhZ2UK
b25seSBtZW50aW9ucyBhZGRpbmcgdGhlIHZkZWMgbm9kZSwgbWFraW5nIHRoaXMgYW4gdW5kb2N1
bWVudGVkIGNoYW5nZS4KCkFkZGl0aW9uYWxseSwgc3RhbmRhcmQgZGV2aWNldHJlZSBjb252ZW50
aW9ucyBhbmQgT1AtVEVFIGJpbmRpbmdzIGV4cGVjdAp0aGUgb3B0ZWUgbm9kZSB0byByZXNpZGUg
d2l0aGluIHRoZSAvZmlybXdhcmUgbm9kZS4gU2hvdWxkIHRoaXMgYmUgbW92ZWQKaW50byB0aGUg
ZXhpc3RpbmcgZmlybXdhcmUgbm9kZSByYXRoZXIgdGhhbiBiZWluZyBwbGFjZWQgYXQgdGhlIHJv
b3QgbGV2ZWw/Cgo+ICAJc29jIHsKPiAgCQljb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+ICAJ
CSNhZGRyZXNzLWNlbGxzID0gPDI+OwoKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyNC1iNC1zNC12ZGVjLXVwc3Ry
ZWFtLXY2LTAtNjA3MmE3ZWU3NDI4QGFtbG9naWMuY29tP3BhcnQ9NQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
