Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B4CC61DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMpO+ropsrIeFI5aG4qaf2NCV0z2o/elqVJFmbSztR4=; b=Ocn68lbPk5P/uf
	1sNdRpN+Cb03bis+E+M8gMqD9+LJ1GanwiseRwCJaxfl4FZeZNEJ8wFN3HO0n3FsM2bE6aYSbArS4
	qI3s5K/COe10Wj2ndpc8HpOwx8IGY5eOFrLlTRgNYq3L02YH7kxDJRXMVPX3a5qqlLAN2M8jCiW7E
	cbNNCoKsYJBydSRAHN4f4ttjiwJO0rIgEEHcoRkyoXPAZE/syVxVTKFT1C38bXBS/Tj8U1WiVOber
	/oydlEmjc+vDVrV0BS90ZFziS78eN4bUTLICM5VUOwkmxjxCQQtbMtEDdjZ9AJfAcl/oisb8NI7rK
	/zq/6AATBEJvCq2W2+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xqr-00000008xpF-2ZLu;
	Mon, 31 Aug 2026 08:58:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xqq-00000008xp3-3kO3
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 08:58:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A512B41776;
	Mon, 31 Aug 2026 08:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FC51F000E9;
	Mon, 31 Aug 2026 08:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166728;
	bh=euwWm0YtT9El1dw8+Zh2LaSdk0rBvB862z9nvBMbyTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ViCaYuwNC/Vu5yh9TLCL2+bVlME9osXcTAyn9FaNa9sFCtwgs74vKvSnaRmg83Kol
	 SQOcgSuvOn6aDTzbK/JU3M3W5i9/Iaeyz5dJ2++sqxe0jMqrhh79B2RCpOicDL1HfE
	 3f/UXAqTr9t4o7G0/5PiLI3Cp4huxUaorYEQKRKtxw5VuZLQ2wFjQc/NJvm7m6XPP8
	 K5UXAWNYL/ZV1sDzV4wOkHH4yEoiM+frNTHeTqYdKSlX/6T6ky1l3yPe06DfhEEpZp
	 4gEKQpNRZqmBk9MhkhboNPJm5PgAI8r56tiB1qRAhwkxM5QvvGF3R1OGYlStEYbilT
	 Tgx7KHrsongYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/6] arm64: defconfig: Enable
 CONFIG_VIDEO_AMLOGIC_VDEC
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: media-ci@linuxtv.org, linux-amlogic@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-6-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-6-830195b9bd91@amlogic.com>
Date: Mon, 31 Aug 2026 08:58:47 +0000
Message-Id: <20260831085848.29FC51F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIG5ldyBkZWZjb25m
aWcgZW50cnkgQ09ORklHX1ZJREVPX0FNTE9HSUNfVkRFQyBpcyBub3QgcGxhY2VkIGluIHRoZSBj
b3JyZWN0IG9yZGVyIGFzIGl0IHdvdWxkIGJlIGdlbmVyYXRlZCBieSBgbWFrZSBzYXZlZGVmY29u
ZmlnYC4KLS0KCmNvbW1pdCBjNjRiNTQ4MjYxZjA3MTEyOTBhMzZjMWJmMDEzZjhjZTIwYmQ5ZTFl
CkF1dGhvcjogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgoKYXJtNjQ6IGRl
ZmNvbmZpZzogRW5hYmxlIENPTkZJR19WSURFT19BTUxPR0lDX1ZERUMKClRoaXMgY29tbWl0IGVu
YWJsZXMgdGhlIEFtbG9naWMgVjRMMiBzdGF0ZWxlc3MgdmlkZW8gZGVjb2RlciBkcml2ZXIgYXMg
YQptb2R1bGUgaW4gdGhlIGFybTY0IGRlZmNvbmZpZyB0byBzdXBwb3J0IHRoZSBBbWxvZ2ljIFM0
IHBsYXRmb3JtLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyBi
L2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKPiBpbmRleCA2ZWM4ZDNhNjljOThlLi43YmU0
ZTVhMjg0YmFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKPiAr
KysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnCj4gQEAgLTkxOSw2ICs5MTksNyBAQCBD
T05GSUdfVjRMX1BMQVRGT1JNX0RSSVZFUlM9eQo+ICBDT05GSUdfU0RSX1BMQVRGT1JNX0RSSVZF
UlM9eQo+ICBDT05GSUdfVjRMX01FTTJNRU1fRFJJVkVSUz15Cj4gIENPTkZJR19WSURFT19BTVBI
SU9OX1ZQVT1tCj4gK0NPTkZJR19WSURFT19BTUxPR0lDX1ZERUM9bQoKW1NldmVyaXR5OiBMb3dd
CklzIHRoaXMgY29uZmlnIHBsYWNlZCBvdXQgb2Ygb3JkZXI/IEluIGtlcm5lbCBkZXZlbG9wbWVu
dCwgZGVmY29uZmlnIGZpbGVzCm11c3QgYmUgdXBkYXRlZCB1c2luZyBtYWtlIHNhdmVkZWZjb25m
aWcgdG8gZW5zdXJlIGVudHJpZXMgYXJlIHNvcnRlZAphY2NvcmRpbmcgdG8gS2NvbmZpZyBwYXJz
aW5nIG9yZGVyLgoKSW4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnLCBhbWxvZ2ljL0tj
b25maWcgaXMgc291cmNlZCBiZWZvcmUKYW1waGlvbi9LY29uZmlnLiBUaGVyZWZvcmUsIENPTkZJ
R19WSURFT19BTUxPR0lDX1ZERUMgc2hvdWxkIGFwcGVhciBiZWZvcmUKQ09ORklHX1ZJREVPX0FN
UEhJT05fVlBVLgoKQ291bGQgdGhpcyBiZSB1cGRhdGVkIHZpYSBtYWtlIHNhdmVkZWZjb25maWcg
dG8gYXZvaWQgZGV2aWF0aW5nIGZyb20gdGhlCnN0cmljdCBLY29uZmlnIHRyZWUgb3JkZXIgYW5k
IHByZXZlbnQgdW5uZWNlc3NhcnkgY2h1cm4gb3IgbWVyZ2UgY29uZmxpY3RzCmluIHRoZSBmdXR1
cmU/Cgo+ICBDT05GSUdfVklERU9fQ0FERU5DRV9DU0kyUlg9bQo+ICBDT05GSUdfVklERU9fV0FW
RV9WUFU9bQo+ICBDT05GSUdfVklERU9fRTUwMTBfSlBFR19FTkM9bQoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgzMS1iNC1zNC12
ZGVjLXVwc3RyZWFtLXY4LTAtODMwMTk1YjliZDkxQGFtbG9naWMuY29tP3BhcnQ9NgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
