Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32028C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 14:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028B72054F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 14:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tIYAon1X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qeP+Z6/K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028B72054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+0KG+U8L1vHPM77KdGIshhBHhahVa16pdTnyEIwdug=; b=tIYAon1XXuS/qU
	l+a9L3V4tvwNJnkF6SH7jfO5FSPL9PrKT1ds26mfpoliX1DNgJzhILP/K1iWfyHbs6ptC1ioDARyg
	dd2Co0YNkc26SlfxeCrj7Hi9L5Gm+k13QpS8bXHgeKwHxpg2/YBw6oY133U5X5BaZcojt5AdvstG3
	NEqok83AhD5VDgoHz0mjTi+UZu5mPC6gWqF9w+BVuxZajKisNu1d+KvR/I00fPasmUC9wOE0ecJ4a
	fKV5UcbYfu4PtsLWrXC9Zbn9gL+4UTSsatSFxNkPDGXQbJXHFCb57mp9oebvuCTOot6FPxiZl5exs
	fphgcJltOsxTYCxP+CGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkVHJ-00048o-Gx; Fri, 18 Jan 2019 14:37:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkVHF-000489-Oh
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 14:37:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id q18so15305355wrx.9
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=XSRU4iN/0U1/JxElvCJ8QeXHgM1DIlCtTrCTfqI/Kh8=;
 b=qeP+Z6/KmTv7hi7/4RKRdD4Zwq08XTmTiioYroDGaCRBvzgLeB1/FB9H4r5z3/m9xr
 lO5Zd0rBj8GmxldFXxG1kqEGL5sImCdRA3kRUVQTdJ1t9erwOxXaLaoZr/bp882X2LZA
 GYk14PyJHNHgxv53X9kzSG2QDtj80kVnaf78B+fhN326wTZMJc01RCc72Z2+2XCh41Ve
 BuQMBs6+95Kv58fHm5KrUnHuFJX71qwedfWWyJaPz3EgWca4K9ILgr+7W2j4E3xdJFn8
 ER1o/LumoZvD9VZpZiZJhAg7nfaGaCCOMeyNWWvYBKNfPzTD1qTruH33jo05xZXNLfSH
 zuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=XSRU4iN/0U1/JxElvCJ8QeXHgM1DIlCtTrCTfqI/Kh8=;
 b=iWe+W+wzA1uW5tCkw3bwPUBgRO6DiYP9wtYGdjguGndhi/5BMaSsIrDlbfK1s21aFY
 xndFyBTIWzttFUk7idrGOLMc23kSm9F0Gmjr6LdKRE12Ix2kyKBM/aUU6d1v5Ri4KWXV
 Wl3Q8AwjWEQLLBLsq4T/paUq/y+EUF7zOQc6sNjeKK78tHU4rVJl3Yd1tlHsYm6gS1aU
 E7/qTL+/iRXGY6xhl34g1AG6qE/tt2mon/vYpQGdmEBmxWun2Lo/K4lqVgfN5E7UQjmd
 0rPbl9+VVRVz3YBIVhIfDa52qAZaHEWYwyIe0ojAG/Q3I6gFDqZSha+sufZkjuqB+yWz
 +/dg==
X-Gm-Message-State: AJcUukcEyNUZJUENP3oTQI4YVhej11gUymoPyRoOLwGRb6qen0yS53rB
 AR94R0h/X2MCyVMXlIj5sxoH9g==
X-Google-Smtp-Source: ALg8bN4W8MhomBelHaVzP0b7u24s0MEoFFcAJi94ftZQCYFjaOY5yUCpFjM4cvjjLvNupQw4uIC6/A==
X-Received: by 2002:a5d:494a:: with SMTP id r10mr17314652wrs.272.1547822263123; 
 Fri, 18 Jan 2019 06:37:43 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 143sm84137867wml.14.2019.01.18.06.37.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 06:37:42 -0800 (PST)
Message-ID: <6c4d61da8d3df8ca0fcc37a51f5647b3eae71aa5.camel@baylibre.com>
Subject: Re: [PATCH v2] mmc: meson-gx: enable signal re-sampling together
 with tuning
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andreas Fenkart <afenkart@gmail.com>
Date: Fri, 18 Jan 2019 15:37:40 +0100
In-Reply-To: <20190118133223.16650-1-afenkart@gmail.com>
References: <3d03d45f18e8b3e10edc7dd7dd03c5b7167abcbc.camel@baylibre.com>
 <20190118133223.16650-1-afenkart@gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_063745_800540_90D9C2F2 
X-CRM114-Status: UNSURE (   8.13  )
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
Cc: "open list : ARM/Amlogic Meson .
 . ." <linux-amlogic@lists.infradead.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 krzysztof.michonski@digitalstrom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-01-18 at 14:32 +0100, Andreas Fenkart wrote:
> card detection fails on "BeeLink Mini M8 SII" if enabled too early
> mmc1: error -110 whilst initialising MMC card
> 
> Fixes: 71645e65729f ("mmc: meson-gx: add signal resampling")
> Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

on the axg-s400 (eMMC and SDIO)
on lhe libretech-cc (eMMC and SD)
Tested-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
