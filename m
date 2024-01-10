Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8C3C4707C
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jan 2024 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLJ+iGzcqfXmwWHrr1PhiO2JZiOkRJlY26seypwrAJY=; b=rqTxK/itaVNSJP
	bWAkTj3IlF5l44NjNBDBoOy9RCd+5iUKMUweKSpbWWeFj69yuJDWY7CpXc0jneg8CVLIqVR8gq9sl
	iON2MJRgACtqv5oT6qpj+fEhuPwVgxoswHVpYcSMyeQ+J/kM4aUvuFD3uBCqHmZpBIWLeMyH9yjuj
	ZEcuB8x3kpRMtF9jieP6x6v6JuOnPh8Es6megczhRTSErFCl+z/1pa6At3m+gNUQSyVtkrvsjcXAl
	6RPJvXf0tcwOLChD7N1ED7t1pktX3MmzfMsXYVymB3vl3hgku+th5ls4Fl3hb8zdVTfa4ew2JOTk0
	yApdFAhShw2YwZfcoCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNaea-00CdEj-2q;
	Wed, 10 Jan 2024 15:38:04 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNaeX-00CdBi-0K;
	Wed, 10 Jan 2024 15:38:02 +0000
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55818b733f7so2077478a12.3;
        Wed, 10 Jan 2024 07:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704901078; x=1705505878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4XrHqEPP20R01xmGCuOPfv+KVCp64Vi1x9YnoG1SFg=;
        b=AtPvD/zMjFbP2IRW8vKjNc5cMuOFkDFtbAPJ+aittkHNdQ+ovHCvWZkWgs60U8R+P/
         CLI7xiEl69h4WLfydouD4JS0KewIH48j48GlrEATm6VGIOKZAIRpOQavu8BxwAGPuXHZ
         zRk8XpUN43slTIrXCaNnrw05kp1izzwsT1CP4Y6lpEh2Vd7JZXU50ByYx/ez6AfU4AXm
         oZwWI7jHN0c8ZZwfiQgBAySnO3OIJud5tSA1Gs4HZWmmN97QHhjkEL3KlvfEB0K9Gbgr
         FT7myXJNfv+T84VQp1H/2kwezXsIk1oDIb2AinRlgAMj1+EAhWyeieoTia5s0xa2csZr
         jvIQ==
X-Gm-Message-State: AOJu0YwwPCjGQJbUf21NAxJRQpkF7Wj6x8yDp0ne/nxkBo7862vsxlS+
	IwVpeqZzMAHDxYirAhYp0gY=
X-Google-Smtp-Source: AGHT+IFds5J+pmhXNSFF50B6wsyc8BDblllR+tNwXXxBcdJoJr0VRCEx7inE4wKr+XwWw8//Dz/H9w==
X-Received: by 2002:a50:f60f:0:b0:557:c43:1fc3 with SMTP id c15-20020a50f60f000000b005570c431fc3mr498857edn.76.1704901077760;
        Wed, 10 Jan 2024 07:37:57 -0800 (PST)
Received: from ramallet.home (cst-prg-39-31.cust.vodafone.cz. [46.135.39.31])
        by smtp.gmail.com with ESMTPSA id da11-20020a056402176b00b0055668ccd9a3sm2113105edb.17.2024.01.10.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 07:37:57 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: 
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Lucas Stach <l.stach@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] arm64: dts: amlogic: meson-g12-common: Set the rates of the clocks for the NPU
Date: Wed, 10 Jan 2024 16:37:01 +0100
Message-ID: <20240110153704.1364073-2-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110153704.1364073-1-tomeu@tomeuvizoso.net>
References: <20240110153704.1364073-1-tomeu@tomeuvizoso.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_073801_138248_C367A24B 
X-CRM114-Status: UNSURE (   9.16  )
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
