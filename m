Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690DBC4360F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:26:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 352C52184C
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zyrtdomh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mrVsMqn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 352C52184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VD8UICGHsBwgwYQyy7Wth1i5JeytKMH2EQQOPFV7rCE=; b=ZyrtdomhMzFAf/
	Ildqs5PVeyfFwjDXczQH3CeeWwm6+KuoujlBdt/cpiKEZeYIyQTD2KeHCx+HEan0SBh49pm5GuYjl
	eVs0Vgt999hNxqtHeZPs96aYili50Im32t4ouM+3A+yDJxREmj36g5ZSlZ23DhLRaOCqPMoyVJVZk
	uPobhtyB1gLQTFpOEdsYZ8p8aX6GlWhgwEjaK7PzfJ1JFkOpbjkjBSWvfn8ttNaGP0BiuB5VnePRN
	hDAf3BXosvAktaZzXy6evHcSRhaKxqVNYlawbyjpekP5oQsIkP44elWrkqJVrz6lZ/tdcgnA6l0DN
	kegbF33WpNGTbWDz2VtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9z0m-0007yG-8o; Fri, 29 Mar 2019 21:26:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9z0i-0007xT-DQ
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 21:26:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id m10so1589772plt.10
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Q70+0QrvpO89GyQOBPlEr/UYN4vzBHidrxXCf8euDdw=;
 b=mrVsMqn9gIl+5Ig21TR1gzyzs7t2B9TngH8SyuxM8S0y/iDUvvpIm2TFa1CCEQQMVF
 tSX9rMWxcIwVFhxfpmkdjYbKuVYh1vvjfUaCgmDVSN4l0mAqlX2jGxCmrBkRPL36MllA
 iIdUCzuEW1l4/DrutF2Bb/+KNsu0CRe1+VdX0PHOS2hzvMTtDzea0UKiaMejdAQiQCcO
 MKm0lEKJyn/zzZSC6utE6Qkb1+g1fONx5nOrJvCs0rf3VpHQMjVYbgswlHcv+VTXel3C
 2MXZFc5ycYByDzRynmvOved+9ghSjhOAdAF+rvrw4zWxZOuuF/l/8ltnq//LVQzb3JGQ
 EYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=Q70+0QrvpO89GyQOBPlEr/UYN4vzBHidrxXCf8euDdw=;
 b=RI9XqVYTH4S07B3Z+pc6N7XSCkP9trlpRwxIrdGramkU/JHWlpKDeD/P6UPZZqWBi9
 rxzYXg6SUgYg3IVTq0/LI8qQxq3Hk+qv4HHrNnf4lOpMKygGHAnUZzgH+aoNM4C8OXZ8
 AJF5X0dKAhSCCsTeKk1zfipBmusZUMxdZ2YA3Q67bAE3h9eOHFCAbMkdu5oOutth4PqK
 i8AbcuxjLUPvWqzoP5cOMcaiJYOlxusKXAXcaU4l84q34UEWvBonJm67SUJtRBRJZSAC
 AhFrsSnK2QAH1YjIu3Ki3oPvNY2ODqyiBv2+wZXvX40rIl2CFChoLRXlJ7vTyLK6oViy
 Tn4g==
X-Gm-Message-State: APjAAAVLvPWeawEFQGIUk5S1YMm5f3m/tpKZcJnkqTmGDwf/HcwhTGTM
 8CJrNh/XZsuRTLt4Esohmb7jbg==
X-Google-Smtp-Source: APXvYqwxzcLLj7QmorwNq5CNo44iZ/+waU42q1wTgzNvtNG7uTG98ostKmU0CCiMv/HCToGacq6z6Q==
X-Received: by 2002:a17:902:bd90:: with SMTP id
 q16mr44852111pls.162.1553894759295; 
 Fri, 29 Mar 2019 14:25:59 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id t10sm4049299pgo.27.2019.03.29.14.25.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 14:25:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] soc: Amlogic updates for v5.2
Date: Fri, 29 Mar 2019 14:25:58 -0700
Message-ID: <7ha7hdwexl.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_142600_458454_8AE60F07 
X-CRM114-Status: UNSURE (   8.16  )
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

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to fdda0a6adc33536ad468f07db27325423703c5bc:

  meson-gx-socinfo: add missing of_node_put after of_device_is_available (2019-03-18 09:07:32 -0700)

----------------------------------------------------------------
soc: Amlogic updates for v5.2
- socinfo: support new SoCs / packages

----------------------------------------------------------------
Julia Lawall (1):
      meson-gx-socinfo: add missing of_node_put after of_device_is_available

Neil Armstrong (2):
      soc: amlogic: gx-socinfo: Add mask for each SoC packages
      soc: amlogic: gx-socinfo: Add new SoC IDs and Packages IDs

 drivers/soc/amlogic/meson-gx-socinfo.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
