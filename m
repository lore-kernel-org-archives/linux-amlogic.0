Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1350AC52D6F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GbAUEVKA1jcXS5ZBd43qZl9thx+iDqpBHROhJfzReys=; b=2/7OVl/9t/LSPZ
	m+Mn53NcbjKawRDsI1w6r5c+aWLd3IgMmuNTCWe/JuFBW1uVj6c1XtWWVYMp9cOC8jxayjAg1+Y/Y
	jBohEmWqF9JYzvC340YxF5r8ktRCgvFYmn107gzslzY0p2GRjDgGUzioUXT/otYnUeTT/osLmJ26w
	PDyym/6kflHKoZ3A9cpvE6IPONYlpLcd8YpmybrDygkFviJqNJf8CChQxZAdPxx0V/VlZAgQH4rJL
	Dt9e6buXvdz1j0S53URum2RFe0/vXhNdJiBZhu31sL3eGAMUHjEAAC5vcqEJbXS5KLEY8XOlr2Ivh
	gB3r0sMiFrBijEDT7igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbHPV-00000001D7E-07aJ;
	Tue, 06 Aug 2024 10:27:21 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbHPQ-00000001D5k-3gQz
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 10:27:19 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f032cb782dso3762861fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2024 03:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722940035; x=1723544835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWPNsrWX2yOQoNoUJ3eWdP1AwzsknTGOk+n/VwMy71Y=;
        b=AuOZBRI/+2ZPE/snHrYOUOetgO+Bo3FNYaJarkOaUKhFQsJwqgrCddhzE82oOAxkuQ
         uxOHGJsx/cSwoir0Rk/IOX+m5j981YdV9fLnq7gN/iClBvgsHQnAJ5fYtfS0yna08Zc9
         rMIXGK6SSQw1wfg8V+3CRlc2V9qka4CpdWGvEOXxxOmXoP83nEZe14H9Xx5A5bkiCm7l
         FCVuWVA6e53WJFphLKUF+ri9lZ/VENkfPmQ6Ypeuh1e9mvUd/BOfxhCGtkTGGv0SOves
         MGxmwLIAF0ALy5shbwLBj+kAlb1sZxmVjnGFSZmW24cqdHe3Nim7JdDM80kVFmqt2cPM
         3i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722940035; x=1723544835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWPNsrWX2yOQoNoUJ3eWdP1AwzsknTGOk+n/VwMy71Y=;
        b=EqIgUTfBKM22sr2KcZguEHXuaSEaZ+9cotGtjUAgZihxHzwYzPmjjG0e6fgmYgZGhp
         4K/SPlU+TD/x+LC3AK1atwJi+D2m68o2Ti6NlJJ7+7spYwJoqPQXvrIieUfyhn39BanC
         AnwU2QaxN53cAhWea5rDUkUeqnejQoRA2N7NA9B+60YJFufJ6lk9YfpMVkUb5Dm539/F
         vxec8QofDiyBMCszxEAOaJtwlgCEoCvXySKwUtpqXoOqxOb9oLTr1D+FSed8HHBKk+1J
         hVmyLq1bJS+mhW5Ck9b3hyxMWSwJPpGJzDHgTt+HEQmIApMJITKwOkN8w+0V00lP9Bod
         NQHA==
X-Forwarded-Encrypted: i=1; AJvYcCVgSbCJhkf55BREsVXZAJBpdxqU4ddIYFutOJdwlj/jb0ROS1DrVxmkh25PvqYbR0jb4ewyFRzvfP+IZqV5@lists.infradead.org
X-Gm-Message-State: AOJu0YzosHb1g5uUvUauxpMTLaG7j8fmckt82OJnVyRf+IMOL+9Y+R2E
	3wHKfmp6zw/wxJX0XSfIG2PHkUJMqHsfen2Rp64p+1Ck1ZNO93jl50SxesdU1pI=
X-Google-Smtp-Source: AGHT+IFLNq6D7zUmhFznmLMT/7z1PKPJ2cAodH71RSFK2iNObFZv9SHqiiRmAW23aOKp+qbcYsfsJQ==
X-Received: by 2002:a2e:8696:0:b0:2ef:246e:d04c with SMTP id 38308e7fff4ca-2f15aab265dmr99425811fa.26.1722940034418;
        Tue, 06 Aug 2024 03:27:14 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c541:c0a5:2f43:ca78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-428e4073f7bsm195890475e9.18.2024.08.06.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 03:27:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
Date: Tue,  6 Aug 2024 12:27:03 +0200
Message-ID: <20240806102707.3825703-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_032717_197210_5B226875 
X-CRM114-Status: GOOD (  13.03  )
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

With PREEMPT_RT enabled, spinlocks become preemptible.
This is usually not a problem with spinlocks used in IRQ context since
IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the upper half
of a threaded irq handler won't be threaded and this causes scheduling
problems if spinlocks are used in the upper half, like with regmap when
'.fast_io' is set.

In this particular instance, it is actually better to do everything in
the bottom half and it solves the problem with PREEMPT_RT.

Reported-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
Closes: https://lore.kernel.org/linux-amlogic/20240729131652.3012327-1-avkrasnov@salutedevices.com
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: b11d26660dff ("ASoC: meson: axg-fifo: use threaded irq to check periods")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 7e6090af720b..d0d05fa44d66 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -207,25 +207,18 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 	status = FIELD_GET(STATUS1_INT_STS, status);
 	axg_fifo_ack_irq(fifo, status);
 
-	/* Use the thread to call period elapsed on nonatomic links */
-	if (status & FIFO_INT_COUNT_REPEAT)
-		return IRQ_WAKE_THREAD;
+	if (status & ~FIFO_INT_COUNT_REPEAT)
+		dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
+			status);
 
-	dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
-		status);
+	if (status & FIFO_INT_COUNT_REPEAT) {
+		snd_pcm_period_elapsed(ss);
+		return IRQ_HANDLED;
+	}
 
 	return IRQ_NONE;
 }
 
-static irqreturn_t axg_fifo_pcm_irq_block_thread(int irq, void *dev_id)
-{
-	struct snd_pcm_substream *ss = dev_id;
-
-	snd_pcm_period_elapsed(ss);
-
-	return IRQ_HANDLED;
-}
-
 int axg_fifo_pcm_open(struct snd_soc_component *component,
 		      struct snd_pcm_substream *ss)
 {
@@ -251,8 +244,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	ret = request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
-				   axg_fifo_pcm_irq_block_thread,
+	/* Use the bottom half of a threaded irq with non-atomic links */
+	ret = request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block,
 				   IRQF_ONESHOT, dev_name(dev), ss);
 	if (ret)
 		return ret;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
