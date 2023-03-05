Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B022C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ant/J0C+6QpWPZeRzTPvT+g3Pl+L9RuSC3KilJqKZCs=; b=ispJ2E1e0VRce1
	wRJ7WSA49MXjG62oOyFDDvF2RXmwaLCa3JE5vnpBf+OSuRL83xp+P53hGvjnuPsn+ZR8BbW6Sn6g1
	dX4ugpn4gWVvwdkgeEXA5dNGvoPbps7Vw6fKfqHEb1Ayf36z1BjnZGMMevZ6XhQDHwegZtbSCWWjM
	M9yWnZoKJtMnDS/69HGPKAmFTShkutlM9D1AFZ8HH5dwuiB+XUPZbRIRGuqBKGTk5LbTkIiI34fqo
	5iQkQnszgkMu3/2clbBxItqp91R7tdPnGQ3FcFQhrTAXNsAOILWEPE/cbPTrSiVgbKHWT0ySz9dQ5
	+I7b6P8Lui7DLqC1+M8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoIQ-00AEUS-Ey; Sun, 05 Mar 2023 13:21:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoIG-00AESR-Jy; Sun, 05 Mar 2023 13:20:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id g3so6322832wri.6;
        Sun, 05 Mar 2023 05:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q22ZwtQznlTgrwEVXTJZ6qwfUdxTbmV0QrtKqsGsNBw=;
        b=RYQ1PbzN70fP9d3SxckyvuhAi2CMCeqcdUn5RtItTe+w9clgA6PRoSqUsYibZ4IJUO
         KHhZnV0kglgJkZ0IPOtCcopMYh1k5CO3gjdq8SK4Wjcr86jVwnePeUWAwd4rWKWH+48t
         y+ZATTgxktoZPQn8WVQCCF7nt1K+4GDJplwZiaWvu9oqSuOyqXtHmsxNOQsYDHHuwghe
         UxEBcUCCXT/K3A+AOP2qvbZLz2BLrZE43KppBnq4M0NU1kNHQHbrUWCwQOqdv0uI1eWs
         kZxRdRwPtVVopaC2gypbphRejS7HFjJZPoxLpTSH6IGyqhC9i4WKIKVfq1IudJN1HIVn
         AiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q22ZwtQznlTgrwEVXTJZ6qwfUdxTbmV0QrtKqsGsNBw=;
        b=FHxIUY7ZdKSLF2dj5AIC3UtaE436B2FJzfe1EJujA5quhOWhGRFiY/c9cjrT+2YVWL
         5mJBBTR233exX+jh5arZCG+weR+hSC8/jCUlXb6QydRSUM3jeFoxBswlScPfISM237lC
         5kmK6c3VcAqI/eW1j6YxYg64vTw6N7CLGwyI9WcTYoGPqVBdozfd4CEmLTRi2FyIxwLf
         dwuGP5vIJFgKByrHO/fz+p6aRFpNb3SiV3AOPD6sZUICfFkg9VPHeCFQpecNGE1qVlvo
         zg1FaAUVdsX6f33PbkoWNyL/Sh+gno5Q6rB/3mLy6AWUpbqGgPDARvP+iudpx+9FfJKY
         BpDw==
X-Gm-Message-State: AO0yUKWLut9DQdi/hd/GWNolKyChnbn6VcJ25S9HDr9Mdqjm7Lwib6dJ
	HvWxOdsWvLayA1z7XVT3k3E=
X-Google-Smtp-Source: AK7set8Ye/Z1fJCh+7BzqtGuZwJtqJwh6OxsXP/yRsY60Qpkgebjr7drzUVqfdH1uhG7Iy2zrHxO1A==
X-Received: by 2002:adf:f849:0:b0:2c5:7c26:c2cc with SMTP id d9-20020adff849000000b002c57c26c2ccmr5495387wrq.29.1678022449684;
        Sun, 05 Mar 2023 05:20:49 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b002c567b58e9asm7496851wrt.56.2023.03.05.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 05:20:49 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: amlogic: Add initial support for BPI-M2S variants
Date: Sun,  5 Mar 2023 13:20:42 +0000
Message-Id: <20230305132044.1596320-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_052052_716386_FDE31925 
X-CRM114-Status: GOOD (  10.43  )
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

Add support for the BananaPi M2S which ships in two board variants with
the Amlogic S922X or A311D chipset. Schematics for the board are not
currently available from Sinovoip so the device-tree is largely derived
from the Khadas VIM3 (also S922X/A311D) and other recent BPI boards that
have public documentation. The device-tree also supports the RTL8822CS
WiFi/BT module. This is optional so the nodes must be enabled though an
overlay or fdtput.

Patches are based on current (v6.3) for-next branch.

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for BananaPi M2S variants
  arm64: dts: meson: add support for BananaPi M2S variants

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../amlogic/meson-g12b-a311d-bananapi-m2s.dts |  37 ++
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi | 521 ++++++++++++++++++
 .../amlogic/meson-g12b-s922x-bananapi-m2s.dts |  14 +
 5 files changed, 576 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dts

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
