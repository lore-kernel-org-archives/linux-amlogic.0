Return-Path: <SRS0=gLzN=FV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3290EC4361B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Dec 2020 15:08:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5B9235F9
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Dec 2020 15:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5B9235F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BkIXHehDKaPDfH+OZrven8Fv2VsL0lmFOyz2kRjc8/Y=; b=kwiJ3DLegdibAb9HKO1GgDp+h5
	WDOEgQsxlR4swXmPWf3RyzXCfwwmDXfnQ3SxjxkypBwbYvxC4UH8KQtSYp88JPajpo4nC7n46cEoI
	juiHTopGhausCNZsAFEyyFnAitL3Nqarmg+RX+/sabPZe73ZwzfnUTXzVXKKqChS6ELrmIfEXLZYr
	yTihNsH3aB4YWo5jEV1AYXqmvBV+t6UcxW/C7FKCXHctNFD8wrfDVJT95MZq62moelLYRwc1Mssxo
	mp6HQImvD6oODynkvUEulaiNO+Zm3epF0fqrVNQc/eQ8xdB+56nrUI3SQThTJjt8bQkUvziIglXrT
	hx46JZcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kputI-0008A4-9Q; Thu, 17 Dec 2020 15:08:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kputF-00088y-Em
 for linux-amlogic@lists.infradead.org; Thu, 17 Dec 2020 15:08:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id j22so20368437eja.13
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Dec 2020 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75RY4vD+6THVdf7SYejRYxpjyXMqUmJXh8IKgMSDeyE=;
 b=BND8Hy/YuYhie9i+NkI9RB7uFYLhDW7+EAITvHsZH3alEam0zMy38AE88QEdICAXJ0
 OtYI/GROdhnmInH4DWuXCFwm1VYo1Si5Lf3azEQZxpMmad675ymUMVBRs1pGhNLJDdIb
 oLzmO8wTlDhfw48rFKn2+ixfWN1MoqOckgSFeRkuRLpMztuYtTQdajwFauhrmqkyYNZ1
 CnxHKAjIntusZNjXWhsEPARlrovuOrNRS2HMJugNtPbbhOeXgypnarDs5guIrmqyHv5V
 83uJ6TfIAUeky8ja7GFMf3/DirrtAvEk8OlOpipWHiPJSDl+a4K+jk+14sop+7JhUwg6
 q71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75RY4vD+6THVdf7SYejRYxpjyXMqUmJXh8IKgMSDeyE=;
 b=i4XhWdRJ+5tqducPKCjmsH0j4Exk91aeYhCCOcxQ1QSl0+h5cZF0DmC6F1+uQY3BsQ
 OrU8kMX0abvjsQfhGgkAf8LgWv8EcjjtAllBV8F5vRZiqlPjxLRu9IXqHqb9URvjZ5qI
 2UCXRD2ymBc7ubHpKdWxLsD+WNE2u6ZNTKwEKorm+c35D7SAXdG9heRdNAeQn9K+igyA
 bxAu49QL0zyR8OzqgGUaa3Z+sn9LpJH/ODXgWgSb4UT1zJK+sOQzSJBNRnXcQXnGiiMP
 KFm7yIBwRdZvofpHW4P3pKISM7PwI2e0I8IdBIljjBJ6cNmv4Kjvy1uQhv8oyPqJpNHK
 jt9Q==
X-Gm-Message-State: AOAM530ga4ZeHarkKIEl54zdbBsfLkJsGjRAWu3G4eEQtXbhG1Z3MFAF
 53eLWRP8n7uYaNUcrn1R6PUelg==
X-Google-Smtp-Source: ABdhPJzyByES9hNl/qPTywwPhbSF8tJ9xCc6PxSLb3zjXhePzkuCgK6L07hmA6u74KYHBNJCULd9SA==
X-Received: by 2002:a17:906:ca08:: with SMTP id
 jt8mr348286ejb.368.1608217702290; 
 Thu, 17 Dec 2020 07:08:22 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id hb18sm3982411ejb.86.2020.12.17.07.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:08:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-tdm-interface: fix loopback
Date: Thu, 17 Dec 2020 16:08:12 +0100
Message-Id: <20201217150812.3247405-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_100825_623653_C7A96D89 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When the axg-tdm-interface was introduced, the backend DAI was marked as an
endpoint when DPCM was walking the DAPM graph to find a its BE.

It is no longer the case since this
commit 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
Because of this, when DPCM finds a BE it does everything it needs on the
DAIs but it won't power up the widgets between the FE and the BE if there
is no actual endpoint after the BE.

On meson-axg HWs, the loopback is a special DAI of the tdm-interface BE.
It is only linked to the dummy codec since there no actual HW after it.
From the DAPM perspective, the DAI has no endpoint. Because of this, the TDM
decoder, which is a widget between the FE and BE is not powered up.

From the user perspective, everything seems fine but no data is produced.

Connecting the Loopback DAI to a dummy DAPM endpoint solves the problem.

Fixes: 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index c8664ab80d45..87cac440b369 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -467,8 +467,20 @@ static int axg_tdm_iface_set_bias_level(struct snd_soc_component *component,
 	return ret;
 }
 
+static const struct snd_soc_dapm_widget axg_tdm_iface_dapm_widgets[] = {
+	SND_SOC_DAPM_SIGGEN("Playback Signal"),
+};
+
+static const struct snd_soc_dapm_route axg_tdm_iface_dapm_routes[] = {
+	{ "Loopback", NULL, "Playback Signal" },
+};
+
 static const struct snd_soc_component_driver axg_tdm_iface_component_drv = {
-	.set_bias_level	= axg_tdm_iface_set_bias_level,
+	.dapm_widgets		= axg_tdm_iface_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(axg_tdm_iface_dapm_widgets),
+	.dapm_routes		= axg_tdm_iface_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(axg_tdm_iface_dapm_routes),
+	.set_bias_level		= axg_tdm_iface_set_bias_level,
 };
 
 static const struct of_device_id axg_tdm_iface_of_match[] = {
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
