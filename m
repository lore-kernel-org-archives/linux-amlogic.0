Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8697BFDEE20
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wLDbAe7WvDjoYwgNVTZ3guQiVCAtTNnljxuETc8THE=; b=h8vTRK2h9zImZJ
	Hlp32d8kWUYlV6WaT7vBajzKtgtowMPwQztlLjtHOGXneTiQbPpED2hf2Ciw1wwIVRsonXn6WKHJE
	HAcWk58zenOg5WoktRzCUpcOIe0xqipKRP5TKOLpyBO8SdNwXirGewkccfI9Jeqs1rO6HBLENbxog
	Be29mS8FAmZJ5twvVYcFz9/vk1fB1VNOe1KLgdTViGtcMTK1K2uDiiebuzZFbmvahkXwyRmrkQ0S7
	pqMln1ICSxf8Y0eQxsuu754AO1znNg6yEIafRZms7RN5QI3z+pyrnlgQ3mANTTItqhfhFS4GrAyfC
	6/R6H7wVUiJBptc7fnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwbN-0000000Bvk8-1POK;
	Thu, 23 Apr 2026 16:08:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwbA-0000000BvWe-0KYA;
	Thu, 23 Apr 2026 16:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7946D4472C;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 534BBC2BCFD;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776960491;
	bh=REA0gNXQwhTgCiXosbKBoReZLjNSpbkwmsoqkYdMspE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uxx9nzwlxousgqAuQESJz5CCiKeNPP5ordUUqhTuqSOfJYPceHLhJNOTsAZYHgnOv
	 jAczcQohHh79Ch8GPQ50X6PWVYdw/VdZzfrzOvFk1U4c8a+DO2PKqjOuKTAdJ5JuTr
	 ZD2bzQYsZIN3I8aFKnzGg+VSE9Y26SnuhqeEaItDf24v7K/pHWuHKEbLeVz1l11FGQ
	 E4hJlgAc09OBUtd8plwTb/ptnQDc08Lg6132mRzKUvo8pThuV+llFRB4uBam9rx2aA
	 zGFVcCfhLb8I58OA0LXLGdyYCQ0oszL5JjNo4sDDdDMcajzYJcQE3AcmXvFNTovjAY
	 AZz/OyyliW7oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B498FC0360;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 23 Apr 2026 18:07:23 +0200
