Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B29C2D0BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 919A42146E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="htwM06Fg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WL6LQvaJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 919A42146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L8vP86HOHgo+eWjzs3u8ZZtk3Bx6PuqLhK5UpVAPUX8=; b=htwM06FgcTbJN+
	J2C8ofv3GbFHIKySMC++G1JRMeKAhc4zKsgHYSRlpU+MPCu7eamqQyK+m5gK74fHdjhkannrw4j3T
	FFlkWMsMmouK1odaEmN4+Oibxyjt4oslqud5yqod3YPhRi9r7oWFNI0Po6sS4e8EGRPy0jTbw7X7j
	TdsbgCsWueE2S7FOh0w4W419KZEnm54JNudgesMzGY2B6evc34w934s3liN7NOkbwZD+7TtywuiRR
	CPjvHOYRbfTWB+iSausG1WIRMHuYuAgaffF+amrVcK/69F82DJFK1pGsHVwvERC/6nBU5WYXjwvf6
	I7mrTJ9KQjiCX/1pHF3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihd3n-0008IN-8q; Wed, 18 Dec 2019 17:24:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihd3j-0008Ft-42
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 17:24:29 +0000
Received: by mail-wr1-x444.google.com with SMTP id z7so3125617wrl.13
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkeDNQUJ3ikeTDqUkF4Gryc9YGb0Gj5eqNCbDtkdhPw=;
 b=WL6LQvaJ9GGlUjw9H2P/1hGp29WTQgH0SjF3vxM3PXuoSHkCPIJMZ0/moLtc9sKgF+
 JEh6NAbPqIWRs+wngIArKVHOaQSYykBTrlkNfSRW5F8uLnOYl7JY1UB6HVoQXdY3kEMO
 QVPbDjuu41bQvjV9npjWA3XGgU7mNTizqkPWaq8m8TTm8pEn3o7oHmiP/QDEr8b4hWy1
 gB0B7bA0p4nRahqNbn8k7FC58AA9TFFrBbxaBSXJ4WNCY3mEi7BmrGLsi4VkqvTiLIFP
 c/ym3SuKFZDF8BCpRPf5wTGrB/t9RvWsnyq/Mj8chxROlsIi0KDJel1ST8/iTOySbmG6
 A/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkeDNQUJ3ikeTDqUkF4Gryc9YGb0Gj5eqNCbDtkdhPw=;
 b=omzfisYnq7bkpEWOdYPnDyLwATSbOpqs09ivGqVDLgVUl0D3v2GkoN7q5hP0la51Jf
 cUmqyXGnGxnLSjJFEAt+b1LyrASWNadAvf1GDkFNoiSHZOI+lJ2S6GgmkA28bV4XkrPR
 WL+rA/Y62JpqK1IdJGJo9qvgofkF/MhVg88RzPOVwgyKpM1JA4mZCftxk+1iaaib378C
 t6+XyhX6DnlBzamriAH0cIHg8o99ySBQAbJRl+7tFhWezl58WwHwA1HnH4jJy0vslD6i
 5zwiWAuUDw6rvV3bMn3R43VUAtMKstKtbtW3KDQ2ZGu0BKGGTwm50YJshLQq5FBU7IhK
 CRdQ==
X-Gm-Message-State: APjAAAW6bhQPyp3yGj8Yj/TVZ8qigPWRMbyi+IasbZNtaGxSVcAMRwcN
 eBJojS79jnv73423miKeFk4XJQ==
X-Google-Smtp-Source: APXvYqwBahCJsSlMYv9H8BS5x9yINh/xRKEr1G8MnVvK/fUdISZ8dpu38/NOPkP1wQV26nQIfcBMEw==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr3902176wru.395.1576689865056; 
 Wed, 18 Dec 2019 09:24:25 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/4] ASoC: meson: axg-fifo: fix depth handling
Date: Wed, 18 Dec 2019 18:24:16 +0100
Message-Id: <20191218172420.1199117-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_092427_219319_9C1E6301 
X-CRM114-Status: UNSURE (   6.41  )
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

This patchset improves the handling the depth of the different fifos
found in amlogic audio subsystems derived from the axg family.

Initially, it was reported that, when the period is less than 8kB on sm1
and with TODDR A, several period are coming at once. This is because the
field related to the fifo request threshold changed on the sm1 SoC and
also because TODDR A instance is significantly larger compared to the
other instances.

With this initial issue fixed, I used the opportunity to improve the
driver and properly deal with the different fifo depth found in these
SoCs.

Jerome Brunet (4):
  ASoC: meson: axg-fifo: fix fifo threshold setup
  ASoC: meson: axg-fifo: add fifo depth to the bindings documentation
  ASoC: meson: axg-fifo: improve depth handling
  ASoC: meson: axg-fifo: relax period size constraints

 .../bindings/sound/amlogic,axg-fifo.txt       |  4 ++
 sound/soc/meson/axg-fifo.c                    | 50 ++++++++++++++++---
 sound/soc/meson/axg-fifo.h                    |  9 ++--
 sound/soc/meson/axg-frddr.c                   | 33 ++++++------
 sound/soc/meson/axg-toddr.c                   | 21 ++++----
 5 files changed, 76 insertions(+), 41 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
