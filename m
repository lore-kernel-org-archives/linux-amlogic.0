Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89274CA5FED
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2026 04:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D38o0Qv6bx8RviJQxjSNtPYd/OgoG0AqzXAhJaeE2wU=; b=Q7MrwFL5Bmzwiw
	UNcGBsuO0jh4H6TId915k2do1jft41u07lQP1sKZ4ewDTzw0wFbbDg96NQsfHVMBmPXBl/80LPZ5+
	A/+inCUQne1aV8/Y/0G5S37h/2UefphW6ELsRzco/d2qyMiCJ3HvCHEw/Iq3wdpLj9I3F7tWLOmr8
	+KpZWEuphDYdrtP8aATSaDZF0h0CHWdqDpO4jqEQFvYV+PVRxxhdIDgfur9xRmokC2eC1gxTqfSAa
	EK7R6dHQTBiV1PQSYO75vPtUfrV/9VPkSNinOaotYAdms6OsglkMZXl+qI0Eo/Dehk4BNnBRRtcXZ
	ztQZf3xxpPH7xt4vCJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwcS-000000000UF-28Hc;
	Tue, 06 Oct 2026 04:17:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwcQ-000000000U9-2uQ5
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Oct 2026 04:17:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EB0844057;
	Tue,  6 Oct 2026 04:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4081F000FF;
	Tue,  6 Oct 2026 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791260253;
	bh=Wa7TJlUO24vY7LXy+sZzppiO9CgVtOyMPLitAlGGnSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fUSfwTQ7akVKqLW2TgVzO4FdyGFq/3q+tTouO8vt0acjDgdegA6wFz9KqCh5swhGW
	 hhjRV7L6Jm97g40P7AEzSZo8UX/mhxP6CUDXeWMET/zt3TYNkhwAy8q8UrErvcdsi5
	 7UmgpgQYYvxEThgaiWvJEC3Mw/NtwASMbCqDxr/v8jF3Mz6kEcdGreieFMLqRnhbDP
	 K9OMXQGfxtv5t2eMqksQ0iokr5ttVT6UzC11prYhgvsJ1dNOjadxF6YznAeWUMLkyv
	 sv84S6Mbtml54P1janK5rih20XAQFCGkDP3mHghLvtf3YVEs4G3BNSlp0HYHjJuA7y
	 IXDrghg2ZAtHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
References: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
Date: Tue, 06 Oct 2026 04:17:33 +0000
Message-Id: <20261006041733.8C4081F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gYXJtNjQ6IGR0czog
YW1sb2dpYzogbWlzc2luZyBwaW5jdHJsIGZvciBmYW4gdGFjaG9tZXRlciBpbnRlcnJ1cHQKLS0K
CmNvbW1pdCBhNmE5N2RiMjFkZjkzYWMwOWMyMTU0MzEwMDQwODAyMjc4ZGJiNDk1CkF1dGhvcjog
SWdvciBWZWxrb3YgPGlhdkBpYXYubHY+Cgphcm02NDogZHRzOiBhbWxvZ2ljOiBtZXNvbi1zbTEt
b2Ryb2lkLWhjNDogYWRkIHRoZSBmYW4gdGFjaG9tZXRlcgoKVGhpcyBjb21taXQgYWRkcyB0aGUg
aW50ZXJydXB0IGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBmYW4gdGFjaG9tZXRlciB0byB0aGUKcHdt
LWZhbiBub2RlIG9uIHRoZSBPRFJPSUQtSEM0LCBtYXBwaW5nIGl0IHRvIEdQSU9YXzcuCgo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLW9kcm9pZC1o
YzQuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1vZHJvaWQtaGM0
LmR0cwo+IGluZGV4IDVmMTVjMjI5OTUwOWIuLjI2MWE0MjU2MGE1ZTkgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1vZHJvaWQtaGM0LmR0cwo+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEtb2Ryb2lkLWhjNC5kdHMK
PiBAQCAtMjEsNiArMjEsOCBAQCBmYW4wOiBwd20tZmFuIHsKPiAgCQkjY29vbGluZy1jZWxscyA9
IDwyPjsKPiAgCQljb29saW5nLWxldmVscyA9IDwwIDEyMCAxNzAgMjIwPjsKPiAgCQlwd21zID0g
PCZwd21fY2QgMSA0MDAwMCAwPjsKPiArCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvX2ludGM+
Owo+ICsJCWludGVycnVwdHMgPSA8SVJRSURfR1BJT1hfNyBJUlFfVFlQRV9FREdFX0ZBTExJTkc+
OwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgdGhpcyBjb25maWd1cmF0aW9uIGxlYXZlIHRoZSBo
YXJkd2FyZSBwaW4gZGlyZWN0aW9uIGVudGlyZWx5IGRlcGVuZGVudCBvbgp0aGUgcHJlLWtlcm5l
bCBib290bG9hZGVyIHN0YXRlPwoKVGhlIHB3bS1mYW4gZHJpdmVyIHJlcXVlc3RzIHRoZSBJUlEg
dmlhIGRldm1fcmVxdWVzdF9pcnEoKSwgYW5kIHRoZQptZXNvbi1ncGlvLWludGMgaW50ZXJydXB0
IGNvbnRyb2xsZXIgZG9lcyBub3QgaW1wbGVtZW50IC5pcnFfcmVxdWVzdF9yZXNvdXJjZXMKdG8g
YXV0b21hdGljYWxseSBtdXggdGhlIHBpbiB0byBHUElPIG1vZGUuCgpXaXRob3V0IGFuIGV4cGxp
Y2l0IHBpbmN0cmwtMCBwcm9wZXJ0eSBpbiB0aGUgZmFuMCBub2RlLCB3aWxsIHRoZSBmYW4KdGFj
aG9tZXRlciBzaWxlbnRseSBmYWlsIHRvIHJlYWQgdGhlIGZhbiBzcGVlZCAoYWx3YXlzIHJlcG9y
dGluZyAwKSBvbiBzeXN0ZW1zCndoZXJlIHRoZSBib290bG9hZGVyIGxlYXZlcyBHUElPWF83IGNv
bmZpZ3VyZWQgYXMgYW4gYWx0ZXJuYXRlIGZ1bmN0aW9uIChzdWNoCmFzIHVhcnRfYl9yeCBvciBw
d21fZl94KSBpbnN0ZWFkIG9mIGEgR1BJTyBpbnB1dD8KCj4gIAl9Owo+ICAKPiAgCWxlZHMgewoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MTAwNi1oYzQtZmFuLXRhY2gtdjEtMS00ZTdjZWNmMGI0NWJAaWF2Lmx2P3BhcnQ9MQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
