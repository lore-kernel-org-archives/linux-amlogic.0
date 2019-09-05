Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26ABC3A5A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87DA22CF5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdB26OUT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DzwniM7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87DA22CF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdFBZSkXnajGo34xYK7Q+R6+0DL535sIGklIHlppSRQ=; b=jdB26OUTySeHfg
	rospWMkFejC8MfonOn8hEkMRPC+1UUVSXKT2j38iOhDxYrI6oH7VmZbMmcwXzTDpjBWEsVP2bc2QA
	H0TRAumC3xuosSjME95ygaBoECdQg8VxmQkuTSiTqHJPkmrjkmRHhjTlJF508Tfa7/su0sxAG8zyI
	bMCBkCdHiQz0a4MGKYIt8W8bKG2MkEP3/TxzRIykDgAVtB1DcFk1NGmxsMMt8tGoBHC0Sclbv3nkw
	7rP6z5F7XPFXYwTpU1do2KqhTo3tDVixKyUyr+1cHWruuGP3ZQ2p99pWyRNHi+QTdtvCouZZdbTpN
	VFPTjbwIsaMvr7lpRoDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSM-0008CJ-75; Thu, 05 Sep 2019 12:01:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSE-000811-9Z
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 12:01:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id s18so2472426wrn.1
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xyfe6twDn91vPCbiXX1zqgwt25Jhxxgzdbixh4MbER0=;
 b=DzwniM7S9e2dHldU3F+1DNyQh1GbrFBvALKFQRdXceZd7xAI6n3jUPUCOzCJ39+RDi
 J/h6MRpzGNtTE/lw14UHMVnmNAGdOEzU7cyD99NofWKpkbPsQOTE1+MDFwj25NmQc3aO
 W9KH3c2WRcRShGvbDNapGZ8QQDL4sFg+qd7j7Nzc514rBwmGbz2zA1L8LG/nLsogy/fA
 gbsccH4/iSxF0MbRsw1lImO1xy42xcxgf1z3Y5NcIUrEEWHcKDNlznQroP7+78TwZyWg
 d0nS6Jm0A0bQ3uda/ZmbM2ajPTylIKrRF9tkaXSX06wgn/nRJlzvISC8J8q1DNDX01Wb
 8kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyfe6twDn91vPCbiXX1zqgwt25Jhxxgzdbixh4MbER0=;
 b=b8LJ9cvhH1B17i3cxXLhILFjQKMioXhLjIAL/nLqpS4tXlkPZX642hzTsbnlyqOJFk
 TLGIXGDsimNn74mo1cRB0nQ9lmzHewyVY6FlDHGpBiZ8qWs0K7e2JF9kpJkmhvSutsbi
 3WLryfRz3PxkDld1r4DG2p/u3XXf5NVAS+4YecgIOKCZDbBv+ntpy58meWcroB/HcdUQ
 IIUbyiqVJ703R2URlNvyG8lLLlty9AsqwXx2y8k+3MDG6JksRXTikQrgc9JZ0uPN5kci
 L+2pbYEEQCubvyftDIh9+jKAjuyalyBtjb6944bq9JvQq5uxqFwmi76P3GCk6HTOUzj1
 d/6Q==
X-Gm-Message-State: APjAAAUjzyetnsgZkImTTqAdq+0ms1Wn7cddDDlzlKXS5PQxYjqHzFua
 dFS+3u9xqOUTzyNh3daMhwtcNQ==
X-Google-Smtp-Source: APXvYqwctgVu4tqOBuDPlYOZXUwUpykru62hEl6KkwzhkUaceLyj2F4nPnNTNrghrllnO/9ig8jY8A==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr2142326wrs.23.1567684892350;
 Thu, 05 Sep 2019 05:01:32 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/8] ASoC: meson: axg-toddr: expose all 8 inputs
Date: Thu,  5 Sep 2019 14:01:16 +0200
Message-Id: <20190905120120.31752-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050134_333228_2A3F0054 
X-CRM114-Status: UNSURE (   8.49  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The TODDR component, as it, has a maximum of 8 input. Depending on
the SoC, these may not all be connected or some input components may
not be supported

Instead of decribing only the connected inputs, describe them all
and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-toddr.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 4f63e434fad4..2e9a2e5862ce 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -142,16 +142,11 @@ static struct snd_soc_dai_driver axg_toddr_dai_drv = {
 };
 
 static const char * const axg_toddr_sel_texts[] = {
-	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4", "IN 6"
+	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4", "IN 5", "IN 6", "IN 7"
 };
 
-static const unsigned int axg_toddr_sel_values[] = {
-	0, 1, 2, 3, 4, 6
-};
-
-static SOC_VALUE_ENUM_SINGLE_DECL(axg_toddr_sel_enum, FIFO_CTRL0,
-				  CTRL0_SEL_SHIFT, CTRL0_SEL_MASK,
-				  axg_toddr_sel_texts, axg_toddr_sel_values);
+static SOC_ENUM_SINGLE_DECL(axg_toddr_sel_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
+			    axg_toddr_sel_texts);
 
 static const struct snd_kcontrol_new axg_toddr_in_mux =
 	SOC_DAPM_ENUM("Input Source", axg_toddr_sel_enum);
@@ -163,7 +158,9 @@ static const struct snd_soc_dapm_widget axg_toddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("IN 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 3", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 5", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route axg_toddr_dapm_routes[] = {
@@ -173,7 +170,9 @@ static const struct snd_soc_dapm_route axg_toddr_dapm_routes[] = {
 	{ "SRC SEL", "IN 2", "IN 2" },
 	{ "SRC SEL", "IN 3", "IN 3" },
 	{ "SRC SEL", "IN 4", "IN 4" },
+	{ "SRC SEL", "IN 5", "IN 5" },
 	{ "SRC SEL", "IN 6", "IN 6" },
+	{ "SRC SEL", "IN 7", "IN 7" },
 };
 
 static const struct snd_soc_component_driver axg_toddr_component_drv = {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
