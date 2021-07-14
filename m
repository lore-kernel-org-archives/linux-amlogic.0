Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E40C12002
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876AC61377
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876AC61377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vGwPldU0mjWSUkgIn5BT9VTlQd3QQdSu6bdo4j9PzRE=; b=o67CFFlSgPwy/5
	D419rYgh9e8lVGtTGBPbcd3qfOqpI6khOic0yBZUkji2yYhgj6S2OKrz54i8z9IhRHgjyP7WOqWcm
	XCi3g0qhtnrUBuzA1CSOY/v5vhquqNxz1hGlgL6WsJmoGgNKbaw/FvT43T2grQ1HUyoCiPoNfY0Xm
	KqtHJXbHvvV+Ln8+9MNQDlbNbNLQVK04w+qABzsg07saIk2RrPKxh+9pW5byWL4hC/0kBO++7QhjY
	LNsvCpbD2jj8jU7x0QcK72GoRMqXp7rlSHCUSYQYx67GKMk1nDu+YAP3yW9u/IpEZ1GU9lsoEhK2d
	F6A0aAG067ScoPB5tfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ola-00GU8E-Ej; Wed, 14 Jul 2021 23:58:14 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3mPW-00FP7e-JR
 for linux-amlogic@lists.infradead.org; Wed, 14 Jul 2021 21:27:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id t17so6121477lfq.0
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Jul 2021 14:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRJ7o0mlWw/xRyIDlZj63kLihIyRP8arTxcwBPV6M+U=;
 b=j8mcdryO+1SyFilZ+FG/FAq5kAO+QkUfj8WRTqfc/eNRgoN5UR976iFyr+eVbqpXaa
 uV1ZpR8S2RqTIBTP6yh8hXowvMAnauzKxijs/jtVaHK2r4/bIP/2zCk+8g5PB6ZqtAC9
 eHxGdidSENetSYBgM4qhjAcUAa9rnbd8oPLH+N3iFCJH67fuxjvdbOmJhrIbhFIe43CW
 eupWhOvG3Ukd8QUk8LwKzdgcOoY3yOPhjvTVw9q7so9FH5+qOvn40uepilzpKZM9MBqe
 1QzWtqPbZQK29SszHunhc+I5gDxUih0HiNBU9OrOSq72dZGIsWobFV0A4OozlsNHUHZ6
 TL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRJ7o0mlWw/xRyIDlZj63kLihIyRP8arTxcwBPV6M+U=;
 b=bBIn1Mu3vVXQKtSH8xtJRl/olhOiLPmoekbXqEUVFiV5YTI/UpvYD8vyYjGX5J89k2
 X441ONNF9aw+3+zFET3CSE3913ydXtRSAmFxJuczWptzbctTTUodjnhB5Ni0CUlS9pv4
 XRD2Ylq+UK72XSk+z+QZUEd6qPxKsEJ15WO30/rcU3Hkcp3TBffOFtxa9uj+k7UFOS61
 fMY8RAIYev0Gkfc3nl0FYvD4A9N2wrbgYCkDV4VsYAS8TcfyYCmdWcY3Khd/jM/7EZfj
 bBT7x5dY7XxNvj8Q8jQUl08QWVLLYFnoQBgmD1iHcw6Wx9+9O8PC249SNtqRr/WZtaaP
 4vgw==
X-Gm-Message-State: AOAM5336iCl51IfnXfuWjx8Ir05El9w4GWJdfrmIggz6k8OUoUUQa6Gn
 w0rs8wXikCPY8xpluB24Zbq5BnQ3/a8n8DmG
X-Google-Smtp-Source: ABdhPJwTodWJWpvnqxhn7bn8LTbuklkoZr0z0YR/nuJWVJnzpCfHQCP/2rK6t3ge41My9ZZ2Uhvseg==
X-Received: by 2002:a05:6512:33c4:: with SMTP id
 d4mr179570lfg.536.1626298036021; 
 Wed, 14 Jul 2021 14:27:16 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id f1sm252156lfs.211.2021.07.14.14.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:27:15 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v5 0/2] media: rc: add support for Amlogic Meson IR blaster
Date: Thu, 15 Jul 2021 00:27:04 +0300
Message-Id: <20210714212706.24945-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_142718_730230_F91B1BD3 
X-CRM114-Status: UNSURE (   8.96  )
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

 .../bindings/media/amlogic,meson-ir-tx.yaml   |  67 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-ir-tx.c                | 410 ++++++++++++++++++
 4 files changed, 488 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
