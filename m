Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65A7C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A617F61363
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A617F61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BenLPpOJ40Zsu7SgQc2YJRtYgjnhx4itvwtrn2ujz5w=; b=CAUUVBsg5I5l61
	mGrxfgYgHXm3vy4SNyqfBjpPIOcjLCwiz3vrJtuU61XIRZPXzONNOkEFwhXM0Zglad79u4vi7uigW
	pugrncso8r8Wqd+yXH7SMlbOu+XnRX5ut4l2zTdUYyEeJVo3tvnvyMCK8lLkHUR0CvrZB9Ww8S27m
	LVLYIeE06SzEzGvXzlnsdpwv8FKeWD5DcqwhmfcwZA5Dj3hdznyAfV0q1lgsSbMBdn9JD8JntftQt
	yN1XDVCgNY7TZLilluzGq5bzaYjuil4OYUI18KO8j2m9aWJBveaEA8jAktLxZDkuDAJDWAkmmHDjU
	s7PYskdvPnWD50CdMfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3RmS-00Bbfa-5q; Tue, 13 Jul 2021 23:25:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RmB-00BbXA-TB; Tue, 13 Jul 2021 23:25:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j34so386603wms.5;
 Tue, 13 Jul 2021 16:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQtFi3Hnx4K3qedNDcjWCvPvHnc34scNXSyJRM66eyc=;
 b=O/qHa4p8MUICgTw2moGtJHisz2F0qV71BT3dbeMDgUXv/x4+5h3u0twAFSJzUipAxr
 QGSW48t3kwX0Pmyk0J4M2o28wylS7QEEjfVWnTfAitPIIX/k1ZWmk8DiZAj+eesy3Wus
 IvHbL6JXs1V/EcIJKWION1Sl9cuspToxmpq5s9rfnpb4rcvUIm3ttnVUalhulkrPdsLv
 Wz4Pghpqc+xXFDRiPjxFQv0mcODuCb3TnBoqEH7m7+Zmb/QLlcM1JOYiPajSNSno/+dv
 N85Krrv37jqo2cEYfaJ1Ilmn6BRI0Iz8RqS8amoe5fyHa8BoqdqrV79RmAUq+uFM6Yga
 44Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQtFi3Hnx4K3qedNDcjWCvPvHnc34scNXSyJRM66eyc=;
 b=MIn9C40D5yoK6SuhhNCu87a6x8tANFjDZCgKdrMkD1mzy546VNVFEnqcEV37vR6Vp4
 GmBHQ0MVHgfS0upr/e/7Xx1nLJqRLJTXze60S9xNcYplXHyh4tUlNRoWVu8ef7X7OnvG
 kt02+uOOA+7/736TNH0/SFhrGKrCAInYMC2A/Frsif1BwFhG4WIjv59AQ9Tb2r+VsnCg
 9H1905LDnBI71f+sISQumNd6FQ/PmHSyBm2VMxY/ihRAEO6QRN+GsDM6rHXX8mbHVAUp
 PtKwfP2eZKxBBB8D39xUj5hWtfsIRcem96SesRyNVVXy7oBJDVDG0Q7VXTe8Gg6yYjwT
 gxFg==
X-Gm-Message-State: AOAM532E1yxzsxE/AQ6z+yhilukQaddWvboJW+BwuTs/PFPHI0jfDcHg
 +jcrzOenPahI/otTzkP4oOf5ElEah7U=
X-Google-Smtp-Source: ABdhPJyZ7mnr+2FtCpzC0i7HKv0GbjmCDE4Hv35Q6SXgvJihuYYbPLxTsQr0J5yi07J72MH5t5j1IQ==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr653114wmb.158.1626218718324; 
 Tue, 13 Jul 2021 16:25:18 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:25:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/6] clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT for
 vclk{, 2}_in_sel
Date: Wed, 14 Jul 2021 01:25:05 +0200
Message-Id: <20210713232510.3057750-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_162519_998505_B5B36237 
X-CRM114-Status: GOOD (  13.99  )
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

Use CLK_SET_RATE_NO_REPARENT for the vclk{,2}_in_sel clocks. The only
parent which is actually used is vid_pll_final_div. This should be set
using assigned-clock-parents in the .dts rather than removing some
"unwanted" clock parents from the clock driver.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index a844d35b553a..0f8bd707217a 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1175,7 +1175,7 @@ static struct clk_regmap meson8b_vclk_in_sel = {
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = meson8b_vclk_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -1358,7 +1358,7 @@ static struct clk_regmap meson8b_vclk2_in_sel = {
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = meson8b_vclk_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
