Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721CDC10F05
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38AB020693
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j6NUhs49";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pYS1Spzw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38AB020693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SA7dN1BpQhtJeIvv4yfSgdf0eGwG6mzKTnpAqJgH+a4=; b=j6NUhs4924cs2O
	E914W3nkVomGEscGtn4gMopzZ9ZTIhAW8wfC6GoH37irTIY2EuEOkxnpqXvfx70ii3O0BbJ7/lryZ
	bIS3ua9GHGnpBZu949rvxFyViqMPE3K+wT8GsdzgrZPR4W03QzsQ7/eaz52d0HJm515a/7dq2KeNm
	cEQYiUIPw4o851SMhLkoK1dK48H65PEaOHPzQtbSM7faKuZprHR4IFnGn67mgxcAyVWKCUFugzeJ3
	oVymJ/VmjkoydNb9hBPG/ODzSlZJ5pyLtufDCFA5E6jMLCtm5zO9cE2+8sg1mRCbJ1eUlu6MIBuq7
	+iQwVyYsJTlWBDv0o54g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9tW5-0005U3-OO; Fri, 29 Mar 2019 15:34:01 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9tVh-00052e-Pt
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 15:33:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id w15so3307802wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWfQp5+ZZrqhqHBdYBd1fS5YgiYNyIDWJS2WXanIlaU=;
 b=pYS1SpzwcqPn03mG5ybxNzW305QTPzPCQZN263IXlWMguaxWwsEMBYjnXbcCHLgUwE
 fPH+js9vlzVc2+Eu+zV/J/qRA2bEk7q7ZGQdJK7o556F7K76c5LkxkgpOASIB0NUdQbo
 mwNZ4bd+82iSvruITeR0gIhLo/Zg5LWPo2ZSFNTOCXeyqJs6mAPBtKgR7D/WxPExfndZ
 YmhxNF4OX1zYm07GCzwBHvtIslQSb2pZ1GZzwoXlBmtQX+p2/oDSS/8+KhAmDjqy7zcV
 O4U85x6VYdjnzcXit5A3CNCMdKSTa4OyR1sqhu0DdOejiZISh2hua7PuBgqjTwmwbVY5
 PENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWfQp5+ZZrqhqHBdYBd1fS5YgiYNyIDWJS2WXanIlaU=;
 b=YXYxgL2+OIiYy6zn+u3ef5QWho9lUfEpQ+DLfynILeTvLjb24HSMtM18n/+SlZuDnu
 K0KnWBxO+qo7rHyB+1cP5kow28xdg2Lk5K3Dak/esggyOtsv/+UeKmArS4E+vsTqWOX5
 HQOu+DiO+phLwXYcqfezlyBjV2lw8w33b2EeHzv7SORegafRR2KY6xhgH92dEAfaOhjY
 a06obuFrkOPyn0s2YCn6X8KjNGucmX17fPtv8/1rC2cJWpkz//G6pFYE1mESGeGXqykP
 /paa496SGJXDTJttMK0Ti0PWP/D2qJ9Ix/W/tvPbTVLY08Z+J/EaUetw1BsmfxretZIs
 bm/g==
X-Gm-Message-State: APjAAAU4yFYRTbgNJBG5GKt+X8bAe2EvOafx+vFNLqK57ClxaxUzDaUh
 RehoP9H1NRzllRK5yPPNSZZZXg==
X-Google-Smtp-Source: APXvYqykcHi1Bbu3B94IurmTjSfeqUhpdghDB5ixIbNF4oVr9EDQj4dbbKldpJNI4UMntOaj0KmBnQ==
X-Received: by 2002:a1c:e70b:: with SMTP id e11mr3828070wmh.17.1553873615975; 
 Fri, 29 Mar 2019 08:33:35 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s18sm1930173wmc.41.2019.03.29.08.33.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 08:33:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] clk: meson: gxbb: no spread spectrum on mpll0
Date: Fri, 29 Mar 2019 16:33:24 +0100
Message-Id: <20190329153325.23869-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329153325.23869-1-jbrunet@baylibre.com>
References: <20190329153325.23869-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_083338_314709_FC7799BB 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The documentation says there is an SSEN bit on mpll0 but, after testing
it, no spread spectrum function appears to be enabled by this bit on any
of the MPLLs.

Let's remove it until we know more

Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 04df2e208ed6..17d4e85bde65 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -679,11 +679,6 @@ static struct clk_regmap gxbb_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.ssen = {
-			.reg_off = HHI_MPLL_CNTL,
-			.shift   = 25,
-			.width	 = 1,
-		},
 		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
