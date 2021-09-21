Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA88C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 21:31:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12468610E8
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 21:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12468610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PvxTxRpyJw0Qar4DVSkj5JwotRhcEwxDm3v03/CYfhk=; b=h4mePpRCIapP31
	JRSOIDCo0UHm/grFFAdyTdgT3uwC4IBEyrCb4uR43ngXWdohRaqjBZZyWpbtUjk9P+M2LP20CgJQI
	cduVw0XOEGgF9ZtGd9EH7qFdcn9KVyWt/5a1iBBjWZUvx1odJ55W+76RGHyPG1BbnhSh17ZS2DGqs
	ZetVX+2u47Q4IIFSiJJ6FnfkAkUbhxgaXwIaeDqmd/h9A2wvH2jC+OW20cn3QYHzC8pyMP+EwUDEZ
	Rjlz/82j5lAdY9tsvDyYw1HFWbNt6YZ5j8ok4DknwE/Jx82n3Req72dvbO6hgYWEw1ROhDzUSpLXZ
	85q8n2y/SCuIku7J0kOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSnME-005wQQ-K7; Tue, 21 Sep 2021 21:31:18 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSnIu-005uvQ-5s; Tue, 21 Sep 2021 21:27:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id t11so300778plq.11;
 Tue, 21 Sep 2021 14:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dfl+3o580a+kMNSziAD63BdB1Q2KQn9mivPlLyQZDa4=;
 b=DdbDl3YmnHFbEkAEzDhzvQP+q6jTeUFwWcThXjc7O+ZM0UFjjsHsiI1S9SLX2uTJFm
 97wnEuXjIC0VHQs3FKZAV1FkVtxNgLiWu91/8ZbzFvRcAtZnIuT6MR6qDBNQ9Wx1jCyt
 0YQwCNhNaDynhsDv7VrE+H/90q0O+1/2mJyP9zh9tZ5XSYSQUrbbvEcAY3iafXyKXsw/
 I6Z5QpoVYVRV2bcapqOobErfFi/ktYmfsgCXUoo3u2dgYeped6zJg1/+LfxrKjvsqXx8
 CBIXoloCbgvEyDuvBnZQe2K6xg9Tu6TTxUoAsZUPbMAbaBKS0u7cTXcZ5PUyxsPKGNGt
 9tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dfl+3o580a+kMNSziAD63BdB1Q2KQn9mivPlLyQZDa4=;
 b=pkPRKhLZyv9tXEoBtKC6qa0A+dF+ar3EyClZVOL4ZiIBQKp2iQOY/tiG3njCBHzcKx
 WHVki8jsNNN5s6HRtXq8Mx97KYvA6uuIj2fJGnVd/CFf+PwMRqlxREx2sY1bs0ZN21hX
 H7ZwyJTc57bmNlSlt4PWFzyYafd2gB18WKnlVcJB+BseWbRSW8RLo0hj5l81/GGL+4T7
 /3xKVAPEAeBnYS9lZPHFyqVLZcJK3+gYmBynT+mHQj7q04C7rOoEiGlJEmvowteA2fbZ
 Y3MMt2LJxxJdQve2SA0Qm1HwD2RYsCCzBhLD7Etaw7ZrLhAdV3/QWwuOtDlNvLKvI7oF
 lYpQ==
X-Gm-Message-State: AOAM5321CZMD6BBuL/TW7sYjIaYiG/JVsIDh3P3RhhyvPb9WZzx6R6ED
 +RMxxbzGnSEUMfYRsOSh07Q2PeKiX1jyMw==
X-Google-Smtp-Source: ABdhPJxkuxtEncfxVsxXDjCkEfFSk5C8p5pf8Bt4pS1LFd5h/MqkdORJDlDmm6zVQbSYutusMGJdZQ==
X-Received: by 2002:a17:90b:8cb:: with SMTP id
 ds11mr7548115pjb.66.1632259669458; 
 Tue, 21 Sep 2021 14:27:49 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id q21sm61399pjg.55.2021.09.21.14.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:27:48 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCHv3] regulator: pwm-regulator: Make use of the helper function
 dev_err_probe()
Date: Tue, 21 Sep 2021 21:27:31 +0000
Message-Id: <20210921212732.1334-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_142752_264739_3196F6AA 
X-CRM114-Status: GOOD (  12.99  )
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

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V2 - Fix the return message and drop the FIX tag in commit.
V1 - Fix the wrong probe defer for devm_regulator_register.
   - Fix the commit message.
---
 drivers/regulator/pwm-regulator.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 7629476d94ae..9e2784ce8f67 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -353,13 +353,8 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 
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
+				     "Failed to get PWM\n");
 	}
 
 	if (init_data->constraints.boot_on || init_data->constraints.always_on)
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
