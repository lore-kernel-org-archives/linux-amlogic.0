Return-Path: <SRS0=nqA+=MI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DEDC07E95
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 14:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9089B613FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9089B613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NNLcBI03mUv3uixMCUrvqd8+vmgbGPTVKy74NWOFQ1c=; b=jt2Jas3XwzceVS
	8X0wr3RvFw9wHYbVEMaqHxpAC184xHQXPaWerwJBrrlWXr3UuzrTdIxcwhL0YzMnNPypD8R8biP4w
	ZQ0DPSN1H6fsvmsmX+/Fvc2yJAU/0xM98D9O+CdOlHlr8immUwPFNWXCHpTmHL6/WQRkJg+p7DW6N
	ynVvNK4WHrqGPaSuWtcXCxraWeEwBM7nmCNrH1Eh5Sof4YYAOzYxSHiR8FS288t45L/5u5i0UfOjZ
	iZJXazaYxRcjYojMWrqEN+hTpo/vrO+3vYq8pTtqLDv6mPvjVvR/6NndToslFEE77yll1NNtXX0oI
	9uLLjGPkIhO/gtS3ED4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4P5n-004cbg-Qf; Fri, 16 Jul 2021 14:45:31 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4P5Z-004cX2-6N
 for linux-amlogic@lists.infradead.org; Fri, 16 Jul 2021 14:45:18 +0000
Received: by mail-lj1-x236.google.com with SMTP id q4so14327535ljp.13
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Jul 2021 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VewEt9Sal2E694kwqU/1zQiu0e9L1vNSWqLI289mobQ=;
 b=GkNk0fsCcdTMKo5D6LBy/xNq2Wnz9hXULvjrUWYo2Dw4dB7jE1SqZzZEGKsaAfLpaO
 5WiLZmeFr1kLQ/lhl+GwIJZ7UG8sUT1Py+w6Bxf8mM1CfKNGYXcCX9iPqyHpdpk57uf/
 YirL+S4f9IR6w6c+Dr2DSVrDz7Kz6ywObNMiVN13FXO/iZoXsa8Ay8pnQKigio+HEUKq
 5hYq4kr8jR/k7jrdGfWBaHjK2XdazjwwhHK5rRjG4Umz5iULOuKIkeB6wkD9+zj2+KC9
 dMmU9CaciDfGxQcVXjjtj05DmIq4QJMANVKhpjKbQZQtIyTLoB6QE6XYM1IdfieBcSVb
 qmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VewEt9Sal2E694kwqU/1zQiu0e9L1vNSWqLI289mobQ=;
 b=dpyqmA+iqkhxqbM2SSvLeCl+sRmOg2rp15695rAUGDhH68Dk73FHYX/bLcDTyYgaEj
 UdYqXHxOqM/UVVxFc1zAa5ia6LkbwK1BG/naLDsHL+Yjkjl7fuxudRuOjWcIMtRcDDE4
 7aVh6mQzyYnswQi/M0gPKqiVTptseZmQsKauC35RFysHi+DUNTkBXcn0h2jbnam9bUXG
 r42UTLmD0mn1D2XkM7/tdE/WqFq6fOzBzUbMpLWpnZo46fA+hXavcylDWTI/Ft0CbfcN
 rlljp7UUmftntXXX7pvbaJfKFj5VlWYwlQwRv7H7mrWItNn09mTLGMLSLtCmXy8E749K
 2bSA==
X-Gm-Message-State: AOAM53259ShJj1IR8/U/vVulXqmJI3/3y5uoZd2As1KNgeWKELdhsKne
 sDS0+ztmbibUIroCPseA3NyQeA==
X-Google-Smtp-Source: ABdhPJwy/jnKpQb7gQ4wl9610QlKRrHy9FWD9SWd1F4D+5MmjA+SijzOnrs5gXqreZh/gl6SLs9Mmg==
X-Received: by 2002:a2e:8887:: with SMTP id k7mr9194849lji.226.1626446715159; 
 Fri, 16 Jul 2021 07:45:15 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id b6sm992327ljf.59.2021.07.16.07.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:45:14 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v6 0/2] media: rc: add support for Amlogic Meson IR blaster
Date: Fri, 16 Jul 2021 17:45:06 +0300
Message-Id: <20210716144508.6058-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_074517_343546_9B2561FB 
X-CRM114-Status: UNSURE (   8.84  )
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
 drivers/media/rc/meson-ir-tx.c                | 415 ++++++++++++++++++
 4 files changed, 493 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
