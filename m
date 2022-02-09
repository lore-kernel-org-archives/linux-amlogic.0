Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D68C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Feb 2022 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MkAZ/9V7DG+2RZxf7KM6tY+6ta8b8oK03sZBu2VeHng=; b=yWRwppcK7JQQiv
	XiI/Mw4NMdF+9QdO49adi6BbNQLoNfuFTaVygb5+n3Oh5DI+MBNjO6QcnOjAxbYbdbbiOZxNRVOwR
	suiNUE82Hm2A4llSEJGX00k5ZdftLhCEQvwyfb2CH0TYqMQhbED0kRMPoftMUFYkRiDh5LpiIi77y
	Wbas1C4Wr2xVR1OAwpQMde2O5kHWcNyercTqgHjzicUmoI8gSdayVnbZIe0/w16axLWKQhkNIUNkC
	gDuNArTiimYGZP2/xoXb2PPsggFpqldrfW3BF99h6LkwBjCiPRFFfw1V9lPcbeqgbTUMhOuJ28ada
	sqK7pew65mQZet6qjL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnUd-000GuS-57; Wed, 09 Feb 2022 13:58:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnRf-000Fhx-CW; Wed, 09 Feb 2022 13:55:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso2403160wmi.0; 
 Wed, 09 Feb 2022 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=7U/uYfF5BBXdgNLHE4+fM0Xnr2orfhJ3kV6quQhuKN8=;
 b=A1Raudlcg8KbydfuTRJDWC+KE9y+kf05/OEpM2s89EkYAhXlrrtpi9qGKOnu+OqeMj
 gz2TEjbu48jg57g5SiHYUxrwLtZEHADVglTk2P8p5a9fFeCfUR3mp41KaOUHsr2Gdr/9
 2vBvYQjnHuYEtFoMhYKZtypiLMju1EoF2zOHQl2wHIWtcp2+LJDSC0NlnZbiVoYZp7E7
 y0/JqL6hg1PE7TU3cm7stqKK+T3i7EZCVnwFjvwurHJMOOF756CQxi6wcfoTlZhKGTfc
 SB0pcp3mDEPsC/pUEVdUa3i3Fg3QZgx2zoQf+qQ16qWiel7aCQdLbm/Us2DB8RFLZ0E1
 tAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7U/uYfF5BBXdgNLHE4+fM0Xnr2orfhJ3kV6quQhuKN8=;
 b=RtvbrDjWvkORm2d0SylBaTf3ca22oFdhM1JQeKemg8flfOubvKtC0ymFOu7qE8VSXj
 3u0KT76259w0dSul1uRrJte748PK38qUdCw+65NngcBxBKQe86s+2QwpMs90+HYcuYCX
 PMTHnvfjQ+RY9vKBnpw+qwrRe2cBRvRpS4leAk8g8zhFDUlJMiJ6WVtv1lmYBbaxseEI
 ynfA+BrO9KbyUgeXuY9dB75Kh8/yD+o67FmltHTLYv8xC9hSuU/tzfCrTBrGxTi7mnrE
 OyMtX2qS3uq96N2/e1RCUHeEN+w85feN52/Ofjb3sADSztffslkTcKMc89YQlPqmTN7w
 ybXQ==
X-Gm-Message-State: AOAM530iTmUxRDy2iABV4yY6HKr6O3NCQVKsz9ddk48w90uFO18iILs7
 rALYt1MEBPpELzJir2Gg9XI=
X-Google-Smtp-Source: ABdhPJwxjFBgHIB+UhKYGiBo3CoUpqS8lR5s3DiuLtu+98fiXKhZHC3z5PVCNCW/puAce4XBpJkvlQ==
X-Received: by 2002:a05:600c:a03:: with SMTP id
 z3mr2688181wmp.73.1644414940868; 
 Wed, 09 Feb 2022 05:55:40 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id g14sm3014309wmq.3.2022.02.09.05.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 05:55:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12B/SM1
Date: Wed,  9 Feb 2022 13:55:35 +0000
Message-Id: <20220209135535.29547-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_055543_508390_9D032074 
X-CRM114-Status: GOOD (  12.60  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12B and SM1 devices experience CPU stalls and random board
wedges when the system idles and CPU cores clock down to lower opp
points. Recent vendor kernels include a change to remove 100-250MHz
(with no explanation) [0] but other downstream sources also remove
the 500/667MHz points (also with no explanation). Unless 100-667Mhz
opps are removed or the CPU governor forced to performance, stalls
are observed, so let's remove them an improve stability/uptime.

[0] https://github.com/khadas/linux/commit/20e237a4fe9f0302370e24950cb1416e038eee03

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Numerous people have experienced this issue and I have tested with
only the low opp-points removed and numerous voltage tweaks: but it
makes no difference. With the opp points present an Odroid N2 or
Khadas VIM3 reliably drop off my network after being left idling
overnight with UART showing a CPU stall splat. With the opp points
removed I see weeks of uninterupted uptime. It's beyond my skills
to research what the cause of the stalls might be, but if anyone
ever figures it out we can always restore things. NB: This issue
is not too widely reported in forums, but that's largely because
most of the Amlogic supporting distros have been including this
change picked from my kernel patchset for some time.

 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 40 -------------------
 .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 40 -------------------
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    | 20 ----------
 3 files changed, 100 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index d61f43052a34..8e9ad1e51d66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -11,26 +11,6 @@
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
-			opp-hz = /bits/ 64 <667000000>;
-			opp-microvolt = <731000>;
-		};
-
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <761000>;
@@ -71,26 +51,6 @@
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
-			opp-hz = /bits/ 64 <667000000>;
-			opp-microvolt = <731000>;
-		};
-
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <731000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
index 1e5d0ee5d541..44c23c984034 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -11,26 +11,6 @@
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
-			opp-hz = /bits/ 64 <667000000>;
-			opp-microvolt = <731000>;
-		};
-
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <731000>;
@@ -76,26 +56,6 @@
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-250000000 {
-			opp-hz = /bits/ 64 <250000000>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-667000000 {
-			opp-hz = /bits/ 64 <667000000>;
-			opp-microvolt = <751000>;
-		};
-
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <771000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 3c07a89bfd27..80737731af3f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -95,26 +95,6 @@
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <730000>;
-		};
-
-		opp-250000000 {
-			opp-hz = /bits/ 64 <250000000>;
-			opp-microvolt = <730000>;
-		};
-
-		opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <730000>;
-		};
-
-		opp-667000000 {
-			opp-hz = /bits/ 64 <666666666>;
-			opp-microvolt = <750000>;
-		};
-
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
 			opp-microvolt = <770000>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
