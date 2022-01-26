Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D425AC28CF5
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 04:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GFeTEZV6Qd4s18bEU6uf9I1j0cfA9x+Q8oh2KOHlQQ=; b=mOF1E1X2rNxy0p
	iZHb10Nbc/yL0udhaAUOjapRopiXiHfYNHa06yfk6g9ldnMvxTBrL6Q+P9H27lWo7nyqdFfqFlw5Q
	pEi/COaU9h2Rrf9KN7p4bhvBnAvhKUQUG3ZVrjUxeKaB/fHfd4In52jJkh+BMwFPHMoSk5FNMAQs1
	wlxqP6gNyiuITCN7Gbv4JwtBk6Pu87zisT/i7Jry7bgUVvEquyUi3Dh+O1EwZ5n5Da+1+SSWWTzwD
	q11M8zGXPOOeKEGpoCW3JhVPbnT5FIyB/qVp4rDtEYJA9MOuNG+nnJ+Ngjkzu09F7jao8pBaPFJd3
	IEPrTjn9PIhh7v7P6EvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCaGH-00A9Om-Hw; Wed, 26 Jan 2022 04:50:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCaFu-00A9Hv-DA; Wed, 26 Jan 2022 04:50:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id f17so23565033wrx.1;
 Tue, 25 Jan 2022 20:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=stznty7HVe/pzQfdeViHDJ1kDbJwUgBbrg0lxMVpxdA=;
 b=IqTBmOSMUo97L7KuoUK3kfpVMK590nOjpPaGAgSqlwz6OTDuXfxs7zW/VUdoQwsSE4
 zJLDECQ6EDo3kw0kwJG0WxigKWFmbLkQKm8Bv5a1FMrHs7BmnB8bCUEFE3Nr/Qq1kddT
 QeCzqd4TNDQAYKY9AtFef4sLsPy06TuRNvLQduCRAJ83FBJ0w+TXbOtwtrtocpGE74PD
 5NfHvS0sU9E3v/1cst44vthFPEHgXkaFWE+j/fuBzE9ndCw2F9xGmyv6rxWeQgJFy6lk
 01ZbIHpQaZE+TAd0EnDw/ylZqrSaAWP0Vtab53HX6wYOE7l1hTCt/3V0tuE74EHkWKDX
 IyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=stznty7HVe/pzQfdeViHDJ1kDbJwUgBbrg0lxMVpxdA=;
 b=C7jYae2TZJj9V4hxYOgYBEITcvF1y5A/GpJ5sFCgPjQYhSwFvyS6JlNiRKnD+UM11J
 dfvOHsYqBbNfgY0Qyvn+37ijK/0zk6OrCPsxO8HM6Bai6vH9zpsylAFC0NTCHlKcEw42
 5r6a4HyoYW8e3WLKnjITu0IueqHLgpRAXArrirSLw8AA+oz05KP8RRxx2cYGpyVpsZIz
 MLbU3x51zZmo7UnW3anUBPb0K4RE2t+xferVMYbuLPl7mThIJXhEEfuQyr2cAU198J0q
 15/od1wJ5bEUeUlq2KigH8vP0clYC2nNBGZF0mL/A0eH2oiE3SiTXdEYcyAK8vqHD72Y
 KXPg==
X-Gm-Message-State: AOAM531VJD1MTNHViv5dq2Yr9CMiVUngNYowrI4pUne3CasL2Q3r7vYj
 c7GTJLMV91HbQPqD/3IXqMc=
X-Google-Smtp-Source: ABdhPJw+jLzjJzxrxscAYl6UjeWlffrvBe2Z/FWjed0KLeKL1hSQVsDlv6N/49LYVPceKooJ7s5W5A==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr21418931wrj.118.1643172600846; 
 Tue, 25 Jan 2022 20:50:00 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id n15sm2171342wmr.26.2022.01.25.20.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 20:50:00 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/3] arm64: dts: meson-gx: add ATF BL32 reserved-memory region
Date: Wed, 26 Jan 2022 04:49:52 +0000
Message-Id: <20220126044954.19069-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126044954.19069-1-christianshewitt@gmail.com>
References: <20220126044954.19069-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_205002_473245_EA0E263C 
X-CRM114-Status: GOOD (  11.68  )
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

Add an additional reserved memory region for the BL32 trusted firmware
present in many devices that boot from Amlogic vendor u-boot.

Suggested-by: Mateusz Krzak <kszaquitto@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6b457b2c30a4..aa14ea017a61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -49,6 +49,12 @@
 			no-map;
 		};
 
+		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
+		secmon_reserved_bl32: secmon@5300000 {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+
 		linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
