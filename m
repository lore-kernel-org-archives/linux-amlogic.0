Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461E8C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B08820652
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvHvHOF7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAYfknH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B08820652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MQYxcuK+q6VaaU26Oi4sXs06dIIqim2WGJeBOYfNMdA=; b=JvHvHOF7U2sNnI6WdivVWKhP06
	UE/GF62QFdb8ErftRayDICt4yaMp8sROp+wyiVWdNXima6Xz4MxkLzWWTNcrDobOBmCTQI7asuKK4
	Xk8JDZyb7BMMUhtGzoIHYyTlnO+StwfGliyBa3QBAmcy/lsjf7IQ0Ll4+8I99YeJQH3xZJCIQMa2u
	tB9y1PggZpGLAnPrbzwQV8cLeUAd5CnFBkpdx+LxtbWz3g3bo0p5WRtr0u9kjODbmvTKlY1xG29cP
	EutUAKdQvIi+8uTRH/1iQ4sunsv5yQ9KZggFiHfxwLrrBchYgRzhbuP7MsNyssyf4j3eUuMCzGMPB
	j4Jh3XrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iemBK-0001Qu-N0; Tue, 10 Dec 2019 20:32:30 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iemAp-0000tp-EE; Tue, 10 Dec 2019 20:32:00 +0000
Received: by mail-pf1-x443.google.com with SMTP id y206so414829pfb.0;
 Tue, 10 Dec 2019 12:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A/c6zfJJrS1aJG6jppJ0JzwIndi82aE8y6QtCeoxQ60=;
 b=ZAYfknH6apyPpWisMZWD70J3/OlrrCxL8Gh8/H0vPzjcTwa5tGgqHcYy2JVjItrRlE
 HgLOw5DCSVcvah5RcNdf3oe6e4IQDYBwUv0wWY2Xz/7VSCVA4GyKr+MNpJM+1i1UDZHI
 HKn0BVkKXSCLrzHouzcAJnc88a4mmWfbOlaCUW85oFrpkr/FN2IdJBT8jQ0Tu3pocy9s
 bnmk/+CyaxZ3ialSyXrxMz0v3kBfjQEmU1wnqIiLfqpMKxpJRUkSatqtySwPBwbGlGHC
 nWYkMpwEeAukZIommkVhTY9d18JnyedDOlyr9gOrIY5sTsIJI7qTNv0gCP7sr4vNG0BX
 RLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A/c6zfJJrS1aJG6jppJ0JzwIndi82aE8y6QtCeoxQ60=;
 b=kcxyqqPWD8/dHW1OfYuFjZBl2Er7Fqa7AOSUy/hTicw9vmwQhQPzGiVHF/lQSsc/wv
 mcpGGhnF66MtdmRHc3pzZBDhg4L7OmDmV1QX1s5Y6drVKlXBA6TC7hlEgkJ5WOi11gH9
 hkql+ueLkG2bj79ZXhnggpZrq87UuEVW72pxK+cGW/GXQUHJYU8JlJrOyd+4dM0tD/Wg
 9sIOtnLSbbjIE2PzQash3JOPYwrjHnjp5ipCXDMmPearSu9RqKC4llPzB8+M4zkqiZ6N
 S5GmOKngRh64xFMndSaVMT6IhJxUPfghjpPcYvx5Eyma6frMq30vp/mHfvq5APX62ELF
 1Ppw==
X-Gm-Message-State: APjAAAXXaLu6XAXs6o3t+xVhqOjVfxYHg+ktnTIDhSUFpild5mMlC5FG
 sfQuGY+T+1W63PblPHUwq4U=
X-Google-Smtp-Source: APXvYqxO+Ov5pF1gQ2GamItsgHb3CUFTQBD50B8GhuwcFzTJa7s5DAfFUIqgmWSuNZzVvQYauh6GPg==
X-Received: by 2002:a63:4723:: with SMTP id u35mr25740960pga.194.1576009918720; 
 Tue, 10 Dec 2019 12:31:58 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id b22sm1931250pfd.63.2019.12.10.12.31.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 12:31:58 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org,
 srinivas.kandagatla@linaro.org, vz@mleia.com, khilman@baylibre.com,
 mripard@kernel.org, wens@csie.org, andriy.shevchenko@linux.intel.com,
 mchehab+samsung@kernel.org, mans@mansr.com, treding@nvidia.com,
 suzuki.poulose@arm.com, bgolaszewski@baylibre.com, tglx@linutronix.de
Subject: [PATCH 1/5] nvmem: sunxi_sid: convert to
 devm_platform_ioremap_resource
Date: Tue, 10 Dec 2019 20:31:46 +0000
Message-Id: <20191210203149.7115-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210203149.7115-1-tiny.windzz@gmail.com>
References: <20191210203149.7115-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_123159_493448_B7F5E640 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/nvmem/sunxi_sid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index e26ef1bbf198..c54adf60b155 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -112,7 +112,6 @@ static int sun8i_sid_read_by_reg(void *context, unsigned int offset,
 static int sunxi_sid_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct nvmem_config *nvmem_cfg;
 	struct nvmem_device *nvmem;
 	struct sunxi_sid *sid;
@@ -129,8 +128,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 		return -EINVAL;
 	sid->value_offset = cfg->value_offset;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sid->base = devm_ioremap_resource(dev, res);
+	sid->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sid->base))
 		return PTR_ERR(sid->base);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
