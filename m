Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FA5CCA462
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2026 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQMOhYNaMkChMoHogNljtlq4bxWNjsj+GvqHyUhrKkA=; b=NhIoYSPAIetT+8
	N6+JN6rQ/6RTE6hzW45E5gxG11Aoc6x951nOSHDQhEHx4zEFhotHWp/R3xrfjs3032JctO66ZYbpl
	yuEDR5q+LGZZuEeeZ6slgFh2Y5+n6aWAbA3uLc4e7dCuqgyZWAogfYDk24aOgF9E9cQNb50QQT3oe
	/OAcjjmM8pZX72kUN8/x9cm9Js7fjdJ7VoS8thzGMw4FB6BubPgzbWG88LU1KQHgZpjDzdVvUwFgV
	VnKelcQngtQA10bc5UC9QK3arAYnefW2MZ5OZu4vthRI6Evxd3PCxAbH6+iL7oFv7lDy5GxvsgFBY
	h1QYCWdl3oVdsipohS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlgU-00000003YRd-0Oy9;
	Fri, 16 Oct 2026 17:25:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlgS-00000003YRJ-3iST
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Oct 2026 17:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CABBC60DDF;
	Fri, 16 Oct 2026 17:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2915E1F000C5;
	Fri, 16 Oct 2026 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171531;
	bh=xWmWtBL11uG8RdMGj63LcIL25V809PeoKDp2Mw+6/18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bH9fDJY/2yT9f04u8D8RVzOYKWUIFibLFAaeeYqYFslaO+fhJeSiTYoUlK5F6b3RV
	 XQx63qUHlqWo8wJKnuyT7LV6CK2qE/lfuFcxVEZ7g3LTnU37HYiRIVcPip7WjdVdzw
	 2m/k5dvm1z1K8fr/bthKHPKrt6l1wzYgWYce7U8KQ5kKgU2IBZTpG8766Hjd7EwZU2
	 Tm+NxLu2CVg+1rZiyCipHwzFNQw7Fx3Wgft8mMll7/ySf9oMA/T8E+C6wMRoc77IkE
	 CdfXn4kW7uRn1AGXgVIgD6Rzxr5jTDMeHTds0t6S8oDULBOFJQg1wTh35Q2vW4gFpZ
	 aT2C7lHN0JHYA==
Message-ID: <sashiko-outbox-174722@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] arm64: dts: amlogic: t7: Add thermal sensor
 nodes
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
 <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
