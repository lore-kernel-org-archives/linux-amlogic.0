Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3CAC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D74D2084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B+qE1DTV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="X1Egy35o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D74D2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beXhlpzTR2fWRR4UeUtTX01U+ndlSE9+LsTLQQP5/QI=; b=B+qE1DTVQmyNvD
	iQsXIgMMI8bBAfJpa+GnWUwP3Sj2RJunOWW5zSrb6/xKa0SqGSylkBuN8qIQEp1jJsWW3SHbS4gvp
	fGiPQc9oUnrifXj6NP2oF22zexU9KuIlU6wtqtuzOQDmSrQW73wZZS6N2SUzIlvpobhXzTg3OPfna
	0oFwgUmRiPVIk6X3c4WSXnP7fdQoLxH5zPhDLsMwivcfOzMpr+FqW7VC4lTzK0+vChK7CkvNaF/Ds
	5NRptFNBZF9cVs4B2vqQ4Wvzydj91VdKKaXzr7nQHkjeW+KjHrBCkIEZQ8k5xgGm9yQcvS1ckSWxw
	ju1bvVy/RplNJ49QEYRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hErbR-0002v7-5L; Fri, 12 Apr 2019 08:32:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErad-0001wi-T2
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 08:31:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so10794852wre.7
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=X1Egy35o1qqPY3mxP4fqCcI/t5UEFYzzzlCa41uLiDo2NLjCuzy29PS1PWgRETdSYZ
 fNrVUGwLmPvFPXrswGzIab/2OXldSTY0YUN9FTOWUqEyEgAKxeZ5JknLzzsPpHemFBda
 ucfosdgpStlBJuAg1CkavIQiNLMXpGlLFKdKSDVVCrKPgKXvFXuMZV1JiET+8GWRwB8q
 CVNGGmvc3i4Af1nSm+k44VPm04xlwAIeGy8mSPno1EVxafvOOdhll+qtNRyeIwxzzX+3
 Flj6G16aHXqnoHkVJ3loO+BNHynPEQoYIn2MMrjQypTPQXu8gg0BzIf+82dTUK1S13SX
 gjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=AEYikb4sIaWQlR/0mnmaIIF70MsbXrQIaOXYA5b0FUq557n5ZAoiFY/8W6OuZNjSF5
 QqEY/5PlSkfqA+PVOKZFu68cc3bxBmXkFgUpGWRFb62JQKCSN52VH2IkYcSGzu7kFSIb
 Ei7Z36F+2J5zTiKNwCKl9mCjg7flra2YmvYzyYDYuwKYCLkPAJJsWEWE0Lbh/qJPCtmM
 OVvN4x8qgSOha9mh+gk6Hidbz/b3qj2HUVc5HZkQt4WrMZnYAqKzFA0z+1IXKGT0ukqs
 0KBPxbcZAeIaaqDUtD7O9dInw4cbgU22Nf7UAWp1HkHhjIZm3sRlKD7efTL5d5o7w2g7
 XjXg==
X-Gm-Message-State: APjAAAVPzgqhJN4xpqnsS1MXvuunwQ4i6wYS56/ejmi3/AxGy3pcRquu
 ljan3Gf7s7xXZj2sQmW+PPqkFw==
X-Google-Smtp-Source: APXvYqzBr1f0O2SeR1JovrsmOw1CtuqCtoaeZGfOl8eubxwCbcaDF51uZ85tyl/iQk+2MGtTWj9T0Q==
X-Received: by 2002:a5d:4907:: with SMTP id x7mr31589434wrq.133.1555057874477; 
 Fri, 12 Apr 2019 01:31:14 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w11sm116054702wre.15.2019.04.12.01.31.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 01:31:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: Update AO CEC with ao-cec-g12a driver
Date: Fri, 12 Apr 2019 10:31:00 +0200
Message-Id: <20190412083100.4070-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412083100.4070-1-narmstrong@baylibre.com>
References: <20190412083100.4070-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_013115_935175_E618DD32 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the MAINTAINERS entry with the new AO-CEC driver for G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..bbad8f3ee3e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10046,6 +10046,7 @@ L:	linux-amlogic@lists.infradead.org
 W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/platform/meson/ao-cec-g12a.c
 F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
 T:	git git://linuxtv.org/media_tree.git
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
