Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6680F513E1
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9tP1LrQ2eFQ3x9L/NdV6Si5tyQpSTpmunBjSdvPSrmE=; b=DIj4Iou4JbOiXg
	9/b5416OMzpXcSD6iu6fVTqi0CKhjEUv/awhTQaxcJbQL8KCWAQ1YzO98ksx1Twp397M4UqBywR5I
	ajxU1lscYrkZq1T8bT8duzz7QBlOibek3x1QlKxtBDx078wfq7np/g57IWKpfbhy39vOlIH5OiuOu
	c+fqBICSueGWRTo7uFvUuf/nqHwEr6nRwPyNytdfdJHbCgDvPPIkeNbkEEz9w8d6zI7qZRmAPkekf
	1e4u7p22ugquHtLt6tjgbIa90tyJiDOLG4aPRfO3ILucy7kuCSRoKU/MfcCUM09bkA5H29BUYPh2j
	ndG6nt6ITMFkdgIs7d0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGys-00000002deL-0R05;
	Thu, 05 Mar 2026 22:15:42 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGyo-00000002dbQ-2PK7;
	Thu, 05 Mar 2026 22:15:40 +0000
Received: from 34.1.168.192.in-addr.arpa (2A02-842b-8136-0001-1033-1579-E8Cc-83D5.rev.sfr.net [IPv6:2a02:842b:8136:1:1033:1579:e8cc:83d5])
	by courrier.aliel.fr (Postfix) with ESMTPSA id BB5CF4A56F;
	Thu, 05 Mar 2026 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1772748930;
	bh=MDPDvWX54EIzBiBuHUn/Aek5yD+kq27hlEvXjqO8q9U=;
	h=From:Date:Subject:To:Cc;
	b=Juj1hjdaTS4gqtBfcUQrRis7u4eJ/vkB3H7heQkhR8aTp831SXwMbTVpheuwa5Es5
	 fOZGbwPGN9fccgQRNJOZw7iPENvnY3dQstHJ6zmTwL5WJGboFM5/sXwscpGd6xHsNa
	 EIDlBquD+vfKvdweTFgUt077tu65RRligBXbhK00=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Date: Thu, 05 Mar 2026 23:11:25 +0100
Subject: [PATCH] arm64: dts: amlogic: Fix GIC register ranges for Amlogic
 T7
MIME-Version: 1.0
Message-Id: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL73YIPSOoq0UfoZgtloRKBdPekz
 4GZqZApMWUYRYVEN2c+YwPVCXDbEgMh+8agpe6lkQZXfnA59mIxsENfMlrv3GBImV5paN2VqEn
 /c5rf9wMyw58RYwAAAA==
X-Change-ID: 20260303-fix-amlt7-gic-dts-7dcc93e13612
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1772748929; l=2389;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=MDPDvWX54EIzBiBuHUn/Aek5yD+kq27hlEvXjqO8q9U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBlVSZU1SuoR80Cb0Pf7o9GsnKQNlDlTZVb8I9zS9pOyAJmcu0zAhwete0dfovrGxBWCmaGC44T
 Y7HZa3INOTQc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_141539_062406_3D18B804 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch aims to fix the GIC register ranges for Amlogic T7 SoC family.

- Context
Kernel log shows a warning about GIC
[    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set

Using cat /proc/interrupts command shows GIC as GIC-0

Adding some peripherals sometimes causes hangs on interrupts.

- According to the GIC-400 ARM doc, the memory map is like:
0x1000-0x1FFF Distributor
0x2000-0x3FFF CPU interfaces
0x4000-0x5FFF Virtual interface control block
0x6000-0x7FFF Virtual CPU interfaces

- Identify GIC model from distributor register

Offset | Name | Type | Reset
0x008 | GICD_IIDR | RO | 0x0200143B

kvim4# md.l 0xFFF01008 1
fff01008: 0200143b

- Identify CPU interface from CPU interface register

Offset | Name | Type | Reset
0x00FC | GICC_IIDR | RO | 0x0202143B

kvim4# md.l 0xFFF020FC 1
fff020fc: 0202143b

- Virtual interface control register check

Offset | Name | Type | Reset
0x004 | GICH_VTR | RO | 0x90000003

kvim4# md.l 0xFFF04004 1
fff04004: 90000003

- Virtual CPU interfaces check

Offset | Name | Type | Reset
0x00FC | GICV_IIDR | RO | 0x0202143B

kvim4# md.l 0xFFF060FC 1
fff060fc: 0202143b

- After this patch there is no warning anymore.
GICv2 is correctly identified.

[    0.000000] GIC: Using split EOI/Deactivate mode

Using cat /proc/interrupts command shows GIC as GICv2

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6510068bcff92..d523cbc0ed22a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -213,7 +213,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 

---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260303-fix-amlt7-gic-dts-7dcc93e13612

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
