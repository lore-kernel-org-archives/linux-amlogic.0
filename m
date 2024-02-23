Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EE2C5478C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWgx1JOp35O8JOH+cYGSEdliD5xbtZerAOrwJ2aw8As=; b=D2Wgm1YSIlty4R
	x5UqqDoLG8dmjU8Qn3iM67iUvrlOmxtCgDHUL5JLjL7wY/2HgjZdlJtGvvjLj13Wnh90nDDGDtuJW
	ADJjIadLaenqhbrrqbo8q9hKGI4/2ebL1OBxzucNtRhvqLTFT+m9Wtd/B+R0Xv2Z71Ail1ynq9jTZ
	E3yI9jIbnIt4vQZ9ZYAOBNf4JEiV1+Iv28/JKB9iOsQsWCbH3GsrHkDJuL15kdjMpWHaUZEHLSLmM
	5jCVsJw+bZs4F4R9LfUJJ8+VW+sDhLP9uy8c+nZc1gNqvfd9SB4uJhg+zs8Q6/eyqorLtpbq4x6jY
	PvuiFms5va0jPfDH7gQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZjD-0000000AeDv-2adc;
	Fri, 23 Feb 2024 17:52:56 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZht-0000000AdfX-3Kdd
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 17:51:40 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412984360faso1702755e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710685; x=1709315485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5onlIQPMa8EU8sK1NqJS82W4yBogcW0MtBFux+iSL0=;
        b=EInbHV5sQm+IMZp3+u2Chv3zcpCpu9azPtM1d8Js1Xpi4+Engmv1l0hcfW9+WCepv1
         kuQtSs+gcT0Xqwna9Ex72VzzIC2J1BvcNhWfq2wsUrDr6yG0qfkl/Dg0xYhaeJTJdj2v
         8anWP+Dlf+Q8N4CZ9Dq2Car0ybZ00ArzvygoOmeMjIRNWP4o4OqJOwl7aq+T7WD0cXvV
         T62iQtAGhqmiXhMoj6reOknu9mLpMkYQLCs1mrUxsMyYx5mAqegbp08cHvZaCDhnC6dp
         jl8egiLTw1mj1SWgIiiKFr9NpPKEOj6LU8IeJXT6XFxN+Q8a3cSSNJUAH4E3NbaiB4eG
         JS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710685; x=1709315485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5onlIQPMa8EU8sK1NqJS82W4yBogcW0MtBFux+iSL0=;
        b=fx/4xq7YHJ9FfvOWoEqYE1z9mRXelpfQS0K4/hsi/fBUzIQ8e9SjHBH2YRIMzDvfok
         1SReyMGwcMLZITc5SByEj5llsZTISCMOykUc9R75sYpz53eXePtEnCalSsqJyqNUo+bm
         Q9GOu3ogNZBxjsHddGN2016pRRbQzvt9bpY9qj0lmU0p65Z/rjcP8n32PmKTh8FQgsFc
         BBIkzUZS60QbUHw4AMgDOlm/jscTw1H3v+ffkzUltVYVi1cRp8ZDne959FOjHX8068tu
         4gQ1JhuZtcJNYDtNHLX/Hf6ufB8nuglhApD9BbKyLBTPlfqnN7HwIkRRQaob3P3ovyAE
         y1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVJpAX19oyWkH5EMI6Vap8cVbvK1Po4JOeAEYKlZafsfK63c8UPvHK2CSc5I87m/5lgJrc8VgTB7xU32wfeF+Vex3CtO0Qturf8PLsBoB8MlaU=
X-Gm-Message-State: AOJu0YzxU6R2yg+0DhbrRSif0MbnyNXrfJVmXqgK9yrEY1PoNEzR2ldc
	BxAjL1JE7vtKUry/lIxGkaUQSN9R1vZ3/06Fl8yCfI5h1adcgrCIRje4YqNFS/w=
X-Google-Smtp-Source: AGHT+IGbVheYYWSnBsZMt7MWcRfxMQjAjkyXcfMrBJ55mpI+QDGAkuDrALH5oqVlvASElX3LNqQCRA==
X-Received: by 2002:adf:fcc6:0:b0:33d:9283:93b with SMTP id f6-20020adffcc6000000b0033d9283093bmr329883wrs.47.1708710684884;
        Fri, 23 Feb 2024 09:51:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 4/6] ASoC: meson: axg-spdifin: use max width for rate detection
Date: Fri, 23 Feb 2024 18:51:10 +0100
Message-ID: <20240223175116.2005407-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_095134_343646_6D3947A6 
X-CRM114-Status: GOOD (  12.33  )
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

Use maximum width between 2 edges to setup spdifin thresholds
and detect the input sample rate. This comes from Amlogic SDK and
seems to be marginally more reliable than minimum width.

This is done to align with a future eARC support.
No issue was reported with minimum width so far, this is considered
to be an update so no Fixes tag is set.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-spdifin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index bc2f2849ecfb..e721f579321e 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -179,9 +179,9 @@ static int axg_spdifin_sample_mode_config(struct snd_soc_dai *dai,
 			   SPDIFIN_CTRL1_BASE_TIMER,
 			   FIELD_PREP(SPDIFIN_CTRL1_BASE_TIMER, rate / 1000));
 
-	/* Threshold based on the minimum width between two edges */
+	/* Threshold based on the maximum width between two edges */
 	regmap_update_bits(priv->map, SPDIFIN_CTRL0,
-			   SPDIFIN_CTRL0_WIDTH_SEL, SPDIFIN_CTRL0_WIDTH_SEL);
+			   SPDIFIN_CTRL0_WIDTH_SEL, 0);
 
 	/* Calculate the last timer which has no threshold */
 	t_next = axg_spdifin_mode_timer(priv, i, rate);
@@ -199,7 +199,7 @@ static int axg_spdifin_sample_mode_config(struct snd_soc_dai *dai,
 		axg_spdifin_write_timer(priv->map, i, t);
 
 		/* Set the threshold value */
-		axg_spdifin_write_threshold(priv->map, i, t + t_next);
+		axg_spdifin_write_threshold(priv->map, i, 3 * (t + t_next));
 
 		/* Save the current timer for the next threshold calculation */
 		t_next = t;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
