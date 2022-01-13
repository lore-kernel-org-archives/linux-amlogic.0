Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50709C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 04:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w54fy05qSop1RjdQ56ojHEYDVjdjp1wAkS8/l3DKVms=; b=tTtF3qzRbcpK84
	MAzxpBJvbDUKEViXcWGpmXK5Mv6Dmj9QA576aSFIDsMjb/jaL3dw5qax4kyyjxLkDOz7LCWDsQ2vK
	fEmhgWzFf9A76DBRmBJpA6ipit57rlc6K6vkDuNjJZF/KqA8/zI83kFC9ZZvm57vkhtg64iQsf2ST
	LSb8ctthI7YQkL0rFFcHBaUsH3guxEVawE+ezVzq9z/04SI04aF9u1//3yu1H5giCJxowyo66HGQn
	uZGfLaX04FBVX8FuKPLMFlkiFxflnBfhu9V7OlHDhdltgDPUC9i2CH+Pb22dfqIOjhqRXXTHFMo5J
	uAsT9KRedtXoV71ziV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7rga-004a3U-8y; Thu, 13 Jan 2022 04:26:04 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7rYh-004Wo5-2W; Thu, 13 Jan 2022 04:17:56 +0000
Received: by mail-ed1-x531.google.com with SMTP id c71so18277835edf.6;
 Wed, 12 Jan 2022 20:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4UM72dZzLG8h7HX4iWc1dAAmQjii4BapFiL5lJRjgwk=;
 b=nyJmLfTv83X0o1n/RQ+fuehHwKeanFXB5hh9Q36aLn5ic0ACfADCC1WXgYw62E8NCQ
 yVQpScT7jQLuswl0zGga90YQqHgIf9/OOFISdspX7khKSETVEUGuxOXpVEZyP+0UCVwj
 8MerJ7rCrYJre2k+9RVeeXDl4Eo3uIiGHihl+3nZi9tXwiy24upJAiLz6Cb/fm5sJqLB
 tKECS3o4Tz8+f11WbvvmNd305UfXg51IghnRpVoA/GgSKwpJQrZp0NM3X1HdNJDZkGBd
 HKdWeWnIZEV4DtZ8VSdd5gN3MowKIuz+kXX3qqrU3YWA/7wFPW9C6KlPmWE0ha9EV5a9
 Mpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4UM72dZzLG8h7HX4iWc1dAAmQjii4BapFiL5lJRjgwk=;
 b=T/8pSIrWavCghsICDpP7qQhFsqNARtK2kEPf4lJheVMLSCuxGsenj8n5bfm4GO86A1
 laf8KKr86GL8Fs6RfIMquhE6tEyospaZEhhjg/Kf3sVFqGwAA7+T9Fa5kSNPjlSEhsky
 F6gUqwRRLqJxxiQNsB1dp7gnKnalavoKyKyqAZkqfVFYSAAZHGIUawapTQWBWoAJuGoR
 Bs1XO7rnH44w/EI5KG2xfjgI412PP5rT0+11jcQ/bj4Z2n02YxyB67F0WhH3OO/UtILf
 dvu1Kb2ZCuWfk3QrAvMTGgdr6zN55qPbsRxSVijMFznvBMqZ42yoiZ8Qxd7m01meBZsm
 Gt8Q==
X-Gm-Message-State: AOAM531LNcZydhCOP0OcYlGBxn9tp4njB8Jx13PCL8GQgkg8uIDmcs5u
 MVt4aHYEYMKIS0bSACSQjqA=
X-Google-Smtp-Source: ABdhPJzUJ+bzVbwLG7tXK2UqutsDV//vAnNkw1izayWTa5ShXzy0T7/In/4n96RgDfq8EkuFksy8Vw==
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr2510394edc.340.1642047472442; 
 Wed, 12 Jan 2022 20:17:52 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id eb14sm651822edb.16.2022.01.12.20.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 20:17:52 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/3] arm64: dts: meson: add Broadcom WiFi to P212 dtsi
Date: Thu, 13 Jan 2022 04:17:44 +0000
Message-Id: <20220113041746.16040-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113041746.16040-1-christianshewitt@gmail.com>
References: <20220113041746.16040-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_201755_167119_A9B556A7 
X-CRM114-Status: GOOD (  11.80  )
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

The P212 has a combined WiFi/BT module. The BT side is already enabled
in the dtsi but the WiFi side is not. Let's tweak SDIO speed (in-line
with other GXL/GXM devices) and enable the WiFi module.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 05cb2f5e5c36..c635e5858929 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -113,7 +113,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <50000000>;
+	max-frequency = <100000000>;
 
 	non-removable;
 	disable-wp;
@@ -125,6 +125,11 @@
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
 };
 
 /* SD card */
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
