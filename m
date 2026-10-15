Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC718CCA466
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2026 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nk/GTS+HMuACjYr8yqrQVqcyT9cj1tXR5a/Hx1sgLRw=; b=u4MjqjmwiTqhK7
	eQK2V04ElXOODYvFxJDnw+k+eIdGDrSwDRQOKXznUO0T1ORleEYoF3xoqaKerHZzIZz9tXdIuYH8A
	UzaHMSdYs0kwTGFDAXG9KR3MLQ1G/0XcvGTGfa1/BFcINF6EDazN+1lkR0k6z+smNiPXZAPV3QM4F
	8zkYOFZrMpv/6ktDhSzzHcQ6v1VMqCuDr+DAstx8gOOGQlqGQ+Y/nGWh/G3tz7xsFJrj7LOPGv4eM
	VfCSXTMoldgTAK5RtY19Gq0vXVjMErItiklz39iZn7K0601X17W6X1eoaVpqrCTY7Ob1roRnTOV7G
	ETo+aTsUwMczxH6W09Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfn-000000013oI-2oSO;
	Thu, 15 Oct 2026 17:55:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPfl-000000013nJ-2WiQ;
	Thu, 15 Oct 2026 17:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DA66447AD;
	Thu, 15 Oct 2026 17:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA1EAC2BCFC;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792086920;
	bh=NNesoLElBUv09j/SE4YghbtNRl4bZejc+cTkcFayRsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rdyrY1iSTume5moU/1bffAZN2NMh7lO8w5GuQ7XlgDjK+GcEiymaHyahSjUocV68Z
	 uQ4m8Sa2p8+m6Lbz6L8Iz9GCtxP5ZljK2gkCdYWtV9RC726SxpS47cJ5+Km578iOyf
	 9K6GTr2K8KcqUHT4yZHmbVqN+3Z/m38SGKVWKw5yrX2RfL+kdsPIrWMlCzDghdm4bb
	 GZ1ZUNPXKPGXKYwERZ2NnyIAD6NqrAJ8EnS0SfcBFma6Qu94U4hV5mmLjuI3grFAYe
	 WEVyqihAWNZfeCD04G9JQu545DG+ti6KS8MsbasT1WKfgWo82AEFgoz7LydSja9iNC
	 kzJ7xCb1TEVJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22BACCA464;
	Thu, 15 Oct 2026 17:55:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 15 Oct 2026 19:54:12 +0200
Subject: [PATCH v6 4/4] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
MIME-Version: 1.0
Message-Id: <20261015-add-thermal-t7-vim4-v6-4-37d1c954390c@aliel.fr>
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
In-Reply-To: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=B2WWh69HSsHWgo7xf4TXcX+65d8XeYi4tsHrfwMtAdI=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZF4WbRc+pCrMF7j8zqcj9z+kzXbsEbj3bdVCo1X3lAR
 kMt7zhvRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjARwVUMf2U38EWa3xKvsQyJ
 fFFTl5R9Jir2nF7854C+d/vEHPs+djD8r/xuKlqjOvnHEtudjcpLraSSdc/+/tT3YkZlRa+NYsB
 yFgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
