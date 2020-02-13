Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF59C3B189
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA1B217F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ilc/Djce";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LYTr/jwn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AA1B217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4D6VbNARLc/81+PuiOqfuGgjfWOP84ZZpe3TX+m3G90=; b=Ilc/DjceRfDhpT
	aL/Qqh5pSdly+axlpIXdcLgk4hO3WU5WhqWhCgZFj2KJySygYX/1oh3tkyrNSvemSVM9a6gboA6e3
	otk9ZfJ8lYxuqCd3SK0baWlr9d9MsWbffzGJ7v0EiEbRA5C+fIfhJNDD+SsUi/PnxT7CSECsfnK+e
	Ppad0ITzSCJqac6rBL59KzclTi7VPmYXstF97uqnpeCnueYkeaOKxCd08uozGeM8T+jiXWvA3E08A
	HLWoexfvMml6RUJAEUPEVjKa0wd2wie5OWSITiHoGR5MV1aBrdZrtI5rmios5+vVegqr5WKEWoFT0
	RReIZGB1FfWAjSSKslhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Gmj-0000eh-Ag; Thu, 13 Feb 2020 15:52:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Gmg-0000cy-5d
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 15:52:11 +0000
Received: by mail-wr1-x442.google.com with SMTP id t3so7287424wru.7
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 07:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aB1AiCkdQEWl25o0CFyQmEuSLs3mwyleNLQ7q44t8HY=;
 b=LYTr/jwnIP7xB41uk/g/SVYjXm/Nywl7CqihGSb6gmVFQuEoDKE+M6yeLtXBuxzSDV
 WSSiblX+7cKEZrMWY2arxWYNZs2uanjtjOd+R/yUTEMfW9J33ZT633LPckPXELjES10Y
 Aw8ZBK7NcNiN9jxHEIKAUsv3sAXzaBPkttp4Zf6trbnjHLj5fnXmyXOrUZL45qj2ssGU
 GnuX/g7Hhi6cCKYgZwWfl0kXt6jC7LA9LBGTwFzOU3OSPGWRVbd3/jvNcy2c28hqmfKB
 nNEVuHcu1cXqvVGTIH5fetzbCx7zyvwiZMeRE4ET5ZeNlolaqQALDjFF+9l21K1IDFee
 UTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aB1AiCkdQEWl25o0CFyQmEuSLs3mwyleNLQ7q44t8HY=;
 b=NElUhoW6/DBzxjo96K7Y86nDJrfBOinSHl2rRkdxzr0GCNEDGHNbvgNTd7/V05byKI
 qr2rrSho2h9MOsU/nlbouZWcDO7y4fKifZQKd7OZbw8t2w025pkxUcmXQZUJ7K8z5ETX
 u0DgjdZlzKVQwJY/gJqMh2iGVe1J9ZjgIrlhMSPTiDfl1t1+qPb/GAntIGkwwA6PAjU+
 z3nJCeypp7nB+MpI4X1EmKyZ8hZ1hWcxF83Ehf4wANixqQaJroE76sI3IBTdZQtv2t0C
 1O7yzw7OZrRDuD0T/n4VKhPJyQrI1MIDm/GWy4a6HmivOIQdXuucE5jHMsCCf6gG97S/
 CrZg==
X-Gm-Message-State: APjAAAWRcvJP9nAR1Wg+Ye3OMUixSvE4Gk8iuYq0c9zPmjl1ru8XczwY
 /mYn7N2rPaNYGgcQgM6lFxlm/CGmOrQ=
X-Google-Smtp-Source: APXvYqyEvLneyxVeHuI/0pBQCYZi5+WLlVqFWpfGuTvBL5p6xmOWK7iqZ4/PQzBDgirZhGC884Aaew==
X-Received: by 2002:adf:f850:: with SMTP id d16mr21763639wrq.161.1581609128618; 
 Thu, 13 Feb 2020 07:52:08 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:07 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/9] ASoC: core: allow a dt node to provide several components
Date: Thu, 13 Feb 2020 16:51:51 +0100
Message-Id: <20200213155159.3235792-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_075210_208893_F94CE24E 
X-CRM114-Status: UNSURE (   9.49  )
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

At the moment, querying the dai_name will stop of the first component
matching the dt node. This does not allow a device (single dt node) to
provide several ASoC components which could then be used through DT.

This change let the search go on if the xlate function of the component
returns an error, giving the possibility to another component to match
and return the dai_name.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 068d809c349a..03b87427faa7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3102,6 +3102,14 @@ int snd_soc_get_dai_name(struct of_phandle_args *args,
 			*dai_name = dai->driver->name;
 			if (!*dai_name)
 				*dai_name = pos->name;
+		} else if (ret) {
+			/*
+			 * if another error than ENOTSUPP is returned go on and
+			 * check if another component is provided with the same
+			 * node. This may happen if a device provides several
+			 * components
+			 */
+			continue;
 		}
 
 		break;
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
