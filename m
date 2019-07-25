Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDD1C41514
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 19:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B3C229F3
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 19:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYtuDYO2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jxH8gQG9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B3C229F3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MkYAfTUhyNZwNxw5SmDxIuYMYiyqErC/EgnlwWWx+QM=; b=tYtuDYO2qwwh5CQ85DII/mszJo
	T6ofI8rOeG+/IgI3TcUEXqKs5Et1rY53W8+W7QxkiZzjWQZRkc3cJ6T0Rogt3Wfn8q3oZ2kfJ77Tg
	5J2hXPdDQJnEe2oLrKeuAia1qt1RCfLm6Ebn60cSvKlpSk6LXs8a0DDqcHFYDKm1kWgvLBKCzsGG/
	kzxw8Y9yQEZvoZNNM1ckXp9A90xQPY5Urhv2+pf01ValAxzhapQvJvYZOKJ7dBYDQO2PURlQl+0zB
	d/ASsPO3HlXO1qw96udY0TupycMxCzHN8EYsHbou7tW/iuK79G+3L/eqmXkJC8X8JTVcFVWIoraGW
	ZT+9cKqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqjet-0002Kp-QO; Thu, 25 Jul 2019 19:44:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqjdw-0001TO-4x
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 19:43:14 +0000
Received: by mail-wm1-x341.google.com with SMTP id u25so35382193wmc.4
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 12:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fJc1atiQz5OEztuHQqSGjdoiIKBAFWAgorgVo68gaaQ=;
 b=jxH8gQG9+QwY+aN4xvMC+QDz2s4wMg21chw6VUnY+kxHdY2WvCjNGfGPBrhfBFzWED
 PqnVkdS5vFVbeJFcHbIl4afpzVwhUtRzuDyrEoleiOCY8EPfczuGBdd5zJEOqLykBeNY
 uAivAzxlDx9irmBuIlLER532F7awvAWTgiuRkWOstlaNGi28VPfD0AIaAiZLYqtC2bpS
 uwmIuM8W1TPTAVbn7HlUokavL3V8UtQ7RoYciJ5CmbASfsPgTscUXuDSOghTjyZZu1R6
 vPep7y8JFYDjYKwCIlHXGWO0SorSaNN9XjZrIqlhNr6MRD8w/bjWzjRbAfuvMLd5cNXH
 MLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fJc1atiQz5OEztuHQqSGjdoiIKBAFWAgorgVo68gaaQ=;
 b=QX8AzRtgJAuZvWeoLw4ECRvwuNnipbGNjOQ6cSEdfiS7N2888RrebKTiUyBcAeG3ld
 TAgU41LnsoCloX1SdXSpntpyxOGrFw6+GXPC8b7v6XC4aAVnykQ2+6GYwz8msUpcvqpJ
 lGMJ80cjDozCIQ4LkCrlpkattvm2SfGLuVVyAeHwRKqW6xiQr9+TdXvclSOabxYM7Zop
 RA3i6O/a3oC7YGYtGAuYtEo/mt9b7Ou2SIRDW6/EoGZMsmABcXPF7+ogbmU5jTq+hflC
 dLVoAsPmcKOeSqRpbR6QZ3AZUy3bXvEUalb0bZ7jcd53C93T87piPg2SIi5CJVbUtK0G
 LN/g==
X-Gm-Message-State: APjAAAXX+0H+tErwSWRjyUiyiF9J4YM+04ZqXCBqNo4vrdh4vJyvYjY0
 mW6pvSIOvETDfqtj3tVkpy3/PA==
X-Google-Smtp-Source: APXvYqyQwu1nmcB4abCQ5zAFUj2iSjiM9xVcT8A6OcXmoRgvpTb6oyQWmgU37KVPZS42Kw0Z+zWV8g==
X-Received: by 2002:a1c:a7c6:: with SMTP id
 q189mr82252637wme.146.1564083790917; 
 Thu, 25 Jul 2019 12:43:10 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id
 y16sm103410662wrg.85.2019.07.25.12.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 25 Jul 2019 12:43:10 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org
Subject: [PATCH 4/4] ARM64: dts: amlogic: adds crypto hardware node
Date: Thu, 25 Jul 2019 19:42:56 +0000
Message-Id: <1564083776-20540-5-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_124312_214875_BFED742A 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the GXL crypto hardware node for all GXL SoCs.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index c959456bacc6..fdcda12a7113 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -36,6 +36,17 @@
 				phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>;
 			};
 		};
+
+		crypto: crypto@c883e000 {
+			compatible = "amlogic,gxl-crypto";
+			reg = <0x0 0xc883e000 0x0 0x36>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_BLKMV>;
+			clock-names = "blkmv";
+			status = "okay";
+		};
+
 	};
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
