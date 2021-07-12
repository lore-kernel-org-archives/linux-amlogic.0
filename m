Return-Path: <SRS0=/T27=ME=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477ACC07E99
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 20:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10008611CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 20:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10008611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0njwggjnBPzPONjl5bIfK8UgFj6d2sZAFnbGgt/UYMM=; b=KpUe3pfXEJLIb8
	VKGeICYwMzija92u5I/5+17VU5krDHO6lO3zYzWdmWSvBZ9EU7Yw0ZdbocF481IzBfjkBftKnw0B/
	L+nx6n16M7zNgRoNRJ8Wh5q9II49ExWjSthSIi6IHBIJ2tUNgorLd2+9OV39O2qMkgamBMvEPyNNX
	NeWOV9+/6KTD0vUzwpOpuCF2+J46DpttaiFdV/FX2zwicCptF2YCj1wJJXJZrl1GGirquQ6x954dA
	s9ssq5rJtLJAy5zZNGVgo8fVSyuJuwg/utngMeS97NgcNJjgJi+juIqHiZqx1El4ZVT3fKGxuGdE0
	tjWsJkXM8wys4RpVIn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32Nk-008Nhs-S7; Mon, 12 Jul 2021 20:18:24 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32ND-008NXP-RV
 for linux-amlogic@lists.infradead.org; Mon, 12 Jul 2021 20:17:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id x25so32968135lfu.13
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Jul 2021 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rf/oy5V65atDUasHDpnT+GK9n0vIPf+l+Loy9PHEV2g=;
 b=L/LG0kiF9dQI5UYt03bUxC7db1G5mmL+zYogzrm0PTQpzCqJ0uOzPzrA1yBTDlUnHz
 Jpr5PYMzj0PHfeqWpQ5bNtX9glzqZC3nHSlYtIJSZjFZ+upR2lbNc0Bj5ptCvxj2E1MR
 RqexC9iCpP/UJEGdtL3o4wmJq2nle9+4svKtHWS8yC5G73xziKtVBi4wnAHYH+12crAV
 LgQJwndM1uaheql9aWc0jYm8tHQ4seYUoPFuRzTtQhLQzIO9dG6fGQt1zic/chZUihRj
 cCOts+iZafOz/VsQM9OyodwsaqxNwtbnDrY3qb6zEkh1Vq2jZaLndzM7vOZjy+szgjkQ
 /mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rf/oy5V65atDUasHDpnT+GK9n0vIPf+l+Loy9PHEV2g=;
 b=Wg8ViDpgPEYqnaDG1V0yP9yVJTVl2hfwV+B2uFEBvu8gFGlRMv5m0ET+0HVSSv4ufg
 2g8T7UoWoaq1D9Da2PCxrMzO4V4hMbpTgjrejXDanDCcxjNgQXIBQHAqYrTvLXXi1gqf
 S2TKwRI19lPdUFdQQsVhe+lHK0iSPwnxl9KK6iwgjoZBcqNR3o2qI3dK+qNmPbLoDI2c
 nq9P65xzdkWqxuht9jnV6zFlI5AGxJ4o+q1MgKqaC0YMGRpz+cJdUWoc9J5RY3kW8yoT
 +0NEUMlqxuIr6Ax/1+yGoRzDv9KqFxUKlxd1Rr+APoO8+XKhxJdprsVML52WAZ68Zpl/
 HoUg==
X-Gm-Message-State: AOAM530HtzyEAS6gRYGc8154EBcoY/bcxhyr6koTUehgOBkFsfwscvju
 K+e58P03vyht4zwwJr1Xbr+l7g==
X-Google-Smtp-Source: ABdhPJxCVPVINOvfBCrr5N+3NDAEy5lpwqjAIrHaYAzlV0oZuwGc8C5fQ5lsfWwgKXJsxv9hLu7lJg==
X-Received: by 2002:ac2:5e67:: with SMTP id a7mr417425lfr.450.1626121068917;
 Mon, 12 Jul 2021 13:17:48 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id p16sm631455lfr.122.2021.07.12.13.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:17:48 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v4 0/2] media: rc: add support for Amlogic Meson IR blaster
Date: Mon, 12 Jul 2021 23:17:30 +0300
Message-Id: <20210712201732.31808-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_131751_946795_5DFCFD5B 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

this is a driver for the IR transmitter (also called IR blaster)
available in some Amlogic Meson SoCs.

Viktor Prutyanov (2):
  media: rc: meson-ir-tx: document device tree bindings
  media: rc: introduce Meson IR TX driver

 .../bindings/media/amlogic,meson-ir-tx.yaml   |  65 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-ir-tx.c                | 404 ++++++++++++++++++
 4 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
