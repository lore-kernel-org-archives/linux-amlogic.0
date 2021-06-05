Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9429BC4743C
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 03:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B8D611CE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 03:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B8D611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ruhQ0jPRo0kAQkr/6pTrLZ63YxU6nSe1P4N51jhOUc=; b=d/ZOF2AyEKe8FE
	WRPeg92LREsyk+HoDKOAXsnzo0zkG/LQOt43mdTJPFW6x5kY/mgKtc4B2ppMJ/4rQ1DQTIaVCWEsV
	JbvYWBEZdZJiZx6J+YZVI++wRNvQXVPdyCj4ouSxRMGL4R8bL8Gh5M9KW4/Ig7folx4t5jrb48gRt
	aDj/MfppV4ZgCK22mkBnoPzjaytdnz0hoi5F9HLHGARgYA76/aq5uLFC4dLND4k+eC7CQp4MSKLt2
	kqq1YCeJjgMdF0ZhCztaL66SotQSK6IGPos/J6qVxLVnKklVZX66h5QK0+Zix4HXc1raEf3eurLTx
	jBIC7reN8GIK+x/3EUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMie-00Fv6A-Uv; Sat, 05 Jun 2021 03:11:28 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMiR-00Fv4k-Nt; Sat, 05 Jun 2021 03:11:16 +0000
Received: by mail-pj1-f47.google.com with SMTP id
 l23-20020a17090a0717b029016ae774f973so6281016pjl.1; 
 Fri, 04 Jun 2021 20:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QuDgN5MJV883HSyDY5Ap+MjtVQArLbn97dqQsvTZD0Q=;
 b=oDPsgeb9JR4dUuytchkO8oJb/wgkUohBf7z3P29xrRqCPx0qyGcctYlFSx/jgPABaw
 c2agmaCXSYIpBDzBWMrWC1oXOcXaBUKELgHOvKocgwrVTkhsmSjyV7PRzPB6uGKYAdZp
 1V6jTWltatJ/p5+ENyeMIboAixnuDZNDRlSwdhUwYBv1naDGm1vlstwAdQnCINWaV5Bw
 qdicj+8d6Q1HHgLx2VJE1UDsjSVIRkbeF9zL3HYOuq8cCtOJHeeIOHtVN7fAtNylN7NE
 ypuMr6SUDoRaodujp9udMjM3cK7mU0xz1vTPGC07Qptnawl7ifj8auKxte6e9g8kq4rA
 erGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QuDgN5MJV883HSyDY5Ap+MjtVQArLbn97dqQsvTZD0Q=;
 b=pZm1eJ7fHwZ/tLllluEhp/OadijDojAJgg8q922dM0s4q5dV5whUhCYqlPqhHij4EW
 zqabUPbdy5RpHe2jk7xqnvHSXOv2EOoJ/QxrMxng/0QHz2SVOT9qWjmohm2AkNCoqxTN
 fVQhwXypb76l88ChdQSkyCkqL2jV2ZgZk28huqh3D7Y15G45gfNdDJcM8xItqSKeNohs
 h/gE4MDZPNmHoblZHjSl5n84ZYH+kO1SMYXpPdIu9OHEephoMXHzjC8sexne61BOWFcp
 W2TWHP7aHXfJf9UDYyhKX0TmNWz8pRAmT8yITMg20kdDpNRtBFK4mAD2uSEJe68qZnfy
 vCng==
X-Gm-Message-State: AOAM532nZjKbwpr9jAGl9xoEJ1JwVHgPX5RgKXuRiqgrr6FRQYrFQO/c
 0e1QnJfPplYJggDpg2e6AN0=
X-Google-Smtp-Source: ABdhPJzf5POh2wGEIBYT/5ja5F3EnhRWuIj4KWfkBknrDt0SUap8pKmqdObziCP6ewpF0wJTKN8gHQ==
X-Received: by 2002:a17:90b:318:: with SMTP id
 ay24mr19170987pjb.150.1622862615102; 
 Fri, 04 Jun 2021 20:10:15 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id u21sm2846888pfh.163.2021.06.04.20.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 20:10:14 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim3: add NNA node
Date: Sat,  5 Jun 2021 11:10:07 +0800
Message-Id: <20210605031007.411469-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_201115_831883_579EC527 
X-CRM114-Status: UNSURE (   7.83  )
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

From: Nick Xie <nick@khadas.com>

Add Neural Network Accelerator device tree node
for Khadas VIM3.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 124a80901084..4aa2b20bfbf2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -13,6 +13,41 @@
 
 / {
 	compatible = "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
+
+	reserved-memory {
+		galcore_reserved:linux,galcore {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x1000000>;
+			alignment = <0x0 0x400000>;
+			linux,contiguous-region;
+		};
+	};
+
+	galcore {
+		compatible = "amlogic, galcore";
+		dev_name = "galcore";
+		status = "okay";
+		clocks = <&clkc CLKID_NNA_AXI_CLK>,
+			<&clkc CLKID_NNA_CORE_CLK>;
+		clock-names = "cts_vipnanoq_axi_clk_composite",
+			"cts_vipnanoq_core_clk_composite";
+		interrupts = <0 147 4>;
+		interrupt-names = "galcore";
+		reg = <0x0 0xff100000 0x0 0x800
+			0x0 0xff000000 0x0 0x400000
+			0x0 0xff63c10c 0x0 0x4
+			0x0 0xff63c110 0x0 0x4
+			0x0 0xffd01088 0x0 0x4
+			0X0 0xff63c1c8 0X0 0x4
+			>;
+		reg-names = "NN_REG","NN_SRAM","NN_MEM0",
+			"NN_MEM1","NN_RESET","NN_CLK";
+		nn_power_version = <2>;
+		nn_efuse = <0xff63003c 0x20>;
+
+		memory-region = <&galcore_reserved>;
+	};
 };
 
 /*
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
