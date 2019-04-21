Return-Path: <SRS0=TOuI=SX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA853C282E3
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Apr 2019 14:42:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 790982087B
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Apr 2019 14:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KKxIxMu7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PyokptBE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 790982087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UHJ7HmhtEhR3DETDI33WMZNCr+22uNSQEaqD0VqOVSI=; b=KKxIxMu7m286Mq
	QUAUI1ut5jnov9JBAC/ndBK+9vfBcq+GK6CiFoGgLexrY4DckEQn1rkxxxm1A5zTSmoXm0C4p7x0q
	72p1t1HaFvvm5s8wg5ou4u/2wDjneYYmUHJqMIxgdvWv4ibTH7PYVoeJ600k8Y52nqQ9YvxLunbBX
	XjKSDsa7iBBTu2kjKe1tskycsW8YOSj0iWONoiuvZIkkq02kpLkZh2Oh8TD3JEPWV2Botx5XmN4IH
	RnEJ4JzHwbWdAD4Tc3OCAGhrHNw4Nf9WRDukEiTtxS5qZ3HZ2WRrBYONGdIu4jCf4rVnDNVPW/nrK
	aXD+suLCD531tRNG6PZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIDfP-0007wy-SZ; Sun, 21 Apr 2019 14:42:03 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIDfM-0007wB-84
 for linux-amlogic@lists.infradead.org; Sun, 21 Apr 2019 14:42:02 +0000
Received: by mail-pl1-x644.google.com with SMTP id w23so4651494ply.4
 for <linux-amlogic@lists.infradead.org>; Sun, 21 Apr 2019 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=gv0LjlXR/GUpLGUmlSNE9486t0zvmlPQVHmwi7M1NtY=;
 b=PyokptBEXqY4nhOGerefx1pYklNpDfJ3rT1xyohjz4mOiVqZIw6WGoXdQf6Vbdc1nR
 kjq2LNbFHrBIJ+s07nO/r8+ypjPV1vJdZt1Ysl4VBnRgDFNNMBikgLFaAQfg40NLFgPP
 wbs+xf5N8DosUnLf+Sjacr8nrSv9H2XDts2EQQXTsoeWL6STX+mjluwGsiqBR4vADVsX
 1xPaXTkzoQ4w5UYuKXOztlBOFtTbm7q+1f4MSAYwYw9RdFKXdYeIvMMtJ1Pw2N7y6aYR
 ap0uCZn0byhbLk/Hacni809dZy0Rbu8CMUbyXMhVQ/yOvygrrPvk3A18FqnVe7ysmcUk
 ublA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=gv0LjlXR/GUpLGUmlSNE9486t0zvmlPQVHmwi7M1NtY=;
 b=ERT459leHebEXJcyR8TuuNMJh6EvNodUZo/cDY4W8gpz+OIphf57tgCRW2tErhcFpF
 ncF7YeNLyCBBHhdXoIHfVaYY3fqBvYcMameMHuWTEqsBa1c2r7dAEyU6dvmjRCVde6Um
 Vw47kyhnym9MrTrcEt2YRCddEIqhXVo1vjeuhcxzVyQwLyi6/Q4ZCtebSqa3Sjtksy5c
 tpfQCNpfDBGqUx2zvKgYvI0gU3Zb/tpFGjVopcqTJJl0LQ9cpSHznq1De8bNjSoaBx3h
 SCHQO1YgNh7sC0YYcSzsnIU/YUQLIjEZEoojALxoqfqddHJTN7n/7YOkbuK+Go/AuMQY
 bzlg==
X-Gm-Message-State: APjAAAVQywzWmio+KNsAkrwFlVnplVdKqfsH+KMXh4N1ngO8zqDfaKQ4
 TwvOAW+yu4kI5XQkYgoPg5g77A==
X-Google-Smtp-Source: APXvYqyGVi0iqFgoxayWxDwvOnmW3uummNPg1W7LJQgc52mYaf9phXrK1wOxvcgsPeJsLpc29txkMA==
X-Received: by 2002:a17:902:e393:: with SMTP id
 ch19mr15216761plb.117.1555857716785; 
 Sun, 21 Apr 2019 07:41:56 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6d49:9ddc:13aa:21c9])
 by smtp.googlemail.com with ESMTPSA id f7sm1205796pgp.77.2019.04.21.07.41.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 21 Apr 2019 07:41:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] soc: amlogic: updates for v5.2, round 2
Date: Sun, 21 Apr 2019 07:41:55 -0700
Message-ID: <7hy343a098.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190421_074200_339393_230F96F1 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit fdda0a6adc33536ad468f07db27325423703c5bc:

  meson-gx-socinfo: add missing of_node_put after of_device_is_available (2019-03-18 09:07:32 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers-2

for you to fetch changes up to bb1dca3a3900a00b881286c96340d6ab85eafe0c:

  soc: amlogic: meson-gx-pwrc-vpu: Add support for G12A (2019-04-16 11:09:53 -0700)

----------------------------------------------------------------
soc: amlogic: updates for v5.2, round 2
- VPU power domain: add supporg for G12A SoCs
- socinfo: add new SoC and package IDS.

----------------------------------------------------------------
Neil Armstrong (2):
      soc: amlogic: meson-gx-pwrc-vpu: Fix power on/off register bitmask
      soc: amlogic: meson-gx-pwrc-vpu: Add support for G12A

 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 144 insertions(+), 16 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