dG8gdGhlCmtoYWRhc19tY3UgZmFuIGNvbnRyb2xsZXIsIHVzaW5nIGNvb2xpbmcgc3RhdGVzIDEg
dG8gNS4KClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZz4KU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxp
ZWwuZnI+Ci0tLQogLi4uL2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00
LmR0cyAgfCAxMDIgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1s
b2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwppbmRleCAwZmE4MzM2MmI0MTc5
Li45MWY4MWY3OTQ5YmY4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKQEAgLTI1Niw2ICsy
NTYsNzQgQEAgeHRhbDogeHRhbC1jbGsgewogCX07CiB9OwogCismYTUzX3RoZXJtYWwgeworCXRy
aXBzIHsKKwkJYTUzX2FjdGl2ZTogYTUzLWFjdGl2ZSB7CisJCQl0ZW1wZXJhdHVyZSA9IDw1MDAw
MD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsgLyogbWlsbGlj
ZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJCX07CisJfTsKKworCWNvb2xpbmctbWFw
cyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZhNTNfYWN0aXZlPjsKKwkJCWNvb2xpbmctZGV2aWNl
ID0gPCZraGFkYXNfbWN1IDEgNT47CisJCX07CisJfTsKK307CisKKyZhNzNfdGhlcm1hbCB7CisJ
dHJpcHMgeworCQlhNzNfYWN0aXZlOiBhNzMtYWN0aXZlIHsKKwkJCXRlbXBlcmF0dXJlID0gPDUw
MDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxs
aWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJY29vbGluZy1t
YXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JmE3M19hY3RpdmU+OworCQkJY29vbGluZy1kZXZp
Y2UgPSA8JmtoYWRhc19tY3UgMSA1PjsKKwkJfTsKKwl9OworfTsKKworJmdwdV90aGVybWFsIHsK
Kwl0cmlwcyB7CisJCWdwdV9hY3RpdmU6IGdwdS1hY3RpdmUgeworCQkJdGVtcGVyYXR1cmUgPSA8
NTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCWh5c3RlcmVzaXMgPSA8MjAwMD47IC8qIG1p
bGxpY2Vsc2l1cyAqLworCQkJdHlwZSA9ICJhY3RpdmUiOworCQl9OworCX07CisKKwljb29saW5n
LW1hcHMgeworCQltYXAgeworCQkJdHJpcCA9IDwmZ3B1X2FjdGl2ZT47CisJCQljb29saW5nLWRl
dmljZSA9IDwma2hhZGFzX21jdSAxIDU+OworCQl9OworCX07Cit9OworCismaGV2Y190aGVybWFs
IHsKKwl0cmlwcyB7CisJCWhldmNfYWN0aXZlOiBoZXZjLWFjdGl2ZSB7CisJCQl0ZW1wZXJhdHVy
ZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsg
LyogbWlsbGljZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJCX07CisJfTsKKworCWNv
b2xpbmctbWFwcyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZoZXZjX2FjdGl2ZT47CisJCQljb29s
aW5nLWRldmljZSA9IDwma2hhZGFzX21jdSAxIDU+OworCQl9OworCX07Cit9OworCiAmaTJjX21f
YW9fYSB7CiAJc3RhdHVzID0gIm9rYXkiOwogCXBpbmN0cmwtMCA9IDwmaTJjMF9hb19kX3BpbnM+
OwpAQCAtMjY5LDYgKzMzNywyMyBAQCBraGFkYXNfbWN1OiBzeXN0ZW0tY29udHJvbGxlckAxOCB7
CiAJfTsKIH07CiAKKyZubmFfdGhlcm1hbCB7CisJdHJpcHMgeworCQlubmFfYWN0aXZlOiBubmEt
YWN0aXZlIHsKKwkJCXRlbXBlcmF0dXJlID0gPDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJ
CQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0
aXZlIjsKKwkJfTsKKwl9OworCisJY29vbGluZy1tYXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8
Jm5uYV9hY3RpdmU+OworCQkJY29vbGluZy1kZXZpY2UgPSA8JmtoYWRhc19tY3UgMSA1PjsKKwkJ
fTsKKwl9OworfTsKKwogJnB3bV9hYiB7CiAJc3RhdHVzID0gIm9rYXkiOwogCXBpbmN0cmwtMCA9
IDwmcHdtX2FfcGlucz47CkBAIC0zODksMyArNDc0LDIwIEBAICZ1YXJ0X2EgewogCWNsb2NrcyA9
IDwmeHRhbD4sIDwmY2xrY19wZXJpcGhzIENMS0lEX1NZU19VQVJUX0E+LCA8Jnh0YWw+OwogCWNs
b2NrLW5hbWVzID0gInh0YWwiLCAicGNsayIsICJiYXVkIjsKIH07CisKKyZ2cHVfdGhlcm1hbCB7
CisJdHJpcHMgeworCQl2cHVfYWN0aXZlOiB2cHUtYWN0aXZlIHsKKwkJCXRlbXBlcmF0dXJlID0g
PDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBt
aWxsaWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJY29vbGlu
Zy1tYXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JnZwdV9hY3RpdmU+OworCQkJY29vbGluZy1k
ZXZpY2UgPSA8JmtoYWRhc19tY3UgMSA1PjsKKwkJfTsKKwl9OworfTsKCi0tIAoyLjQ5LjAKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
