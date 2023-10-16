Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C80ECDB482
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/aPInPaZ9bjXagjf+8igdh96yDhWlvqavPEZ8wIdEuQ=; b=xUjYYyc43j+v95
	JFkXZXVAb5C2+8SoQQlOLWZdF9ItxoQcpsIV8QiEndUZCnlAtk7ULhTVubwV1iLysztZE9QQiBsn8
	MILwaE8BDlwFyVCwzlJIFI1zfo1ZEMEgba+Or8w+T0fFahzzrLCU3FP+uNfG36vkA/+Bs3mPhPSeZ
	T3n3xJXD6SGuuK1++RukUXSY864udB0nD8ED/t2BqytySX14Nxp6WffskM6uzL0W/UE/cfFMsRr8C
	Y4MgAvdGRK5iOlY59CjqNVqm+OaWnQ/fyYpNGtpgOZz0HaUoH7CZEGvOfss4llrgGvBXlNjKm4TNq
	hel/FA/O2Qqqv4yBl97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIYQ-008k1C-2G;
	Mon, 16 Oct 2023 08:02:22 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIYN-008jyn-0G;
	Mon, 16 Oct 2023 08:02:20 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-405524e6768so40304365e9.2;
        Mon, 16 Oct 2023 01:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697443336; x=1698048136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vxzdd7hvG1LZGKkqhTZumSilwKU2j2TuY6Cx8E9gJo=;
        b=t89OHHJSkR0TuKIr2FadJigJJOZAWCXeJY3ct2UKRwt7rLifCafIY45tlEVh+mjLz4
         ntk3Sfl4XnqrAZgofbVs8YWBar8RKcE5Acpi+FXiuN2E62p8KUJRu8+mgE3s8Nq0/zt0
         3ccjDzxUJGUPt6aqZNX6i/bnb4GTWpjnP3U8ld+Yj/zEdGExccnR6BgMU7HEuixadXCH
         pRUWXYjqmp9ppCypl+TYY9QfK6p/8wz0rkyXL6kyYMNhXLKFEE4qPt3KU/MINbfdvddH
         e6gssI0s7Vz9iI6g9Zmg2/I4kKiVOdqvGwXWjImn9IIuIp0SHgUT88roDU+WMCOQnMB1
         niFA==
X-Gm-Message-State: AOJu0Yz3Z0OgUmDucWjsSVqllGs/pHZV4t7BspDbjNrhTRY7Ctn8e6dQ
	DHL47EnRft5LvFlOuIG9G+s=
X-Google-Smtp-Source: AGHT+IEnAQcfulAK8tSKm3mqtTHbvdCU+3ufmoudypoqa9HGPqbCXKZR1ZkkXFpExKpIiIPsRBFBng==
X-Received: by 2002:a7b:c40a:0:b0:406:61c6:30b8 with SMTP id k10-20020a7bc40a000000b0040661c630b8mr28046368wmi.22.1697443335642;
        Mon, 16 Oct 2023 01:02:15 -0700 (PDT)
Received: from cizrna.home (cst-prg-37-192.cust.vodafone.cz. [46.135.37.192])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c419600b00407460234f9sm6395535wmh.21.2023.10.16.01.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:02:15 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Da Xue <da@libre.computer>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: VIM3: Set the rates of the clocks for the NPU
Date: Mon, 16 Oct 2023 10:02:03 +0200
Message-ID: <20231016080205.41982-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_010219_121061_029A0F9D 
X-CRM114-Status: UNSURE (   8.74  )
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
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff68b911b729..9d5eab6595d0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2502,6 +2502,9 @@ npu: npu@ff100000 {
 		clocks = <&clkc CLKID_NNA_CORE_CLK>,
 			 <&clkc CLKID_NNA_AXI_CLK>;
 		clock-names = "core", "bus";
+		assigned-clocks = <&clkc CLKID_NNA_CORE_CLK>,
+				  <&clkc CLKID_NNA_AXI_CLK>;
+		assigned-clock-rates = <800000000>, <800000000>;
 		resets = <&reset RESET_NNA>;
 		status = "disabled";
 	};
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
