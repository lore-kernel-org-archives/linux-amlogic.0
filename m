Return-Path: <SRS0=kycw=MB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE44C07E99
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jul 2021 16:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B53D613B2
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jul 2021 16:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B53D613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MBVGfHq3vkkBBNROmxLyrO8YPFPr8C2zqhArp5KQUqI=; b=cGzBJZIXaKTJWF
	lEenqkaiN7UHAW/NRkQxCHEv6xJRD7h1rIHqLb9R14HjYU5Q4dJOyqeS4XAbdQodcnsHA+AViwzdm
	FZbfpEKvET7kANX5bw3i1ceG1CiddF4BuCMbDdZQJ0mcyic11Dgj8M9hgim+M6KoJl0prDP4jg424
	urMZhsyy1deq3SD9NwvwEJPWY6y17WQXoSjGdCHqEvotO4lPc8gzaAO3lW6hpBOQyz9OFC7SQR7fW
	yBzrwKEYnyVf5Stko4hjjCrqDntnBWDIyShQMomwSDLWf/TWzcMRXcyB7rNdq0jJn3Q9vQNTlXqRK
	sh+G9IJX6RiEQG++ziAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1tpN-002AK4-7s; Fri, 09 Jul 2021 16:58:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1tpK-002AHY-7w
 for linux-amlogic@lists.infradead.org; Fri, 09 Jul 2021 16:58:12 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 8so12828508lfp.9
 for <linux-amlogic@lists.infradead.org>; Fri, 09 Jul 2021 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rWdI3dgudUSXDDNvYaQxqKTPG0uXr+l1miDHJi7VFA=;
 b=gb4bm6wdY+mgfF3fPkAX5c4NhVgQzXhYb2OB1RbNJheGqu/VHWI2t6cgM5/ytib2Ay
 pTwsmTGu7cuTx21bTUuR9HwoFyPJBH4hISsTN2jyscRd7rPgrr5NedmXNnFDdvGm3NGK
 z9TCV94jVdjA78qU3qAYir3LvhVHdnfE0k3YGcSH6MFNJAtnhIIEq19PYex2THB0qAy/
 S4gDifECV5kA2y/oIMe+hJjp3iB+cZGW5RU7GjWIpV+jSjxBaUh53Uv7j/woOyezG+fB
 R0v8KWic5b+jC8icrAyewD5Agh6vZgU1rYbPdutF+GZIZRQX8xWzQcP4qEvyZ3/Iu5GS
 AZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rWdI3dgudUSXDDNvYaQxqKTPG0uXr+l1miDHJi7VFA=;
 b=b8T7R/KpLKxQ0VoH7I92AcHcMngmWGaFArOGkjdWFG1N42VPqYWHUoc9rlbAcGjRQ9
 uteabIDGW26W4SaCQlH13MGZsCf+v9LPt9MHxiW9LaaCGjy1jgTSEBQ4gmS8/+MJ1Hlm
 QY5agZrl3A+8LYpAmxX1lgksVsGSI8wrv6DJN1L5vmiWTZ7UY/9iABRUkWwiNOCIoRqA
 oWIfk2N5cCe531AL6lkzbI+e0Wjw/2Z+yPgBJlpYjO92LyhgbcfJlbaKnuwmPzFul7WP
 UXu7TScaeCM/aGGIUiU4QdzH6bmUm/QZED/42BiazYKjssjvgTX5uVw+uGYCtuRoLRYn
 xv9g==
X-Gm-Message-State: AOAM530kxChIFkkKeyg9hZ0GOQmRZN9IQ+65yshcZObiLs+zQIG+eWO6
 acPVWU5iEr4nyT4gz9Hmdm1AOw==
X-Google-Smtp-Source: ABdhPJznK93YSIMj0wPtxqtU7Ow09tlCGEe/IfTHANQTYCqmvrZJe3ddKiqQW6bX08aRbfTBMAU14g==
X-Received: by 2002:a05:6512:3711:: with SMTP id
 z17mr6150488lfr.135.1625849887381; 
 Fri, 09 Jul 2021 09:58:07 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id i130sm504107lfd.304.2021.07.09.09.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:58:06 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v3 0/2] media: rc: add support for Amlogic Meson IR blaster
Date: Fri,  9 Jul 2021 19:57:51 +0300
Message-Id: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_095810_403644_F2F24370 
X-CRM114-Status: UNSURE (   9.09  )
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

 .../media/amlogic,meson-irblaster.yaml        |  65 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-irblaster.c            | 400 ++++++++++++++++++
 4 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
 create mode 100644 drivers/media/rc/meson-irblaster.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
