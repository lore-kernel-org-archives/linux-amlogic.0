Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50749C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 May 2022 21:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/rQHQivs8jFloWpfb2RennNqPcdyhpgO+5pelseJ65s=; b=igN6zkxbxox7jw
	RkQx1wIQLE8bQ1s7k8zyYmO8DHTMF+sUXzioQLtCtr0u9apt7gJ94KOOej9rl/OIFaUKY2GQ45jhR
	tD7NnzAd0tntAMrwhm3NZL4ir53W7MYW/o33MZkYlSrWSMSKNWJUni6GngAM8YJ4Kz1ZePnFcLhFY
	L8SOOef85zN9+/ohy2jdrAC2gEY140mrRZK41Ug6mUnrRAe52uYScxF/pvLiQT1prx20K8chujzGB
	T0wLYnlydK5BPv4tb7rtrV42RTV/e3gXvPV+Qq8v2WgvxYQdJ5ZkXtrtDcP9SBtj/uetSExIYzxDh
	pF5fsiBjq6dPbQyNE9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKbx-00Fvp9-7C; Thu, 26 May 2022 21:01:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKMy-00FpkL-Q6
	for linux-amlogic@lists.infradead.org; Thu, 26 May 2022 20:46:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id y13so5194235eje.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 May 2022 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKFl69Qf/EfZisA1xjfBE06TiXrFDlro+owcvXYxfLs=;
        b=OPrJTmWWghJxejBwqiBJKnQTE203iScML6t38O4ge+iX4qrqf9UUL8F1yxMhy9/D2I
         vtU5EtfG4quCCB2ZCn7woUy8Nlfcnv6W5+2drvtJ1F47aHI0CBGa6KfwacFvANbHiQao
         m3YW06Doa442ooxkosamZ/z07i70Y14NmNCWJbkzdISVa3PiF39J7UMufwc0qNQQB8ef
         Z5aLWglU/wPFO1tD7Oz7/WJAfzKfC7X6M5Hm/VD4FRMeOyTIjryxWRjYBVdpBAtWMojw
         6Qj2YFapZvbVb/Jm/d+V7ugCCRHN1STPy/TpgRt/Xu2neoZSth7ha2V06YLazxgi8ONB
         CqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKFl69Qf/EfZisA1xjfBE06TiXrFDlro+owcvXYxfLs=;
        b=xsxdV5TATCo8hdKhI1ILJi/nkxQ82HHiI3ptGL5RVL/L32TJ8iPx4KsndI05/zgY3a
         sKzY34OqbzTw0ujwrIqH0hLjwBWOpya5jiMmmANwfkKqVN9+OBzHTeeJ7TF6ZxMYgrRk
         iPx5iVnpdy0LbRe2OBQyIDibBBX7IyrmCZF/on4TV3NZCgAS0G+/O01Mm2l3GxvfY4ln
         sgX+vkH0cLzbNlrumfEPkRfjdIuvkv6S9h9VNFbHuLDGbT7RtDhoGGMr0P+G0qAlh5kL
         youoi5cOSyH2GbB8sciE75EDMgsizsmB36MF+RJvIHzX4p7GVXAaZbMDB3Cjdm137E7m
         TEdQ==
X-Gm-Message-State: AOAM532BftbY6TMtgP6kgcHRy08FT6XiLoDM3BQl56yN5cL7V328F/MJ
	rrqK2IbA5X+h+qNUaz2hIuW+h7NLS28mZcPC
X-Google-Smtp-Source: ABdhPJxjg7MxB9+eNd5wcXXuMUeFFezHj5yR25BZpYg2A0ogiMJQ3jbwAK7yX/hn0Rc1JtM5uBcpOw==
X-Received: by 2002:a17:907:a414:b0:6ff:2e46:e891 with SMTP id sg20-20020a170907a41400b006ff2e46e891mr2501719ejc.758.1653597956660;
        Thu, 26 May 2022 13:45:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709067e4100b006fe8ac6bc69sm827633ejr.140.2022.05.26.13.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:45:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
Date: Thu, 26 May 2022 22:45:51 +0200
Message-Id: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_134608_890768_796F4B70 
X-CRM114-Status: GOOD (  10.52  )
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

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                      | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                       | 2 +-
 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 3f5254eeb47b..04f797b5a012 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1535,7 +1535,7 @@ aobus: bus@ff800000 {
 
 			sysctrl_AO: sys-ctrl@0 {
 				compatible = "amlogic,meson-axg-ao-sysctrl", "simple-mfd", "syscon";
-				reg =  <0x0 0x0 0x0 0x100>;
+				reg = <0x0 0x0 0x0 0x100>;
 
 				clkc_AO: clock-controller {
 					compatible = "amlogic,meson-axg-aoclkc";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index aa14ea017a61..023a52005494 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -450,7 +450,7 @@ aobus: bus@c8100000 {
 
 			sysctrl_AO: sys-ctrl@0 {
 				compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
-				reg =  <0x0 0x0 0x0 0x100>;
+				reg = <0x0 0x0 0x0 0x100>;
 
 				clkc_AO: clock-controller {
 					compatible = "amlogic,meson-gx-aoclkc";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index fcb304c5a40f..6831137c5c10 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -216,7 +216,7 @@ &uart_A {
 
 	bluetooth {
 		compatible = "realtek,rtl8822cs-bt";
-		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		host-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
        };
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
