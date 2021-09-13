Return-Path: <SRS0=/Mmf=OD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D1C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:44:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652AC60F4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 652AC60F4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ua3qAiAmZxnWzY8fMNpj4CEy5tPMYBxtVvliYU49ZKg=; b=pL3z53U+puXEgn
	umHvhlOPGbCcpPH6d7bTr3n78eEEeBeDbfF4PowYldCt8gOwAYXjsEUCGwgq3qluSCXXUc8EOCRop
	twxdB1DxpHZt/MatnvqIsVLiCCfQqwDgIj5knMajgBNP5KfFHz0KGbW3YeQ2ZzeLusr4rSfukp0Hj
	XPNgYyYps007sUo6ZdBto1foZ99j7cglg5oRjZpuTPKbASdwl6fnIh+Wr42L7ChE9B0DNtbenr1Hx
	EcfnNr3SagJoXaLzzGroBQwkgrC8WX+W9uO8iUmvK7fjrcArDhPnaeatkr5aU3CBvRkx7dRFVYxYI
	bQraeIgjIcIFIaCO8kug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPgdq-000Xzy-4V; Mon, 13 Sep 2021 07:44:38 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPgdc-000XyM-KE
 for linux-amlogic@lists.infradead.org; Mon, 13 Sep 2021 07:44:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id v5so12936906edc.2
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Sep 2021 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsUPD2aQ6KskTShRBgvWOAzAZZRbHuwoC4E0wgxFpbM=;
 b=ShKeBeYpI29nTz2skjKW6jlYy5FmIP2axzdMqB880N2t9zwls5YhdmZPADfKoAm2rk
 2c9BKAyPDKDH146xpYy/D9h8hdgVgLReOtfWrs8lZTSSzef7Vb3UKawEeagOn5g8NGqE
 6KYg6bAxCmBKVvs/KovQCLx8Ao92LokLzOHpoZWhQDBAkShXZLKgvVmEYil8HKCo4GnF
 QJKY2dsd8NdCB30Mh3HxNMM08XBrcNl5Kcri2sgi74K+mpLGj8JBbVw/G48RdK3BB+8X
 rWUtSvPZUlqO5HpWN40EUC9+/1h3hvkfMQHha0ioD6w2SHK3rgglvEO7BBZib6mtmV1A
 IJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsUPD2aQ6KskTShRBgvWOAzAZZRbHuwoC4E0wgxFpbM=;
 b=F2PElwsIo/Mdl6rXfrwuMlnr0MQrPt6Rou6ZHUAavJ16YFVvjy/etW3GPV7uaFmBrt
 HvKPTrG/eQy6j/j7BauRRHY90xGKIBKOAlvMpJQSVkkdUIbOvplprFTMbZ++UC3H0sFS
 36KratsgI4qAGLArsTlCB2S3y4nv1mAAD9lh+frwzof4d12JOldJ4drZm67B+lPthHQG
 S2VzfaRG4SaKpQzb+pO2wQ7q7CsSGynyIz0jgWHZDQ39X/dUOMN+7EhGMQEYSStiMtb+
 vfv9GxbdAU8D0PDwO84ZcfDOAqsuom9rIDORfbHvvfVQUA1a7ixLGFUoMdCcOH/Ej9ob
 UR2w==
X-Gm-Message-State: AOAM533PDfEmUkA08Ya1vTSF+J5VkBWPTmlMzva2sI5mPgD9s9uZc9Pz
 tgnS2NvYuIUptsGgqdhxOz8EeA==
X-Google-Smtp-Source: ABdhPJyrvCAQ37PtfCLNc+t7oamLP6EmStT6aXFN3UhAOhGxL8/D8dFcVJKShybnHLXUKcDeID+mXQ==
X-Received: by 2002:aa7:df8d:: with SMTP id b13mr11793713edy.393.1631519060310; 
 Mon, 13 Sep 2021 00:44:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:9ebe:26f1:5acc:c894])
 by smtp.gmail.com with ESMTPSA id y13sm1543856ejl.125.2021.09.13.00.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 00:44:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: amlogic: canvas: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Mon, 13 Sep 2021 09:44:20 +0200
Message-Id: <163151904951.817859.10640218800664816407.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908071544.603-1-caihuoqing@baidu.com>
References: <20210908071544.603-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_004424_747031_99B6DBE0 
X-CRM114-Status: UNSURE (   7.21  )
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

On Wed, 8 Sep 2021 15:15:42 +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/drivers)

[1/2] soc: amlogic: canvas: Make use of the helper function devm_platform_ioremap_resource()
      https://git.kernel.org/amlogic/c/97a4a24087ce354ce0318449e6bd9e660f5c573b
[2/2] soc: amlogic: meson-clk-measure: Make use of the helper function devm_platform_ioremap_resource()
      https://git.kernel.org/amlogic/c/d54dbe9f0ec05935e10d6a38d81e54e2ec8b8a68

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