Subject: [PATCH v4 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
MIME-Version: 1.0
Message-Id: <20260423-add-thermal-t7-vim4-v4-8-d4c1528d5044@aliel.fr>
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=zbgRfmKb31HDgkan9Fy8S+p1BOUmWfaoe9tmTB9hGac=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+Yr5xflybeZjF97/jKcsPDNNNUFOfG/L6VGLSyOu3FYw
 I7R7nx7RykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCR79sY/vuzcdw5ksW24vr2
 fZfURadVXE+XnBp1JXnNohcOnVNmPJrAyLDG8ozr0qcxP+bN85hn4yJ2RiyfN2NR+CURSWdbkQ9
 ec3gB
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_090816_192946_F6A0C43B 
X-CRM114-Status: UNSURE (   8.98  )
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
IHRvIDEwMC4KClNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2
QGFsaWVsLmZyPgotLS0KIC4uLi9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMt
dmltNC5kdHMgIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEw
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKaW5kZXggNWQ3ZjUzOTBm
M2E2Ni4uYmE5MjE5MDczZGQwYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cworKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCkBAIC0xNTcs
NiArMTU3LDc0IEBAIHdpZmkzMms6IHdpZmkzMmsgewogCX07CiB9OwogCismYTUzX3RoZXJtYWwg
eworCXRyaXBzIHsKKwkJYTUzX2FjdGl2ZTogYTUzLWFjdGl2ZSB7CisJCQl0ZW1wZXJhdHVyZSA9
IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsgLyog
bWlsbGljZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJCX07CisJfTsKKworCWNvb2xp
bmctbWFwcyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZhNTNfYWN0aXZlPjsKKwkJCWNvb2xpbmct
ZGV2aWNlID0gPCZraGFkYXNfbWN1IDMwIDEwMD47CisJCX07CisJfTsKK307CisKKyZhNzNfdGhl
cm1hbCB7CisJdHJpcHMgeworCQlhNzNfYWN0aXZlOiBhNzMtYWN0aXZlIHsKKwkJCXRlbXBlcmF0
dXJlID0gPDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+
OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJ
Y29vbGluZy1tYXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JmE3M19hY3RpdmU+OworCQkJY29v
bGluZy1kZXZpY2UgPSA8JmtoYWRhc19tY3UgMzAgMTAwPjsKKwkJfTsKKwl9OworfTsKKworJmdw
dV90aGVybWFsIHsKKwl0cmlwcyB7CisJCWdwdV9hY3RpdmU6IGdwdS1hY3RpdmUgeworCQkJdGVt
cGVyYXR1cmUgPSA8NTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCWh5c3RlcmVzaXMgPSA8
MjAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJdHlwZSA9ICJhY3RpdmUiOworCQl9OworCX07
CisKKwljb29saW5nLW1hcHMgeworCQltYXAgeworCQkJdHJpcCA9IDwmZ3B1X2FjdGl2ZT47CisJ
CQljb29saW5nLWRldmljZSA9IDwma2hhZGFzX21jdSAzMCAxMDA+OworCQl9OworCX07Cit9Owor
CismaGV2Y190aGVybWFsIHsKKwl0cmlwcyB7CisJCWhldmNfYWN0aXZlOiBoZXZjLWFjdGl2ZSB7
CisJCQl0ZW1wZXJhdHVyZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVy
ZXNpcyA9IDwyMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJ
CX07CisJfTsKKworCWNvb2xpbmctbWFwcyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZoZXZjX2Fj
dGl2ZT47CisJCQljb29saW5nLWRldmljZSA9IDwma2hhZGFzX21jdSAzMCAxMDA+OworCQl9Owor
CX07Cit9OworCiAmaTJjX21fYW9fYSB7CiAJc3RhdHVzID0gIm9rYXkiOwogCXBpbmN0cmwtMCA9
IDwmaTJjMF9hb19kX3BpbnM+OwpAQCAtMTcwLDYgKzIzOCwyMyBAQCBraGFkYXNfbWN1OiBzeXN0
ZW0tY29udHJvbGxlckAxOCB7CiAJfTsKIH07CiAKKyZubmFfdGhlcm1hbCB7CisJdHJpcHMgewor
CQlubmFfYWN0aXZlOiBubmEtYWN0aXZlIHsKKwkJCXRlbXBlcmF0dXJlID0gPDUwMDAwPjsgLyog
bWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMg
Ki8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJY29vbGluZy1tYXBzIHsKKwkJ
bWFwIHsKKwkJCXRyaXAgPSA8Jm5uYV9hY3RpdmU+OworCQkJY29vbGluZy1kZXZpY2UgPSA8Jmto
YWRhc19tY3UgMzAgMTAwPjsKKwkJfTsKKwl9OworfTsKKwogJnB3bV9hYiB7CiAJc3RhdHVzID0g
Im9rYXkiOwogCXBpbmN0cmwtMCA9IDwmcHdtX2FfcGlucz47CkBAIC0yNjYsMyArMzUxLDIwIEBA
ICZ1YXJ0X2EgewogCWNsb2NrcyA9IDwmeHRhbD4sIDwmeHRhbD4sIDwmeHRhbD47CiAJY2xvY2st
bmFtZXMgPSAieHRhbCIsICJwY2xrIiwgImJhdWQiOwogfTsKKworJnZwdV90aGVybWFsIHsKKwl0
cmlwcyB7CisJCXZwdV9hY3RpdmU6IHZwdS1hY3RpdmUgeworCQkJdGVtcGVyYXR1cmUgPSA8NTAw
MDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCWh5c3RlcmVzaXMgPSA8MjAwMD47IC8qIG1pbGxp
Y2Vsc2l1cyAqLworCQkJdHlwZSA9ICJhY3RpdmUiOworCQl9OworCX07CisKKwljb29saW5nLW1h
cHMgeworCQltYXAgeworCQkJdHJpcCA9IDwmdnB1X2FjdGl2ZT47CisJCQljb29saW5nLWRldmlj
ZSA9IDwma2hhZGFzX21jdSAzMCAxMDA+OworCQl9OworCX07Cit9OwoKLS0gCjIuNDkuMAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
