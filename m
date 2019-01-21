Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57317C31681
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 18:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25CC520989
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 18:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HNrn2AN2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UaRqvkoN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25CC520989
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zGDklCGvlz3dSEoCGB/z0p+dg10TD8cianbWXGNz3w=; b=HNrn2AN2+XMkgJ
	cSoAje7BGmcm5IqEWM4hDdLizsezkFHTgOocn5ibrZMX6I4wni9UJMyMYvuCBqXYFhTAHu4CTTCFW
	WYOkN3jAEjDDDNWEUFJKS3+4IRVpmojvSTOQDDSlm0BEkbq8U2F2h/uQA+W9uqLuo1z4U/KhHF/v6
	gtHiZjUlh6D7zsmDeHBO5+cHpDjl8kclMRPvBW4QA+1PGPAC+GKTMJNiz06EDzhbv53ua8ToyXqpq
	k4iMZI6wbw3NY8iWPHUmROlpkAkqRY+ZU/NixTaWQT+7T9HHV+IGX22Wz2UPgpppDiDpdLfISV4ek
	b5TA+oaU09iqL2k4+FTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gleSH-0008DQ-3a; Mon, 21 Jan 2019 18:37:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gleS1-0007wW-C4
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 18:37:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id t200so11889239wmt.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 10:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvDjW2J5ri+L1/t5EFcSwU+ZHLISGJXvHZow6RDENGk=;
 b=UaRqvkoNmHSnsc0tMky0m0e163SucC8NyO5xumxs0pjp1bei31WVInpKX+wnekzsOh
 LqOCTwkib3Z6OHOMmvCqHwTCvBkxQ2n4zUhEumBACxn/8ielPeTbZfqMsB2hYA2svRf9
 JxJxHfM/w1F9vvJRQa9pFjloDs/bqorc7DCfL3pGqfx+qBRsCTNk9Rur+0aA2pmiDRmG
 63gXtC5tXhvUt+1xQ9ucx51nHLoI4qkbNXGrLtdS0AtioN3xqElidqcwXa8p+l4xUJgc
 fOm84Q83Qwl3s6BrgswQ6BE4L2O5aDV2bLtgr81cOK1MOx3YHVRRnwSCEOozZR2D1IVm
 5pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvDjW2J5ri+L1/t5EFcSwU+ZHLISGJXvHZow6RDENGk=;
 b=j8qyO/6Nm6dlVd20zBxHnGxYHq3eIPo3aj/w3ZJWfkHFW38AoMJarXLSqHPQIA1ShB
 n/zJQIRfCUaZ+jww57b02nZh70SpDhGemty0Q7NJqQrWaebSRFwG5iVlCg8NTxxcc7R6
 A7/BZWhB83sGzGnYNjFIn+9J6lV4zM+/U+wJV3u/uqDoTVQsDBtPqw7IkEEYztbZnh7U
 0LVyPSv7Y7/Yog9QehPERbL6grJdkVaG8eabkSeoiHg9/PV21l4ZXVFjgtjdBTm43ASc
 Ztn3L8k3E3aXF2MDUptIw7TDBheYOw9pFRGS+lKXCCpTgxwewWQqZcg7t8eXs8MvT6+b
 e+oA==
X-Gm-Message-State: AJcUukfMoPRnWTVv5+TyFnRyeqdku8aEi04CJ9qdKXcyyviJh51NF/+2
 aarW70vYPsWjYHFDbPrFBa3q1Rpe
X-Google-Smtp-Source: ALg8bN4xvcqQeupyAnI04ZNE9CTepqUx4xXne8UdCkoys+QsZSqtdQH5jyfZqxgZ7y6bLHK5M0Vosg==
X-Received: by 2002:a1c:7511:: with SMTP id o17mr529576wmc.42.1548095855568;
 Mon, 21 Jan 2019 10:37:35 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73A8100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73a:8100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 199sm55700630wmh.21.2019.01.21.10.37.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jan 2019 10:37:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/1] regulator: pwm: suppress EPROBE_DEFER error message
Date: Mon, 21 Jan 2019 19:37:23 +0100
Message-Id: <20190121183723.25231-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
References: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_103737_404348_3CFD0438 
X-CRM114-Status: GOOD (  13.85  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Suppress the "Failed to get PWM" error output if the actual error code
is EPROBE_DEFER. This makes the behavior of the pwm-regulator driver
consistent with what most other drivers do (which is: print all errors
except EPROBE_DEFER).

An example where this cleans up the kernel log are the 32-bit Amlogic
Meson boards:
multi_v7_defconfig has CONFIG_REGULATOR_PWM=y and CONFIG_PWM_MESON=m.
When booting such a board (for example the Meson8b Odroid-C1) the
following message is printed five times during boot:
  pwm-regulator regulator-vcck: Failed to get PWM: -517
On the sixth call the pwm-meson driver is finally loaded (as rootfs
becomes ready) and the "VCCK" pwm-regulator comes up fine.

Fixes: aa66cc6630a408 ("regulator: pwm-regulator: get voltage and duty table from dts")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/regulator/pwm-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 3f53f9134b32..7789d181ae67 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -357,7 +357,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(drvdata->pwm)) {
 		ret = PTR_ERR(drvdata->pwm);
-		dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
+
 		return ret;
 	}
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
