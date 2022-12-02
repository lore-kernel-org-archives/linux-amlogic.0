Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B430BC47088
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNiyvUNztER8KFI0f9EyQBAbkd/C2AufzJgoTuQjvFY=; b=4OAJ9CD1NCHL6G
	c1fH5KN7yW0zieWcyBNncJWjAHWbCjohBHg1TjHFyvSXA61xLbwo4Lo0xrYmwoSut6c/mdz9bussg
	eT1JS7/RZE0zCMRAB3CHpQGRH+64ZsN4u9Lnvu0rKDkO0zCx46Z6nJgtlqZtV6OfteRJt+KVYMCZx
	c5eYR7djNCb3TsJ36P5W2acg7+SHQ0K2uwBkdQXshWwGW09rdcWKQcUB9r6fzftfn93evIhX8piRs
	FquXcPoiFu3lbErbXdn7hq6THmEKXTZQVLs585i2SqqixlpjxWkZcDMiSFcEtGs9DxEE6SsGMwtBB
	w97ucPnLVFjYp6ohD8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14bB-00G6Nt-SZ; Fri, 02 Dec 2022 11:52:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14as-00G6Gc-34; Fri, 02 Dec 2022 11:52:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id vp12so10989304ejc.8;
        Fri, 02 Dec 2022 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PtgXAGJmcmMEV5+MQtqk497ZJ57rtsXRI8tIjkSb9M=;
        b=iDb0lkEMzmazESd5awPzg6ZyS1abQbKXpfLtGCsD8QafTrPd9VY/H4r1xegNz7As+J
         rQvTR++06iApH+ybBpDCVdB2nEtLoZXKwxNx26exg2lGz4plEChJwe6/3N3Ws3kxGxeB
         Wmr5iLSr931xsGgQiuSDwsluZeN+OkaoT8A3KJF04LHjJNJ3/fs3MhBrFLZXMmejh0Sz
         V8EGz5XledxGK1gUgI4FzCGMPThvV2JOvek/IUvnWw+7NkY37RrYzGTusSrqQGQz1PWG
         yR4ZIbXJ6n1Pnqti2PFV0RyYqLMdTNRE2PV7jYA05JrC4QO0+9ccdIS1YrEyNYwklQm3
         47mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PtgXAGJmcmMEV5+MQtqk497ZJ57rtsXRI8tIjkSb9M=;
        b=JXY8hXhGLJr0vrpHdqUf52zvNeALgLsX/FHR9qlnyNSgSkH1RoKPgk2G4dF8BjRwMt
         jpCamwufZWrnZmCHZrDWz9TD0YeGaP4A1zPm/UsDzCZNoHzlwjzFyTsKbkqepR/VoT7g
         NkMmvvw0VJNJGkJPK4eGwBPwsxKaMsuYMw9aUb7xjwVsuJ3P5r0A0nWPQauGqXduSvAq
         wXSxOVXetOhLnWv/s1Cl0VwSiLT8UM8FCyOAmOZ39TJEsDqZ05850wczWyV+tJu5vhw6
         KvwNGumRvrYoHrUK1c54751e0nW/frRWsEchVXXmX7JTdMKz6fYDs715XH8K2H1bLFPg
         DfnQ==
X-Gm-Message-State: ANoB5pmIP8LbfpSU+8DZ1i+A7a2awwm8igPTA0C/xf6//Qge31ibJPx2
	/1Fb2ue8GL2Mq9LTSR496bw=
X-Google-Smtp-Source: AA0mqf7jj01A8oMhYJoBckXaekMhZdpOj5mhNi9QsJ1oBNazwr9oRc1BsyV5aCFi7NW8gl2Dy7/6MA==
X-Received: by 2002:a17:906:6c7:b0:78d:4061:5e1b with SMTP id v7-20020a17090606c700b0078d40615e1bmr51092779ejb.47.1669981955805;
        Fri, 02 Dec 2022 03:52:35 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:52:35 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 1/8] dt-bindings: reset: meson-g12a: Add missing NNA reset
Date: Fri,  2 Dec 2022 12:52:13 +0100
Message-Id: <20221202115223.39051-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_035238_145262_186C634F 
X-CRM114-Status: GOOD (  10.27  )
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
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
