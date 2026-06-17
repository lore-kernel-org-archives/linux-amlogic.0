Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00CFCD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwBNZ3ZB6vM8se60Qilb1IhiwXANdH0/oTmxVSfj34o=; b=2AhoAxMgJuxhae
	B2agffVCrQWkpRHs6js3uVfrwH3nHcZBEe38vEXvQJ6RYYhqsPej2ZXY8fC+nvOQcV5LfkpOIWPso
	6kcUqSONE05UEmNLXUx6jXNthxXW6KUxtXdsri7QFHWurGZKy+sHd44KPFCsR+d/Yu6mzsJLunSWU
	SndAiwlWEU/dl+Ht6F1vKDmn+nCFtSOIOQpFeqfR4ypc8chl0ZHvjf6eMsMDzV3P+tfMlijOJ4sMp
	ymwJ0hW9mGq3ZeKNZ3boCpD/vAL7QM8sn4GJwehF1iYYNV2uWT0JeQhv+5TPjJkrKsZDJ1hsWkj5k
	ZY1/eY6IUfEWEwRsjn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYO-0000000GsK1-4020;
	Wed, 17 Jun 2026 08:23:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYN-0000000GsId-1l0J
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 08:23:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c168baac83so24593345ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684599; x=1782289399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=Ib+ZZ8yBAjT3j7MQm1o1nJcxqEn45NLO03EpyGEMAa9bFYKAqFSldjV2n0t44RtxGT
         /i5ESBlbb9yuxYON9F+Mtk1SPqxG3HlkKAJ6U5pnu7wmE6dt/wX2yYdtZZ69zorp7Jph
         518dKDNqA+L/HbRd+5uhi/ey1dZk1BdmvYqI5EgAfzvKkoRZvLJwF8/UPKKbi6G0Qtm0
         qd8G7afyTlVHzipT/z9yVkAWLJ1vXVNctlTyu/AwhjmrIjcV5KriCsbjQovp+nA8a+re
         hAwnXNW9XaiGJwb78v9f/GeyobRHGK51Tq3EGjNfiOnO2dsGtm7iZxUv6vAQnbyC67Yc
         EB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684599; x=1782289399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=k7Dc/4Csbb+WnhbQLFocM14tFhvRhTbc7zGWeV/UcUYFuxczt7yyuEhI6195SLw5fN
         hpnoFQCi3xKUmwu7tZZn1d47riQbJULgcbx1NyYKZwnJ729l0diqWmbswgVHL5rzUkBT
         k/9uNdb+O829XFNwrYC+KccBwnRriZL8TFNauBMVi2n/EeX1/AQNbZg5A49FfGnYxzeb
         VqOArn/OB4pTkb7JxmHrTYa/kiK9xQmgmc3QoN1O8/x7QGfaeFrC7NENcSakvDxcnqmQ
         41g+KMV6/EEyLeHDa22d/7HLK61/TYUn49nEPj25i87J1z20JKRCwzTeJ0ih4CImV9rv
         uhZA==
X-Forwarded-Encrypted: i=1; AFNElJ8+eowm2UrGPqPoLnv/K4MF+GEIPTwUaz99NQkTjHtjYKbJGEhqFRXO1Wqt3lO4Cxd+mUN3/Gw1/ux9zbU5@lists.infradead.org
X-Gm-Message-State: AOJu0YxR3iqNcLcDOMr4WRrXYpDFvd248U3xjiifljQnWajPoJSdReLu
	qy1e87cGYlpRGJRvhxMME81Eh33t8Uh9JDc3P2BycixmSSQIqhvrqE9/
X-Gm-Gg: AfdE7cnv193me9aa2AfCIb5Ol+F4syqyv20jOc4X2LxncXhESHNoNwpaWwdgne35BPZ
	al9wbvXnNNtWkCU1MIQjucjHHdR7gw9SX3bo6XKTNg49E+GlWsKi9KCBvUMa36wKuAExumAAMiM
	fZhAA8Iuaz+v/XUyjlVuAb56puzuPtAkCefg61m84ygH6xfxOiU+2StxpoM8twROp7NSISv/Aqf
	xSV5vbaBG8rJkPSXAT7E9FRp1xY2J9XUkEqZWWcljpgB8whl2QxGI9MNQw000pHauuvj0leHLRr
	HNl6BQwDCKlipB+v/u+mzb2kAw1yjTpbtyrgZ/eDASnfW7rWf5t5A4/5gIFKkJLeKCHtpBYJWBZ
	/fXIeRapRkh6tHAC2f7f4v4sURwgSCysoo1oKBwONvuuniVsrquxkthnW3ffHkcalKX/cwHZHzx
	yv7vWV02v52g==
X-Received: by 2002:a17:903:3c46:b0:2c0:bcff:e191 with SMTP id d9443c01a7336-2c6bc27199amr27006845ad.36.1781684598761;
        Wed, 17 Jun 2026 01:23:18 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 17 Jun 2026 16:22:34 +0800
Message-ID: <20260617082239.645562-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012319_460044_3242C6AA 
X-CRM114-Status: GOOD (  11.46  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
