Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F1C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5B9206F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0gy/nrvZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGvuf0NL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5B9206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=biPYOVSH805ZWkMVpbMOB6oBAL9ArOWVlGwVA4KxGQY=; b=0gy/nrvZak1rJlPIVgcOPFMLR
	wa2Mws/GqyVYg1JvV2q07Ps6MBaWyLPN5S+1C4Qt+yvGDEJhWPLepLKEKSYhymY8k56keVjaJvDfU
	+SJO2x34ubAV7ArNq8fcWyBLIXQJDvT0vXwF4KClh1ASW0XW6fwJ26WpD1PJelpJrnpve8HE5MKdC
	Xw2FpYb4xM03BtEL8v5DPf4whhPZZrmkn0M+bDXVmk3JW2TcSuAky9ptq16HKmCelRfIuBMZkmaZ/
	zQCm4Ncqh2hgxweMM9o8lG1VCIxyd/VvkHdbwQJOP7F7x6McESY9Q82M59RHG+2Z4mTIAmFd2Jolo
	qAHXSWBGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k15Oa-0002iA-F4; Thu, 30 Jul 2020 10:02:40 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k15OM-0002eI-37; Thu, 30 Jul 2020 10:02:27 +0000
Received: by mail-pj1-x1042.google.com with SMTP id i92so2856798pje.0;
 Thu, 30 Jul 2020 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKGnrlhAfNKdaaToJ46lBcdVPmMZfVv12+YknhqbXO0=;
 b=QGvuf0NLGceYH/+wRrdOtQLDYt3saSF6XNwkqBlehffifMS+OO1e7Vly37SFa/FNff
 qgIByztFK0amyngVkDtXPvH9yIGQuGdfgerQPBlXfrfk5aKWnEGwq1VjKuaLvyGzwmJo
 fDLWvV8WgOiTpBwMgIh5FlldQrRq74IAJF3wmNFp7HnjlhEJzJgKxS83IxfZDTm4rE4e
 IzHj4z9R8byaoCeVHYhrN/bZDEPk4cwDxuXAZpZym7QN6rW98wlOXMzCxpKEfVGPqXU0
 x+kSXoOC7trOVX+q+qiBnq8Olx0Dus/Lkp6tzmb3LYxNXQDG9J/jFzZIa3m42pISCGcS
 RbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKGnrlhAfNKdaaToJ46lBcdVPmMZfVv12+YknhqbXO0=;
 b=XrY2qBRDB2EJtTYz3fJm3Hn5DAFYyw2kWIreFWTzCw/m+IuigFFzk2g2paUiyMkQW0
 7nL5/onmtKRGK56DjojrijoIsuGYuqYDqcul1XUIasHy/aOO/G3T1/+hJtCgV/XP0wnq
 ds/xsE420dOo8kk3gxzFv6xhLxrdTCv3UoYPGVttwXTA/vUJjO4T4PxOi/S93duU5zIL
 NwjZnUbAHhYZFCLaFOfE5IIZN9AnRmizHTvVmC8A0S8Jtp3Er991EdfhYtB9t807Kt8r
 VqOLOwVmEinpjJSN5BuBDhB3TUSD2TJL4G4OA9VzVcjMnMlnCfXY0cqrePlm1217/Soo
 nLEQ==
X-Gm-Message-State: AOAM532IV+Q4OW+PlHByT2fOMv4fXwzrPJhy+Glow1GsU3wucpkeQb/a
 FKBDcXWMfamVzQgOh70NS99GyLi8
X-Google-Smtp-Source: ABdhPJxDx9Ym7HVXcpFoe1CzJLYNTbZhywq+pILuDn9bh6hwxwAfLOs5ThzX7Yev5HFde+W0GHKFLQ==
X-Received: by 2002:a17:902:6b81:: with SMTP id
 p1mr246370plk.331.1596103344015; 
 Thu, 30 Jul 2020 03:02:24 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 03:02:23 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v1 2/3] arm64: dts: amlogic: meson-axg: add missing ethernet
 reset ID
Date: Thu, 30 Jul 2020 10:02:08 +0000
Message-Id: <20200730100209.793-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200730100209.793-1-linux.amoon@gmail.com>
References: <20200730100209.793-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_060226_703036_03B5F023 
X-CRM114-Status: GOOD (  13.42  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8e6281c685fa..61adc5592211 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -185,6 +185,8 @@ ethmac: ethernet@ff3f0000 {
 			clock-names = "stmmaceth", "clkin0", "clkin1";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
