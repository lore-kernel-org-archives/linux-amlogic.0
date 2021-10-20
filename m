Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20D2C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:42:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A4D601FC
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87A4D601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qENxqZ5nyAzTci8s/2f2KbqknrtVbq7frcO2R5jKlfk=; b=m62mxDm539AG6j
	i/yXDu9jXmL8XjGkbfmuulwAu4pRqsmGC252suaCfUZCCticN/J8rYSrBLTj50cCb3Z2z1y2myo3U
	aQ2piPZc8UQIvM9/6ZTlCPyoY/z3Oj1m6OSDmy24LvifWhxJr/eRlFwxsDmFZ33pzffpxEhTWPXPS
	+fhMbWUxBAh6x23By7CEBp8FD6HvLO8zz6SwvgEY0ARlpcvOt+YiIB/IdXcbck9C+eynENLWtU5ez
	vS3PO+SxPooX1BnWiLovcdiiem+rs4KLmUFyvM4q4Jj4mQ+K1wWxX8tQ3X+frEok3Yar04olCUrAO
	r7GVaJLtQXAqLZJClxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9zT-004M7B-Uz; Wed, 20 Oct 2021 11:42:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9zP-004M56-J9
 for linux-amlogic@lists.infradead.org; Wed, 20 Oct 2021 11:42:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso9520569wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Oct 2021 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7BaCPl7ldB1ZwnXu9KWBTtfoIsEu4irOp5YwoZvuko=;
 b=u55djidDImSvWmabo3H/RI86RvhRx5S+vRIn6uS3PLai+eMcGfgWgqjAc5X1X7nIRx
 BeCJ+ApJyLT0yLEH7PzBuqKUIJu19kA0ZD6PqO6Zvd4No59psrhLoBHOdtzpKAHeIFLn
 FrtrA5DMr8pA9X8PQJGnb128ahr3EaaLqXn2dsO2GJKUsJCMX8XeBPsvouyPkR3K1opV
 cMTmq6bUXfGXPO7QioREClt4BpjSzNRBWM1/bWUq7yzQREUOyT1fInftpWSnfzuRPqGh
 TPqfC3A2M/RxohNxeXWU/WqrkjOTXeYhEycLtOirzlWR1G4xeRInWTa+ILeKHlFcqnf+
 3s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7BaCPl7ldB1ZwnXu9KWBTtfoIsEu4irOp5YwoZvuko=;
 b=4AGJrRcgle/COKGwRj1MdEfv/kleVh5qWG+jhGHvYWSIivBxx5LNgi2of27q0tpXGq
 Jf/hDtYC4PGqK1x/9rLTHENMspSLwU84M4LEt8bo6ej68aHwHKID6SrdiGWBgz6/55PW
 iysTt218vFCB4J9vmJNiZbRH8+Zdq0bi7es6Xe9iCRFBrN1UTUhSGVPe0QIGhtdVeuVF
 zOjWgevWMsEL7YC5alNJJ0hFkKtG3jxNvqrimmx+smNNu6LnBTMfTos+yVOPyPv8AEe9
 OdzbGPDult3Hr3DTeMXHGEJNz8HMheGq87TQSZL7qZOaiywXcXoKsCgWlXVZ0pUmLu60
 08Sg==
X-Gm-Message-State: AOAM5331itX3+GDl6KDNcY/FIgC5F67fRZzHxeAS8wJgrV5tbVk1N5iG
 aRjCrMrw/Helfh3Z34e7ho06jA==
X-Google-Smtp-Source: ABdhPJwXjUAog5s0d+VefQsRYQGeWGpLjSU51iVC7OGHVSZaoxF85rQlqGR/4MByRa8qJpq8pwXZzQ==
X-Received: by 2002:adf:c70f:: with SMTP id k15mr51845987wrg.98.1634730153564; 
 Wed, 20 Oct 2021 04:42:33 -0700 (PDT)
Received: from jackdaw.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s14sm1732927wro.76.2021.10.20.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 04:42:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] ASoC: meson: axg-card: make links nonatomic
Date: Wed, 20 Oct 2021 13:42:16 +0200
Message-Id: <20211020114217.133153-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020114217.133153-1-jbrunet@baylibre.com>
References: <20211020114217.133153-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_044235_686391_333DDB19 
X-CRM114-Status: UNSURE (   9.47  )
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

Non atomic operations need to be performed in the trigger callback
of the TDM interfaces. Those are BEs but what matters is the nonatomic
flag of the FE in the DPCM context. Just set nonatomic for everything so,
at least, it is clear.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 2b77010c2c5c..cbbaa55d92a6 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -320,6 +320,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
+	dai_link->nonatomic = true;
 
 	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
 				   &dai_link->cpus->dai_name);
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
