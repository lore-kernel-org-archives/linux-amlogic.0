Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A60C433E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 08:50:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E25E82071B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 08:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usehEkfD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0A5itPX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E25E82071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CH/2GXuROT5MXhK3sZfIlkf2S1qdYcYoxUtZ/CAkjgo=; b=usehEkfD8Byom/r/h3AxShUVqP
	Vr1nDfQA+6Adgy1sz87GDsI3RWQnvG7EJk0mq1FqN/M1s363K3CbIUpZ7nAR/NJG5nk+WrfBFQkzv
	vZCBNVht1XOR5y9komAQxAnx+57OMRF7y/MnWquNWtWBW9eAtm9tubk7VelrW/HIYivAOhvnn7Zw0
	xgRJL7GBmTDQfrxgR+LdOnuRIGorcpxBWahu6rdjlrHxxoftW/IbiU7mepwvMCeuPvbLCBdN4HsaC
	KkYnQXIWtea95ddzWhFdNdHueaCXb8B/6PnhdQM39hX0NQwSZdjjkvb9DxaHHHKJJ/ew13obcVV9I
	okahtOtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBa5V-0006r5-NP; Fri, 28 Aug 2020 08:50:21 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBa5T-0006pC-7c
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 08:50:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id e16so539374wrm.2
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+3tnyknHgCWcY+CXnIQZy7jgmgvddABFfrqih1RlpU=;
 b=B0A5itPXeBN+0z06C4i2qeDYBj1zPxUlWoFeoxX1tf3yAAQFC08TX+JL7pAgAVOs+B
 n6Xw5DzvcljhL5InIo/s9qwM0SzHzK/Mfm0sSbs7ZoxjsGQVsuU4gjoCGJA2jihEo5Pn
 iwjupedOv8SeVYmoK85WjcskP7S+1+kT0M34omP7TcFVZBdky8umspDDeoJy/xUtQXD/
 6NvTcgs1crdHKt5uFbhzBi5a/KcOFYJ3+RiW8MenX83ZOtVZLbFThm/0IskQHzgeR++g
 NoZH0ZlDqLFlLVMivvVUrUlgV2vvXAJryOlrpCS4ndfRDbddoBcK+VedpsNZ3eQ0/ZRc
 4cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+3tnyknHgCWcY+CXnIQZy7jgmgvddABFfrqih1RlpU=;
 b=HrvcMPddGct1u2qy22DTd/cZc5pKstBTlJtkXMF0MJ6EMmXADf3cSfpfrD9auaP7xV
 qEWkfa7m+jhQMNOFTKG+OZ/WorgmuRPL+6ncT8MrlVH8plyeq8aBSoPobUhA1IYG2kkY
 UwoVghAYKs3Gwa1ByaeTE3qOiw9ANlrpAn9/5y1uH/chucSzDH9y/UIo1rfJi6VhN4uC
 dbpL6Ft1mKLdElLb1b4onxjNBP5/TFjg5FgC5/rjpvAzUupULd91HbtAxOBZwSFzOoAb
 K+RuqIkEBO/iUmGbcZcH9LohF0dFO3BSeQmoOnJ9wL8sLwKg74z3lY+SbXGOLm/x/sPf
 4xhw==
X-Gm-Message-State: AOAM530hzwNQi6ODz15e87m8MRG8hNVhofBUNMR+XnlFGaaZIc4dXdTo
 b1HXfQC9MHH+DTbo/8hCqcqczA==
X-Google-Smtp-Source: ABdhPJxKpuq5ifj5pswrU/neYc8lZDZhx4Q5BSNYHUmcMo/znm+G6K0NN0tMvVvhrGWR+/xW740azw==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr509062wrn.249.1598604616677; 
 Fri, 28 Aug 2020 01:50:16 -0700 (PDT)
Received: from dell.default ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id a85sm1111057wmd.26.2020.08.28.01.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 01:50:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/1] mfd: khadas-mcu: Fix randconfig 'unused-const-variable'
 warning
Date: Fri, 28 Aug 2020 09:50:07 +0100
Message-Id: <20200828085007.2008096-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_045019_319514_87046026 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: linux-amlogic@lists.infradead.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When testing with !OF, the build system reports:

>> drivers/mfd/khadas-mcu.c:125:34: warning: unused variable 'khadas_mcu_of_match' [-Wunused-const-variable]
   static const struct of_device_id khadas_mcu_of_match[] = {
                                    ^

Cc: Neil Armstrong <narmstrong@baylibre.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/khadas-mcu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index 44d5bb462daba..f3d418810693c 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -122,11 +122,13 @@ static int khadas_mcu_probe(struct i2c_client *client,
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id khadas_mcu_of_match[] = {
 	{ .compatible = "khadas,mcu", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
+#endif
 
 static struct i2c_driver khadas_mcu_driver = {
 	.driver = {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
