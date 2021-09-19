Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570D8C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 21:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253D960F13
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 21:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 253D960F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MvJkp5huHMkd/08RQdGWtE/3gQLDu91056UkU5gSFm0=; b=3eFSaJBUKUocU5
	M3685TMbF7c0RM4xCThC4ipCn8dTp6DROcDFbZpqluxxLeteOm3y81b++O+8+WR+pWO7G2N0InCFq
	wNxjH3/dLH4MWJvGU5cIKsM07epFDe2Me1zPdFhP7MVhwfQuF02VUWqGOXrRe4XwarlpqB6Sl/p9z
	NkveP8llCIxcRmueZxdew+PWoFXHdKAFOmAfjglufmsiaqp6E82JKjegVvEKe8syDR1LQajYFCxlF
	c74FDYiT5ETh8QcAWFiF7KSLud7E/Yxn2jBkVrFsNOdoVgFX4Eg38aoB2hu1In6mUOTkyP8FBEPhi
	zwLIIhjXohoYwJvTIgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS46P-000Drd-Mf; Sun, 19 Sep 2021 21:11:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS46D-000DqJ-O0; Sun, 19 Sep 2021 21:11:47 +0000
Received: by mail-pf1-x42c.google.com with SMTP id w19so14284290pfn.12;
 Sun, 19 Sep 2021 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xYUcfWhUdZuh85e32IgUBDiou2vTR9MT2ExA/x9jGQo=;
 b=i9RDUCz7FMUDmPstW+A3ZyFX4Cv5AUAQNM7V+p2B6+/xxKF+FyO6ihLMQ3TwSIIRuv
 kASOGUdZa6hiV7pL1tR0Th5Q/YA+KccqF7fswOb7GSiOg7y1/6f4EGQJaIK3ZdHB0c+7
 qOjm3HHWuKewLv2Wv1DBh2lZ5ysAS7v7ySFPF/SZu1E3tTt7AIVdQbeC8D7sKKXywanM
 joRmbQ8aqVjo9PSGxAwR73U9U+w8Lmz16Jm2B3u5UKXiwjCjOwAuC0cMXYzRlWus5b4m
 TLnpemAM71GToDGssu380CA7aZE8hvRzFrTvkJQ+lGM+sHBNnerk/EtmSJseZb6ps97X
 /XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xYUcfWhUdZuh85e32IgUBDiou2vTR9MT2ExA/x9jGQo=;
 b=TiafJHjk9MkJjemf33SmC4kvzpLLNka6oCaEqbRK5Qd1Knew95Ase7hmFPwq6gx3UO
 95jD/A+YmlL6RZMJHW9cRrCoWqOe0ekokZGTg77KR/vWTtT6V4isATg2NpaXvY9Pr6lH
 nj8wfhjyE8ryVtMU/V0bNoZAz0CiR4aWrW0ejc2jgFR3C4FVLLDi2uFKv/LMZyOKDtN6
 zkWfxqYkTlZvfme/1aREehvtqvO346SjKF9rzNpZU9m72+HTZ7ZRlTMWwyQy3BMB1tkh
 l84pioA2n/TGNb/aZzcxsIWcOgEbYOluV8WtLMHI2vlf+tSySHVCsoF6WF8WcrnhnPER
 h1EQ==
X-Gm-Message-State: AOAM532af1RK/6DmkSdGqXRZP3l/jeiqVE2AtzJ0/nXVaoHMFu9JRXkh
 cjhFo4mNW9Ld3Q6YzGZbGC882MjVg3H6qA==
X-Google-Smtp-Source: ABdhPJx3ZyB5j+hqrEoO6Ya/OUKsB2JDkJGte0Vs6uQfGcLWrg644Fr7SnBQfvuZnetczpJDDNAfww==
X-Received: by 2002:a63:7447:: with SMTP id e7mr20756338pgn.46.1632085904720; 
 Sun, 19 Sep 2021 14:11:44 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id j9sm13520565pjb.33.2021.09.19.14.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 14:11:44 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] regulator: pwm-regulator: Make use of the helper function
 dev_err_probe()
Date: Sun, 19 Sep 2021 21:11:28 +0000
Message-Id: <20210919211129.4364-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_141145_827568_1925EFA6 
X-CRM114-Status: GOOD (  12.79  )
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

devm_regulator_register can return -EPROBE_DEFER if the
regulator is not ready yet. Use dev_err_probe() for
pwm regulator resources to indicate the deferral reason
when waiting for the resource to come up.

Fixes: 0cd71b9a43ad ("regulator: pwm: Don't warn on probe deferral")

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/regulator/pwm-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 7629476d94ae..451e57a739f8 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -382,9 +382,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 					    &drvdata->desc, &config);
 	if (IS_ERR(regulator)) {
 		ret = PTR_ERR(regulator);
-		dev_err(&pdev->dev, "Failed to register regulator %s: %d\n",
-			drvdata->desc.name, ret);
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register regulator %s: %d\n",
+				     drvdata->desc.name, ret);
 	}
 
 	return 0;
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
