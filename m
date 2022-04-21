Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DCCC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cLJWxNh7J/JGLdhsOkXCKUXc4m1/76CQqBziOI7g28=; b=h3HwgBbOjZKvuN
	QEeF0yYx0m4Z4GiY5K6SUcEExQxZyoGwM2PD+wxJ09pwH/+RxtOD7NywEy266majJ7lMrlvfciW1C
	5lblJeUJHSxOS+KmWhui6M+NtoLvI3z56/NzVXxKV2Z0mwrscN12rPB9QmcNEWl6XLxQClrKhFERF
	2Gi7gMMWqr4H8Y4yzkAWrRosOl5PXc2pt8rnPhiWIt4xGitxY2bdoeYvDWDQN2j5xJVNILwAfTB3J
	RSAV+okcrEI5IaLgAuWbLsOL2+7irCh1QZOrEmX0QPCqfjnFSLiSJ/Dr0WNmfdZ+p9uSnhIHTQVEu
	YyWBtC12usMitGXqdqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZBn-00E8P4-Sd; Thu, 21 Apr 2022 15:57:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZBV-00E8El-8g
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 15:57:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bv16so7295774wrb.9
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5v2dcbpfIREeY44tdPJXPJiKXCQO1isQe1PN8hnmtA=;
 b=x7mIAao/XjRhFqxaq69esUVD9gaSAFe7pBZaCn5vqPJ7FGAfIcxMddEd/ZwhipP4xe
 adLF8gMXeI+5Lr2Vr6CL40gna2y9IIhkZ19d1Kk17qzehiOtRLwt0VEWd5VamUDeaQMs
 xzeNByKjw9cAqJpO9CPiyjTLidYUSP84vxCflxxes3yEc40nRsQS7DNzcbMT6FyGVp4A
 ajm565I5vOTyqmV9Vqb9UHeQZhhoHlk9JHUiTrC/fEuvyTkAZ3XGkhwi8Cc75rAs9/qJ
 Brkd+R0DlIuzJ878hwMF9F8pQg9hkmzm8h6EoiAyMKBBplvmBjqaw2Mrq/Fo7uODcUhH
 HGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5v2dcbpfIREeY44tdPJXPJiKXCQO1isQe1PN8hnmtA=;
 b=HKWjvgORIdWC0LOQEqyaT0AjCUsgRTsG+JyU+ghl3eO7y3KXpS3odWydsP1jSJJ+l4
 KjT7DCYinxk29xbPpHAHHEVMMjn4xCKcTnJJ64Co8CHIb+QYNB+vf3v2G5pgA1UD+NpL
 9vTnTRmPGTsuuxxXpHnnepNnN5nP+Dx6NvjYNZjIofTsDoYxg9fEF3IUK0oVBVJrQ24b
 TyKh2vcr+pRmPchhoFhZqCX2N9L/bmDIj/SeufkmObpYazUYmxonWuZ48yO8opWT1n1q
 XsPy3r0kKTJbJGYk/6FbZj7KIbbhTpqWlrPHuvcBoLnxT3+QaT2DfvZZtuJppwXwmcX+
 kN8g==
X-Gm-Message-State: AOAM530gTnC1mPenqI1+3sX3b/DmJXkLFK2yBG/cDMJrFnbzdN/cVDkM
 e4lsmMFgZkn0Uke0xpXS9QXQfw==
X-Google-Smtp-Source: ABdhPJz8PBGJzTWGkvR9SDIvidKwEabWHonllUxUaq2TEm4JZ76WETtMHbtWwFFwMYrsLL0Ek3CKbw==
X-Received: by 2002:a05:6000:713:b0:20a:92f1:c057 with SMTP id
 bs19-20020a056000071300b0020a92f1c057mr289175wrb.241.1650556651171; 
 Thu, 21 Apr 2022 08:57:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 61-20020adf8143000000b002061d8d807esm2623140wrm.87.2022.04.21.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:57:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dmitry Shmidt <dimitrysh@google.com>
Subject: [PATCH 2/2] Revert "ASoC: meson: axg-card: make links nonatomic"
Date: Thu, 21 Apr 2022 17:57:25 +0200
Message-Id: <20220421155725.2589089-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421155725.2589089-1-narmstrong@baylibre.com>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_085733_338963_E7748DBE 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

This commit e138233e56e9829e65b6293887063a1a3ccb2d68 causes the
following system crash when using audio on G12A/G12B & SM1 systems:
 BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/0
 preempt_count: 10001, expected: 0
 RCU nest depth: 0, expected: 0
 Preemption disabled at:
 schedule_preempt_disabled+0x20/0x2c
 CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.17.0-rc6-03747-gd403c3588f77-dirty #957
 Hardware name: SEI Robotics SEI610 (DT)
 Call trace:
 dump_backtrace+0xd8/0xf4
 show_stack+0x18/0x30
 dump_stack_lvl+0x70/0x8c
 dump_stack+0x18/0x38
 __might_resched+0x154/0x164
 __might_sleep+0x48/0x78
 mutex_lock+0x24/0x60
 _snd_pcm_stream_lock_irqsave+0x20/0x3c
 snd_pcm_period_elapsed+0x24/0xa4
 axg_fifo_pcm_irq_block+0x64/0xdc
 __handle_irq_event_percpu+0x104/0x264
 handle_irq_event+0x48/0xb4
 ...
 start_kernel+0x3f0/0x484
 __primary_switched+0xc0/0xc8

Revert this commit until the crash is fixed.

Reported-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/axg-card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index cbbaa55d92a6..2b77010c2c5c 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -320,7 +320,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
-	dai_link->nonatomic = true;
 
 	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
 				   &dai_link->cpus->dai_name);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
