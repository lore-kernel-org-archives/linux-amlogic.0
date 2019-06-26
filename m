Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D658C48BD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 13:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50389205ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 13:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E0UmBzOx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VHEsNntS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50389205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tenRZPMfnhjN5dRqj7RJzwt7wIDEfmv9xpRWnmEtdP4=; b=E0UmBzOxKecxeD
	YdRzaUJcIrV4dqQIWzI6g4tySXsjwlt0u/DaGY9LBjIFQ3aSXSXKhKppVNRxSCZywRq7lalUxcAoH
	QJq/ek+Gqy9GPXLn26yZB/32iMZcR8gV2qdj3C/cR0Ek1DTU5mqFCsuoDfC3gefO58ARucLsALFYw
	TjSldWLHtZf2iH7YgRCkVGfKBm0n+7woPLqAL65tDmGzJ7i7zYuqGXJOf9RBajantsV4rW8QPFEnS
	+LeX/INkApW+UL1GksS8Me+6Q2wZOLMxwtfkfpPYujwLPpggJ+FttR4QtMIZkknT0qZytB7i23zok
	rttekzNrr2qVVeS2/tOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg86b-0005Vl-Dp; Wed, 26 Jun 2019 13:36:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg86F-0005Bg-OH
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 13:36:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id x15so2141767wmj.3
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FQg0smS+mfYMsusPPdodpkb22WraUSysEIqfJJV0yM=;
 b=VHEsNntS0B4pEO3c7fwECuQ4V7xeuFnooK6MO9IMX978YagrBVIBsBiTY/LeigduXr
 hEbi1aImDb5PmCDtCL69RpPzO091ws2GrWX+YPTWXyBl39/QnErn31JHaEHU3SibngUj
 FNNYMAXWu1Tqgnw5sz2ykr2xgdx7q4KTMKiPYaaQ3KGcDx/koVCST9+xzBl5+BtWNtFP
 5p9Zdc76EobXrkOX18uFkB+3jY53S8T2F5N8v1f5SFftwAhZPOnZY1ma88QRv2JP5rfh
 Tx4fBaWB37o2j1YJ6zOKCb4gZpNh05B4LnMrZroeTsw6Y75HgPdAiFYDfOektVxiXGer
 IPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FQg0smS+mfYMsusPPdodpkb22WraUSysEIqfJJV0yM=;
 b=W2L9aWwFYj1+9EoVRf0DYxuo0KYt3s3Mx1nRKkN6xmBp7Od8UCdZB7bfGBehlvIrtz
 CRWZiImBiTAka0IKdP+1InoLuPq7GWYDE+siVBJ6Es1qabVNGUNbFiy4HVItyzEWcqqK
 uuYaAq3eIivIQsaL+shpdUyFjI2tnHFuAHRcf/ykXedQzHKfU2Gtb/mOJZsQPxfMRy3L
 vn4qTHkFeK1mDR1jpnojardX1MseTkhd84zkF1vRGjZg9YgMmEB0c9kb9S7+w+5MGTCt
 9HY9KlIm4cDr1Jd6HUlEN3wx4iEyP68Ko5s++kD9Hh+Z763LwSzlttEuu3iPT4PDrwE0
 kQAQ==
X-Gm-Message-State: APjAAAWILU3oGqTHxshJG6vR2KQLDXJJ0Wppld/cv1+hDbTChwgKNqPJ
 ZKWHWLDywaBvWMGB2NHqz18GYA==
X-Google-Smtp-Source: APXvYqysws+jQlqShYlTKNd5YEBpxaojbCsgdCSKH4ZtXxVfdbxFbdzZ7FYDDAUJSCKD6wEDIJmj7g==
X-Received: by 2002:a1c:3:: with SMTP id 3mr2866435wma.6.1561556192208;
 Wed, 26 Jun 2019 06:36:32 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w185sm2877880wma.39.2019.06.26.06.36.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 06:36:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] ASoC: soc-core: update dai_link init
Date: Wed, 26 Jun 2019 15:36:15 +0200
Message-Id: <20190626133617.25959-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_063635_923683_F554B6FD 
X-CRM114-Status: UNSURE (   6.44  )
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

My initial goal with this patchset was to allow a dai_link to have no
no platform component, instead of having dummy by default.

However, when rebasing, I discovered that Kuninori Morimoto had recently
done that in a different way :)

I am still submitting my change since it should allow multiple platform
components on a dai_link, which is one of the FIXME note in soc-core.

I have also added a check on the codecs component availability to align
on what was done for platforms and cpus

Jerome Brunet (2):
  ASoC: soc-core: defer card registration if codec component is missing
  ASoC: soc-core: support dai_link with platforms_num != 1

 include/sound/soc.h  |  6 ++++
 sound/soc/soc-core.c | 72 +++++++++++++++++++++-----------------------
 2 files changed, 41 insertions(+), 37 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
