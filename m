Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BC8C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wc7Ci79c1DbADVjE3tr0XW57/UBfX+IG8XRuS7R+4FY=; b=r9jjZKsp+EWfmP
	PqQZ8RfqwVOpb5gejC3jiDdOFP5OcbOB0kH4aTWRL+X37WhDrBSU7ZkyflwQf2Nfo02FgiB1niLHS
	TjaPSB9vUArxdd2iQx7uPRxaGoxEJwXPKtiX+2XW5tSW/3QUve0gAejvh4zfaAg9dbQoLty01Fzxf
	lNz08rwax7NmrFSk9U8bLCNzJIuzp/9dlQ94pShnxQeHiznRWnUvNcMMW3CAcIDg3q9krEqTUtV2f
	g3tmfkcX7Ls1iIM8ZOk7TwZymHgosnlf26AhVY7PeCEbEYVDIdwjrt2oJWAj6y/jD8OIWs57B+IjA
	z4sGkaq2+kAvRtbOxNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI6M1-003Ovn-FL; Thu, 10 Feb 2022 10:07:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI6Le-003OnZ-AN; Thu, 10 Feb 2022 10:06:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id v12so8624658wrv.2;
 Thu, 10 Feb 2022 02:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AdLoWe4TJ+d53isrSfLXpob6bEFDfaz15GEr9DTK+5k=;
 b=i5DEQyEGksT5axCgpBQ1hQ2t5ZMnMcozV7HGcpy2jwPAYpT8q8dpUJ8/nSTFrRtnyM
 L3j0GOzou9gTl6wm4a42frUCbFNfR163XJko8qIlUEZYnxb2Ua7EOiNLGBdX75esOlWQ
 iUu0UC9xZYkYjFsKhsllEGVB6vxDqCxNb4e/XwBJg0vH1NxaslaAKqNZx8bFqO0VGzQ9
 3Q0YZ7zOMn4Cxbj8eGJqkYxDHVdHznGS300aTWzKI8Y6RrX7AA5RnC9C4Rdq7XtToZEQ
 kzkJYX1oZ5DAcFLIGbOac9AhgRl8Pke6XWjKtu6dgjKC4hIkCnHtB1hpXVxgBrcy+nci
 GnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AdLoWe4TJ+d53isrSfLXpob6bEFDfaz15GEr9DTK+5k=;
 b=7zHeDDFbGIZy3xyxVbTmFpqb6IcOPjqvFuPzS05AwhWnd7WosduCVgnkEyVv1h89Wt
 5TwCMiSFMCpJPL2lCwb9D5wmOEWt4jIQMdEU2iI18pz1caiplb9Nq/YBY7RDvSTYhSpD
 ooZ5yTFldfP2/MAacpEwpdN76qfeZ/1lEapNd9isSbG7ar2cRmq08o8Mntk0oA9eL+3R
 FyidMA/HS0TUCvLXT2V4cFB2kXrOt/634LCkmlRFtUutjXjCwUeHnk8Ub77lwxFfwHMu
 JMqeF3q3smF3mm3RdjWzwjG2fYKtXmQnv9baSmgp6qMFQbp3ZUI32NyRFsErWkz3XTgl
 lWIQ==
X-Gm-Message-State: AOAM530EPpdyneD5GYwqhUEMZRWaFVuyuOLNujA7/YAJm52xeFrEhE/8
 S06+zCArApdMJMAbS25DfEHS/dJPvthyOA==
X-Google-Smtp-Source: ABdhPJxmA/ljjGJKtGRHJ20kdMBzpoWVuFUelKr1w9SqGyTwgL721t8XnS/soD648KPyCk072eEnxQ==
X-Received: by 2002:a5d:48cb:: with SMTP id p11mr5875288wrs.229.1644487605013; 
 Thu, 10 Feb 2022 02:06:45 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id g15sm18817494wri.82.2022.02.10.02.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 02:06:44 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: meson: remove CPU opps below 1GHz for G12B
 boards
Date: Thu, 10 Feb 2022 10:06:37 +0000
Message-Id: <20220210100638.19130-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210100638.19130-1-christianshewitt@gmail.com>
References: <20220210100638.19130-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_020646_381951_D0D6B5A4 
X-CRM114-Status: GOOD (  11.91  )
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

Amlogic G12B devices experience CPU stalls and random board wedges when
the system idles and CPU cores clock down to lower opp points. Recent
vendor kernels include a change to remove 100-250MHz and other distro
sources also remove the 500/667MHz points. Unless all 100-667Mhz opps
are removed or the CPU governor forced to performance stalls are still
observed, so let's remove them to improve stability and uptime.

Fixes: b96d4e92709b ("arm64: dts: meson-g12b: support a311d and s922x cpu operating points")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 40 -------------------
 .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 40 -------------------
 2 files changed, 80 deletions(-)

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
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
