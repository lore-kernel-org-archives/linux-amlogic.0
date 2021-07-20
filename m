Return-Path: <SRS0=sMge=MM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B6FC07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 10:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C0F610C7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 10:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C0F610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=raVEiqwXkRp6lNDvhdBIAsUVlH1zSPKmgSFBlOf2DJQ=; b=Dzg4yOekKd/BET
	sqWCBBNNVUZ+BgY9qWwz/8D3Eea6ZBuGbpnv6QlzVL3IY7eeLGKu0hTtZcdKeg1iq8ErSETd7pILZ
	OoE5gKpZ2HsZFyaU7s/E+R2x2YeK1YGBfbKOZer5NzvdtW6bU/gfDsjpKcmK7pwHV1K2eqF1ToYs2
	UnliBZwcpTO6yGcWJDE05HoDmf28zFdxNbB+ScGB8/yDXmcVElt1SOXyhDwKQ/iStTu19UGLrlUXO
	hLh8IxOHU4XU3XjdTiOvl85qPXtUYMrlMYhdgEo9mJceTGMCnQ2hyPNq0C902f4MFs4OKyXHQDXDt
	Ndu8ruurlzMJHTWzef3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5mZN-00CSID-IV; Tue, 20 Jul 2021 10:01:45 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5mZA-00CSFa-0t; Tue, 20 Jul 2021 10:01:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id i14so7079891pfd.5;
 Tue, 20 Jul 2021 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p7JqjKw4ZgeUqcixNCroP1lhIkrtsuMs/VQXEPM5hRg=;
 b=DxxZ4ytQrUZq6pfA1s91pu+YVSJ39hxGEzwCu8ieEunT2j2D7GzlvzW8hJ26bF88tU
 WBk9Pke5xIabideKp4XQQvgj7sIZwCOegsD1M4YWT5Md/G44QIq4XvoUyCMBRpQAs3zf
 XKqODqfk0COx+NivVfLyYnqD3nxi2WpCiqQTDA/I+znq5GNVfb3bDtEFTagFaS+n6pgm
 X7+nymqJ1CCyc/O3rSuG9b4cF7AJw+qYs1VOuq8ekBfeGuctFc7WIU740Cha27HOEKf9
 kMGAXHu1XA0ciHlPpGfLKWTshrGFp3Zt2js/9KLNAy3KFP0OUl2W8cXjPGUAFZGY0g4t
 vkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p7JqjKw4ZgeUqcixNCroP1lhIkrtsuMs/VQXEPM5hRg=;
 b=JxT/fMtf+onwZWYWIhT+txXTiCLj+TWKgrr7aG7qgAZ/3L0bVhKpF9Df4uvzNYcV/0
 4c14Ci3MLPzT8R5b2c+QAZlpqfjuKFw8/mi9auANQ52cr6RF0Ws9RDuuY3UTTyFKskKd
 4QwtN6nk5qJHvJ32dv/n8P4gZUeI4cAAEhM5bs1NvB36Vvjnl0/D1F3huIypi3MfiF8g
 gkOqbA8a705qvGh3DzDuFGrPxJSulfmbAvItiaAgLwuid1xKdFaH95e4s1GwDX9kOPf6
 ygwmDTSma4rDyNbTj8GDOdl3gZokPTtoGtsnimzAOTrB9HkPnbjuxMj7THwrOKutLJGh
 qXQg==
X-Gm-Message-State: AOAM5318B5kLEBvgD919q/rQNPGOaNgVoDszPbzrp6/NKTkfZoy9FtAu
 5rkm9tojrzp1NM7yKMk2QjA=
X-Google-Smtp-Source: ABdhPJz0HRN2ARW3HNVlTQ/wea9NHB4NFkITtFecEKWrKWkwa/yPrJiCNeBNjbzYYRhz7+YHU+QzEw==
X-Received: by 2002:a63:514c:: with SMTP id r12mr30438063pgl.70.1626775290352; 
 Tue, 20 Jul 2021 03:01:30 -0700 (PDT)
Received: from localhost.localdomain ([154.16.166.191])
 by smtp.gmail.com with ESMTPSA id y9sm2073966pgr.10.2021.07.20.03.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 03:01:29 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Dongliang Mu <mudongliangabcd@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] spi: meson-spicc: fix memory leak in meson_spicc_remove
Date: Tue, 20 Jul 2021 18:01:16 +0800
Message-Id: <20210720100116.1438974-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_030132_133945_83BBC48F 
X-CRM114-Status: GOOD (  10.95  )
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

In meson_spicc_probe, the error handling code needs to clean up master
by calling spi_master_put, but the remove function does not have this
function call. This will lead to memory leak of spicc->master.

Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
Fixes: 454fa271bc4e("spi: Add Meson SPICC driver")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/spi/spi-meson-spicc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index b2c4621db34d..c208efeadd18 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -785,6 +785,8 @@ static int meson_spicc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(spicc->core);
 	clk_disable_unprepare(spicc->pclk);
 
+	spi_master_put(spicc->master);
+
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
