Return-Path: <SRS0=LiOq=L7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A89C07E9B
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 14:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4FD61CC3
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 14:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4FD61CC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hgRvpL73F5j1HcHyd8L459ALE7S6zn2atntdpQaUWvs=; b=iFqm+/drkFh4O0
	AMgfJUo7nYDSDqltg8Nk1uaeJODusi1bk4Mb3+3YK/ZOBqczgRBDL95aWV5eDQl+L58dQ8ipRuKdZ
	2UGUyMr4QU98U4eE4xr4xyVC3wZL93kJEMrMyoYnit+zyz1ONVN/UoruTfiK1v/CsHZltGdWD2dbr
	K6nfdsWdawPXCcxPXGsyeJp8FXlHK0Hla9gGJS2oy4EjWcdOioEXziMIeh73JXE/Q+TZes1rXyOwv
	BYltvRlvc/Rsn7TCLFfM9F51Cs2p2KwOSlZ+0FGJa/US2yAROVwLPdZqS9vqBZVWYo9rB7wmAhinS
	/ROt1X6Ql15sZWQ0eUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m18JL-00F2bJ-0s; Wed, 07 Jul 2021 14:13:59 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m18J6-00F2Uq-C9
 for linux-amlogic@lists.infradead.org; Wed, 07 Jul 2021 14:13:45 +0000
Received: by mail-lj1-x231.google.com with SMTP id p24so2905692ljj.1
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Jul 2021 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g5y2U6uok/0so0eFkpqI39QSbZF7lC9EfSeNA/R2eiU=;
 b=b69y5epbfVrMskok7SBd1fb6b+hS2UNHIjBQpCvisPd9gFak1ZIcM1t+CCpoHXjx48
 AYqnzcVvvaYeOw5tbYaLmdMEmNJ9epDabUQTTJxMY6CkFbF4Af3SXV3nQ3XQ3QuPuOLx
 wjW0pncMm8r57xkk0W14y2f/V4kfTptIqomWgvad66QefRyb5ZFIjfyCcgxnaP4tX4Jn
 5oLRPogaJswJY0tBQ8mLfaxN4Tw4R00hZibCFs5IAd/Z4NrRVsc8I5Z5lxpYWMP+duiJ
 qbDG0vkhPcmo8sl3NI2eEZx9L4H7bxYsVcCg6dLHzkGliujExF0U2bdlgRjhx/EKi+wc
 Nc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g5y2U6uok/0so0eFkpqI39QSbZF7lC9EfSeNA/R2eiU=;
 b=YTsro+CQcwolK7W9uJfiV0SHgpfebIu5JUBN4y8E1g2nLPf6v+ZZa1ahRzeM6qXhm2
 FXLaD3kadwOR8Pt1gC4/H7k6zMl12WLTvz5GKciLMMHn4+0cvVFUgRKzWNt1ldigAsf5
 rAdykDWGkuKDZY5aMEsXUEO28WsNWQ4Iw1De12qBE0hSSHv30jvalDNsqMgaYJimzwkY
 yQQCNJgUNqSbEjMKaA+P3Tz9hkpcMDP4HxOhNAUebJt5D4vP6i3DN9dIDe09/QpiX9Vf
 5cZS99k3khGF9mbK+lQhDf8xAtG8zveJAEAlBlaV5YuT1HHHAbLhB8rBEycEw/+cBipE
 SiHQ==
X-Gm-Message-State: AOAM533z0X4/zLH7Sl/3ybPj4Iv9K6M2Do3ViYJAW4/C1F4AzmCJELDg
 Tg3LigxVsELlZfk+9RFdR3MPQg==
X-Google-Smtp-Source: ABdhPJwFZTZe2iloQ3VAroTCsguHeU1FjVUp8cYQVAbXI7WPISb1E0nxwT/5jQC8Z9Ebykwsatgwgw==
X-Received: by 2002:a2e:6c10:: with SMTP id h16mr19473010ljc.234.1625667218555; 
 Wed, 07 Jul 2021 07:13:38 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id a26sm205077ljq.120.2021.07.07.07.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 07:13:37 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v2 0/2] media: rc: add support for Amlogic Meson IR blaster
Date: Wed,  7 Jul 2021 17:13:21 +0300
Message-Id: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_071344_439905_E13A8B66 
X-CRM114-Status: UNSURE (   9.80  )
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
  media: rc: meson-irblaster: document device tree bindings
  media: rc: introduce Meson IR blaster driver

 .../media/amlogic,meson-irblaster.yaml        |  62 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-irblaster.c            | 433 ++++++++++++++++++
 4 files changed, 506 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
 create mode 100644 drivers/media/rc/meson-irblaster.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
