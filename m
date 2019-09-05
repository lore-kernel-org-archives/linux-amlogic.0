Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2163EC3A5AB
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4032332B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIk+Gmtv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bZvoaN8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB4032332B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUlprcACeoLaTvEwvScjzzOpRW4T0mRWzMpPnJZUwgQ=; b=dIk+Gmtvap9OL+
	DiOt2RbpSeA2N+Y1UpoWQuagQf0PLrTA38+gV6OFYPXwb3VL+UTzZAQpxa5U6JKDlAsATczvaW+Ar
	7iuE9K0zf6m/TLNaQNg/OIMsrYxVXpOSMmMt08+G20YCnkhYA7I8vEPgPoss/UY+so+vuzXNuCpW/
	9IZoCD4cBLIyVGBpmVENBCWvlTEMDK3x0W5exhwbD6HoI4HfbdkeSelODmT8LDyiQ35DjlwOU05e4
	RyuHDEiILbyCLC0vDMu4scPSS57AWSubPwr6fnzstA3EkeaaAzx0BMdXTvg2/n9dSjxWv3VaiOFxY
	aeDIJkgosMu2bXKBNplw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSP-0008Fx-Ot; Thu, 05 Sep 2019 12:01:45 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSE-00081W-Ga
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 12:01:36 +0000
Received: by mail-wr1-x441.google.com with SMTP id i1so1872808wro.4
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwIBL4UHh/W/g2VGAibAzry/ewI4tWE5Tv7d1Udm+yA=;
 b=bZvoaN8kfBlJr557WiU4RA17OFezviTWtWGEFddijqdVU2icYp6sMDiTVcTPidBX6c
 DIHAjpnJAcmHLrnFZ4SCWBMqfwSNPA1NnA8yl0ZoteP+Zw3TZFXQGtUBrwx/4WesE+ip
 K8l5xpQwNjyH09ZncYod4oeArbPlGvBNbiIXyi5cGMRqHo3u0Qd31ig+LcKga4Rzr7Pk
 mtgMJjp93GlGrUngM0v5BNPOMf2LjPL6qDKxbbHIJtr/esoKcy52bXW8876IpwjJTxqJ
 2BkskNQ5IFxJNz6/DDQ/AwsWzTzwYmMq/0HNCUujKTaVPdYEM0CUmRBMVYJGBRzPu0Ym
 hDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwIBL4UHh/W/g2VGAibAzry/ewI4tWE5Tv7d1Udm+yA=;
 b=qajzrvpvGw1ih7zYdUCaJuNZ87pC+g6/UAaZRs7wzbGAXbDsiryK7vWzfhpDeRqRGv
 wk4a+b6W+/EdsIMB5WKwDqwngYwSI3W5w2IAONo2ZcYfmqEjbnAt66a8AJyLVu60lB16
 qxtAvo35KuhcfJoIoGotKgLFVjbDE9e9loB2AvJdfooUTj5XxAm60O+MNbLjNvJswuMM
 XJBANZIGrXfSYzKF7DL0bkZ0ddCK7rV3ZNOtCtD6LYRMjqD7IdKuBQ8nFHNnE7qShieT
 T1TMkLGNZGMN323hdcyyaJ5952NlxgsEWmtIWoT4b6JBGI2AP/+xfWq6fzDcVTKKPVvR
 tRaw==
X-Gm-Message-State: APjAAAUkGc0bGpp9SuC+qqKc5RcRSXMAWTrASZ/bVJy6a4Ao8mdUWBCe
 UcIintGkEP24BIHAC/Z0lQnn4g==
X-Google-Smtp-Source: APXvYqzwbqkVLLSjcIoOrfnAmDwBx+OFVpJhIzJAo2/JMbRNzWLPcZyCMfUZhDW8FQH66JXu0xVWRQ==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr2430516wrx.241.1567684893278; 
 Thu, 05 Sep 2019 05:01:33 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 5/8] ASoC: meson: tdmin: expose all 16 inputs
Date: Thu,  5 Sep 2019 14:01:17 +0200
Message-Id: <20190905120120.31752-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050134_631588_51F75296 
X-CRM114-Status: UNSURE (   7.99  )
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

The TDMIN component, as it, has a maximum of 16 input. Depending on
the SoC, these may not all be connected.

Instead of decribing only the connected inputs of each SoC, describe
them all and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 47 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index cb87f17f3e95..973d4c02ef8d 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -43,7 +43,8 @@ static const struct regmap_config axg_tdmin_regmap_cfg = {
 };
 
 static const char * const axg_tdmin_sel_texts[] = {
-	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4", "IN 5",
+	"IN 0", "IN 1", "IN 2",  "IN 3",  "IN 4",  "IN 5",  "IN 6",  "IN 7",
+	"IN 8", "IN 9", "IN 10", "IN 11", "IN 12", "IN 13", "IN 14", "IN 15",
 };
 
 /* Change to special mux control to reset dapm */
@@ -164,12 +165,22 @@ static int axg_tdmin_prepare(struct regmap *map,
 }
 
 static const struct snd_soc_dapm_widget axg_tdmin_dapm_widgets[] = {
-	SND_SOC_DAPM_AIF_IN("IN 0", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 1", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 2", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 3", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 4", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 0",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 1",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 2",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 3",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 4",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 5",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 6",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 7",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 8",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 9",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 10", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 11", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 12", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 13", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 14", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 15", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0, &axg_tdmin_in_mux),
 	SND_SOC_DAPM_PGA_E("DEC", SND_SOC_NOPM, 0, 0, NULL, 0,
 			   axg_tdm_formatter_event,
@@ -178,12 +189,22 @@ static const struct snd_soc_dapm_widget axg_tdmin_dapm_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route axg_tdmin_dapm_routes[] = {
-	{ "SRC SEL", "IN 0", "IN 0" },
-	{ "SRC SEL", "IN 1", "IN 1" },
-	{ "SRC SEL", "IN 2", "IN 2" },
-	{ "SRC SEL", "IN 3", "IN 3" },
-	{ "SRC SEL", "IN 4", "IN 4" },
-	{ "SRC SEL", "IN 5", "IN 5" },
+	{ "SRC SEL", "IN 0",  "IN 0" },
+	{ "SRC SEL", "IN 1",  "IN 1" },
+	{ "SRC SEL", "IN 2",  "IN 2" },
+	{ "SRC SEL", "IN 3",  "IN 3" },
+	{ "SRC SEL", "IN 4",  "IN 4" },
+	{ "SRC SEL", "IN 5",  "IN 5" },
+	{ "SRC SEL", "IN 6",  "IN 6" },
+	{ "SRC SEL", "IN 7",  "IN 7" },
+	{ "SRC SEL", "IN 8",  "IN 8" },
+	{ "SRC SEL", "IN 9",  "IN 9" },
+	{ "SRC SEL", "IN 10", "IN 10" },
+	{ "SRC SEL", "IN 11", "IN 11" },
+	{ "SRC SEL", "IN 12", "IN 12" },
+	{ "SRC SEL", "IN 13", "IN 13" },
+	{ "SRC SEL", "IN 14", "IN 14" },
+	{ "SRC SEL", "IN 15", "IN 15" },
 	{ "DEC", NULL, "SRC SEL" },
 	{ "OUT", NULL, "DEC" },
 };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
