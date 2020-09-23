Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72788C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 12:39:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83E6206FC
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 12:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mH6LE5T8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oIDf+FbM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83E6206FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bYFq+C9chOCUmJZIccQDaxamjQKL4RMNZOaZC2Vq6Uk=; b=mH6LE5T8gtMah2blMtOTOMrqBZ
	I5T+T9e8BWTNwyqzIyWGusKGRolPChpFyOst5rrxy2IzrdPeLs27itrMJ2vCIax+Zju8M0EQOSHIb
	1NRD07Ktk4CC9ZvGa65FHylqqXRLZorVhqrWNExxBcqkxj2rHFxmVjcL99FSxLTteNEkBYFeeRKne
	73zHTrPRDZaz6564lBmOHYC6UD3CEwRQdg0btPMqTT0vxLZ5lLxiNY0q5rqtTrPMQ63i79fSdM5Fx
	2+F5D9bCIEWQO60s6k9M7EGO1yV0XaDOsKNZByn84yAKfHN+eIPZIQdNbKrFJzslHlkNM7cot1Bo8
	LL7adNQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL43X-00053g-JH; Wed, 23 Sep 2020 12:39:31 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL43U-000531-Jo
 for linux-amlogic@lists.infradead.org; Wed, 23 Sep 2020 12:39:29 +0000
Received: by mail-ej1-x642.google.com with SMTP id gx22so18465247ejb.5
 for <linux-amlogic@lists.infradead.org>; Wed, 23 Sep 2020 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ca8MpxtYSTi9fxnkIDOgsCaEJvwuUcIlAKj0sgOzoGg=;
 b=oIDf+FbMIJg0nkmo9OaMEYe7LWTRMMKcnV5j/JRJZt7wh1t59i2pDpCbU8a/Vf8ST0
 uOVDsSWIaTpDjCA9Btosu1kikktm98gaWopExkcmr18eERz0R2wh/D5STOUKttv4TypR
 vvfVmj0bgJxCBIM3ChmRqLzp0fL2CJqayF8FZKcry1J1B2iKskZQ9KwPFSpb6odoJSt4
 diGq0Q9An1oRKPVMe9/xngPIpPa1EkR58273X5zEATTYIDr2zhd+QoIAlokvNZ2NWUf7
 m/HAJ5cNXtyQFst1zorjJH66KzKr7B9+wyNrUh7eyAocpf9WqLxn8IFRgRSRjPC99zt+
 FEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ca8MpxtYSTi9fxnkIDOgsCaEJvwuUcIlAKj0sgOzoGg=;
 b=m2Xfv3FXjcKQP+/SNmoeG+1ybQcp6Bss93ZpwGA0iW38dYBBdVmOnci5YI+4VnvTCz
 +G9HEb6tlYjxOZQOjrI0c5LFxxtfuPn8yQqh+oLg2oOk8aKtQSE0HhI3ZlohsK5VXgac
 LRwJELD+32YEccxlVUsmShexYKL92IB9wLmm/+JkBQtP9fprNyGOl5sTSAx6pvnqkLNs
 VSEz7wfHnnUrpbf4rKZJOHG0hlDtPr3Nj+oda6zu9he0D3PnIyLYlZetK/e1Tt6l2pgo
 Jl7PDHDbd34nJMBN8rvNig8/LCbESpblHRoZY2lvYd88g9+YLQqpmn7x8+7j/P3uICPM
 bokw==
X-Gm-Message-State: AOAM532D4rUM9E5HW3z/Ydp9sdUxHW/xN2jrCpF0PjE4XqajA3hxNPUb
 IUWf2kkG16MsustcoNIOLpargQ==
X-Google-Smtp-Source: ABdhPJx5Cvk/hYChiUl93W6xD/qDLkGJ7fQ7DDElz9ONKimcxGUuCe2Al0cDNTEtuG8CuqOq6pw0nQ==
X-Received: by 2002:a17:906:2712:: with SMTP id
 z18mr10331457ejc.380.1600864765418; 
 Wed, 23 Sep 2020 05:39:25 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id k21sm7015003edv.31.2020.09.23.05.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 05:39:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: cancel timer before starting it
Date: Wed, 23 Sep 2020 14:39:16 +0200
Message-Id: <20200923123916.1115962-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_083928_661542_4FD5780D 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If the txdone is done by polling, it is possible for msg_submit() to start
the timer while txdone_hrtimer() callback is running. If the timer needs
recheduling, it could already be enqueued by the time hrtimer_forward_now()
is called, leading hrtimer to loudly complain.

WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
Hardware name: Libre Computer AML-S805X-AC (DT)
Workqueue: events_freezable_power_ thermal_zone_device_check
pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
pc : hrtimer_forward+0xc4/0x110
lr : txdone_hrtimer+0xf8/0x118
[...]

Canceling the timer before starting it ensure that the timer callback is
not running when the timer is started, solving this race condition.

Fixes: 0cc67945ea59 ("mailbox: switch to hrtimer for tx_complete polling")
Reported-by: Da Xue <da@libre.computer>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mailbox/mailbox.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0b821a5b2db8..34f9ab01caef 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
 exit:
 	spin_unlock_irqrestore(&chan->lock, flags);
 
-	if (!err && (chan->txdone_method & TXDONE_BY_POLL))
-		/* kick start the timer immediately to avoid delays */
+	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
+		/* Disable the timer if already active ... */
+		hrtimer_cancel(&chan->mbox->poll_hrt);
+
+		/* ... and kick start it immediately to avoid delays */
 		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
+	}
 }
 
 static void tx_tick(struct mbox_chan *chan, int r)
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
