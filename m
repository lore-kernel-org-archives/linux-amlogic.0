Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDA2C43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJS9x09/3exmX7G1RY2mMDcxGvC+7/424XZ3GlNSA3A=; b=3PqxDae84ol0hH
	0dz3JTfdLtn5atBWBGnWjl3rQsGv/lqOOmUJv0du0tgTbwx84dJJlqDpdUs4uaI9/jFG67DGckN/O
	KrcPUl11rBSpHgYsnXxz0RX3rajYdtdih6AkSWU+4s0kWQwQ4AuGpoKevVoYpZ0l1Tz8zBgXbL0xE
	KwJLcyUewcnjSAngaEIWl+hgNQM360nq0N+HNp3j0+4AVWrSY/FyArXvyI1qd7Vf8kXkFCsKpVZRe
	xPs6G3v2P8gSGzcHwHiEYbZxUW2LA832TzGTc8l5XWNq+mo9SaiOqzEZ50S6lVQuvlz7s+fAm8k98
	8UOLXWai37CBrhkF8woA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fm2-006Iy1-Bt; Thu, 01 Dec 2022 09:22:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0flb-006Igc-6z; Thu, 01 Dec 2022 09:22:04 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ml11so2709276ejb.6;
        Thu, 01 Dec 2022 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=CXkqw4qUp3iF1c/VAFgMXTatfXdqW2qdLv/ri5wf4ff6y/bwMhcPTiZXL1x5LkU5Sz
         8Q3mRbIrRA7hlRTEfTFvkSh4JplJO/zNfnMvtjbXrFyqH4PZ7WpFjEnp/GBxXNwUR7GH
         EkCCEv4ab3AsoRp7+L1ILg70SRjD0TtXIjl5wkVTPpNUj+/yqoDESBjYRocrbG7qVSJg
         vVJbXbCSMCe9Dao9ZtUScNN9WV/YVzg1l6F9nWke00MhibBosR79feNatjZIYXSi/v24
         VFRKQvRE0AS0abToSBRu3BfhJ0c225w/p4IfxWJ5Np67Q38A5aicQ82QiqNr6PElvY6M
         QySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=qVQmv1Z8exiDAYyAKMhz5VT/I7iVXLVtTQk0MHyq60MxhdwR+2qL2BWtTlCg4eegZA
         ItpelpLXHvcGxBSWoY825qOYDwcpxrAkIATB75YN7Gvm+AGBwhmpuWXure76GSMnjzlO
         qM7iFmsjHpZ/lT0iR/KmbMXoUdC61gjbHUw2DH2Fpll5Ahc8llGcYmmf0f7DHd/uGQ3f
         Ih/3yw61W1+BFiGSu0+toosG69hRUp2AlK8YrY90RBQpZflf01jXWkqT+NwKJL4nuXY2
         NrZte8hyj3r1lNBG0tjVYG+mkP9ShYvTbYNbq7vZkJ2Ir79wAcM/MFqLJLcVK9jDuVrP
         UL2g==
X-Gm-Message-State: ANoB5pk9tez8m4mugty+YEeLeIJGEsqv3plm+AWrPYpAIK/FUdsXZxgO
	ANAb+spqNYxn29cVqf8SxIk=
X-Google-Smtp-Source: AA0mqf4ntoAMYIY51L9dJw/8VGj7v7SAFWbpcSMtapJ99oDCgJj+l+3LtrhYBgp8Pss4X42nEaXNwA==
X-Received: by 2002:a17:906:a418:b0:7a5:e944:9e48 with SMTP id l24-20020a170906a41800b007a5e9449e48mr57172762ejz.109.1669886519485;
        Thu, 01 Dec 2022 01:21:59 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:21:59 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/7] dt-bindings: reset: meson-g12a: Add missing NNA reset
Date: Thu,  1 Dec 2022 10:21:22 +0100
Message-Id: <20221201092131.62867-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
References: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_012203_298119_7B266AB3 
X-CRM114-Status: UNSURE (   9.97  )
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

Doesn't appear in the TRM I have, but it is used by the downstream
galcore driver.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
index 6d487c5eba2c..45f6b8a951d0 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
@@ -69,7 +69,9 @@
 #define RESET_PARSER_FETCH		72
 #define RESET_CTL			73
 #define RESET_PARSER_TOP		74
-/*					75-77	*/
+/*					75	*/
+#define RESET_NNA			76
+/*					77	*/
 #define RESET_DVALIN			78
 #define RESET_HDMITX			79
 /*					80-95	*/
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
