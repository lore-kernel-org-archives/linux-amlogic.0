Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C62C11F67
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C68A61410
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C68A61410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZMF7iIU6C9vdsFmYTVXNeRn43mK3byyooRcxcPw4ZHo=; b=kleimj+8QLPYrN
	XHYt68QXfMukYiPdSj2VhEK8yt5mW5ya6qgWVaoGKFdzwiz/SnoXsiDbtA8wv8FwWiq0aDnZj5ZCu
	554coYI3pVqYS9HrG16jAF9K6AsFPv5a1m7VhNt3oXSOpW+ELR16jKp6NcP5YkCiR37JyEUyc1SYG
	aDGAG48upuN35I1wBj8I490wuYj6EFmUzRgbU6NSxNbul8qrDe7y2boKr1BXstXGRzOEwiTvdWMut
	iiETGMufJ8cS1a5+26KdDUZ4WHs4Al4uLDuYQ3X8Fe0j0LeYoZ1taL6EOm4U2uRn2Ug7xzjDVLpXh
	CYibm0VW8ADhVUV2Pl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz4bR-001GnR-0E; Thu, 01 Jul 2021 21:52:09 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz4bD-001GjA-HY
 for linux-amlogic@lists.infradead.org; Thu, 01 Jul 2021 21:51:57 +0000
Received: by mail-lj1-x22a.google.com with SMTP id d25so10500211lji.7
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Jul 2021 14:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a3IX/2KuwHeMRcmciK0Z/zcjVGMIarf1/EXwo1sUcpU=;
 b=0/G8HqauhtiyYpibqNVecNYum5ecxe3IiMbygluzJPZOdzvWwW9vBN56yOOSDNv0eN
 7ENGMx4jiGbO4xReSZS8rQFd62bvkl9RS+/aAN8jqFo0vy/fi35Ry6WbULuIxxLHAY+1
 aLP1u8XhKEEcxhEN8mtj/XZZ25FVHLP/9IkcRf85IQY3R/3Zj4i/utnEz0/eMFfYMY8k
 IF8DEdriWA8EWU8TuOCSPwCZ4jRsNU/JqjmiUbhrtu29fcj+06N1DrVb1kV9Cv5jn4aO
 omaKfF4+mrdwJpaLeWs4OVyJ3Hl+rcMW/kO8wbBTVUzSLAcVW2A8d3yVId4ZN5uSOCN2
 waSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a3IX/2KuwHeMRcmciK0Z/zcjVGMIarf1/EXwo1sUcpU=;
 b=aCb9pUbSoQjWQcw9QoRFc+xVaBBACiz8qpOlnitvCSabpfGvrepjWwN+aL+dysT6dS
 G3wx5UxWFTsxBEBiRbxdJdBcDA2jcJXKLLW7c3N5UYgHsSahTQtR1808CKAzXErxpVV4
 8tKxSOcbSwPBpNJIC7cJBbkw4+3HUaQzExLl/ZBbg24gs9Hz83jUk1txZk6zOZfh2pBw
 A4qnfIWYXk29o8yxcbGOIrqwvMtmPGMjKt9yXMK84eYpWYEgDQqAP+1h82VWvXMppLjv
 pHFqy8XTr7h9f2SYpRTjVD8vPLXwxVw2NuePzQpGlpnUqJk/UaucqKix50edeAW18pyt
 u2eg==
X-Gm-Message-State: AOAM530fwdhyEySni+Qp5YIq7b3rexT2VHRIKPVMZB6eu1XITWFwl/03
 l0l3FsxDUtLNMC68HcKzazSUmA==
X-Google-Smtp-Source: ABdhPJwFe3YY1ET2LKfFqWQ/0/xLKXQAv2E0/Kf2SXy1asZumMFcF3weWH7KiGXFHN5kVlXaSX2ieg==
X-Received: by 2002:a2e:bc26:: with SMTP id b38mr1230428ljf.345.1625176312222; 
 Thu, 01 Jul 2021 14:51:52 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:4d3d:fdb7:f150:ee77:eba5])
 by smtp.gmail.com with ESMTPSA id q17sm138623ljp.3.2021.07.01.14.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 14:51:51 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH 0/2] media: rc: add support for Amlogic Meson IR blaster
Date: Fri,  2 Jul 2021 00:51:30 +0300
Message-Id: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_145155_625262_74E0FD81 
X-CRM114-Status: UNSURE (   9.29  )
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

 .../media/amlogic,meson-irblaster.yaml        |  63 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-irblaster.c            | 433 ++++++++++++++++++
 4 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
 create mode 100644 drivers/media/rc/meson-irblaster.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
