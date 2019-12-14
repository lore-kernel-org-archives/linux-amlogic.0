Return-Path: <SRS0=KqFA=2E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F13C2D0C9
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Dec 2019 17:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676082465B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Dec 2019 17:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aWcNDrPM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHnjEtAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676082465B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=xV44FlszxFor1l01XUb+adHhxLC+9E5agb50CsqjB5o=; b=aWc
	NDrPMlr6garx6+K+0aL6ytblv+P6G2L8PdTsACT4nhc+2buHul2xAoXnSWM/rOw2NcdQMX9oZngVC
	ASUfqrw2BxwMOdbIul8p60Zp701zs1Sxv0mhPAN4AhmBmERH+VhZPaPPR+wOrfIeF3ywcC7BzZ4hS
	Q0nhYSK49el43BscrmXlwQriR3smc+TEQCAwJ4LtuJPs9MhN1K5pYZNd+VuqU5kFdWSgc+a3QX7wQ
	ovzp4sJbMJKJFSfHDwhcTNa07ADPvFz6nr4OFeTMntuwspApPPsky6CgLzqy/ghIrVYweOgEgYTD9
	xXZRn+M3mKOtad14+J35cEHkMVmX5jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBdN-0004w3-E4; Sat, 14 Dec 2019 17:55:17 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBd0-0003O8-3p; Sat, 14 Dec 2019 17:54:55 +0000
Received: by mail-pg1-x541.google.com with SMTP id 6so1198605pgk.0;
 Sat, 14 Dec 2019 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HUgbRO2BhcAt34RLIr2Su6ppZQ/Nd1zKa7NZkK38qdo=;
 b=gHnjEtACweKJQ9KxtQ461Zgr7NfGqheFDsRZTRRJFz6YFL8wuergs72JfrcnO77sdJ
 /QS7UPm1Bg4iIc3NujE4sEMdigb/F/ubMD4/HZVOB5uT9H+42YKgm8+veKx3a8YgFdtN
 4jggFFFOQRkLhxlPZm6C6OxcyQ1QbRzAyrzeiBX8bXkva7ITvJqNDVSY0Fae7CSC21vy
 JP8PdkfrraxJdDi8nNQMD4jxIHdZTp8NmiB1F0c7GS7VpvR2GLV2CyfBpXw8hFKCMdY4
 5RyngV4Optzg3+dljoTt0tZeJ5RhogtepGPUJ1LqLD44vd/D1CspHKleJVWmOwLZLop4
 BhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HUgbRO2BhcAt34RLIr2Su6ppZQ/Nd1zKa7NZkK38qdo=;
 b=fnase88RwqYVL+M9Et1ssmcIu+f9UHymY4AL5WrK/mU3w8r60F65duj7Kf3S/anVMc
 wkgVWL4DKKhdN/CATJF1D4GnSkoOSk66E0Y21XG07MY3nt2hWJGyjnXbE4ORuehMKdmU
 pF2vH7eLMhHyyDK9h/Ks0fm5lXnIQjKl3ow/K9F6IGB2sIc9qQ6xnuKkYxU9kO/zo1kb
 RwVKNGSfpTBQpw6t470yUywfsE6G+5VkxoGb9jxcE5MjZGEi4VbyWZhUVbCDazUNlfe+
 AHAyB9ajVyC0YPPw+Or2LZNBM5504tVhSuChdgnLBy3IkbER/vqnCpyp0/LBMh/y8GS1
 P3Mw==
X-Gm-Message-State: APjAAAUy9wKY2m9bD/R8O/Qasc/fXd63lGZjYZiqN0mfYP8rpRfUCJtg
 3YgMILfmGU31kpj+Ew/stwI=
X-Google-Smtp-Source: APXvYqzczN9kvUPQ7Hc2LxnRw9L6ohEd0G4hrwU0EL1lvwEgBvQanEfnjjXSSKWlr9BOfM41oALivA==
X-Received: by 2002:a63:111e:: with SMTP id g30mr6840840pgl.251.1576346092717; 
 Sat, 14 Dec 2019 09:54:52 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id j16sm16064250pfi.165.2019.12.14.09.54.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:54:52 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 01/10] soc: sunxi: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:38 +0000
Message-Id: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095454_178450_502980C9 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 1b0d50f36349..f73fbcc73f51 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -320,7 +320,6 @@ static struct regmap_config sunxi_sram_emac_clock_regmap = {
 
 static int sunxi_sram_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct dentry *d;
 	struct regmap *emac_clock;
 	const struct sunxi_sramc_variant *variant;
@@ -331,8 +330,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
 	if (!variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
