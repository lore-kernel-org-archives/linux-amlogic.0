Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF92C46467
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YjhlPxCssNpz9iO9C5ZmXzZeoyTd9ClSAe4a/7oAZU=; b=mUjfxofqwHmVqe
	XSG1WLM7UJotVxVvxeHC4HGMygVoofpYqUDVEAtqbgUKt+Q3nsGcptgq3U2hw6XZG9XOlsg0JnEr3
	q18y9X9AKRKL2w8RBJECTMaBC6j/b/RXeXcGxjaid9SA9xTCXmmBQ/UrzRJ3GQC++Jts8jL4Wmsf8
	/Op0ZinmPbYQ5H57yX62CMuQuo4vgNxQpJn1qjCz8s0+NEUhmRCpnw8qh5V+cn1rBuoJQjEvo5PLc
	+ufuyPaQmazptznqHbbgal963RbhEVdqSgA40GTWUwuauh4/nNLdaL9fWGid48pSaqVA+J905iHq0
	rxHtMq3BKMTKH6u6PzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwLt-007YDU-7P; Tue, 29 Nov 2022 08:52:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwKl-007Xj1-03; Tue, 29 Nov 2022 08:51:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id vv4so32074130ejc.2;
        Tue, 29 Nov 2022 00:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIHeFovEuwjGuythdoubrFT/SXANkAJoc/lUtd9ZW10=;
        b=m5uCgXks2HvW5R/x6dE35mrXeuAHQ3cr7K5plc0T2J/N4Mquzkf5TDcI83kXewzzRm
         DMStLtEeRJtLpRPDN9ycQ/djzbNYE4IeGwTeYzoRPXoHxCAshDduI2e//fvw3xlzBRBe
         aiVSPeHLte/Z/tYGosRqjQFmY9XGgRJY3Cdoe3gtqQBte9EcKJNPuXvFGobaesY1CItP
         wHpwPERqM6TNBYIYtX7Qwp/X10/4NPSkzOyXA/MJefaQouAHeM/nGcrLtgNZysRZREsr
         0HzAML7IUOKEJb7DM77mqFa6Kadv2Am2zVV9ZKaP9JbdwjiCGjeqv64ZHE3bJxTO34Ye
         jInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IIHeFovEuwjGuythdoubrFT/SXANkAJoc/lUtd9ZW10=;
        b=FSch+hUCDrcle+prQjiBsKRtyfgLYghpkxmccoY2496j6c2+GwUM4NKWenHVulI/to
         rGiifEN4CcS9MicE5uDh3lodztFBlLjkbL292rBvXQXHbJWdWqf1ymKWvGUzCHC37ZTt
         UZxWgtnEAg/N66Nt6u8Spq7aq0DUXIRVN0EMkWQcTy+IWSZZd4u4h4fSdE2fmVRUZc7M
         dXQLZ1JtTSjLBSlib2bz9192YzuOE8nkYn58CaBHUeTLFVgwuVcqx/QuOPKbhXqHC88v
         Kw/XJTyuG6Hwg3yC7lS+MPrtVOUGY0jpJhJ6YNW9ZJt14rq5d2I+30Clblua7Iq08GQ7
         ep5A==
X-Gm-Message-State: ANoB5pmzPwvMRnkq42wM1BQsnFwp7lgpljKR1XJHu4wxJaP52ufEbzpp
	0JEuJLvRk41uPhf4jqP8nB8=
X-Google-Smtp-Source: AA0mqf4J/t4QZ6BLzbajN+wa5uDqJj33v1lQ2C5Hl8cQB2CTaAZVIab41wT63RWTwZ6RPm1AQvFETQ==
X-Received: by 2002:a17:906:a58:b0:7ad:b45c:dbca with SMTP id x24-20020a1709060a5800b007adb45cdbcamr36204325ejf.388.1669711875344;
        Tue, 29 Nov 2022 00:51:15 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id kz1-20020a17090777c100b0078de26f66b9sm5873219ejc.114.2022.11.29.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 00:51:14 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/5] dt-bindings: power: Add G12A NNA power domain
Date: Tue, 29 Nov 2022 09:50:42 +0100
Message-Id: <20221129085047.49813-3-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
References: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_005119_087599_70603E09 
X-CRM114-Status: UNSURE (   8.94  )
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

Add define for the NNA power domain for the NPU in the G12A.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/power/meson-g12a-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
index bb5e67a842de..93b03bdd60b7 100644
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -9,5 +9,6 @@
 
 #define PWRC_G12A_VPU_ID		0
 #define PWRC_G12A_ETH_ID		1
+#define PWRC_G12A_NNA_ID		2
 
 #endif
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
