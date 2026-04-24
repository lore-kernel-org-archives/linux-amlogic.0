Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D7AFED3D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/1Ph5DxToi1Z0JwUryrY4VcQMtpyAZ+/tt81lOyZPU=; b=kaFD3qV0DdcNbc
	0oripJEhFQN4yHSmrI68XvS3hfeX5uF+pMcLU28IIDuqx2eOFOVndLOUtF7V8M9O8AzenblZ/RNaM
	db/i2pnBDr2IRjvJcQnwYlyugrnwyNiOMSky4uw9f8qLDe3/YvFQvTuc+H18WUzxoYAhYKer6JRfm
	oGcu8UFPFxsZMqQIw0/KFWP5xKeS7hlswr1DcuBWbhMuDMcvHSYPHoP0C+gt3t56JB4vr1TeivZg5
	Z8JXvyaEaEe7GHlyTS7NjUAfklJZECkhN2APliVOsQ8Yi9pWeMqH11FUdqM6qlokEyV09xQX8TCHt
	OH9KwWIb9u0YEk7ZL5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIl4-0000000DPDV-0k0L;
	Fri, 24 Apr 2026 15:47:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIkn-0000000DOwI-0eOk;
	Fri, 24 Apr 2026 15:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BD0944712;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5985FC19425;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777045656;
	bh=0OS0O2le0mzHMAbxRNl1A/VObEVx8TTq/lX1ZilvR08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OCq1KwLuyiwQgpW1oN5p/FLcYXcVA36EIszpXNd2P1ZyJRR3L748v5W+Kp6ExUzwC
	 aZMuw1X9OIWiADRDQ0X3S7UTzSjsi6xj0k6xxGekKxjD3mqqPykDmaJUos+4ib7mlR
	 uCq6prm/pwqdYauxkxN0fzJhHCcyXnDvPIhfTaFaRt3kAp0UNTmp23ZwWYxph9/+H4
	 pgB6bcfiHACy0FiipRBOxJ0Rb/GPTjvA+2z2sDnt6o8O17Pwi21gQQxpyjO76rhgfI
	 V6ZwpqADaOlQIaXGwXZrp/ayLC0+dk85oGeLiXyF613F6hDJ0kYhTmqb0kOValGviz
	 bVttkJukxvDiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF62FED3EC;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 24 Apr 2026 17:45:16 +0200
