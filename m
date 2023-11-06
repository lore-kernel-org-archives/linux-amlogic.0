Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F05C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/aPInPaZ9bjXagjf+8igdh96yDhWlvqavPEZ8wIdEuQ=; b=qGjbly48/fk+ao
	VCmU/ZbIe5tco0iEoUQgxbWxFgPEs0nc1WDYpDmmwZ32Y+yzmEkvB54IuqX3L3XiniOL5JuBKGETe
	FwJuLwQC5B8GFOl+NUoxTyauPR/BKnIWHmiRdVLLWOL1FdEk2YCUUlkOSqQQ24/Gud0hbk9h49CSw
	7bn0E1EbDdcyVrEOWvOelr6SqDZVt2QAGwxUJcdCZCYOhuiJ45sZH7UuixByI5MQUTyIokJ4H/1/7
	WpoSx7YCDRAubIJ8qYmxkzJw+dOr7x154OC1ejhCD03uwxEpcXVeBybjuCVtQ0VJwjb0uuUGsYep7
	6jkRPGE+6KbcswrtZg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvoH-00G9ME-0b;
	Mon, 06 Nov 2023 09:22:17 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvoD-00G9Lj-0u;
	Mon, 06 Nov 2023 09:22:15 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5441ba3e53cso4541138a12.1;
        Mon, 06 Nov 2023 01:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699262530; x=1699867330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vxzdd7hvG1LZGKkqhTZumSilwKU2j2TuY6Cx8E9gJo=;
        b=mSGWuDtOxq2NkCnRDMs1YpFgxfJizWTQ0NtddIRhhtSiIZNQd/fWoqkjsXUJkn1Eyb
         fzxd9F83AQ3YB9z3uYpd5vR0qRalH05CfKVEF7regRd5B/+27SMAb6W7FiVvZW2yp8k6
         nucw+SH2UadswgurcOirIW4J0phWOgL+mWaxoPW6zJMaqo/dwBHtp6uy2d8rS7KDA4qp
         zPkiKftGHezKZFO0wG/q1Lw4tOmXXT4Uh0GE70tQ53gzLFitTXjItQCiXBR/fPVRJtCs
         QjzrX5qyUADrFbf4PJBx78vJwE8JJ6dd/5ytxa+/hlqSwDqXtSG5PEXwY3U3uEeEXskR
         XW4Q==
X-Gm-Message-State: AOJu0Yw6EXMtpyD184cvkn6hqwNi4OGc8Ft0VttXxuK+s0yy9XVX7J/q
	UHNG82eEdZb5DzxGxKkkMfc=
X-Google-Smtp-Source: AGHT+IF++APSwFNH6r2Ey/Q67hM2PkyNzMGIaLHd/q7k/8mo1G5861RXhVzAIHRm7zWxfkxBUM9UWQ==
X-Received: by 2002:a17:907:31c3:b0:9bf:122a:7db2 with SMTP id xf3-20020a17090731c300b009bf122a7db2mr13821438ejb.66.1699262529951;
        Mon, 06 Nov 2023 01:22:09 -0800 (PST)
Received: from ramallet.home (cst-prg-38-127.cust.vodafone.cz. [46.135.38.127])
        by smtp.gmail.com with ESMTPSA id w5-20020a05640234c500b005402748cf29sm4098608edc.50.2023.11.06.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 01:22:09 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support)
Subject: [PATCH RESEND] arm64: dts: VIM3: Set the rates of the clocks for the NPU
Date: Mon,  6 Nov 2023 10:22:02 +0100
Message-ID: <20231106092202.11127-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_012213_319494_554645AE 
X-CRM114-Status: UNSURE (   8.68  )
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
