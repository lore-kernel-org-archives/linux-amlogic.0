Return-Path: <SRS0=GwLp=O6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6AEC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE16A21924
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mfef5Mnx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NxSrbpi5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE16A21924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bxr2otvfRcZVVE2hc3il/reksoe0fomqcunHa8/jnhU=; b=mfef5MnxBM6WQB
	g4vrtXDVx4Eah8S3Skaami+eUKwNuvOY4LWUc08XEXMSMk3CCZ4gJpfeVctfaT7Fwx2/v6qZnaJ/6
	agqkUHb0shiMEeDmKawna/0EbBJGLqc6qsMqln5b+mYLIgdgIMIp/vKTRQq/9oUI0Iyf4RumpOl1y
	2gEafjNsmipiM/xy8hQ5B6GpieE89rkuHQ8pj02c4Stz6MEKF/eaS12WiQ6WVoX1JJ01DPxs7LwIa
	52nxzED2SVOtv1AqseyWFtO6kxa1bo/NPsndla1kNlck++Dx8gUnMN/iK7SL1usAQFCapDYheuXWG
	wfw0fGuxnWRvfeN2pCAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaNal-0008HO-JS; Fri, 21 Dec 2018 16:24:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaNah-0008Fi-Iw
 for linux-amlogic@lists.infradead.org; Fri, 21 Dec 2018 16:24:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id z5so5841489wrt.11
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Dec 2018 08:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MtxMedezO/SO2ydy0vk2j3ybDj6JbE4oP2cGnPpI5Zc=;
 b=NxSrbpi5kRDPhyF7PbDz8tJGxTG6zf2v5rGgTjceDWTKm5Vo0mKm566wdJje9kq/U9
 9dMdkZZ5A+wxfYw6VpjqWI5EZYteQhK6JVuFMPmJE9Eu/iX6Y/P8HlJlimnZCoOohn9V
 wk7dYJQ5UGdPoTEE9nIbrcRoC4czmtRw3l/11Bh2rnXzZR/NORzqGPLjci06fMu6wMy8
 MozeVxr0k7UXOzc6gZRcW0oLgBrinB3cNLW4WRz4xTHJqtEkbcBFgSkoNl2ntkOrFxkc
 Bpcc/501nlL99fmrq12aVRlPeXD2FemsdvuUfddYVO0jcFqVpaiw8qAjNQWgG40nY+J2
 a0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MtxMedezO/SO2ydy0vk2j3ybDj6JbE4oP2cGnPpI5Zc=;
 b=UrBWP2hD3jz/cu0/RE9d2lLKLx0Fwro8pK9+5LJnXbKa7oojVaXvyQJX8FlVqpjm/b
 wLsf05qTeJ/BgsKpxHj/xxmOQzyvMgi5OrlYblZG52vFjU/kLBeMhrfjRHvHoJZTWSez
 3ecPvAO5VDPNY0cDI6ItbFRZNHqRegOAGR+yTBrvplof2yTI2LqrQ19VyqLWEuZpK25j
 7cpWedXRuOOtJ1Q4ONVzxpWnUQDvOPNdEBWfytLP8ctb+zX8odYcRDlIwe9MP24++irq
 wnpMTvyFUZifJsGDJRqgXEpfCHreiCnfh+yIR6+yJCHvGhXC4UUexSq7meGnCwLI/891
 LE6Q==
X-Gm-Message-State: AJcUukf1wR67WceAsdGYueM5LLU6DZ3tU8TT4hBPyVAMcbNqG8+XQ1k4
 6jF6K1splckOG5wGiwAX7ii5IrVqUWY=
X-Google-Smtp-Source: ALg8bN4D9IA7ldCkcaDihBOGVxrYU3X/w2FnadUPOHt6tYF3r84YQpvEpNYy0RSYQ80qT5GTzJtx1w==
X-Received: by 2002:a5d:6988:: with SMTP id g8mr3162627wru.33.1545409427230;
 Fri, 21 Dec 2018 08:23:47 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id b13sm15712373wrn.28.2018.12.21.08.23.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 08:23:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] driver core: silence device link messages unless debugging
Date: Fri, 21 Dec 2018 17:23:41 +0100
Message-Id: <20181221162341.9847-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_082359_622669_13135E89 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: linux-amlogic@lists.infradead.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On platforms making a fair use of regulators, the dev_info() messages
coming from the device link function are a bit too verbose. The amount
of message will increase further with the clock framework joining the
device link party.

These messages looks valuable for people debugging device link related
issues, so dev_dbg() looks more appropriate than dev_info().

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/base/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 04bbcd779e11..8d330f921ad7 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -301,7 +301,7 @@ struct device_link *device_link_add(struct device *consumer,
 	list_add_tail_rcu(&link->s_node, &supplier->links.consumers);
 	list_add_tail_rcu(&link->c_node, &consumer->links.suppliers);
 
-	dev_info(consumer, "Linked as a consumer to %s\n", dev_name(supplier));
+	dev_dbg(consumer, "Linked as a consumer to %s\n", dev_name(supplier));
 
  out:
 	device_pm_unlock();
@@ -327,8 +327,8 @@ static void __device_link_del(struct kref *kref)
 {
 	struct device_link *link = container_of(kref, struct device_link, kref);
 
-	dev_info(link->consumer, "Dropping the link to %s\n",
-		 dev_name(link->supplier));
+	dev_dbg(link->consumer, "Dropping the link to %s\n",
+		dev_name(link->supplier));
 
 	if (link->flags & DL_FLAG_PM_RUNTIME)
 		pm_runtime_drop_link(link->consumer);
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
