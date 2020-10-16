Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F03C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 17:30:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E4920E65
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 17:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fiyNXU6s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lroJG7Sa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E4920E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ps+FWLT0RGDLFTi5JCKQ/dTvFd122VasSEK2B9bK1xo=; b=fiyNXU6sFGeaYHxujEY57/5lGq
	wIOZ34TNveNrDLbuu5LiBkH1yc/F+/dX4LHAQEJaV7A8EKOQNLEYFbFi2E6LgRwHOxihwnWxf+zsT
	jYPGKTrF2jWNOKIIrgA3IBl/xgEcyb8tNF4oX+70bMjWSkIp+yFW1yWoh8bDykIoH7p1hYHR/3v6C
	D3qAulM44mr46yBKNopLcZboIUOTmWVYDWda/5qI9/mFNFGECvwPJ2w+hurfUSgrZ/CpFyjmERNc0
	JZipplsBnZwW+fHrRpQoU429RIzDARGuVVBQD9hRAufh1O/EHcW11PCEIMC5dw9ROor2uCT9NsJ6P
	OqWOmlJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTYk-000837-Ky; Fri, 16 Oct 2020 17:30:30 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTYi-00082H-2w
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 17:30:28 +0000
Received: by mail-pl1-x642.google.com with SMTP id c6so1642380plr.9
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LkpxYpHOUh6wWOIUN82AjP6Fw85m2v3htFNaqQxO/5A=;
 b=lroJG7Sa2/n+Pm3E/imxwkcvy1qhI24bxdO7S3msAaNvwtM7v7F1m6eZvIiuLQMyOG
 CJbnu11Yt9R/hTlpc0HNsmBFgYCQYYiEDbKglUhRQtBoZuN6YKwdv91XZ0gDvxAgzEsc
 qLxfLbsyFPMoOKFw2i0kQ7G2FLR3f2cI0LlYtfDg5rsX1nCV2e8Oj1jpa8N0X4N/+bpL
 e1QEG24lkO1XtKO9AqRqSCms7cTOLaRsaGkzUscSYf7iVos24lBmy6UJXo3FFjIWbzb+
 8TfsZX3jv3F2lszHO1HMWsphZq906YxkPoGulGWPxDCPVFDz3q4YYYd6HG2WeXEYvVXz
 EqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LkpxYpHOUh6wWOIUN82AjP6Fw85m2v3htFNaqQxO/5A=;
 b=NAcM5xwm/t1p52xYtmRuSVHzkFtAXRYmZlLvsWYCAv0rh3LmIbALdDAQBZEkNDx7b+
 vL/xZZ0wvmOi+jBkZVGzWu+lc2s6WjmaFu8A2LLdzmagmbyuWgfds43DTGbpNvg/YNH0
 q4wr9lOiQ3QcZhYvhILhEm7bZAv/wNCcSuciimHb8I5d+4sEGmqdnaDYeXqIeh5lpL6i
 5uf04628Yee6m6SJdfejSDN6x2mLiseRWXuHbcm1DNCzpUbdHWroyNdZWVW9Hem1B8aU
 4/QchhEBmhAUi4pkAUTtqi5+RZHeSXpadOPsVPg8hGhY8IjpI1V6SeOuEwwosJizcbwb
 yqow==
X-Gm-Message-State: AOAM531pIuU0xYeYRLV/b8L2Bar1zcOvaMjzd8/21l0m8ffP/iCk89UF
 Jxs+C8wSYp0qGFL0pFcgmsk=
X-Google-Smtp-Source: ABdhPJwclqbg+gtWSGEcRJ5TA2g06LpmhR3sr00rrCicZcy6R7gm/FKrjktQ24YJCgeBfuHf8an+Ug==
X-Received: by 2002:a17:90a:dc0c:: with SMTP id
 i12mr5346362pjv.191.1602869425011; 
 Fri, 16 Oct 2020 10:30:25 -0700 (PDT)
Received: from localhost.localdomain (S0106d80d17472dbd.wp.shawcable.net.
 [24.79.253.190])
 by smtp.gmail.com with ESMTPSA id nh4sm3668126pjb.1.2020.10.16.10.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:30:24 -0700 (PDT)
From: jassisinghbrar@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] mailbox: avoid timer start from callback
Date: Fri, 16 Oct 2020 12:30:20 -0500
Message-Id: <20201016173020.12686-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_133028_182257_7CC6F7AD 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: khilman@baylibre.com, Jassi Brar <jaswinder.singh@linaro.org>,
 sudeep.holla@arm.com, ionela.voinescu@arm.com, da@libre.computer,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jassi Brar <jaswinder.singh@linaro.org>

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

This can be fixed by not starting the timer from the callback path. Which
requires the timer reloading as long as any message is queued on the
channel, and not just when current tx is not done yet.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 drivers/mailbox/mailbox.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0b821a5b2db8..a093a6ecaa66 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -82,9 +82,12 @@ static void msg_submit(struct mbox_chan *chan)
 exit:
 	spin_unlock_irqrestore(&chan->lock, flags);
 
-	if (!err && (chan->txdone_method & TXDONE_BY_POLL))
-		/* kick start the timer immediately to avoid delays */
-		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
+	/* kick start the timer immediately to avoid delays */
+	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
+		/* but only if not already active */
+		if (!hrtimer_active(&chan->mbox->poll_hrt))
+			hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
+	}
 }
 
 static void tx_tick(struct mbox_chan *chan, int r)
@@ -122,11 +125,10 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 		struct mbox_chan *chan = &mbox->chans[i];
 
 		if (chan->active_req && chan->cl) {
+			resched = true;
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
 				tx_tick(chan, 0);
-			else
-				resched = true;
 		}
 	}
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