Date: Fri, 16 Oct 2026 17:25:30 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHRoZXJtYWw6IGFtbG9n
aWM6IHN5c3RlbSBoYW5nIGR1ZSB0byBNTUlPIGFjY2VzcyBiZWZvcmUgY2xvY2sgZW5hYmxlCi0t
Cgpjb21taXQgZDk0M2RlZGQ1NTA0NDFmZGY1ZWU2YjFlYjZlYjk3ZjAyYWFjMWVmNwpBdXRob3I6
IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKYXJtNjQ6IGR0czog
YW1sb2dpYzogdDc6IEFkZCB0aGVybWFsIHNlbnNvciBub2RlcwoKVGhpcyBjb21taXQgYWRkcyBz
aXggdGVtcGVyYXR1cmUgc2Vuc29yIG5vZGVzIHRvIHRoZSBkZXZpY2UgdHJlZSB1c2luZwp0aGUg
YW1sb2dpYyx0Ny10aGVybWFsIGNvbXBhdGlibGUuIFRoZSBub2RlcyBpbmNsdWRlIHJlZmVyZW5j
ZXMgdG8gdGhlaXIKcmVxdWlyZWQgY2xvY2tzIGFuZCBjYWxpYnJhdGlvbiBkYXRhIGZyb20gdGhl
IHNlY3VyZSBtb25pdG9yLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDcuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2lj
LXQ3LmR0c2kKPiBpbmRleCA4YWE4NWFhYjMwNDY5Li5jODE2MzJkMzk4NGU4IDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4gQEAgLTY5Niw2ICs2
OTYsMjYgQEAgc2VjX2FvOiBhby1zZWN1cmVAMTAyMjAgewo+ICAJCQkJYW1sb2dpYyxoYXMtY2hp
cC1pZDsKPiAgCQkJfTsKPiAgCj4gKwkJCWE3M190c2Vuc29yOiB0ZW1wZXJhdHVyZS1zZW5zb3JA
MjAwMDAgewo+ICsJCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LXRoZXJtYWwiOwo+ICsJCQkJ
cmVnID0gPDB4MCAweDIwMDAwIDB4MCAweDUwPjsKPiArCQkJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSAzMSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQkJCWNsb2NrcyA9IDwmY2xrY19wZXJpcGhz
IENMS0lEX1NZU19UU19BNzM+LCA8JmNsa2NfcGVyaXBocyBDTEtJRF9UUz47CgpbU2V2ZXJpdHk6
IEhpZ2hdCkRvZXMgYWRkaW5nIHRoaXMgdGhlcm1hbCBzZW5zb3Igbm9kZSBleHBvc2UgYW4gaW5p
dGlhbGl6YXRpb24gb3JkZXIgYnVnCmluIHRoZSBkcml2ZXIgdGhhdCBjYXVzZXMgYSBzeXN0ZW0g
aGFuZz8KCkluIGRyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYzphbWxvZ2ljX3RoZXJt
YWxfcHJvYmUoKSwgdGhlIHRoZXJtYWwKem9uZSBpcyByZWdpc3RlcmVkIGJlZm9yZSB0aGUgaGFy
ZHdhcmUgY2xvY2tzIGFyZSBlbmFibGVkOgoKCXBkYXRhLT50emQgPSBkZXZtX3RoZXJtYWxfb2Zf
em9uZV9yZWdpc3RlcigmcGRldi0+ZGV2LAoJCQkJCQkgICAwLAoJCQkJCQkgICBwZGF0YSwKCQkJ
CQkJICAgJmFtbG9naWNfdGhlcm1hbF9vcHMpOwoJLi4uCglyZXQgPSBhbWxvZ2ljX3RoZXJtYWxf
ZW5hYmxlKHBkYXRhKTsKCkR1cmluZyByZWdpc3RyYXRpb24sIHRoZSB0aGVybWFsIGNvcmUgc3lu
Y2hyb25vdXNseSBxdWVyaWVzIHRoZSB0ZW1wZXJhdHVyZQp2aWEgdGhlIGRyaXZlcidzIC5nZXRf
dGVtcCBjYWxsYmFjayAoYW1sb2dpY190aGVybWFsX2dldF90ZW1wKCkpLCB3aGljaApwZXJmb3Jt
cyBhbiBNTUlPIHJlYWQgdmlhIHJlZ21hcF9yZWFkKCkgb24gVFNFTlNPUl9TVEFUMC4KClNpbmNl
IHRoZSBkcml2ZXIgZW5hYmxlcyB0aGUgcmVxdWlyZWQgcGVyaXBoZXJhbCBjbG9ja3MgYWZ0ZXIg
dGhlIHRoZXJtYWwKem9uZSBpcyByZWdpc3RlcmVkLCBleGVjdXRpbmcgdGhpcyBNTUlPIHJlYWQg
YmVmb3JlIHRoZSBuZWNlc3NhcnkgYnVzIGNsb2NrcwphcmUgZW5hYmxlZCB3aWxsIHN0YWxsIHRo
ZSBBTUJBIGJ1cyBhbmQgaGFuZyBvciByZWJvb3QgdGhlIHN5c3RlbS4KClsgLi4uIF0KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEw
MTYtYWRkLXRoZXJtYWwtdDctdmltNC12Ny0wLTZlZWRlNTQ1MGZkNEBhbGllbC5mcj9wYXJ0PTIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
