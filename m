Return-Path: <SRS0=nqA+=MI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BA8C07E95
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:39:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B42611C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B42611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7hazLnQFNKzmF+ENjNzYBKt6fRZPP77tAvruFIZ8JU=; b=FnwQMdkpCYHky3
	+o8QV8fHF/Ub2JFM0gKQowssJo4rZsdaeJ5eunWk22J9Gue9sFXfrY+D32B73EpqWUPMnLDjxuGY+
	3+/W1uK3BblgxXI9FN2HJsi9V+vZNEI62Y1v2eNC2vPBxq9wwk/HEtEaagqT2uCskf+lncGXsluPS
	VRdphEv3jNBjC0C389ietkcBv2xdaMUwFCho6Pucj1JYvqiGDcZDg+7cPcKUe9pRlqZBauwEgbA/m
	mL0s6SZvcyfX4N/uN8y84bN55voFtmAk9azBqKmhgQetueOhj9ocrPOdIwLwWSXoqxH4Ys3R44JLl
	mvV7sH5JDEvxZF7Xg4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4LFm-0049SB-FQ; Fri, 16 Jul 2021 10:39:34 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4LEw-00490O-TU; Fri, 16 Jul 2021 10:38:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id q10so8555298pfj.12;
 Fri, 16 Jul 2021 03:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3d3QBhIUG9rULiQkPjmvB3VFugYPgFTgKGsQs/0OIs=;
 b=edMHLZZ9Joy3kORNlbb3fA7Oip6TpGrlESLPRoP4j3s+sAQLT1SlBoA6nDewPTbeVZ
 adOYB6al4mrObEuWESAJ8eKqdNEMX2eOcU/YxWBmqhLKf3xbN45sNRIeZKrAtBqyiz9f
 nX3dORJt+ID97uW4aq30eSU7zpLvGnWqQQDutpcN7gU5/m6ZvhDGcnZwvjjaNnqkhHWH
 TaAulTOhfwFITR/T+aDhl6mwTAAaYhoKE8723LObUi/eM/LbPvenJ3bIctfUxk92bowR
 BJ6DACx3dWU2weZVjdGuyk0HaB1noOWHalBTdjC8xkh7RLFCqkc388tyQMAjAHw2k4PS
 KfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3d3QBhIUG9rULiQkPjmvB3VFugYPgFTgKGsQs/0OIs=;
 b=FfStSLpkyrbjpXLX1Fw/m9rhchrNEHUYQWAjgxUHG/fAto1dPlOarQnFFh3RHtJFPI
 BCxl85M9KNK+xbfx3jwH8zLNqv7q/ZfDvZpchOYDiTZYkN7YzWxJWpjAeJ8OqVrJ+e+Z
 lo0cj6MxeHema8+Hv7gvQIANlIoWJ0LaahvBZSGNUsC+xkA/dQ9SGk1jCVI4qadKWsyd
 5g3Etv4nFWrkRU8M2OueYxTUxRAQWv+0cqgKcopNtcMBRBNxiuTGgSSCH2LwvVRL7Dce
 pIubHdh0w28dI2CxGEu4h0iZS3F0S8U2nl1oZAMKabwL+D5M2fwYF5iaG1MfpjIW+RCe
 i9zg==
X-Gm-Message-State: AOAM530ObTTBGFMCJa3Kss50w6fwlo3TpcRaxPpEEF/t1yBAh8VmJiek
 pyPRIVGdaRgu1f43m4WTryl7/1OHYIo=
X-Google-Smtp-Source: ABdhPJzRs9l6a/USkfsyP9AF6K5QWyN3b48FxjpiD1pQ49VAVuin34TLdB+q2UIjut4p6GMWd5n0vw==
X-Received: by 2002:aa7:97bd:0:b029:32c:56cc:8fa9 with SMTP id
 d29-20020aa797bd0000b029032c56cc8fa9mr9677013pfq.65.1626431921511; 
 Fri, 16 Jul 2021 03:38:41 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id d29sm10070111pfq.193.2021.07.16.03.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:38:41 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 4/4] phy: amlogic: meson8b-usb2: don't log an error on
 -EPROBE_DEFER
Date: Fri, 16 Jul 2021 10:36:36 +0000
Message-Id: <20210716103651.1455-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716103651.1455-1-linux.amoon@gmail.com>
References: <20210716103651.1455-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_033843_057016_BCE5312B 
X-CRM114-Status: GOOD (  13.58  )
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

devm_phy_create can return -EPROBE_DEFER if the phy-supply is not ready
yet. Silence this warning as the driver framework will re-attempt
registering the PHY. Use dev_err_probe() for phy resources to indicate
the deferral reason when waiting for the resource to come up.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
None:
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 2aad45c55494..cf10bed40528 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -277,8 +277,8 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 
 	phy = devm_phy_create(&pdev->dev, NULL, &phy_meson8b_usb2_ops);
 	if (IS_ERR(phy)) {
-		dev_err(&pdev->dev, "failed to create PHY\n");
-		return PTR_ERR(phy);
+		return dev_err_probe(&pdev->dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
 	}
 
 	phy_set_drvdata(phy, priv);
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
