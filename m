Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AB8C32771
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVqukTfkQfw+TRISsJW0NrA/85UlAM6e7Ablz+ew8Ao=; b=nayEaq0O246iLX
	/P3RKElt/W7wu3qJJKvLh3kqi+KWvwRCsIDkVqA8+x4wi2GGN3Qp9ognLaS+GISOLXk4IG6BoyZ52
	xo7AdT5EpK0xe3/EqnyxIcvH+LB4Nn0LHAthS7kKdfs/8YsL0hO0OJmG61eLAvMS4tSHorB6mXRLo
	REUrJh1Yj6w7RR+J/FZf/dzgiS3BiUVeEea++hzSlkkopzplwSIQ28K8twMayrXmF7e0tXciN4Ww3
	T4FWEGjtmpmiBpLcbYmDaBzK4tM70jZpPgi5+f4MivC9pQYJSlFzYgPsdmnAOXXTBurkASBs8ZJap
	r/XuBi5poLpkV11K7cKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvCP-002Bo2-2H; Fri, 19 Aug 2022 06:09:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvBH-0029u6-Fe
	for linux-amlogic@lists.infradead.org; Fri, 19 Aug 2022 06:08:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id fy5so7013772ejc.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Aug 2022 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nqYvJwkPyhGWw+zs1FTUvC87NAtZOXSQ3RqOerl0RrE=;
        b=fiuYIZZteuYPevbr1jm85MKPd5CH4K37Lu4s75kvjuumhqQNFhJ070aTDxlo8rddZH
         i+SLkKBHFRU3yeK8DOPjK8gtAyWibQEuXvJ8eP9IHSg/vRac7WgRAymuwe9+ZobzdLFN
         PxR14UjJQUSwykQ7XL3yHLtQ4vIhSNDABxzAuHo0Xmno3tATOenqwGlRgr3r4XJhrefO
         D77YhaODhrbxs5QaR/3iE+LF0FPSh9Ss0hm+76qlQi4ZO1yohXeMcT2tciZbP4zjCTWi
         ITu0PHFBTopfTT6ON3pqalPDv/DMSFxCS4bqvqWVeoQK7zX6Pur+EiSUCX6SB3Idc4bs
         hj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nqYvJwkPyhGWw+zs1FTUvC87NAtZOXSQ3RqOerl0RrE=;
        b=VkB8U2hdOjd7f9w2T8K6wNtnQfVI4SL6AzlzK6bqX+o023bQ+yqE6PYcZ/AL7KEd1p
         9oIUEDQSAx5MKnXyq2mMmPmKF440zzbSZQn0Yv8IPCXute6dg4RR58oE7CWmb/Kqn9Aj
         DFIr0DWQ8RPPRIeoYRlIO9ZaoeIZW83fxVjpkVo17ezh8lwA6a1eodHgiCSoMciKXa0l
         WNv+m8Uh6i3nE/Ps/9uArm9K3ZXqvYildYsm3amOKOVI4r3+XMewIN6pVqrffwlBweBW
         ISjKe/1b63uxxxyTwZU2jdNRyTgDp00TAeRb9/ldHUqajmbDM6S2h8jUuox+knrsVb85
         BkKg==
X-Gm-Message-State: ACgBeo0ltIOy89kEbGFhjBd+BMcXilbyDbPLvy0ICXcaTgdYrymI7pEZ
	qhTC8W1uSBQzHpguoWHbVHbETw==
X-Google-Smtp-Source: AA6agR63MvipYuGx9P2SlYQNDL6T8+iUmE8z45ilOguyJ5frm1741Qd6zDL+S52D+AlEU7kMb3PpMg==
X-Received: by 2002:a17:907:7628:b0:730:b755:4414 with SMTP id jy8-20020a170907762800b00730b7554414mr3907267ejc.11.1660889310244;
        Thu, 18 Aug 2022 23:08:30 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:143b:fd00:5207:8c7f:747a:b80d])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709063a8e00b0073a644ef803sm1809660ejd.101.2022.08.18.23.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 23:08:28 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v1 17/19] mmc: meson-mx-sdhc: Fix error check for dma_map_sg
Date: Fri, 19 Aug 2022 08:07:59 +0200
Message-Id: <20220819060801.10443-18-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819060801.10443-1-jinpu.wang@ionos.com>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_230831_574985_3DA0CF45 
X-CRM114-Status: GOOD (  12.13  )
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

dma_map_sg return 0 on error.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index e92e63cb5641..b32364f20c32 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -388,7 +388,7 @@ static int meson_mx_sdhc_map_dma(struct mmc_host *mmc, struct mmc_request *mrq)
 
 	dma_len = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len,
 			     mmc_get_dma_dir(data));
-	if (dma_len <= 0) {
+	if (!dma_len) {
 		dev_err(mmc_dev(mmc), "dma_map_sg failed\n");
 		return -ENOMEM;
 	}
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
