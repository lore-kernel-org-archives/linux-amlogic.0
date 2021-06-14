Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F49C48BE8
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 08:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF0061289
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 08:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF0061289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qA9mI6Zk4dYpWArR5k0Y3oQMRv+eCbl6JCGy/TLbd5c=; b=q2T+XVIjX5zaOK
	0udG1Gpnq2IreWUCp50vKzdBbmdlkIaR0kMkr3RnLH51yLXIRrvVIYBu0/JwpkBDbTAXw3E/bbPPp
	tFuyln4ykHjESBcNV/5lGEmJm4AQtvb9SjywoVQbVz2OlGnCDTZ6tNpj8Ew7Vr3p54ZCvgB+g4lBT
	rXZVhpRDR9dvaZOB5Dw4pcMwlWAYJu7r1m3Nicjw5FAk+8beMZ9Z737TxPBg9mzIoCqLsum5iE5tQ
	zj3ItTE9tbalg1iwdj68cIpbJql20avUycsnx7ZSTKyI1FzFa83WpmH+2+DmcVXF51YzvD1U2IWps
	OGKMVpxCbkSkjtV17D7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lshYT-00D2L3-GP; Mon, 14 Jun 2021 08:02:45 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lshYD-00D2GE-OE
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 08:02:31 +0000
Received: by mail-wr1-f51.google.com with SMTP id a20so13483593wrc.0
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 01:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3lbqWZTEszNETQXU+jhXVvtElOXfGcCoN5XqLAJJws=;
 b=YgR1ctmLRMdXS9l9GQnO/y/kmcq4SDIqC2bGXJwz9Ol620nwEb9vnEUDQxPZr2SRxW
 QK8Wo+dXhWQBINn+pnWrUeg/HOVzn8BavWIGdZ8MP4Ue6ka/zFuPICSDl91OF08k/gRX
 NjsIgk+ljTV0Sz1XbvDUVW9dZGS3tjbM67vcFUGCur+/s9P2LBr4BZR4XzQNzwnpPiTy
 /F4xi3aZjTjIpAwKXJRY4Ylp3CajAsHonmqcsCENUeiXZui/M70D4nS1mwzCI8Hkcdp5
 XOW9tpNG84HzdaNKE5a0pPIAOt2djX6tzJJL1QH9lGtAUa9THR8sczRHNDinfWY/Vr4A
 KRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3lbqWZTEszNETQXU+jhXVvtElOXfGcCoN5XqLAJJws=;
 b=GfqnHsiV9WdFwJqvs8J4CWc4eAa2DTAZY0VcC7qqWSNLwadVTrmig4bdEt2bzXp0SI
 deyM3pRu4tag4RTucvilPBN84/2PYdQmmkzf0FdT7tQk/E1d5uJTUQtvl2G/qql7wbua
 4grUdKsZVoVeU9VHX9PyDSu2awRXQpmITcYNj8LFKXrQdFgl7F/SQfy/3SDFPADhBmou
 M1KHAr9BXBymj2xSU12PqVO3h08UP7uxHE6DFEPKd2TRl6dHLi81jXBaxoiTl9p+n20P
 nk1ZSzVvGi4KQC3NmuOBv8g0LCpZqJguDCltrTjEimXk6ns2sWK00lxVq8xkfQtlFK70
 EYkg==
X-Gm-Message-State: AOAM530bVGEfDFDjIHYJcFM1kiClA6Pb7bny9PBDjeyTIA3rVp6Olwyb
 rv5sfkmi7cIaSPH7n8fGhna1PA==
X-Google-Smtp-Source: ABdhPJy3GrxHrAITne9gl53/cvM/13scb2PdbnRj0oH6g7HVlaW5iLq1RYGExS4z050i+vVDy5Mi7w==
X-Received: by 2002:adf:f907:: with SMTP id b7mr17086296wrr.357.1623657686850; 
 Mon, 14 Jun 2021 01:01:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:71f0:4862:1742:37fd])
 by smtp.gmail.com with ESMTPSA id
 o5sm15825751wrw.65.2021.06.14.01.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:01:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Subject: Re: [PATCH] ARM: dts: meson: Set the fifo-size of uart_A to 128 bytes
Date: Mon, 14 Jun 2021 10:01:24 +0200
Message-Id: <162365768004.30373.6312960282628075528.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604170844.2201229-1-martin.blumenstingl@googlemail.com>
References: <20210604170844.2201229-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_010229_834213_80D0E8FE 
X-CRM114-Status: UNSURE (   9.91  )
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

On Fri, 4 Jun 2021 19:08:44 +0200, Martin Blumenstingl wrote:
> The first UART controller in the "Everything-Else" power domain is
> called uart_A. Unlike all other UARTs (which use a 64 byte fifo-size in
> hardware) uart_A has a fifo-size of 128 bytes. This UART controller is
> typically used for Bluetooth HCI.
> The fifo-size of 128 bytes is valid from all SoCs from Meson6 (or
> possibly even earlier) all the way up to the latest 64-bit ones.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.14/dt)

[1/1] ARM: dts: meson: Set the fifo-size of uart_A to 128 bytes
      https://git.kernel.org/amlogic/c/7db3cde5123e2acdd65ff7458628a9835c804b27

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
