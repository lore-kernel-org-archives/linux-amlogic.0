Return-Path: <SRS0=ok2G=7I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FC2C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:30:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC50F2065F
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GPd6//mJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DvdWnLIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC50F2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Re6ym+7Gfdv0ps3N/P8Hv0Tnym62Papv2vzjUPUZqHA=; b=GPd6//mJU/0Eg1
	MAiWjKXov/e43WaeFKXH71En8bvMPpdopNAUUaEwrcukp+TRSB8o6bL9qQnTFkMOtfS5pwlvZ4NkV
	rTIB+qgX9DhPrzkGrcBw7vODt0G2EflLnuJm4Ji4t8J8StsdMrl2uT9aEnmm+40WO8I5aUxkSW/s+
	d5AFyu1qQc1GxaRqAhrLEnfKJz4vvai5lL1cuUGJ7V2qdQ4qDGvXdA78Behu7PVLKa/WVAchndBlI
	AbZDT6X6oPe+aosH7mNKjjI1ytALmndRv4lI0Lq1af6BO9Y4KKF/FCRVpf4umjPOrO6pIifArtwcF
	0i1n0k6J5uJV0wFKC1Uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdgDp-0007zE-Vp; Tue, 26 May 2020 20:30:49 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdgDF-0006jO-Qs; Tue, 26 May 2020 20:30:15 +0000
Received: by mail-ed1-x541.google.com with SMTP id be9so18773001edb.2;
 Tue, 26 May 2020 13:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJGAhXW9kaqHmdjOkBKCCdqPZdpTsmEr75Eb52L7QxM=;
 b=DvdWnLISXQXckcKGz5k9iHMnMLw7t+1Bf5ROTwcPt0G7qtxsWYK0OLFt/tU4vxx5HS
 p9EtwrWaJYBdUO6wX0O+ud7L5aW0BxMpMbjSSzaTcR42410tsoOJDstMiRFCexUxy7ub
 4sEe/Q5IELF9Hj3JKo85j6fTjE2mt+OINcfHZ7ALe+tA9B/K0rb7zr6tvZpj18bOe0VK
 bih/T7ZuWH3bpXLMP93jHxz/4p0S4r6KYn+iYt2V/QgkJrHgdLNqHkgYlbvMl7UBO6DW
 Uo3H+PhKLoc4hnnghNVyaGDunmyCoqxaFV+7xL9yD+zzN7TIBT/ErUdSC0OjLzed6nYp
 Le3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJGAhXW9kaqHmdjOkBKCCdqPZdpTsmEr75Eb52L7QxM=;
 b=XLSI0lnmytTUCq8XDihhBahAoS+zACEq+DpuHvkfEWbPpp+V2FdcW3+t+2fWjzm3Cd
 S2SAZELZBSP3ryLwaaukH+XoRQ8VXqt+vyWLgxzNgNLTTxQwi+jnfOsHPjfrdOxdBoqX
 Cyy2A0aFgjPH/zgQKeYSr2pXaZjXZzCWkKdHxEGbAAe1+2/U1jbWFkbQZKdKJZIETD8P
 2ox2BPDwf0rs0dTsmmDauOMf9Ec24uOcvru4eECZPvsrehi588yCAQXOTJNKxq43tfWE
 3SEzrdZUqQpSlg7N65/DNqgYJSie3VZTHB555SX8R96FDWCoLLVOlboHr/RvXcamcV0W
 GOow==
X-Gm-Message-State: AOAM5308QYS+Rhd7lCO5eH93LNaBQ9evA+WHXhmh4iwA0+yqPbg81UWE
 ksh9QAx31JevHONzQ1TL18E=
X-Google-Smtp-Source: ABdhPJy0Ce3NFppUwfK2zdiMLWn+r3b9wC6i+sHOfqsQ0eHIH0E7/7C4q8MKdRlIaLKasDmDQnql+w==
X-Received: by 2002:a05:6402:8c1:: with SMTP id
 d1mr21864323edz.265.1590525008143; 
 Tue, 26 May 2020 13:30:08 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137189200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3718:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id ce16sm735517ejb.76.2020.05.26.13.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 13:30:07 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Subject: [PATCH for-5.8 1/2] usb: dwc3: meson-g12a: fix error path when
 fetching the reset line fails
Date: Tue, 26 May 2020 22:29:42 +0200
Message-Id: <20200526202943.715220-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
References: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_133013_867458_00A30878 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 hanjie.lin@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, yue.wang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Disable and unprepare the clocks when devm_reset_control_get_shared()
fails. This fixes the error path as this must disable the clocks which
were previously enabled.

Fixes: 1e355f21d3fb96 ("usb: dwc3: Add Amlogic A1 DWC3 glue")
Cc: Yue Wang <yue.wang@amlogic.com>
Cc: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index bd744e82cad4..ce5388338389 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -738,7 +738,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->reset)) {
 		ret = PTR_ERR(priv->reset);
 		dev_err(dev, "failed to get device reset, err=%d\n", ret);
-		return ret;
+		goto err_disable_clks;
 	}
 
 	ret = reset_control_reset(priv->reset);
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
