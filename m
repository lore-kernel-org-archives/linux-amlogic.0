Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6C5C4167B
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L18e50NiJJj+vdQz9i1c9RilQiKkR3ZURpziHG7l2ks=; b=BrsjLI+8hhyek+
	mQHo7mP+VRpiOoxA59pR1tk/gpLXIcsBdJTbz7UmrGVdPM1Bhnmn9zRVCpMJfSmZBPbkW3VcDc/uB
	VGoAYtleuUOHvPr2J7i3WieFEu+/1HpX7dhW7QqdjyaJ6Tk6ZfKaZ16dBqFVblZesvUkvP4PTqbPd
	IksvQfYVDlDcnF7vwr7n1TFzurX7yvUqMc4PvvTeJ/sNziE8PORZaJYwfWHWukHk6H8vZoz6JQvzU
	9DQRmKsHsebwr9g0SklN3FC1MYrQiHtkneXtJ202uSpascS98OkURlqomOYFfhas+PBN6nFLkZw1l
	Mg7On84HI1QyMV62oHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vfH-00GMt6-2t;
	Tue, 14 Nov 2023 15:49:23 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vfE-00GMsY-1c;
	Tue, 14 Nov 2023 15:49:22 +0000
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so8873359a12.3;
        Tue, 14 Nov 2023 07:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699976954; x=1700581754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bC0gh5GtET+GY1POn83wCGMR6SSUdpI6TGA9ZU4YvM=;
        b=KQYxOznZKDuSORJ985vfUygRyf0Nb9sO65mao5uxd0dlnQFpOEJueWWDigdEse8iLf
         Kq0hDuOKr2e4FVHbIdKHlJjw2xCumvsXUPaf8Jq0CB+QiwIjznjYKJ9j2Ragi+qDMNWM
         I3YXW1g/8NaWfElD70c1IAQpTRu+5IunHqAgglDGIjvqbdqBUhwv5+1qseo8Y8KHNRfL
         fLqLtuGlEO9OXvKjy9WyIhQwlShF4eMhSLtcHhys0gEoBYyv1P4GWerFXN/cmgvU16/h
         pMb90BFNhUN+1PPcMpcba3Jzbi4pGzpSirMQdB54G3ETN9/r/ykia+PVXyzYpb71kIRM
         WCiQ==
X-Gm-Message-State: AOJu0Yyq/HOBpZSeO4IH7c39ZEKTjQjw3ZSquDpod/1wVFTTr2hg81MU
	SfTo3xjoaUGmQINhezGVUtxflnOfEew=
X-Google-Smtp-Source: AGHT+IENt1pIK+n+wp8H+la5uVQPNjn4/lEW7n+Ls2HMUqOuHCwh3SZzMgv4ZZ05LH+OzNrW4jjdfA==
X-Received: by 2002:aa7:d889:0:b0:543:5741:c9cd with SMTP id u9-20020aa7d889000000b005435741c9cdmr6861999edq.34.1699976954369;
        Tue, 14 Nov 2023 07:49:14 -0800 (PST)
Received: from ramallet.home (cst-prg-38-127.cust.vodafone.cz. [46.135.38.127])
        by smtp.gmail.com with ESMTPSA id v22-20020aa7d816000000b00533e915923asm5211770edq.49.2023.11.14.07.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:49:13 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: amlogic: meson-g12-common: Set the rates of the clocks for the NPU
Date: Tue, 14 Nov 2023 16:48:43 +0100
Message-ID: <20231114154843.1262225-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106092202.11127-1-tomeu@tomeuvizoso.net>
References: <20231106092202.11127-1-tomeu@tomeuvizoso.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_074920_557670_8048E7CD 
X-CRM114-Status: UNSURE (   9.15  )
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

v2: Fix subject (Jerome Brunet)
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
