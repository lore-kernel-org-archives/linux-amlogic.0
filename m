Return-Path: <SRS0=+Him=ML=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B91C07E95
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 17:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C3960FE9
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 17:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C3960FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1mJpEui9g2Ud/BxHc3efvjOBKtwKea1LjdR6cprrzU8=; b=B2uiXk3cpcCX/F
	4BQKrkIrVPmYKmEbhcpHkSL5texc049zJXBQqZURY7K9Uy/LGmH/cIef5459EnCrYBO2luc3ITDnH
	/EW1BitjMtSJ8smGSaHHdmTc5uoqcW2zACIREgQd3p3YEY9DJ8GUnrCJ25xDoLucHJorAUp9yrh92
	VbYhb18QuBnnkqLHF7+LJsW2o0BV+SFBP6BaS65e6IFJExMQndGiBI/W99alct1vWfMCS+6biZ8dX
	eSxnJfznA0kHNU4uvIHQ7vTmRQ6NU45r+iBP20p6t5mbb7kde2c0bXi0A9aFwx0RMwtx2AqnkLrJy
	4rWyFKkF6rApDAcbkSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Whn-00AhHu-Fu; Mon, 19 Jul 2021 17:05:23 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Whj-00AhFb-Tp
 for linux-amlogic@lists.infradead.org; Mon, 19 Jul 2021 17:05:21 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g22so19484927lfu.0
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Jul 2021 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVWppwQDa959r4EyoeDttMlnVrR+sUQQyz24Ur+wrSA=;
 b=tm7g4wfvS9xa6UVTvbYV9KLPDGRa6aUi/k23PE4woz3Dhf5Ac4NXE1s2FpUo8mQ2Sz
 m9C/Va+bszZ4/doxhEmtK1yRKir6+fFcQdPL3qZ6ySAMlx4YcAg9s3byPzbjiCte5HmY
 7bgwDxy7KY594A7oU7Ap4kPCpRf0EGl2yvvD0zzGYGle/uqJzNmFvrY5niwCo3EO4bDL
 2fww+l+2QfjlRXjghHjJ/0tRbHhX9BNGsRs6eBRegUGL8NDoLb6ASK8k+tByAOBkFvHY
 9t57Mm9C58xF2cMoRkNIOCePU3TLMQMsMwvHU6712pM08NP4MG5gJTE4d2M+UKsxVwmP
 vHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVWppwQDa959r4EyoeDttMlnVrR+sUQQyz24Ur+wrSA=;
 b=npttDYRw8Rkt1j5C0srlaMVMek87hjeMs4ehKQehW1zLbFVlnm8naB20eI/sGY7hwc
 eZQC5P11dHMsOh7SHvF6BYXz26LCwPC06GY/3I+at+4mAoTZnWZx1hp6t/KEzPZA6U2a
 ZTb43/3sHZLIYymUltYlmkPYHwdExN++QLjlwdFg832941mrb5drDGSoDW6/QgwLJdM0
 A84B7oojjucpB9iaciNqW5ZS7giMzIKrWyk2HRtxwVdpNFXU6E7yBhjv4iJNIuRW8Yg2
 d3N1yf878kVkqK+2bS9NhvjN0lFkqysOndarMN/E8kQrDNXu2ugcEtgsFl7SGmdYs1Ks
 bN7A==
X-Gm-Message-State: AOAM531fQuQPeemH4LM1PETBqyU4fWFFC9kEilr+MKLFmrwxZxhMPxsB
 rvDgeIayLbWvdQUymTDyQHqfzQ==
X-Google-Smtp-Source: ABdhPJwwimdpA4JO2EjsZrMxSSoC8I6iX64G5jogsp9iaDmetD1RQFlSh6eqjDiVC6+BuFY2Y0tsUg==
X-Received: by 2002:ac2:5934:: with SMTP id v20mr19008674lfi.353.1626714315893; 
 Mon, 19 Jul 2021 10:05:15 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
 by smtp.gmail.com with ESMTPSA id z8sm1330749lfh.119.2021.07.19.10.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 10:05:15 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v7 0/2] media: rc: add support for Amlogic Meson IR blaster
Date: Mon, 19 Jul 2021 20:05:04 +0300
Message-Id: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_100520_063060_13D7125B 
X-CRM114-Status: UNSURE (   9.63  )
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

 .../bindings/media/amlogic,meson-ir-tx.yaml   |  60 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-ir-tx.c                | 406 ++++++++++++++++++
 4 files changed, 477 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
