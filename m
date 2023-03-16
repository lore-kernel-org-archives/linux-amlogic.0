Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC1EC6FD19
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Mar 2023 06:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3jvZZfB7qj2N/3kZVaZ3PauufFSxmgdyZVgMwXQCe5w=; b=zW+imP6hFl7Qen
	E+/xeXvfmDm8ykmyNBc3gCvslyOTkaiMefjZoPtLWtMwknv+zzky8o029nmZevjG01G9bVoxnYybj
	fRArcja0hdD8cqOpiBJ9qSX6G6E71YgB74PXhhHxtrgCl8F+oWnLfkPDjcHsSZmMV1ujZgQ277yeN
	0D/TGPf/D7gerALc5Cm5eq2EsS13XO2lCqd6hKJH/aYoK/TUZ/e+nVc/Vpf9VnH43Rul7ht1AtsDE
	cxT3bX8JzZxlEKT1Up+LB2EWmVQjBLglH40CbAI0U8FRTaa0LLG3r2c7ZDUrF3BZ7O1ubsrk0dlkm
	4IXdFVj8G7kfHACkePiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pch5C-00FM5c-2u;
	Thu, 16 Mar 2023 06:27:26 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pch59-00FM0U-2U;
	Thu, 16 Mar 2023 06:27:24 +0000
Received: by mail-ed1-x531.google.com with SMTP id r11so3423710edd.5;
        Wed, 15 Mar 2023 23:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678948015;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8apLMnDIam1wRAIPZf4i1rDypdfipJ/G4sed7RkOwg=;
        b=DQByby1mSYBgmiOrbhSIYG3bdeLYyFvIKua3+cdI1vhtDMkbQ2RxzNdGytZolqRDRe
         bjSR0ndh1HWRkDKz0tcJk0ugGMl6/YDhGDTDdKy1/68CUVjo1d6a9NfEoCc/k1wIVpx4
         yq29l8xICHgkwBdfhE8MwpXXjHNQjY2J9ZZLAoFx5UwhvJSFKe/QQQR99UokezDRIj6v
         3+UyrCX9tdpCIBynz/qg+CdSTcFCnexA24EqrAMHn6A+ECoeY9+TWe2wMaAEOtX/lgnR
         HQHovmkjDk9h9G+hEO3Vbh7hgutBAFy1quizINceqrrbrvS9lCx+AmnkasVOCtNB059H
         JS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678948015;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H8apLMnDIam1wRAIPZf4i1rDypdfipJ/G4sed7RkOwg=;
        b=Lyg8kRzMLA3t6SkOjxlrT/Kqelz/sGrD6GMR2cSL0FdgaNzv0VP208fTIFeNQhXsEZ
         YyG2K8cYfKNi51lN+uaJFcvOvFiqi418vwzYl5oSxtQ7tyFVZuQQsUqqbm/fSwpN7WTm
         5uugeLtAjdQAztGNoNUDqv58Pt2zNlfZKwynK0sYgJzSfe++909kJn7rGNSFF/c5uIDv
         x/R27rry6RR8rVVWUgTfYHTehMCRm7poqfZSP1H0OsffK+hETQ4KIz2Wr+GhIquf+heO
         E3oc/wkTqkty6aVS4+5yMuPOzjfuZDD9sbK7h9C/+tfTgk5GL0XgB6T6vDh3RQ2n1G/G
         SatA==
X-Gm-Message-State: AO0yUKXVBDd39vmDmQYAhNnvrSojSRjO254tRYBOAS0Bnkgf1G7QS0BC
	c7dOITulo5ukN2m9W8tYI1s=
X-Google-Smtp-Source: AK7set92a1vAVoAeeIP4tGYazOTh+uxSwcuTq/dUpdOILVRdcY1OoJhc7CqR5O9U3RAkwRQrnEzRrw==
X-Received: by 2002:a17:907:6e0f:b0:92c:847e:403e with SMTP id sd15-20020a1709076e0f00b0092c847e403emr10813357ejc.75.1678948014986;
        Wed, 15 Mar 2023 23:26:54 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c416:2100:7501:4f16:1d78:4bb6? (dynamic-2a01-0c23-c416-2100-7501-4f16-1d78-4bb6.c23.pool.telefonica.de. [2a01:c23:c416:2100:7501:4f16:1d78:4bb6])
        by smtp.googlemail.com with ESMTPSA id kg27-20020a17090776fb00b008c9b44b7851sm3422334ejc.182.2023.03.15.23.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 23:26:54 -0700 (PDT)
Message-ID: <12428fb9-8a0e-3f3c-ef71-b1edca6d1a8f@gmail.com>
Date: Thu, 16 Mar 2023 07:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] reset: meson: simplify meson_reset_probe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_232723_814930_6B99E52C 
X-CRM114-Status: UNSURE (   9.12  )
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

Use devm_platform_ioremap_resource() to simplify the code and remove
not needed call to platform_set_drvdata. No functional change intended.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/reset/reset-meson.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 26dc54778..e35c3364e 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -116,14 +116,12 @@ MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
 static int meson_reset_probe(struct platform_device *pdev)
 {
 	struct meson_reset *data;
-	struct resource *res;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->reg_base))
 		return PTR_ERR(data->reg_base);
 
@@ -131,8 +129,6 @@ static int meson_reset_probe(struct platform_device *pdev)
 	if (!data->param)
 		return -ENODEV;
 
-	platform_set_drvdata(pdev, data);
-
 	spin_lock_init(&data->lock);
 
 	data->rcdev.owner = THIS_MODULE;
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
