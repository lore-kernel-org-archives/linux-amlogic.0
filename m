Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88E1C2BCA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92FE206E0
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqsadFio";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NqnGfAJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B92FE206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNHEOsHOk6OW63OGvLk1V0eQPF1VcN0VkndJd0AEWIM=; b=iqsadFio1ATxbI
	nDs4158aWGB60B08g/CLk8AD0RASVamZgh/T7gFUG+eSzQIbz+wh6iv5UD8Vs3q4N1VMnEcNB/Inv
	sO/l83tje+EAoaItbVD0LvUq3GNGCemZP1GXMWd1zlDgXtkq/s7YX8wgNHPCeuHfNXOEdRiDfEgWg
	P5qm14kINa/xCEckTJYyRi3md/wK9sjTZ8fhpm3bvU2Vr25dpPlr4wz3RUG3yQ2GgHVgNiehbgPnp
	llfefu9T64jLkX3M5tG06xjOkvPCg2m/Ni5vquq6ag6M6sHqKdapFFVo1+I0AJkHwAxrdSQYwZsds
	tGjxCaFNQ3oHPxEAYWRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZNnD-0003O6-L1; Fri, 07 Jun 2019 22:57:03 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZNn3-0003Fq-Fq
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 22:56:54 +0000
Received: by mail-pg1-x544.google.com with SMTP id e6so1878138pgd.9
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=M8kh7Dgz12YKrTZB/CDTuS2cguipR8YlgXyL4uu88Rk=;
 b=NqnGfAJwCu03tLbifhT0GvFm2QW9R9io9AMcdefvJFzJ7g5Vr8PmXoK2S/sS0EBCtH
 Fusk7Ssd1izPi4ZVcnBnUIZrYJgm2cJJofYjf12PPHOu7ZZQRvC6lU0/MhgweIGPyLeg
 E6/EwGWuLTjiqp09TGPSY2SCFTQsrN6Q1gyBuOEW5aINnxk+dmy7z5bJcCLEazyA8lbi
 VWQySNTO5RzIXQriYe54HK29THy5Z3raT0y6A4hFRm5CoOlH/IVwVyITcvGmjab4XIjl
 OGj96J+wDHrvBD5Bl803937Zwo9o/GU9QYKxuCxNaeVzWqwjMi90YBdkhNvlFjQpuFFm
 tqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=M8kh7Dgz12YKrTZB/CDTuS2cguipR8YlgXyL4uu88Rk=;
 b=jBZ29dbF8jOy2riOtwk6AwgWscWk7WdYfNLxAaE8nhpbq0Gv8s+tliZhF6VOQVRzxu
 Q/jkpWM9HskxuTexYXTGram5kP7/AP2FyOZCQE/C+/zNHexEMnipBuIklZj0VUgfSe8D
 lGc66nH0cK0qGyiJHXzYUBaFnlNgIfYlhxp5glqyrV27O1mS1Z1NtbbcZ8OfWChSn/Ld
 n5P0RVjrl3mmB5bBRPJjvSdbaMHJ2V3HZM4eY5PMCqzM58/UgdMw+mk9c6JKwbxhpyNh
 wDf9sl3tyaHsmBVLIDNmcxpi0ZpJiEsy5h4VF+Bxmaf0PRXiZhE5UZvjlQSna+19zW6H
 tbtQ==
X-Gm-Message-State: APjAAAUqm4HLSLcWfgN7f/T2hFQuVOV1qZh3ADfR6dMuaXdQmhKT/wj8
 1g+UE174Dr5UD/5r3hPb6d3T6Q==
X-Google-Smtp-Source: APXvYqx8Ow2gN0FBBUIuNPbj3rAAjRbrUfUEtyHrw8/8rVx9mCf6X0IFniQr4nPekXIHjCWdFu3P7g==
X-Received: by 2002:a17:90a:5d15:: with SMTP id
 s21mr8054502pji.126.1559948212523; 
 Fri, 07 Jun 2019 15:56:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id f13sm3439916pfa.182.2019.06.07.15.56.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 15:56:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org
Subject: Re: [PATCH] media: platform: ao-cec-g12a: remove spin_lock_irqsave()
 locking in meson_ao_cec_g12a_read/write
In-Reply-To: <20190605122015.11439-1-narmstrong@baylibre.com>
References: <20190605122015.11439-1-narmstrong@baylibre.com>
Date: Fri, 07 Jun 2019 15:56:51 -0700
Message-ID: <7hk1dxatsc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_155653_533852_01C2355A 
X-CRM114-Status: UNSURE (   5.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-media@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Since locking is handled by regmap, the spin_lock_irqsave() in the
> meson_ao_cec_g12a_read/write() regmap callbacks is not needed.
>
> Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