Subject: [PATCH v5 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
MIME-Version: 1.0
Message-Id: <20260424-add-thermal-t7-vim4-v5-8-9040ca36afe2@aliel.fr>
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
In-Reply-To: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=QDl6XRK0bbX2myAi5/KhL6pv37d0zhbhr8IIj0YHBpM=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+brCZNdzrbuX9w8w1VW1l352MHH9r7zZX7P09w16eVJ6
 8uZa7ZEdZSyMIhxMciKKbL0z7U88e7y0TNf96inwMxhZQIZwsDFKQAT6RZhZJj4cnut1ZvwOcw3
 TkzKu/CAPe+t6+6gNQv6s2yaz+7isBFnZDixIjfzyLeCz73BZ/4d+WN3WGzbNW4tWeOs7MK8e1d
 uVjEBAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_084741_244462_505541D3 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpBZGQgYW4g
YWN0aXZlIHRyaXAgYXQgNTDCsEMgdG8gYWxsIHNpeCB0aGVybWFsIHpvbmVzIGFuZCBtYXAgaXQg
dG8gdGhlCmtoYWRhc19tY3UgZmFuIGNvbnRyb2xsZXIsIHVzaW5nIGNvb2xpbmcgc3RhdGVzIDMw
IHRvIDEwMC4KClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZA
YWxpZWwuZnI+Ci0tLQogLi4uL2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12
aW00LmR0cyAgfCAxMDIgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwppbmRleCA1ZDdmNTM5MGYz
YTY2Li5iYTkyMTkwNzNkZDBhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKQEAgLTE1Nyw2
ICsxNTcsNzQgQEAgd2lmaTMyazogd2lmaTMyayB7CiAJfTsKIH07CiAKKyZhNTNfdGhlcm1hbCB7
CisJdHJpcHMgeworCQlhNTNfYWN0aXZlOiBhNTMtYWN0aXZlIHsKKwkJCXRlbXBlcmF0dXJlID0g
PDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBt
aWxsaWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJY29vbGlu
Zy1tYXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JmE1M19hY3RpdmU+OworCQkJY29vbGluZy1k
ZXZpY2UgPSA8JmtoYWRhc19tY3UgMzAgMTAwPjsKKwkJfTsKKwl9OworfTsKKworJmE3M190aGVy
bWFsIHsKKwl0cmlwcyB7CisJCWE3M19hY3RpdmU6IGE3My1hY3RpdmUgeworCQkJdGVtcGVyYXR1
cmUgPSA8NTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCWh5c3RlcmVzaXMgPSA8MjAwMD47
IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJdHlwZSA9ICJhY3RpdmUiOworCQl9OworCX07CisKKwlj
b29saW5nLW1hcHMgeworCQltYXAgeworCQkJdHJpcCA9IDwmYTczX2FjdGl2ZT47CisJCQljb29s
aW5nLWRldmljZSA9IDwma2hhZGFzX21jdSAzMCAxMDA+OworCQl9OworCX07Cit9OworCismZ3B1
X3RoZXJtYWwgeworCXRyaXBzIHsKKwkJZ3B1X2FjdGl2ZTogZ3B1LWFjdGl2ZSB7CisJCQl0ZW1w
ZXJhdHVyZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVyZXNpcyA9IDwy
MDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJCX07CisJfTsK
KworCWNvb2xpbmctbWFwcyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZncHVfYWN0aXZlPjsKKwkJ
CWNvb2xpbmctZGV2aWNlID0gPCZraGFkYXNfbWN1IDMwIDEwMD47CisJCX07CisJfTsKK307CisK
KyZoZXZjX3RoZXJtYWwgeworCXRyaXBzIHsKKwkJaGV2Y19hY3RpdmU6IGhldmMtYWN0aXZlIHsK
KwkJCXRlbXBlcmF0dXJlID0gPDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJl
c2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJ
fTsKKwl9OworCisJY29vbGluZy1tYXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JmhldmNfYWN0
aXZlPjsKKwkJCWNvb2xpbmctZGV2aWNlID0gPCZraGFkYXNfbWN1IDMwIDEwMD47CisJCX07CisJ
fTsKK307CisKICZpMmNfbV9hb19hIHsKIAlzdGF0dXMgPSAib2theSI7CiAJcGluY3RybC0wID0g
PCZpMmMwX2FvX2RfcGlucz47CkBAIC0xNzAsNiArMjM4LDIzIEBAIGtoYWRhc19tY3U6IHN5c3Rl
bS1jb250cm9sbGVyQDE4IHsKIAl9OwogfTsKIAorJm5uYV90aGVybWFsIHsKKwl0cmlwcyB7CisJ
CW5uYV9hY3RpdmU6IG5uYS1hY3RpdmUgeworCQkJdGVtcGVyYXR1cmUgPSA8NTAwMDA+OyAvKiBt
aWxsaWNlbHNpdXMgKi8KKwkJCWh5c3RlcmVzaXMgPSA8MjAwMD47IC8qIG1pbGxpY2Vsc2l1cyAq
LworCQkJdHlwZSA9ICJhY3RpdmUiOworCQl9OworCX07CisKKwljb29saW5nLW1hcHMgeworCQlt
YXAgeworCQkJdHJpcCA9IDwmbm5hX2FjdGl2ZT47CisJCQljb29saW5nLWRldmljZSA9IDwma2hh
ZGFzX21jdSAzMCAxMDA+OworCQl9OworCX07Cit9OworCiAmcHdtX2FiIHsKIAlzdGF0dXMgPSAi
b2theSI7CiAJcGluY3RybC0wID0gPCZwd21fYV9waW5zPjsKQEAgLTI2NiwzICszNTEsMjAgQEAg
JnVhcnRfYSB7CiAJY2xvY2tzID0gPCZ4dGFsPiwgPCZ4dGFsPiwgPCZ4dGFsPjsKIAljbG9jay1u
YW1lcyA9ICJ4dGFsIiwgInBjbGsiLCAiYmF1ZCI7CiB9OworCismdnB1X3RoZXJtYWwgeworCXRy
aXBzIHsKKwkJdnB1X2FjdGl2ZTogdnB1LWFjdGl2ZSB7CisJCQl0ZW1wZXJhdHVyZSA9IDw1MDAw
MD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsgLyogbWlsbGlj
ZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJCX07CisJfTsKKworCWNvb2xpbmctbWFw
cyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZ2cHVfYWN0aXZlPjsKKwkJCWNvb2xpbmctZGV2aWNl
ID0gPCZraGFkYXNfbWN1IDMwIDEwMD47CisJCX07CisJfTsKK307CgotLSAKMi40OS4wCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
