Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D78C48BD6
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 13:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66565216F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 13:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d8R4DUo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="blN2Wv4W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66565216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXdmVHDvSxDU5gJ63XBWazJVK/rBltu7m31Xxy24Y4k=; b=d8R4DUo8ojLgC/
	nxPqi5uWDYlyD1bVRePs3uOl/mQbIPRiEmUV5sNyqklsvCEOUIzsn63Wd/F9+uHhZw5oZVrcvlJ18
	dk2Fqid70XifJp6gW66tcQOD6J+BxXtZNrcG/wmF4PTQwvBtacRwsls9YGbIZ/AOuHp4OBfaLHIkx
	HDrPcw8VJkhL/cpnPC9BRzHFWDOtMfiNaUCjO9dl6eKdM6LSb3/nzrStX7Ipto2fxJ4EeXGhxHf8J
	uuaWG3GVY1XZcBJmgtNLbKlbSv/BZCFA6KssdQegyfbL7lKP+SFnNAAaCkuTzyfcdicpN5THcAbK7
	NTAaCg8XRXWykLhlfTDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg86f-0005Yv-Fw; Wed, 26 Jun 2019 13:37:01 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg86H-0005Ds-6S
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 13:36:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id n4so2799735wrs.3
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnbXfzzoDtydJ87Q5fD6teACNHZuePi08QBtGx5OaUc=;
 b=blN2Wv4WVam0hiUqSylbBjtVDmRMsW53HOX2psNbZKAxgOV2/z/PkOMtPkvN/ugaMZ
 Sg4t47aCwoKzFiHw5nHazKAzbtIIT1w5Cg3nv+jk5gdLshoApig4CdNMpdMnYHjq9tnk
 CedAXDygrR2Ry2XQZjRO9kNtKX+IT1NbJk0z0dwj9Lpr0DgIjdw6g0Z9+faU+mkx7mrF
 CTbKNYE6FmB6gqFUzdzYfA74pNkEU/94kdqZgl9dh8fj7D+Yhwb2d2/+4XhXJeLiYfEa
 RHU/dazcHlX1nB+mtKcX232onWixjioT9LUKx+Rkgfh1Q3bg1P6IAwWw0fNvYbujtGBk
 gw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnbXfzzoDtydJ87Q5fD6teACNHZuePi08QBtGx5OaUc=;
 b=Fgjgrq3tmUq5VsLJGEAPaV3Zwa3p91Yo8psSNjstV0yaZ+aF+9iao73j8wYbWMZ7Gz
 SMl1ZXERaU0x3A+1817TPClG7PlIZT4r7lwPTodED0MO2AHTbb+PO2AZcYMU1HgjFLTE
 Y90eDr629zpWnjGg54mqvc8FucGjwE1Q+xrdY1O8UESP4um+XSBC0L3+Dq6Gsbb7mDD/
 siTAvo9MAoNvejWE88SsBjCPkd9PzUERAEz7TUnftP2LNlR8PvYSko4J+QFlKvHCySwQ
 +eIGR5dXzVhPzD+1cGmlT38c1dl0UtZMq221UmsuzCWogVTHawo1bteKGCYYFZr7WFm2
 tDJA==
X-Gm-Message-State: APjAAAXjxkkpCcmB64pzo+cJBCwEDPzivUPWtGWJ5j1v0n3yiqIBbtBu
 vYAKw0pBOIPuIxaBvC5ywV7j+g==
X-Google-Smtp-Source: APXvYqw4hWzpgN2aSWbX3Ju7Pa2dKjxwWsjZwurpIK/EUEgT1P05NHGu8zYfqRbAxNX4dVIeZVs39A==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr2478127wrw.138.1561556195567; 
 Wed, 26 Jun 2019 06:36:35 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w185sm2877880wma.39.2019.06.26.06.36.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 06:36:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] ASoC: soc-core: defer card registration if codec
 component is missing
Date: Wed, 26 Jun 2019 15:36:16 +0200
Message-Id: <20190626133617.25959-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626133617.25959-1-jbrunet@baylibre.com>
References: <20190626133617.25959-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_063637_272910_3E0A1829 
X-CRM114-Status: UNSURE (   9.04  )
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

Like cpus and platforms, defer sound card initialization if the codec
component is missing when initializing the dai_link

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 358f1fbf9a30..002ddbf4e5a3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1064,12 +1064,20 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 				link->name);
 			return -EINVAL;
 		}
+
 		/* Codec DAI name must be specified */
 		if (!codec->dai_name) {
 			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
 				link->name);
 			return -EINVAL;
 		}
+
+		/*
+		 * Defer card registartion if codec component is not added to
+		 * component list.
+		 */
+		if (!soc_find_component(codec))
+			return -EPROBE_DEFER;
 	}
 
 	/*
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
