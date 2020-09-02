Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498D8C43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:37:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1751F2083B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ssNs9MXo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l965p2wy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1751F2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHlWMLicFr77TdciV8zgha8aI8Hx8RgWKkXiQvE4C3k=; b=ssNs9MXo/cNxZ6NATuyvZ1FXxR
	u2NN7FLVXfdq/sYQPhcKOkAVHCUzslbzFVpV3NAptXti9Nh/ultKiD2eOaTHXhelhgofkCz71J1KK
	wxzHYaq0+Zd57E3HrXxxR3Cvp2VCLIgF1Y7NjBTgYnStkTHrOfA03+eFcOmC+kcA8ONHPL7tnieuI
	G4etA6DyNAUceo30C/epwhj8CYmFPXZOmAjEfKUHmvHUBx+WRXjCrRriBguE7aq70S5DZ2Ouh0OZ6
	RIq199ysArdzujRi54POKkiPfewGOXNlw5itixMoZ/zZKlJVZwDFZD+b/HZsXqS0r1UDUfq4NMejX
	Nu/9Ap1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDYZg-00082y-5O; Wed, 02 Sep 2020 19:37:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDYZd-00080d-87; Wed, 02 Sep 2020 19:37:38 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 557BD208C7;
 Wed,  2 Sep 2020 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599075456;
 bh=5UnpTA5GY8oNqT3vBtcTzkLMcda+odMMYdMuv+NOOyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l965p2wyuOyXR5gyhwoX1BKPXSLXH5XU7O35v8yUw4at3Ke+NvrG3SwcBNbY6ITLV
 1Z3i1DD307CJIcfZ1SsjhNUJOZ0nJSocEg1djQAl6fz53k17bf9uD9T4bXRKH4igQq
 22YAJw9gPaM9NkfexU0xMCsDCJiHwfGKcxSZcRxA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH 03/11] mmc: dw_mmc-zx: Simplify with dev_err_probe()
Date: Wed,  2 Sep 2020 21:36:50 +0200
Message-Id: <20200902193658.20539-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902193658.20539-1-krzk@kernel.org>
References: <20200902193658.20539-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_153737_439085_6853AC11 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mmc/host/dw_mmc-zx.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-zx.c b/drivers/mmc/host/dw_mmc-zx.c
index eada648b27ec..d9e483432a61 100644
--- a/drivers/mmc/host/dw_mmc-zx.c
+++ b/drivers/mmc/host/dw_mmc-zx.c
@@ -155,7 +155,6 @@ static int dw_mci_zx_parse_dt(struct dw_mci *host)
 	struct device_node *node;
 	struct dw_mci_zx_priv_data *priv;
 	struct regmap *sysc_base;
-	int ret;
 
 	/* syscon is needed only by emmc */
 	node = of_parse_phandle(np, "zte,aon-syscon", 0);
@@ -163,13 +162,9 @@ static int dw_mci_zx_parse_dt(struct dw_mci *host)
 		sysc_base = syscon_node_to_regmap(node);
 		of_node_put(node);
 
-		if (IS_ERR(sysc_base)) {
-			ret = PTR_ERR(sysc_base);
-			if (ret != -EPROBE_DEFER)
-				dev_err(host->dev, "Can't get syscon: %d\n",
-					ret);
-			return ret;
-		}
+		if (IS_ERR(sysc_base))
+			return dev_err_probe(host->dev, PTR_ERR(sysc_base),
+					     "Can't get syscon\n");
 	} else {
 		return 0;
 	}
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
