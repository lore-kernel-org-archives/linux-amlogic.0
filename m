Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F29C31E49
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E447521721
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DiDsdiqE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ok5DOoG/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E447521721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9+KJJlO/qhAxYaDZjFW2luhCinASQcLqiXNyrmH95A=; b=DiDsdiqEkLyG/F
	0Lvhll+/cgzm0ZqcerWTCsv9nNPM8Scw7yQ/OXx4KSv+7gnPvy+ireK6KPxAGgf4FTMExgiuLXMyB
	ziN4qN04ibyBJqqhkPRaGQCjJwKclwgeK6JxYy1AT6z92P7DCPFyJUVojqPB0CQFr2a3hj+ZFcfnC
	K/hVruIphji5qHd8NIcMXFwfIXS81XB1OkCy6cf0H9q2yuIXHVfcHpE8xBH9XOwop+k2C8YjpFw3H
	r2VKrDeXyj8vD7l0qjWDGj/zUHmFYSYhwwMp1vpoYdX1Y1bqPcvM8B4RFgLbIA5F4Fj2rMTPqLhX3
	usGjSqxhx5zwnOYkXxDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbO85-0000Ag-9B; Thu, 13 Jun 2019 11:42:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbO7w-0008UN-7r
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 11:42:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id 207so1973493wma.1
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tw+9nr0k/SQ4+6C+T7NQWdtgxVemIU5O6qgx24DY8vo=;
 b=Ok5DOoG/v42T5p/NULeH/QnUtOj3y3bgwt/tHoF5P/QfLizFjo2FteTJhShh/SJZlr
 Nmlqr3KRJRhMsWo6pVvAXVbul1OayENODZ5gcGgO5C7JDGHK9U+PzWdA/jg93WjfgrBX
 3aPLgeJJNFVLG2B/rgjiiSmhS+VPDiaQJtZu9Yj5qNZsnJJwZOWKrk3hKiDrwVwOJa46
 DJ8yGbCY355E06ytD2Ad5rB+zWuOJWxU5VFLulOd9U0WSoao+makMDcH1cw103nSXVwm
 WvwvNjZS5YfcP6dgfELXmWKxdmNFba7TWuBCTXVwsvhillQ7D9Jrl3egEbQtgmyPgiVH
 5Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tw+9nr0k/SQ4+6C+T7NQWdtgxVemIU5O6qgx24DY8vo=;
 b=Bgfpa/Cu+USMLYCYV61hX18VcYE4zDmVLALl19DjwX+qnXQxKZqKgHEmV/UvP37z3f
 TTtnZ0dcDDUSILxT54RqmXIPdkCGsEJaIAHF7jhvhn395IJ3Uu9MDx1KqENBYK48cDWW
 W+N1+rmipzztRnW8otbteqsseNpW4S3AK0GYT7D9T07ydzo5uAwPDDb7sEK0ZwhbsmQO
 4NhOMuPYRq6pFB00njIEtg8OMz4lFLrSJd/cDTugVB5t26tP2pShRPcebJ7Xoxf6U5WS
 w3f326/Cv7xm4TfOeZzknyQonsbTXuAAZ0oUWCLqxp3nQAQXySlCJ3/GAU16S2W6jTh0
 xrtA==
X-Gm-Message-State: APjAAAUCHbFGNZERd9eEm0w32jd2uSj9XtziBbD1cWNlPRFo12Y63PMp
 WSPC+KdqK3k7eM8+5e7pdBT8BA==
X-Google-Smtp-Source: APXvYqzEpIcfbKY9VmOQOlh4gHR44pyPiRNjVhiHDFIUMTdcrq2NBX4iOv+SXfr3SjTejuF07/m1hA==
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr3280189wme.157.1560426163056; 
 Thu, 13 Jun 2019 04:42:43 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/4] ASoC: meson: axg-tdm: consistently use SND_SOC_DAIFMT
 defines
Date: Thu, 13 Jun 2019 13:42:33 +0200
Message-Id: <20190613114233.21130-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114233.21130-1-jbrunet@baylibre.com>
References: <20190613114233.21130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_044244_276205_03ED6E4B 
X-CRM114-Status: UNSURE (   8.75  )
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

There a mix of SND_SOC_DAIFMT_ and SND_SOC_DAI_FORMAT_ in
axg-tdm-interface.c. Even, if this is currently the same thing, lets use
the same group consistently.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 585ce030b79b..d51f3344be7c 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -306,8 +306,8 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 
-	case SND_SOC_DAI_FORMAT_DSP_A:
-	case SND_SOC_DAI_FORMAT_DSP_B:
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
 		break;
 
 	default:
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
