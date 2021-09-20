Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A090C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:38:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F37E61168
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F37E61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ElODxt2+KQ4DBvWsHEJFqybutnMrnFe4Ypmq3LB0B5k=; b=waARiC186YqoYy
	wvWnXgp0yLjpmsJ9OJMsJWqgrPlchgO2gkoyd3oS8Adt7v+XGWC1Ba4jkFEHclF/emKjiu/8T8+d/
	k0Rn/eupBoKK+l6+GutunwjuiTEhRDcr8vqKWnmGIpiru5BFHIp/BSUWoqArzBXG8r2f7by3fgNwN
	NVmYvl4CHOqpeRCrOtR1Gy4BGKYTSj1YrdRgUc7kYM/QqgHSyJPx4Cp4Oin9zqgUndNDQJu605zdR
	XP1xG8PcADle1/tvsJWGUZHuRJMsWR1m5m+RAUIQpiQfdOWbYiKpLiCjuQNyQcsKPHwwIjQWG/GG9
	dv+8VUwvgBmysLYdH5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSQ3V-0033DA-T0; Mon, 20 Sep 2021 20:38:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSQ3I-0033BJ-7m; Mon, 20 Sep 2021 20:38:13 +0000
Received: by mail-pg1-x52a.google.com with SMTP id s11so18573464pgr.11;
 Mon, 20 Sep 2021 13:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=psFhvnbomh4BZTHkKL4KzrE+hE5GmzxDRBn3ytu83Jc=;
 b=Jh5/S6Nlh5+moSDgJ1X+Hpv/uzVrmbgY4JdP4Iotvd1D5DO4axLaOg+hR6OHl5bh6l
 tRI515gAI99q7d3KNnQx/OBcGArC5zQtHf2BOHg1XUBjcjWkWa6HlZ7Yf9ZIrQxmDxoC
 H3XjmgptwGTgoUl8LfIHhUQZsX0NUTqMcbrocgs0RMX9HSwuNaS9W51GRVfsmPiPHw/K
 LMkNOWKEMRbgxX4hLzDlY1XPfwdLLdUKKVgXpkSLWFGPsrAvTKu8SPw9hYlF5M8cpQ4o
 ynQb30DS3W/2qDi9r37/VFXdjfEyFTwHgknpuUQ95PVfZ4807AHQ4dN4/oh0roAkczu2
 X2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=psFhvnbomh4BZTHkKL4KzrE+hE5GmzxDRBn3ytu83Jc=;
 b=OnmcrfBSQtVEAJZNzj7MyvZ78r4xiLAxjb/PhxlWmHcsawibOYneV6gai6JsGkcllC
 K8AcGHjcTlTbJmmW/UNKHWNvEbm6yaVKpgjOC7VzJ4SG6e9qxsf7fOR8o0oeQLl7nU3R
 h9t5NfM0qBvMfhaSFO3U1Qpt3n2fJwq04fmVhRP2jPfCh6uYUKu6kIHKsHb2ByOvYIGI
 9Oyf2rpJiwZM5sekOjAlIRyq4fWh/nMAG8Q7Y3WelkNe/hNy28NpBfNRbBWEc8q4GX5K
 TJRihEyWSr6ywJ1x7Gf4PS2pHR9cuCm1txHEMC0EICV9mLdRnBfUfzkC5K+eUC5XiyAX
 RmrA==
X-Gm-Message-State: AOAM530zZwX7OEoYGpJ3uX22kNy5cIjf6AV6smlyqIGblTZ7YjtQ+0Ir
 I+IF4ZpLRspac4MOadlcxRu0FaV4vKpBow==
X-Google-Smtp-Source: ABdhPJxLb6UoG311c4JNQ3zT8ZX2EPvkY/tErqjRqz98DnU3DimZy4ausiw057w6+HzJTCD2vQv5iw==
X-Received: by 2002:a63:7554:: with SMTP id f20mr24835256pgn.161.1632170290437; 
 Mon, 20 Sep 2021 13:38:10 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id 18sm12904814pfh.115.2021.09.20.13.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 13:38:09 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCHv2] regulator: pwm-regulator: Make use of the helper function
 dev_err_probe()
Date: Mon, 20 Sep 2021 20:37:33 +0000
Message-Id: <20210920203735.675-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_133812_359115_2FDA759F 
X-CRM114-Status: GOOD (  12.81  )
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

devm_pwm_get() can return -EPROBE_DEFER if the pwm regulator is not
ready yet. Use dev_err_probe() for pwm regulator resources
to indicate the deferral reason when waiting for the
resource to come up.

Fixes: 0cd71b9a43ad ("regulator: pwm: Don't warn on probe deferral")

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V1 - Fix the wrong probe defer for devm_regulator_register.
   - Fix the commit message.
---
 drivers/regulator/pwm-regulator.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 7629476d94ae..3bd020641b67 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -353,13 +353,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 
 	drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(drvdata->pwm)) {
-		ret = PTR_ERR(drvdata->pwm);
-		if (ret == -EPROBE_DEFER)
-			dev_dbg(&pdev->dev,
-				"Failed to get PWM, deferring probe\n");
-		else
-			dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
-		return ret;
+		return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->pwm),
+				     "Failed to register regulator %s\n",
+				     drvdata->desc.name);
 	}
 
 	if (init_data->constraints.boot_on || init_data->constraints.always_on)
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
