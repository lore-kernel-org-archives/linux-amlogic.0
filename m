Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C6BC3B198
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6222086A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOt9pw1p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TSTqqQMF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6222086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3bouPj3ivk2bubGWt3tp6nbo+Tc61iEinTFv5U1haM=; b=TOt9pw1pez7ZKL
	wYnhyaLhMACvmdArPDgFyIEyK3/nsJyKJuc7SBUOBVXvTK1Kt75uL9E9L18c56VPEOZtmIEwezWH6
	/tCU8/SEo6pRxQkB0QaF+7wQeOpTe7IL0fS/RIoBVLWDM6QYGkyE59KI4LSDNImuB4+4AAmXvarvp
	caLItASNUO/Fej6jPDUVuSlL/o7klz/UpqxlqJJK4zMMNXYkvajLKK8SWeF461IlqtT3sFWEsM6Ai
	DN1t+CFpmhvKZzF0TQagwYXoI370p3u0II+jrQ8+npniQpDDnkwF6p954t4pJmyGlgkOTc7O0Ay7J
	S4OkaNhyM0TWyC4b62uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2anO-0006WK-I7; Fri, 14 Feb 2020 13:14:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2anD-0006MD-9g
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 13:14:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id y17so10857109wrh.5
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vuwuzpsX5RzClpZoSCXE8jPlP14S0+i5Nh9kd/OQAlU=;
 b=TSTqqQMFRXUb+avCLPyEtyy/SXMFgBkz3pOzmJbAzGCp49zkBAxH+R1F/rhbnNxTFD
 Lk+85ejQ9VGaB7p/I4fQH7B7SdZAVt7MLVbNYuC7JYW+x61DQrc2AWz8LSevDK05D5eM
 HcrXJxXWzTXuLSNhEvuWHScbTYgK6y1xzaKe5Lcg9UBtw6PwP9hs115Own9COoQ83NFd
 Ywc8T0gKKEGTgQ/6RHwKCvpXT0LlDeHmBbnWaLQQ+hrEcvsTBE7pSSdiTIZhk4an+wBg
 3pSd5O99tNdGusYKMLiX2H6bckHhb5Oj10pHRP/mJwt2i895/6nWHO18IV24BQyvxVdJ
 /THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuwuzpsX5RzClpZoSCXE8jPlP14S0+i5Nh9kd/OQAlU=;
 b=uEIkA+fiWxlzAjagv6IhjCc0LGCNEgBBVXtwzUkmo2HZQLGX+GPHPD1laERhJGUd9V
 EFBLcKxAgsHCJzk27/O3Dl/9dxkIhci5wEXCJqRYuymxK0seJVmZmeJxITq1u/8tQuq/
 72T9TI0kr3SjmZcWuy1zqAZkRuw39wuxKUP65+D5AQ1d6qWQPckE4AgcHv1vNup4JMOL
 p7Hpfd4SREFw+Zrf/55o+6uh+9iMeZLdRe8sITjWzL//ZNTE6VS8ByH2iEXShNWe8w9l
 1CQ/NQImaV9MfSpwqkMUapJd+niTMDmcRiqN4U1Z1PbY/lcmn12Trs9NI36jcz9NFx/k
 hSrQ==
X-Gm-Message-State: APjAAAWk7J8QRKiyrPoJNLieWaAy+Pj/RGMaDM5Sksl75KijGasMeiH0
 ova60jYsadzqt9Fnpxe+2CABHQ==
X-Google-Smtp-Source: APXvYqxMHOnNCwLIWDmiOvwhVwAWtwAZf5cc+Xtor4Tr9qkozMweqEkbj+d370UvqeuQ9mcLgqpjyA==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr3985658wrt.162.1581686037685; 
 Fri, 14 Feb 2020 05:13:57 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/5] ASoC: meson: aiu: fix irq registration
Date: Fri, 14 Feb 2020 14:13:48 +0100
Message-Id: <20200214131350.337968-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_051405_089685_3BE6B5E6 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The aiu stored the irq in an unsigned integer which may have discarded an
error returned by platform_get_irq_byname(). This is incorrect and should
have been a signed integer.

Also drop the irq error traces from the probe function as this is already
done by platform_get_irq_byname().

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 8 ++------
 sound/soc/meson/aiu.h | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index de678a9d5cab..34b40b8b8299 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -314,16 +314,12 @@ static int aiu_probe(struct platform_device *pdev)
 	}
 
 	aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
-	if (aiu->i2s.irq < 0) {
-		dev_err(dev, "Can't get i2s irq\n");
+	if (aiu->i2s.irq < 0)
 		return aiu->i2s.irq;
-	}
 
 	aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
-	if (aiu->spdif.irq < 0) {
-		dev_err(dev, "Can't get spdif irq\n");
+	if (aiu->spdif.irq < 0)
 		return aiu->spdif.irq;
-	}
 
 	ret = aiu_clk_get(dev);
 	if (ret)
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index a65a576e3400..097c26de7b7c 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -26,7 +26,7 @@ enum aiu_clk_ids {
 struct aiu_interface {
 	struct clk_bulk_data *clks;
 	unsigned int clk_num;
-	unsigned int irq;
+	int irq;
 };
 
 struct aiu {
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
