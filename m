Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D88CD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLqUGRtSYFksyhHN/tkqnA8N3bc5w9CZ9CB16H9HfsQ=; b=xajq1LnjGjQDks
	DjETue4lkNFZ2BJuO7c05V2TTNqvUHlMJWPfdxPCOW0nKlHnNYKevVFFNOGXm7+nAm7Bt+py0ULTa
	tGm6qCwiYyPfA89s9M3ku4wvLWLDjxQT1WkxNWhgm8QgtNj0BEwrl/+maVZCaxz43nXnTjvt3Iik5
	Yx8/PNA8AecdTTKOtZ/EGhvEwWbmH2ZOuWXtByujah+BTjxiWSZolIgCWq2QRW8z/3FAYMPw0I/U7
	uD/cRTusyMhoMmqeOItHG+J+ezuaYDHsMQeVPehL76NgUtNSdZduSLkFRLtm97aIvNHP28LeZG22h
	a9IpZrC+EoX9vO408Rug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkeq-0000000Gp7d-0QQZ;
	Wed, 17 Jun 2026 07:25:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkep-0000000Gp7W-1Eh9
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:25:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DF18600AB;
	Wed, 17 Jun 2026 07:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A441F000E9;
	Wed, 17 Jun 2026 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781681153;
	bh=u4AWRUVG9ZHOsZdi46VB05kCt+swzak17AoYKf+KujI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U3Io4uDHwQPa0fnlsuSoJ+1v99WLTFe69IBNUtutOrRz0HXb5qxkYubK2zgvaB3pd
	 WrTLMJZlSKDULdQK4eO6WDMISDw2GEEM01O87xaBuRF90hqrupg9ohMvxrP0FgpyF8
	 4346He/rSj11NtcbcW8623eCX86PhRg/AhdRVIZ67qbXKc21ILZjJQ6Jt2u425URXB
	 uh8HrBjGTQzknGDV40KAxoHY54d41TyP7+dHQw2fucFCivKp57OPgTM67giGFyE4OE
	 z2PcVvVYpEFokM2xK4fZeIJxl3triFwP01UgAJqmylZ9KyjoQI/UGuRET1Nf0koncG
	 2kxWPq7JTHojQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy
 node by default
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617071604.635627-4-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
 <20260617071604.635627-4-jerrysteve1101@gmail.com>
Date: Wed, 17 Jun 2026 07:25:52 +0000
Message-Id: <20260617072552.C0A441F000E9@smtp.kernel.org>
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
IFtIaWdoXSBUaGUgUzQwMCBib2FyZCBmYWlscyB0byBlbmFibGUgdGhlIHVuZGVybHlpbmcgYG1p
cGlfcGNpZV9hbmFsb2dfZHBoeWAgcmVxdWlyZWQgYnkgYHBjaWVfcGh5YCwgbGVhdmluZyBQQ0ll
IGJyb2tlbiBhbmQgdGhlIGRlZmVycmVkIHByb2JlIHdhcm5pbmcgdW5yZXNvbHZlZCBvbiB0aGlz
IGJvYXJkLgotLQoKY29tbWl0IDg0NDdiYzYwOTc0NDRiNmE5OTE0YjA5NjcxZmZiNzg4NTQ3Y2Qw
ZmQKQXV0aG9yOiBKdW4gWWFuIDxqZXJyeXN0ZXZlMTEwMUBnbWFpbC5jb20+Cgphcm02NDogZHRz
OiBhbWxvZ2ljOiBtZXNvbi1heGc6IERpc2FibGUgcGNpZV9waHkgbm9kZSBieSBkZWZhdWx0CiAg
ICAKVGhpcyBjb21taXQgZGlzYWJsZXMgdGhlIHBjaWVfcGh5IG5vZGUgYnkgZGVmYXVsdCBpbiB0
aGUgbWVzb24tYXhnIGJhc2UKZGV2aWNldHJlZSB0byBzdXBwcmVzcyBhIGRlZmVycmVkIHByb2Jl
IHdhcm5pbmcgb24gYm9hcmRzIHRoYXQgZG8gbm90IHVzZSBpdC4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1heGcuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1heGcuZHRzaQpbIC4uLiBdCj4gQEAgLTMyOCw2ICszMjgsNyBAQCBwY2llX3BoeTog
cGh5QGZmNjQ0MDAwIHsKPiAgCQkJcGh5cyA9IDwmbWlwaV9wY2llX2FuYWxvZ19kcGh5PjsKPiAg
CQkJcGh5LW5hbWVzID0gImFuYWxvZyI7Cj4gIAkJCSNwaHktY2VsbHMgPSA8MD47Cj4gKwkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAkJfTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBh
IGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHRoZSBTNDAwIGJvYXJkIGZh
aWwgdG8KZW5hYmxlIHRoZSB1bmRlcmx5aW5nIG1pcGlfcGNpZV9hbmFsb2dfZHBoeSByZXF1aXJl
ZCBieSBwY2llX3BoeT8KCkxvb2tpbmcgYXQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLWF4Zy1zNDAwLmR0cywgdGhlIHBjaWVfcGh5IGlzCmVuYWJsZWQ6CgomcGNpZV9waHkgewoJ
c3RhdHVzID0gIm9rYXkiOwp9OwoKSG93ZXZlciwgdGhlIGFuYWxvZyBQSFkgaXQgZGVwZW5kcyBv
biAobWlwaV9wY2llX2FuYWxvZ19kcGh5KSBpcyBkaXNhYmxlZCBieQpkZWZhdWx0IGluIGFyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaToKCm1pcGlfcGNpZV9hbmFsb2df
ZHBoeTogcGh5IHsKCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxheGctbWlwaS1wY2llLWFuYWxvZy1w
aHkiOwoJI3BoeS1jZWxscyA9IDwwPjsKCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cn07CgpTaW5jZSBt
aXBpX3BjaWVfYW5hbG9nX2RwaHkgaXMgbmV2ZXIgc2V0IHRvICJva2F5IiBpbiB0aGUgczQwMCBi
b2FyZCBmaWxlLAp3b24ndCBwY2llX3BoeSBjb250aW51ZSB0byBpbmRlZmluaXRlbHkgZGVmZXIg
aXRzIHByb2JlIHdhaXRpbmcgZm9yIHRoZQphbmFsb2cgUEhZLCBsZWF2aW5nIFBDSWUgYnJva2Vu
IG9uIHRoZSBTNDAwIGJvYXJkPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYxNzA3MTYwNC42MzU2MjctMS1qZXJyeXN0ZXZlMTEw
MUBnbWFpbC5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
