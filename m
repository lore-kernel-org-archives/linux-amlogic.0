Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DDDCA5FDD
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Oct 2026 03:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fRVAAGLSrM7ZrW9U7DpRVSZQq32VgNm2IuoYivSE3fU=; b=m4dzFPZyFvplgZ
	eBlC6CHhq80CLFFfrKqSXpW3IriJJNxVEjVRYxEpXaKvCkJQ/eiTLizrgInAJhO6EtkNK+rXsKVm4
	ZAbqyeDTwIf9Wjq5cS0Md5Lx16fSGf6QlG36KaKXtOvcA9fTIRDXkxKoSU0NOCtCsEotFqNyhmhjd
	Clmc//tmHqWlaif+z/9GggORgpXlQ/EUGOrSVKPXh6kXxs3iLoArI14Wxg1XfFOXQXGPKj035UZKY
	imPgYl7IGjYQh/CRKV9jJ/h0fFBq2L7vV6RgfimdFsNpuf8T0A1wbXHPT+8A/W0jdZKBflskR3MfL
	7U3fuibffz8TICIJJvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCqDN-0000000CzG7-3E1r;
	Sat, 03 Oct 2026 03:15:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCqDM-0000000CzFw-2YDy;
	Sat, 03 Oct 2026 03:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DAB860AAF;
	Sat,  3 Oct 2026 03:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02881C2BCF4;
	Sat,  3 Oct 2026 03:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790997307;
	bh=5T+24V9e8z5HCcVYrnNkaJSm+elLVTowiHzkPZ1WEDA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BDYztaxF0fBSUzUoc0fJ88KeJqIG+gyLyxHi70UVRctQQOlJKx/MC3CPhFeOhvjiE
	 UO00/4ZwEqSHbnf+C5dkGgrP+L2HeEcB/3kexFjQjmZqOzWmvIZm3AmxAWpM+EP8Xu
	 d7/4F6cQVeEmSECs2BHdPIY+rPgG9dikpBilfFfWl0Nf/9VdsHWVCoLfz52ylWLVKO
	 n/AqN0YxVsjrR/DHcfVzhkUTDNBBMv7o79DHmMXr8wlvn6nCEwwb5i8Yy40ivmpBKr
	 yuod/wkn4msxyz/AOeGYU+FSdxD+oXmPTT3Z9foe2wYoTZMDfnyObppnE+eG7viX87
	 j7tlyF/njuN7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19C1CA5FDD;
	Sat,  3 Oct 2026 03:15:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 03 Oct 2026 06:15:05 +0300
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
MIME-Version: 1.0
Message-Id: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
X-B4-Tracking: v=1; b=H4sIADhzwGoC/x3MTQqAIBBA4avErBvQ7I+uEi1CZ2o2KgoVSHdPW
 n6L9wpkSkIZlqZAokuyBF+h2wbsufuDUFw1dKobtVIGT9tjdhjDTQkDM46TMzzMrI3qoWYxEcv
 zL9ftfT8AAcz0YgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=DXX3IOmUgvr4GKV8MwPySwGHNkc4UtI5AabTLkv0Z0E=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkHii1ZN5pd3bp57Xa/9BMGS0Q/Nyxizfx87ucKy5m/h
 LYd9XL63VHKwiDGxSArpsgy4ZDGrYwlV//6e5g/gJnDygQyhIGLUwAm8siT4RdTE0fb5E2HJZm/
 t+actL/EXKd+772c6JWvkemOi7mL+psZ/hmbnPd+9vHr6sPOBx/57bo4Rb5yZufzaUxCu65zPav
 lTGEHAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Neulight <Eric.Neulight@linuxdev.slmail.me>, Igor Velkov <iav@iav.lv>, Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

A warm reboot leaves the ODROID-HC4 in the bootloader: the card is still
detected - CID and CSD read fine - but data transfers fail, and both
U-Boot and the boot ROM give up on CMD18. A cold power cycle always
recovers it.

The card is left in UHS mode at 1.8 V, and nothing after Linux brings it
back to 3.3 V: the bootloader resets the controller, not the card. The
kernel does try to cut the power on the way out - mmc_bus_shutdown() ends
in _mmc_sd_suspend(), which calls mmc_power_off(), and meson-gx-mmc then
disables the vmmc regulator - but TFLASH_VDD is marked
regulator-always-on, so the regulator core keeps it enabled and the card
keeps its supply.

Drop the property. The regulator has a consumer that manages it, and
regulator-boot-on already describes the state it comes up in.

Tested on ODROID-HC4 with a card that reproduces the failure. Not tested
on ODROID-C4, which shares this file.

Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index e6f02d738a21..7dbc75bfaea2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -38,7 +38,6 @@ tflash_vdd: regulator-tflash-vdd {
 		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-boot-on;
-		regulator-always-on;
 	};
 
 	tf_io: gpio-regulator-tf-io {

---
base-commit: b44e2be772f866985cafdf90355285069ea68495
change-id: 20261003-hc4-sd-power-off-67d3f58f1304

Best regards,
-- 
Igor Velkov <iav@iav.lv>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
