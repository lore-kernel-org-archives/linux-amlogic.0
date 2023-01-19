Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B526C38142
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 05:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FuyFievaNvPZg4vs01E8/UD8z730mCN6HVL0BuJXkZ4=; b=GOAArbS6kaHe6n
	ajTW1brxt0tuejm0fZebqQX30FVBJ3TNPndLzUZCYjWfIljCv3F5X3YKHX0OO6s3juTk4nXcZnCQb
	qJCADOf34fDqIo3dE9UsWXMdCUYFWvqEEXUvTf7LGq/YWhNZ8Tq3sQtSg8w+4THC9I3fIdt/zws4w
	KUMIjjfqT4jnCg2v/UF6AFcctf6dcMjAXYF/ocTzWLC69UsvI9OSwj9ghQHswuBKCiOElBpot2mL5
	Ged6ZLkH6sdf3AgwcWcj93++P9ip1rDwCozfTwaZQH2pON5kUWEOS8cMjZNKW9hp8RB+v6/zFL2pb
	xaHv1QpR4/OHF5ujmLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINVq-003g77-KL; Thu, 19 Jan 2023 05:30:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINVf-003g5I-2C; Thu, 19 Jan 2023 05:30:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so2791804wml.3;
        Wed, 18 Jan 2023 21:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2/XB5nocOcz71QrQT5RaGDQw4mHrCDFlBceveHpJws=;
        b=fgDrE8OE636Axhvs8Lml+cCcuTQCUQ3tIQGZGfszJQbL15Y6MB1s5qgXmfdl/gtjcH
         4f8H5rVpgBL88MNsCqOyrWE/SJpME1Rvm3qmPfYuyDf//rjSI1AlxZOsmFFv+RPG5Ip0
         UwdT5DS96/BoAmZ4+dwGog+uvQvQKlZxX11OwT7AR5yYyxZNPcGQcFpdNtjn9dfVsU9T
         hzze1H8WwkdArdbeRUrL2cZyrXOLacd9q9mFtFGP62I9bHfpQm3/81p2XS5tRFVrAVNy
         IeeNfkB38/GWcaL9igVXh6v/UAMdfvU6qbEm9MuYOQ9RTkbxTlL9doZMIFKvhtiwCffE
         qqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2/XB5nocOcz71QrQT5RaGDQw4mHrCDFlBceveHpJws=;
        b=jPadQJfeENA+TLO0xUdhFe5sX0cwlDjKyYfNvS1x1OG2/E0ITZZkFGu8ur1Qs+NKGq
         eCIrJrdDH3IH7NvUb1x6o2xUa6RhsZv7l0HB7Zr5c0uqGeROx/f9FO6/Kx31iCzVZqZu
         aQ4xJDfAEXzXIc9EIh+Qsh3kpNSlcKj6+y6SwxloQ7Jige1ZaYakpllJZqGylbFbdijM
         STAd2dFIVrIV1YyuAqAilqnqhewmD0LFxUGgWLt6fKHabDFEqe7njf/No0DMkDhNoqRn
         MqU3DJ92+7XBO8xPGrK86YE0kWWUIqyENoCvkCEPzn0nxLipmWusWxKaRO+m0L3FctWk
         xXlw==
X-Gm-Message-State: AFqh2kr/MTKA0zGUlWWg4ASNq+hq2ngABcLdkXIFIoOzawcTVMV1ZBXv
	LxXz7wmov9OenvqtfukemBg=
X-Google-Smtp-Source: AMrXdXvZG+5JyX7tCrSg0+qdoNIZWu8cTzu9QPwzTNMQg4F6j1BoIm8ZtyycdVguMOiAWMPmO0H4dQ==
X-Received: by 2002:a05:600c:1c8b:b0:3db:fe:f84e with SMTP id k11-20020a05600c1c8b00b003db00fef84emr8654045wms.1.1674106236017;
        Wed, 18 Jan 2023 21:30:36 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d9f14e9085sm4235381wms.17.2023.01.18.21.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 21:30:35 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
Date: Thu, 19 Jan 2023 05:30:31 +0000
Message-Id: <20230119053031.21400-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_213047_128443_1F93BD62 
X-CRM114-Status: UNSURE (   9.47  )
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

Amlogic G12A devices experience CPU stalls and random board wedges when
the system idles and CPU cores clock down to lower opp points. Recent
vendor kernels include a change to remove 100-250MHz and other distro
sources also remove the 500/667MHz points. Unless all 100-667Mhz opps
are removed or the CPU governor forced to performance stalls are still
observed, so let's remove them to improve stability and uptime.

Fixes: b190056fa9ee ("arm64: dts: meson-g12a: add cpus OPP table")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
It seems we (me) forgot about G12A when pushing changes to remove opp
points from G12B and SM1 boards in [0] and [1].

[0] https://github.com/torvalds/linux/commit/6c4d636bc00dc17c63ffb2a73a0da850240e26e3
[1] https://github.com/torvalds/linux/commit/fd86d85401c2049f652293877c0f7e6e5afc3bbc

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index fb0ab27d1f64..6eaceb717d61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -57,26 +57,6 @@ cpu_opp_table: opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-250000000 {
-			opp-hz = /bits/ 64 <250000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-667000000 {
-			opp-hz = /bits/ 64 <666666666>;
-			opp-microvolt = <731000>;
-		};
-
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <731000>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
