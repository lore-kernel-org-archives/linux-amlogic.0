Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96812C433E6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:51:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C3920838
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k1XjBiYG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2q5UJCJT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C3920838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX/pHQWhtbeJg4OroL+twOPFYXSq/SRHw8M3IjMLVrU=; b=k1XjBiYGPdk2xw9eXXNk0MM/0c
	8MR8YOGCPC3jrHBPV1PI26zPXutDsh+iAOsBsDXS1NUP9445UvdnuerGyg7XZZ17nt/rFid4P4sJg
	TBJNDYnLwEkSA0HawvhGyemPvwGzfB/metlCJd7Lo157/N9um6s7N0DC0OYfLM3VbeT/siJCmEDbb
	TZw5ZZD2b1iF+/PoDmYntznQ98QXa1b5OHahtSqm3rre2WZxTFfuN4Ls5O3hDj82GhJBNusvdwX+C
	k9PCAYiXYIOz5/3t2LGIMtnJ3iJ77wNRq5AsRfTguHLnhhLrEbY8voALqbc0TcBWrNF5qeq9fqc/N
	GBsDry/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBuiC-0004cX-9H; Sat, 29 Aug 2020 06:51:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBufi-00037E-TD; Sat, 29 Aug 2020 06:49:09 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3B3820E65;
 Sat, 29 Aug 2020 06:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598683744;
 bh=4Lu3EJuJBkPkkhNm8cEkffiFcH6Q42bc9rp03XpBrfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2q5UJCJTz4MbOA8HJ/KI2YbH8ixBYNWTU5cscPWHOwBazmyqOMEXvAJA/TxjhKgCc
 dcJSIcEFEFv2wOtJLH1DrUOpfmGGfdCCzR7rTAP/4bqEVf4iq8xpZCegelD2iVSsM7
 wejsuCcOP7LOR8iIyXVxYXrH/DNE/16YWdxioG8c=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 18/18] iio: multiplexer: iio-mux: Simplify with
 dev_err_probe()
Date: Sat, 29 Aug 2020 08:47:26 +0200
Message-Id: <20200829064726.26268-18-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829064726.26268-1-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_024907_259510_3C64BF13 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---

Changes since v2:
1. Wrap dev_err_probe() lines at 80 character
---
 drivers/iio/multiplexer/iio-mux.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/multiplexer/iio-mux.c b/drivers/iio/multiplexer/iio-mux.c
index 6910218fdb00..d54ae5cbe51b 100644
--- a/drivers/iio/multiplexer/iio-mux.c
+++ b/drivers/iio/multiplexer/iio-mux.c
@@ -354,11 +354,9 @@ static int mux_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	parent = devm_iio_channel_get(dev, "parent");
-	if (IS_ERR(parent)) {
-		if (PTR_ERR(parent) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get parent channel\n");
-		return PTR_ERR(parent);
-	}
+	if (IS_ERR(parent))
+		return dev_err_probe(dev, PTR_ERR(parent),
+				     "failed to get parent channel\n");
 
 	sizeof_ext_info = iio_get_channel_ext_info_count(parent);
 	if (sizeof_ext_info) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
