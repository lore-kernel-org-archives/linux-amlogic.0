Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E7BC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JYUYgUyfif8SzubEuwrKM4gcAV9AHhEeAN0DFqtuA0=; b=Neua1rRUyLPqo2
	MACc0LEhyTSxvuLPfBqBzIa/oKmEhJ6WRKxld/09LSueaYLyUOR98zcEbJtGks7BYdf22gfADG29f
	U0MWr99BGZZWNbo0npVwi3QAQjWRA8hY/Db9LzusLhm36ujg1TiI9TX8OkwS7swTaMD9dc5471KrR
	DuHUGUoZBZGyVwbKCqE66klJLpPIzTkymtUA4iBDDbatWhfTanXdC1xyx19DfJKMvq76U+FjU7fGt
	h7oN2ui3fj6sSjvHIJKh6NLz+h7QueFS3PMI77QG79bngyAt3fs7GPAZDsG3zCaISxMtOHVvy57FY
	bM9gIcooejbdTErwleGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols8S-007ztE-GQ; Fri, 21 Oct 2022 13:32:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols7g-007z9b-A9
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:31:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id n12so4795520wrp.10
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hO6u+TED5AV65kw0TGqwDPOYy64CaLI0AQeOAz3rUlg=;
        b=XftffleNs/SDrTzvj3RL404tfe0D0G94sEfSTAx+QPOAohy66BrA3nLxjU7UBRSg+L
         gfwH3Kg/EPEWnUV6yu5A6aJzBRkJ2G+B0caF+hO6BQCJrIfCFapTv0ml5zFpNXKCgJEW
         yyERdl5dasuMNJfSUbMQP7KoV3hlbSlH0wak5wYTFVX0qLRnHbLXPNDuinolw2dy4LLm
         qKsqqGvQ6ttxt8/zaSiuGtoSs4N1akd8GHGfosn4mtrnPZ3MbIncc7sN/3nR6v+q6sxZ
         JS4YlOEIHnNJgvL3jF7KbjgEUGjc5E0uQxdW4oxbfxqmV6L+GHDYZ18TVL5SiG99Utpe
         9rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO6u+TED5AV65kw0TGqwDPOYy64CaLI0AQeOAz3rUlg=;
        b=yH7qeGu90aaszEk+1EWP5m5m4blpGXpCtR1PN+mwc+JM9ny0tRCRkKqKb3WjssE734
         j1zOOBzBxiBV04Czv2PiDbLawKfeKLH4SwiAjojr+sISce0powbEYLsLOUXhgQKxTJ0R
         kAb5SEHXI0BJ13YjTY/Rc52doYRb0ajGzsfwzY3Ou4BywrvEZtN0w/yjCcssN5gUWFyJ
         jH6CQ91XmeAPFv7O+UUuTPo7WAHtjBnBZZtzR8nSYQCR/SpFIiB9f+IUCEKDZnYwXC0L
         7PTbkUxQF8bOOm6wtdN7N5kmIhEhWiNR0IwaATUUvVlRMUqx4nLPdMGUE/WaiIP31ZRw
         TmKg==
X-Gm-Message-State: ACrzQf0C1oegJdmjrcHrEF0JMGnONG73UlDCgrKA0bRpfh3l16yXcm8m
	n58IL+O9bbQkFFCqrlwKEaJ4Jw==
X-Google-Smtp-Source: AMsMyM7RDGlYUmFt+uk/UpjANtp7mSMOjFGUDLhcbDkDXV658mYnUAxfeyAQlis0jr3+rAPgnUVoNw==
X-Received: by 2002:adf:8bc5:0:b0:22e:3873:276d with SMTP id w5-20020adf8bc5000000b0022e3873276dmr11869184wra.402.1666359099122;
        Fri, 21 Oct 2022 06:31:39 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j8-20020a05600c1c0800b003c6b7f5567csm10325280wms.0.2022.10.21.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:31:38 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 21 Oct 2022 15:31:27 +0200
Subject: [PATCH v4 3/4] arm64: dts: meson-gxl: add SPI pinctrl nodes for CLK
MIME-Version: 1.0
Message-Id: <20221004-up-aml-fix-spi-v4-3-0342d8e10c49@baylibre.com>
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Da Xue <da@libre.computer>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666359095; l=919;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=1L7zyfIVhCZJcKzTBVkOA0R/6Ewhoh6l/GXCUMDjLaM=;
 b=Zp/yYenSqGlzVa6vYtQoBdDUo5nHcdIjN9FTC6qkrBjM8QJTMaNWtHta1JjorcWWKM9T6PQnIONB
 FK+jff8nD3d+Gq6IuPYIEKx63QSIxJe2nU2ZEj6BX+F4KwZCX2Ma
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_063140_372962_183BE8CE 
X-CRM114-Status: UNSURE (   8.04  )
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

Add SPICC Controller pin nodes for CLK line when idle for Amlogic GXL
SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index c3ac531c4f84..04e9d0f1bde0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -429,6 +429,20 @@ mux {
 			};
 		};
 
+		spi_idle_high_pins: spi-idle-high-pins {
+			mux {
+				groups = "spi_sclk";
+				bias-pull-up;
+			};
+		};
+
+		spi_idle_low_pins: spi-idle-low-pins {
+			mux {
+				groups = "spi_sclk";
+				bias-pull-down;
+			};
+		};
+
 		spi_ss0_pins: spi-ss0 {
 			mux {
 				groups = "spi_ss0";

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
