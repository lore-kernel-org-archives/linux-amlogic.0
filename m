Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338F4C04E87
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030552053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 13:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L6K2Jykc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gJyARx3V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yMl0eoA6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030552053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhdLUmX6L6hguNfhvyt7oX9H//qqSdWbycFZesToFJk=; b=L6K2Jykc2lYamk
	NqygPTGeRaWP/++HEVuQQJd8P8L0/4FG8PBkqEv3laRRtPi5aJXIUEXGTxpyXwz94bzWtJdjw9iUP
	/sgObDr2mmFC6dgbonUo0G5s/9pe5F7bxBrTqLcHE+tDttFUxHJC8OkjNKXTiIaD+Etlril2KYC9f
	FCsFJ7RvnBDtWiFj96+pe50+K9X03E+K4SYBhmdJIAtWHPvo0ejRmvtFgusJEMdm5GCEmk+hxnYiq
	EgZLvups4Vu+GbJ9j9cpDLyAlPNkmpkhCx+O7xehuJC8s6htLmO9fsf5F4eOkh07rx7d3GGgy6wiQ
	IK5TskMbUzzqdYT5lOWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQu4w-0004Ib-Hp; Wed, 15 May 2019 13:36:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQu4u-0002Oa-S6
 for linux-amlogic@bombadil.infradead.org; Wed, 15 May 2019 13:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bgxe1GRX/w2wrtefgULdeMfRiILdFJq82pUWP1dCMsw=; b=gJyARx3VXEZm/50fXkRXPfo9/x
 +qK10xzPWsQRdq4lfdGqIQZcb/5l3Z7Sw8uwDoscH2GEJ6lK841cpeNWb3EfBJEceNfN+V7eN7D4E
 p22l9xu0BEFs02ZeMcDOtK2V+cLvomqsOoChCIfEq9kPXnueby9ItkRyTBNtWV63Cx0a6QCcZG6Tg
 d0Dluze/lnFsiFHsKRheZVo3u3QgEzscljMkO/Cr7exr3+1Qoio06XVY5XF88l/TSco5HD6TFOWKi
 rLl9aS168lvQY9YkQumbKK1rvpBdNEI4OU9j7kGqswJfq/t80I+ByFLcbYD4fBDY8dzy2tF2y4IRJ
 H0EInDZw==;
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQtoK-0008QB-IJ
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 13:19:10 +0000
Received: by mail-wm1-x343.google.com with SMTP id f204so28309wme.0
 for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2019 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgxe1GRX/w2wrtefgULdeMfRiILdFJq82pUWP1dCMsw=;
 b=yMl0eoA65BOO2y5I3UtLa9IGCL5g/V97Lh8F7pAYnMofU0OqB+DIOWkgA2URKybltp
 H7qbZR+c/pQ5kg8Jh64jQWDo3qjvnPG5gXyHa1RJQEKTLZfVemrF0Ar/ngXN5HpkQa6X
 5KOSaON+QtfoQeSlXGJyzu0XWA3OzS1TPtloWRjxcSGfHYcOeaOhjxuJxfjypNfj0Qdb
 ycBdmXHDROw1d4BPZCaRserlLAhGbSb+L1o3j1Ky7n9KyiOytriN3Pj+KsBu2u03vCX4
 0Lyf6UnNjgpbUvuHwezCqrLu9sFkfWKa0YzOGa1HjNyARC0N3+KMc6ai62nlzhSuD9uR
 Pbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgxe1GRX/w2wrtefgULdeMfRiILdFJq82pUWP1dCMsw=;
 b=bEhh610ng/bVzFKKgJt/6YARAj6gGwNpXONmgyOFlD9Qqob8DUAca0ERwPFOGQFCTd
 EdBDswMdV53kIOKcO2QSWoXKupj4vu1ZjiL2Ha62rY/+h83u4M14fBrope2wUbm3zYrw
 5BEWM7uCZjtgRB5Qxk0E9wVgIU+XSAK4pnznx4VBHWn2nx/9H3PVDbBHKQIKTxDvGQ3K
 8sNrpbgK6fEnhkyrdwsQx7Oqq5XCXZ9JDdvzg7a8vqdvvGTXnP7jsa610lukeS3ALwxi
 dAIUn8PjPw6kYiXTNOdeuWiWs4Gsccb+G3qi8k2Skioxq5ULNAxIOypU0jeYVvp2Z5Pg
 B0rA==
X-Gm-Message-State: APjAAAVLo/zlRjHsnIAE52zLDawmqyhR4Jn8+n0GjErnt4oauIlREGpk
 VxQDYzR9pLCqHHQQYrX05OYf5g==
X-Google-Smtp-Source: APXvYqxC3WiRwd3tKaX9tLKESnKaHtepk6/HtpPVFWaY2/GLrIXfw8TZB9PS3JtGTCSqZMvaoTXs/Q==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr722446wmk.122.1557926347157;
 Wed, 15 May 2019 06:19:07 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/5] ASoC: meson: axg-card: add basic codec-to-codec link
 support
Date: Wed, 15 May 2019 15:18:57 +0200
Message-Id: <20190515131858.32130-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_141908_616937_987B1B52 
X-CRM114-Status: GOOD (  12.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Add basic support for codec-to-codec link in the axg sound card.
The cpu side of these links is expected to properly set the hw_params
and format of the link.

ATM, only the tohdmitx glue is supported but others (like the
internal DAC glue) should follow.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 5c8deee8d512..db0a7fc18928 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -29,6 +29,18 @@ struct axg_dai_link_tdm_data {
 	struct axg_dai_link_tdm_mask *codec_masks;
 };
 
+/*
+ * Base params for the codec to codec links
+ * Those will be over-written by the CPU side of the link
+ */
+static const struct snd_soc_pcm_stream codec_params = {
+	.formats = SNDRV_PCM_FMTBIT_S24_LE,
+	.rate_min = 5525,
+	.rate_max = 192000,
+	.channels_min = 1,
+	.channels_max = 8,
+};
+
 #define PREFIX "amlogic,"
 
 static int axg_card_reallocate_links(struct axg_card *priv,
@@ -517,6 +529,11 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 	return of_device_is_compatible(np, PREFIX "axg-tdm-iface");
 }
 
+static int axg_card_cpu_is_codec(struct device_node *np)
+{
+	return of_device_is_compatible(np, PREFIX "g12a-tohdmitx");
+}
+
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 			     int *index)
 {
@@ -540,6 +557,8 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	if (axg_card_cpu_is_tdm_iface(dai_link->cpu_of_node))
 		ret = axg_card_parse_tdm(card, np, index);
+	else if (axg_card_cpu_is_codec(dai_link->cpu_of_node))
+		dai_link->params = &codec_params;
 
 	return ret;
 }
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
