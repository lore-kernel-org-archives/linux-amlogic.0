Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979AEC9830D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eza70e3VRCl1iSsazmfxF9REyfa7pGzQyKJ+B6csDps=; b=iG3pF+hiGm5SH3
	HSkN4JRTfzoe9D6S4arzmjla5kY9ewXE9zdR1HkTj9lfY+k5pvtzDVGam6RB+oGHUxXj1lPP4OIUa
	6/qhXSXPKcyXWKdU5gYJMq1worDxt5rY1Pm8mEuDdS8N0fI6nyvH/2Euvb9BUCwIw17AMmtvGxr6q
	vBxjByK59+s6OuAmSPrAcIKsCivPR3+taccOlwZ4tXBXvPH0p1LKHLy3/TdvUP4gK1qo/+VrydoUH
	WNa9f5Xc0A0MYpCR9B0OXKqu6h69vumr+tL1ZGhyC4GupKH7WC88JEfin5i0MIWtzfAiTWm/G+B3p
	7ewMnSwRFeZVrZwckWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LeK-00000008ANg-40zs;
	Wed, 23 Sep 2026 12:00:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LeK-00000008ANM-1QLi
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 12:00:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E6D44165D;
	Wed, 23 Sep 2026 12:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A2D1F000FF;
	Wed, 23 Sep 2026 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164831;
	bh=XB4BUKjxqcNG7O6VXKX+/Q9C2QHBlXxMLaWGtie9/KI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wmsc1E6a4f4gklDjiY4Zk9wMC9I7mqExge2blvj5GBbgZ1at334tsU6JmHbUJPrve
	 3pCfVlYvdRvr5f4S5/topDfXBMYSM2QyC+0Fje8KAeJcDM4YdvmHd2wIBjTTHM28Fk
	 wKTS3/LLmkCNpxTgYWMqSE/8iHH+16IqSFvRFhdEzgwFcGYu7w6ODqvA610NOlNuvL
	 GSONv800j8ignAJhH8bXffE86VV1nH04SOl/i/Y+DaX0+gpQHwZ3WhS2U162HxS3c/
	 Ub2reTv3waRbaEfPWhAoe1/WAfWF6WIR5oWp8EWvhmseLneVY9Uf5I353y6b/9wkYP
	 wCat/adxFiM5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: describe bus clock
 for t7-thermal
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260923-fix-t7-thermal-clock-v1-1-7d4c4682f182@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
 <20260923-fix-t7-thermal-clock-v1-1-7d4c4682f182@aliel.fr>
Date: Wed, 23 Sep 2026 12:00:31 +0000
Message-Id: <20260923120031.88A2D1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBkdC1iaW5kaW5n
czogdGhlcm1hbDogYW1sb2dpYzogQUJJIGJyZWFrYWdlIGJ5IHByZXBlbmRpbmcgbmV3IGJ1cyBj
bG9jawotLQoKY29tbWl0IDljYWQ4MzI0YmYyMDRjZWI5OGU1M2FhZGJmYWM1NGEwYjhkMDRkYTYK
QXV0aG9yOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCmR0LWJp
bmRpbmdzOiB0aGVybWFsOiBhbWxvZ2ljOiBkZXNjcmliZSBidXMgY2xvY2sgZm9yIHQ3LXRoZXJt
YWwKClRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIGFtbG9naWMgdGhlcm1hbCBkZXZpY2UgdHJlZSBi
aW5kaW5nIHRvIHN1cHBvcnQgYQpzZWNvbmRhcnkgImJ1cyIgY2xvY2sgcmVxdWlyZWQgYnkgdGhl
IHQ3LXRoZXJtYWwgc2Vuc29yLiBJdCBhZGRzIHRoZQoiY2xvY2stbmFtZXMiIHByb3BlcnR5IHRv
IGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlICJidXMiIGFuZCAiY29yZSIgY2xvY2tzCmFuZCByZXF1
aXJlcyBib3RoIGZvciB0aGUgdDctdGhlcm1hbCBjb21wYXRpYmxlLgoKPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFs
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2lj
LHRoZXJtYWwueWFtbAo+IGluZGV4IDhjZmE0NGRjZGE1OGMuLmU3MmNiMzlhYzYzNWQgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dp
Yyx0aGVybWFsLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGhlcm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbAo+IEBAIC0zMiw3ICszMiwxNSBAQCBwcm9wZXJ0
aWVzOgo+ICAgICAgbWF4SXRlbXM6IDEKPiAgCj4gICAgY2xvY2tzOgo+IC0gICAgbWF4SXRlbXM6
IDEKPiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlv
bjogQnVzIGNsb2NrLCBnYXRlcyByZWdpc3RlciBhY2Nlc3MgdG8gdGhlIHNlbnNvci4KPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogRnVuY3Rpb25hbCBjbG9jayBvZiB0aGUgdGVtcGVyYXR1cmUgc2Vu
c29yLCBzaGFyZWQgYmV0d2VlbiBzZW5zb3JzLgo+ICsKPiArICBjbG9jay1uYW1lczoKPiArICAg
IGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBidXMKPiArICAgICAgLSBjb25zdDogY29yZQoKW1Nl
dmVyaXR5OiBDcml0aWNhbF0KRG9lcyBwcmVwZW5kaW5nIHRoZSBuZXcgImJ1cyIgY2xvY2sgYXQg
aW5kZXggMCBpbnRyb2R1Y2UgYW4gQUJJIHJlZ3Jlc3Npb24/CgpTaW5jZSBvbGRlciBrZXJuZWxz
IHVzZSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxMKSB0byB1bmNvbmRpdGlvbmFsbHkgZmV0Y2gKdGhl
IGNsb2NrIGF0IGluZGV4IDAgKGFzIHNlZW4gaW4gZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhl
cm1hbC5jOgphbWxvZ2ljX3RoZXJtYWxfcHJvYmUoKSksIHVwZGF0aW5nIHRoZSBkZXZpY2UgdHJl
ZSB0byBtYXRjaCB0aGlzIG5ldyBzY2hlbWEKd2lsbCBjYXVzZSB0aG9zZSBvbGRlciBrZXJuZWxz
IHRvIGZldGNoIHRoZSAiYnVzIiBjbG9jayBpbnN0ZWFkIG9mIHRoZQpmdW5jdGlvbmFsICJjb3Jl
IiBjbG9jay4KClRoaXMgd2lsbCBsZWF2ZSB0aGUgZnVuY3Rpb25hbCBjbG9jayBkaXNhYmxlZCBh
bmQgcHJldmVudCB0aGUgdGhlcm1hbCBzZW5zb3IKZnJvbSBvcGVyYXRpbmcuIFdoaWxlIGEgbGF0
ZXIgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgdXBkYXRlcyB0aGUgZHJpdmVyIHRvIHVzZQpkZXZtX2Ns
a19idWxrX2dldF9hbGwoKSwgdGhlIGRldmljZSB0cmVlIHNjaGVtYSByZW1haW5zIGJyb2tlbiBm
b3Igb2xkZXIKa2VybmVscy4KCldvdWxkIGl0IGJlIGJldHRlciB0byBhcHBlbmQgdGhlIG5ldyAi
YnVzIiBjbG9jayBhdCBpbmRleCAxIHRvIGF2b2lkCmJyZWFraW5nIGJhY2t3YXJkIGFuZCBmb3J3
YXJkIGNvbXBhdGliaWxpdHk/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIzLWZpeC10Ny10aGVybWFsLWNsb2NrLXYxLTAtN2Q0
YzQ2ODJmMTgyQGFsaWVsLmZyP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
