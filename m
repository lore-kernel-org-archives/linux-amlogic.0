Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CD3C31E4A
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4202173C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SsjabNAu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="t8gsBpvV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4202173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PsIggNNW/VYWSPjFOP/htSLVkEBLwEQS0e2gIHqaXU=; b=SsjabNAuFRJfwP
	ntvVorcfSyEXzr+vcAvz3/+3kCYjtnBYphwo6jbxJckueXIanA7355RuSPEyxdcdXCXCHHZy+ND2o
	dKbi8IknwhKOrMm22ISHITMQX9Wgi3VI+Jlw0W7qMwrc01GS55sMC7Qay5I6FBWGSNLHco+fQZ1jC
	JIjPM7YMpuUoqG/aEF3AMJRi7J0R4B2UjoE+qGPA+w9QNOVwaOYYnPsTOpF/sZal82CnEbT8bSNEj
	lrGYScjm3W3k6ZN34gPTdcppfh60/nQwL5TW/m76/WLCMKndQs0DW0BrOcR0wacqdiFaBiHP2rTWs
	SgAhoodRUIQTuRF9xZ3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbO7z-0008WU-BZ; Thu, 13 Jun 2019 11:42:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbO7t-0008Ta-J8
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 11:42:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id z23so9764259wma.4
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ct4dk4GNCZZpVBLlWG9IpyH3sVkXJaOUvUrsuvrJN7k=;
 b=t8gsBpvVYiQYc5Cn+QwlQpiY7tEcHBk2PiEx7Mm99YPiqUHhaR1qhC0wYPkrGD4SHH
 AeMv6d+++LORjfxG0hocO0hAVvVWjfgFXU7DUebAhDowZP5pxIZyokfKWuCJzU8ptVhs
 QTgFlBriQSaGZrLhOrDLhAUzOUWa2IZ20zuUZUL7kLXsMMqv8CincQItL92lCi5QYDLp
 yO8rK8tCPUVh0fCCcPIWZsvG5XWSoviGFdcRgDhPtSwdgQT738Uv3cgVBbCBZVsW2SCz
 ENsPDyh/zm4wAkf0I4yvwFPYHgBcqLTLWSYk/hhtUFHz1WUfsbUpGdYYMdpUXFx89UY4
 6JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ct4dk4GNCZZpVBLlWG9IpyH3sVkXJaOUvUrsuvrJN7k=;
 b=eJWSs5Lm9ISiYdZyaSoirKwScMePk66UIXcsZG+Zv9gYTEMocTPWw8NJo2vC892MJx
 iyKDzRltC+VK4lqQpMrsJgGrLPpE+Oiarhh+n9Z+uFqblHhg0v92E4UoDYbBfR2fX15n
 KX7XuL+fcfBHULrXDK2jI+7VKOmdQwglRF4FjV5NpcphY+qN2zoiotsz/z3IZK+E4+oF
 c0LEhYPm/RgcIkRorNhPCmJnhvpeIctYYrDGGdS4WUah6AgvVpWd856ZZjd3aDJytRzr
 iEe0WK+P9SoSKxgi61ykm5TFx5SUgwOwyyLDr4unLXnGeHiT77mXVLdh4xg0/zxjhcKK
 EnIA==
X-Gm-Message-State: APjAAAWZoAXy9fF2g4+9M4NE7rEqKiFqn7X979Gf4J1ZVB/+IqVqfe1w
 yDolXaOD4iu0KXNFej9F7subjg==
X-Google-Smtp-Source: APXvYqwqh3apCFq8wjX/n7GQ82ee2GciU3Q+2n5x2zCfXMbElFvgw/Kli69Hg3m7WsELb0p2+ZsBpA==
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr3135082wma.171.1560426159921; 
 Thu, 13 Jun 2019 04:42:39 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/4] ASoC: meson: axg-tdmin: right_j is not supported
Date: Thu, 13 Jun 2019 13:42:30 +0200
Message-Id: <20190613114233.21130-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114233.21130-1-jbrunet@baylibre.com>
References: <20190613114233.21130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_044241_628123_A0529F86 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Right justified format is actually not supported by the amlogic tdm input
decoder.

Fixes: 13a22e6a98f8 ("ASoC: meson: add tdm input driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index a790f925a4ef..cb87f17f3e95 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -121,7 +121,6 @@ static int axg_tdmin_prepare(struct regmap *map,
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
-	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
 		break;
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
