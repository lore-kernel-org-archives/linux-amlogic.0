Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7A7C4708F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:04:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0967610C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0967610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yOBc57ZsmCAEdARa1CQLr9XxMlPhfmIfyjEvzMjMys=; b=hxAEeWlvOODKfn
	fMDdNgb2U65DfTe167KxNfORbtfKpNBlr7mxYwCvMy+vyVvs1/hZHhE0EUipbLQT3y26gPjugnQ8Z
	Fov8sodJrV3S0ojn9wSg0XpnjTVkR0Mk4zg8inggqIGdxjFo06Gt6RZUQ+oMEGiDTJagcJiXDYtm0
	IIZjL6BQOQ/9ORB1S+YrEzY5d+ohwY0/66wx6Lo/uHpAIxQLlO7uPVDb1r9OByCcnZA5UmvIh5+rn
	HJjcK0d1cqwCtU9kb03VWM9d1tmUTxirW+KJ2dKl3VNu/FDxypXKcS1562S2R0NhI+/HiVKtyyukf
	i1D28PI0ym6CET6fTbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0JZ-00FV1P-RX; Tue, 01 Jun 2021 09:03:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0Ha-00FU2r-Us
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 09:01:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so1425302wme.5
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5IwYtF72UjHa9iHdNpTtLmTlD6+WFBrg2eN19aC9Omk=;
 b=OfHfr2YXdaik4HKexBimsUEZCrWe/vMas3BTeQo75Ubex1ai0ml+iFJUOW0SlBQsty
 qy0yBRbXnatJv9JiqrN44w+xgkP2NABvzTKh34RjnuKF09ocolSaZGoFVj5br5TT0utJ
 qLx4psENsGYhXwZ9zGm1odrUfe8ctjMdkJR+9qWCBVRRvsWbUMzh8OUshjVSbc8x7e5G
 tKKGPv5cUwJv5PWAdheSFcfDEPI5QH/TIbcDyIT2zTuh8EIXNcDddzM5p0lHFs16Z7nO
 Wed3cRXItq1DqC4sksn74Q+qlCGOrbGLLxGaJcimxO2O4hIWiMPoIHQsM7M6BtEu6xKv
 WOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5IwYtF72UjHa9iHdNpTtLmTlD6+WFBrg2eN19aC9Omk=;
 b=K1BkBYjsaUJ0qQhkvsjD4NU4VQ4LEzOTNuJbJwMEu7oxaLy/tTWi3NpY5fBjy0ni+u
 8V6yiYRZQQs5PUR13dpbqh5m++BzUynHMYpL1xYE/24kqMzvf9ZOEGheD20gZ3HycXk1
 hqh2PV7f9AX5x7R4LmL5h2CCBUkOBRti5Lru+L08K9x4jISVEW88tMcBzTbgfeq9uPgy
 YV+et03bO0p4VC0Bios/m9ZNBLDwWJ18yd0FwO6br3x36y2GW2XY0SZASqJb+4wuFHWV
 zyG0p9WbqOvIiINkSpSMFE8+U2Fe7Pb2WTCtp67ObefB6hg4pr837os25USzWqmPaGFr
 RyzA==
X-Gm-Message-State: AOAM530TifxYrKug7+e5FUskgVIjRjKkmtMP+79VlHkA5If6ZLy/kBB8
 xBXzbg35TZJvlnfPXbwuoLvTAA==
X-Google-Smtp-Source: ABdhPJw937YIFZ3Mgv/DYBbwiziumbrHOQVmBQ3enRfvTw+ZjCIAI3CQUIO+DpKL0u1MnzrsSMqu4A==
X-Received: by 2002:a1c:6782:: with SMTP id b124mr3412909wmc.159.1622538113518; 
 Tue, 01 Jun 2021 02:01:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 e17sm2668199wre.79.2021.06.01.02.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:01:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 6/6] arm64: dts: meson-sm1-odroid-hc4: add spifc node to
 ODROID-HC4
Date: Tue,  1 Jun 2021 11:01:40 +0200
Message-Id: <20210601090140.261768-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601090140.261768-1-narmstrong@baylibre.com>
References: <20210601090140.261768-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=narmstrong@baylibre.com;
 h=from:subject; bh=4Apj0m6+83jroquluYgqns8V8hJcFEuKMqCVi55Btpk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfc89atbVaTE3uafIleEYxQ46PDSj92zOM1wRlkq
 xyAYr5CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX3PAAKCRB33NvayMhJ0aP2EA
 DOy817Oo3Aw84S+Vq02JvA9hnzMVgdWOH2Xwq8XXi21rpRxxEh3wCNcd7TR4zXAipgkWmsrAlnCQHV
 gYnk3Kzqi45QnjCLQFg84z/AySFoj3xYPXZcAnXD0EcjZhxDYJp7eO1Q3THuMl+3KyEl+ggQZUFwxn
 Eu8MKw0nss4YCdEX3MPGzP7gQaWRdfh5oEXHFGNvUiVDQauiIRBi0CMKDR5LkarQv8QQItSjX0VRaF
 RHWzQgAKhDwQEEI5I9TzPgnV+vnEGKhdwa3tn0g7qVc5wEgGkO3D/nwL9bx+ZsaQrbDs/E4srkbN23
 P0L32/DxrxqIZ9x/lMmPnmAG85gWZ4uqRjyWMonZdk5LF1VxH/gcdw4DV7dcmU1jXvUdlcAKtUnAW1
 EK5AK8luOn/JkXoqFNtLQK4peojuEEjT3XVYN6WuO4K9eo5ihFKyyiQfAOttb2XM66Vqz5D9QVdwRy
 NklDye6BtHYHHtqIf+YUIuUFB1/3CPda9YEOuqkbnyFKbelSyHDt30c3W30mpihcJZ1UhfrCPADIUj
 IKrlfhgf2xXuzuLNJtM1gETqRiAS3wx7qfLDuV2LIAwQvBEMDNDPNCUxi6r4Lu4CMaLJu57e9NoaxQ
 bolmEBvHycxccGDNqm38g0kBao4zf5f++xXwU1c9G17H9Nx7YNvl4du2hs0w==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_020155_039577_9DA85BE6 
X-CRM114-Status: GOOD (  11.42  )
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

From: Christian Hewitt <christianshewitt@gmail.com>

Add a node for the XT25F128B SPI-NOR flash to make it accessible
from Linux.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index d36c25b5b690..3c2ebc7333a1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -116,6 +116,20 @@ &sd_emmc_c {
 	status = "disabled";
 };
 
+&spifc {
+	status = "okay";
+	pinctrl-0 = <&nor_pins>;
+	pinctrl-names = "default";
+
+	spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+	};
+};
+
 &usb {
 	phys = <&usb2_phy1>;
 	phy-names = "usb2-phy1";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
