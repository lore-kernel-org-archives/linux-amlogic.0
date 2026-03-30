Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AD110D14AA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QIapTqSLKgAd1uLbX7eUc23uPwpO5SXCvk5TyHg+mIA=; b=aMNZ3kINg05P0X
	BUh7DQWXA0zmYQtz4imzS+Ejly+kw7GoGBEKjdlMxkPu0K1R9/kq+r47vt50jOjuwhzm42em7LRE3
	5X1iTJx+1T2KRpsERS6rm5HsxBZjp81OBbCqMDSa66Qx649Ie+jjExWdHnruFrNqOSpLAEtRUFtaI
	bz7pJOimD5KkXPP2khus9sJcKDooROE6htZ72w+515iY+5eEtI7OydgzykeLQoLuTA9S0k1ILtFde
	r6jC0EnwAq3jhcsNVTciNVgbImKX1t188i3vPLBVoKvsI3L2TZha+Y+nSyCNTJU9F7cxECnvS84op
	YgvE3kAvKSDKvrxjNAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BX5-0000000BEBc-1vs3;
	Mon, 30 Mar 2026 12:15:51 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BX2-0000000BE8a-16pq;
	Mon, 30 Mar 2026 12:15:50 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774872942;
	bh=xVUcmfduypkog0Ts4OgYZx4Y4alW8vHomSxuHp689Vw=;
	h=From:Date:Subject:To:Cc;
	b=sLfjiDPlp3MMpmzVuy3aO04stshQ+TFaMkY+jL51L6hDoX2nVunINKeH3294yIxU6
	 WQq+IroKiUqlcgpbuWeyGWIYD/x51qakxziLv6/3wMgOGiVBxY33tWQNZ3pAGLRAo3
	 0W6U1fUvLBlx4ULqSLcdmGYqea6dDQzVwek8bAHg=
Date: Mon, 30 Mar 2026 14:11:21 +0200
Subject: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid
 property
MIME-Version: 1.0
Message-Id: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw6CMBCGr0Jm7Zg+EMGV9zAsKJ3KJATIlDQSw
 t2tXMDl9z93iCRMER7FDkKJI89TBnMpoB+66U3IPjMYZSplrcLAH+QpdSN7XGReSNYNnaNb6Rt
 rw11Dri5COXfOvtrMA8d1lu18Sfqn/hlMGjVSbZq+9LWqevfMPo3XINAex/EFBk6IIbcAAAA=
X-Change-ID: 20260330-fix-invalid-property-bbe54d933f71
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774872941; l=1587;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=xVUcmfduypkog0Ts4OgYZx4Y4alW8vHomSxuHp689Vw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFe8HkgC5Tzzi505mPD+oo6xvu6CJSbvqSzoHf8z7fQX4YThiWYbKanG0BszCUiQodatWAkaYjr
 nqaW0+XUyGAc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_051548_796565_1FD44197 
X-CRM114-Status: UNSURE (   7.75  )
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

Fix introduced invalid property for Khadas VIM4 sdcard regulator.

arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@intel.com/
Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v2:
- Add Fixes tag according to Krzysztof's review.
- Link to v1: https://lore.kernel.org/r/20260330-fix-invalid-property-v1-1-e829c4d806cb@aliel.fr
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 11bfbc99191b6..003b3bcdaf2bc 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -65,7 +65,6 @@ sd_3v3: regulator-sdcard-3v3 {
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		enable-active-low;
 		regulator-always-on;
 	};
 

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-fix-invalid-property-bbe54d933f71

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
