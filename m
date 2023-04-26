Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C39C77B60
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Apr 2023 05:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZsJeVnyj5ZOlUIIe/QqGtmvuDYZgBYB1WNE1dVhiz2o=; b=gXhOz6G+2gYhfW
	lNb8Xjemx+Cy3ZnUicUuQJxCtqtZQqlFLHWx28iB0NIpXK3xjdXZjZ1IdYac2Ox/j8bOsRa4JmRhv
	DDvppd1z4QoHLwYAdnZwXcfQZFrwbqHchH6V+UZX669Wv+9Vmgyp7KOkiX8vG2bjx1TWLOEk9wUvp
	1PMnKkxwepiJoOyCVxETWsr8IEs+vKcds2u6vnD4+PTx3ALX1SGrUXXNAMr8zjHX2bu6MbYtGVg3d
	zVm1HuqEYs9Ogs6MApQ285maEdw7l+2xuo7xvsN6IkZg8/j2dDIbH1qwn4JCSVYdn4fzr2XQQdyDx
	0Uw+vgDuGuxT6K6ZQBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prXhv-002pTX-2t;
	Wed, 26 Apr 2023 05:28:47 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prXhs-002pSq-01;
	Wed, 26 Apr 2023 05:28:45 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-94f0dd117dcso970847666b.3;
        Tue, 25 Apr 2023 22:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682486922; x=1685078922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sKTnga5osoBChiq0wC1tiBZnMTBNSiyIak8o4AC7LI=;
        b=R9UbgCzgCnQxviWRbc9WXPLniRsygJOZUrf6/K1fyQPf2qUwwGYOR/NNsROiJQlZPa
         BjjsUPYdUE33hTDwI8yJP8Wxz9/dCYh4nhIP2Kpu15h/w+SUIbE8zlxP+5Y0Zmwfta2n
         nDXYC9BO3fb6/QwXqm/UpYP6Gs65HNo/vYQ/SSOELta5E/JnWjRKEZ0E3dqAarM8hbOB
         1ev1oepwSQLt9z0xMM6AOUgRSAWi93X2V3Z1cLYeMcvd8YXhlBZ7ZiCo1H4dp15Rcisj
         Qv2PgkQnMN5Ishvlr1ieL9TV84U1B9R0FaAqgmYMxHtdfEJeF7aWm1TgcmkAWucwpfoh
         7kdg==
X-Gm-Message-State: AAQBX9cNocrPtDgbGV+bWvqfNMjOIme0sWWaW7d6BB4WK43Qji/LH42K
	/so3TkSRPEfIlNrDKFAT13dtH7K1uwc=
X-Google-Smtp-Source: AKy350afIwgIUzk7/1vNhIB1UUFEJtteADzFrDD5QGP+/lq4u5bIcqIkZK/MyC4E+wHZ/4sZ2kJT5g==
X-Received: by 2002:a17:907:7e94:b0:94e:d75b:5998 with SMTP id qb20-20020a1709077e9400b0094ed75b5998mr18238906ejc.5.1682486921617;
        Tue, 25 Apr 2023 22:28:41 -0700 (PDT)
Received: from cizrna.home (cst-prg-36-136.cust.vodafone.cz. [46.135.36.136])
        by smtp.gmail.com with ESMTPSA id i21-20020a05640200d500b00501d73cfc86sm6598206edu.9.2023.04.25.22.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:28:40 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support)
Subject: [PATCH] arm64: dts: VIM3: Set the rates of the clocks for the NPU
Date: Wed, 26 Apr 2023 07:28:31 +0200
Message-Id: <20230426052831.59391-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_222844_044100_1D732D43 
X-CRM114-Status: UNSURE (   8.82  )
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

Otherwise they are left at 24MHz and the NPU runs very slowly.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Suggested-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 4e8266056bca..3a14b21998c4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -52,6 +52,9 @@ galcore {
 
 &npu {
 	status = "okay";
+	assigned-clocks = <&clkc CLKID_NNA_CORE_CLK>,
+			  <&clkc CLKID_NNA_AXI_CLK>;
+	assigned-clock-rates = <800000000>, <800000000>;
 };
 
 /*
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
