Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3B606A32C
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r/VRsxXL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkpRrorW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2xKiSXdic/LvXy+VujEhsJ4zK6hA1iw2jYWR25bit0c=; b=r/VRsxXLFIJPMDkla5TUUwyxkt
	PfkzfDgoyR6FmAPGWJ91yn9zFNifRoPUx+e3uGmiE2Lke9vH8UJ+qAfw3rXTpHMrnC6S7UD06fg9e
	vqojUZRAXXdPQ9vmMRsWbZ7pctem4xaDX41071ztxvPyRFlqIyAuXwMBFgrASbChPd1MSZgZyxmfI
	9qMNVe+TlzEC6dqfgWc0XRmN2KIo8orNsWavBdQD5vSklvfi96EYPLLXZgKm9PPjhXpWp3ODI1KE0
	cZCKxbO0e62b8wSSLP56QijFo4oE0ioLh8QomLCcLlV5O0mI2+Si5PzIzLgrvG1a8ncSVoQlIVtmp
	qrf5jp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHgB-00000003D0N-07vE;
	Tue, 03 Nov 2026 16:48:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHg3-00000003Cyi-2EaW
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:48:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28530045e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724480; x=1794329280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=NkpRrorWl6WxFx7tRiYB7fZKMwKxF5XqZ8p6swpZHwMkZnjDrNC+d4+VUEKa/cMFlQ
         OqBWjst1RnPpIPyh/ipcyujJGN6DDPoSWvHq5F/Pq5guL/MdpfN4IQmKPMAnXF5S6nQJ
         5bGUESwKAi6MFOyxMMn457roczbucVbAdecHBap3SUdsgm7IFB16sqk/leD+vovHrm4R
         zq/BS8cXwKOGSyWeOfDRBgHanNKdx1PUEDl61UaTnFEPmLRb0WEa+E0+esEJc5X2kbtn
         AyRbcKSjKBkl5sVSQYpwFMbnSAlG/Lc82yNCGpFcQDpvPGJMGoviX7PcjOtWQR23e8To
         THsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724480; x=1794329280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=Ut1JcLHr9p2CccUrRWbJ4Y5JvtmEXSuMKQnYAuGookxGI79lR3TqtJICFqazCkAmZG
         S1o3AWdT/w/JHd3wDqQDqKacmycHMkhdXEYBvqsakPbU5Oh6sSTC4L53YE6u6pchISm/
         +b05rUC8BQeY7CrAfh04hLHsTgx/eorjJlJgCh1pg0CSIOtF4jNVn6uvMuG2PvDqUubB
         LnjHha6rjT/l+f+CmS2AqrqQiGHawHcI9VSTA2EYcxL7n0Xxe+NbpX3B4YXcOsG3raEK
         R10r+d1P22VYtq2sOp1xYFGxuZIiORzAE76f4DAjXrJxQ3xCGeJQ3GDP5J88rj3IeNK2
         UrlQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0Q8fa8hXzPM0jFwzk4Z7cfkD4XI4aIS9sSYnqnWnojZDFN92ZCz2mlPzHTVJEAapVKs32kYC4OVLZKsUz@lists.infradead.org
X-Gm-Message-State: APuU4Z9qevF2EK/xpZ/YTnIK6lm5PE07My1NrNn/H9//AOweHViY7iJH
	G43nBxt8Azs76QAF7IisaCBStkpngm+7lW3EbeIKNT5KVSD4ZU2UMMHV
X-Gm-Gg: AYBFou27sHVsFcgdIHZgoftLBQNtCssi3UYjrz6pi6Ee2JKhcpcHe4yJM6GE/eCyL/P
	gtKnc8zPvT+rlwj2o4xFPRPettkJeCy30B/3PVTXrs0J6AMeBgia5/wR9UgGkUQD4Hyfk6B8Fsp
	ylPN4p3TN92ZOKF/YaxWZCyDOF3e57IP2D2CHY1yyY8KORP2mKVzrUwNU0w0oOA0XzRNCsqcA4X
	tMVZIkQsEwPmVyKVr656ESEw5IeNN5Jy+zK6camtuN3d3jWzyYRtgsDSQVG/rFVug5i4Vtqxm3M
	HsJtl4I3aSmD5Zuy2JDuzbUL+TwuEF76d+FbltJ7bI3q5SURkegAc00LrdvC2Dwo6HOjVt/odfN
	0r7maFNbu8mj4ROU08StBycKf3I20KiP4RyZhHLV0VsgbK355vO/WExFE+hTr7A3PvklTp+ApOD
	km4w582HBnZiNzEHIlJUf6PervJLSNR7dfLyiZX/pen1XkSMHwE9zdSesXjTEOj3d2yqrocr1pK
	ZcKMtl3kNcoBziAkjDp92Zwj/nk8VR4os5Cak2FAn/zWUgPJUA8/T8HbdPnIot8nVmTJ/WHVN0q
	ebdUeYTKed6bZo1xs3+cs4gLnS/ZswwwL1AjRNE2aBrxWz7mEixJfGPjgo0f1fjCDiQ=
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr276786925e9.28.1793724480320;
        Tue, 03 Nov 2026 08:48:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm79469835e9.0.2026.11.03.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:47:59 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash overlay
Date: Tue,  3 Nov 2026 17:47:30 +0100
Message-ID: <20261103164730.160593-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_084803_585347_1EB6A379 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
device.

The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
nor_hold_wp_pins pinctrl group is intentionally not used.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
 .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..3714cbaaa03e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
@@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
 meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
 meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
new file mode 100644
index 000000000000..c70780b11b9b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
+ *
+ * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
+ * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
+ * enable the SPI NOR controller, exposing the flash as an MTD device.
+ *
+ * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
+ * nor_hold_wp_pins pinctrl group is intentionally not used.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sd_emmc_c {
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
+	bus-width = <4>;
+};
+
+&spifc {
+	status = "okay";
+};
+
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
