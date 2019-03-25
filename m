Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5F9C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6CC20870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GNtUcjOM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uzlHV+6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E6CC20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmddLf3FN1H8nyCP7T2EJVHi6vCLouYkemCzEo7TuTE=; b=GNtUcjOMU7sbV3
	Mo9W98QKafjn00cTgbQ3v8zxpbV5BTht5AnWonDLiyVNslXrFMTsnLWp77bGcroLaALiWCnDuqj1R
	h9fUWQiFm/CUbf1d71qymv+KGKSED3AY0ErEhx+QBY/WxfZWF/oZ5wIpu9kpymGUQs6eJTABW4b88
	CSm4jUUp6bP0CZTTt7TagJBEH891yGO884cz3sPghWaNKjBVP67llI3Rf2Qj2uv6mIDSppHtd+W05
	8HzndLTJPA6qDVrHU5nq3FzMI3cVuQTjN5V+Fp0nAnUjePe3o+7hpU3bc4TZNXhleD86liqp67V8b
	T6JQGaeL5O8miGPBLGKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MDn-0004qs-OD; Mon, 25 Mar 2019 09:48:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MDh-0004m7-Li
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:48:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id q1so9314536wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=tBC5OtGtmN7x85dPX6xr2NlJXzvSgP8RiHmhhpk+SWM=;
 b=uzlHV+6UMXSg0tjYKE5trY4EL/bIkIe7rrqKL/k9OSsZq6JewmtnBfoxvbZ5L3R45i
 SjSVcKdYuy7qQOBIWqoge/FQWx3y+mXiB7tUNzOKeCnrQyxDlg90/2rDwYrJpk9neqew
 8yaBrEPFkqLcbvRHiCh1lJ9hdjf93Wb7/4isxEtK1iknXeZvAKRCpOGTCsdBdpqTtORc
 b1BJ8zUBJfYmwGgcaHQrf4yLS3BXgTKFoEj3k5VSkwGS+QO2jxx1OjoXeTwdbTGs7XN5
 L2BdRbnw9GWR2w4KhVz2m1BUs4qAQySjhyEJ/23tmrZtcyb5JrF3uLozgvBJ2yaD0Yit
 IdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=tBC5OtGtmN7x85dPX6xr2NlJXzvSgP8RiHmhhpk+SWM=;
 b=Me7N8etfDn0l4Ssny8MOUpO/Ru0x9HS5hHFCbJhfD+vQD+oA9xWT3l9YHVGo4eXgA7
 QwPK7EgGege7QBlEFc2mFgOE0WK+vs7WdzNuSPP3Mib3cUhxj2PF5yhV8i7c0hyigtuF
 mgVLe8UfG6u+FYh1zMD5EF0mQQjLyBmALZh2EgeB1I5+sh3AGL9yKBxNkdS3v8cMLmgY
 aqbZOrcSUHnYtGvDNh/S/Bv0sirAqFRhkfBJD+8Ov6CBJxDrkp9+Y3TQyUc/80nmB3cE
 /ze/+vpFMaEOFvgP4QEV1Pw2dI0US9fJVnBpBiDRIoWTsuc4dzHATOqEyNjxClWBaGLq
 3SOg==
X-Gm-Message-State: APjAAAXwuA70rHAEhJQnO+lyAD/BmIDZI02yJg8Hkba9B1cVMOTGUmVK
 35wNuPqlCKJN+ymiIcxl6SdqHw==
X-Google-Smtp-Source: APXvYqxADaFe4JjXnTVcMbFHpLwZxeARdWhEGN7SDBrC6Ul6sbUsuKrhwm83htZKnHlmhTgpcKHQgQ==
X-Received: by 2002:adf:dc88:: with SMTP id r8mr8719485wrj.28.1553507318621;
 Mon, 25 Mar 2019 02:48:38 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 f9sm16675248wmb.36.2019.03.25.02.48.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 25 Mar 2019 02:48:37 -0700 (PDT)
Message-ID: <c8328cbe29fe905834a618dbb263f4fb79be3d22.camel@baylibre.com>
Subject: Re: [PATCH 1/1] clk: meson: pll: fix rounding and setting a rate
 that matches precisely
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org
Date: Mon, 25 Mar 2019 10:48:35 +0100
In-Reply-To: <20190324164327.22590-2-martin.blumenstingl@googlemail.com>
References: <20190324164327.22590-1-martin.blumenstingl@googlemail.com>
 <20190324164327.22590-2-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_024841_728920_25F519A6 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2019-03-24 at 17:43 +0100, Martin Blumenstingl wrote:
> Make meson_clk_pll_is_better() consider a rate that precisely matches
> the requested rate to be better than any previous rate (which was
> smaller than the current).
> 
> Prior to commit 8eed1db1adec6a ("clk: meson: pll: update driver for the
> g12a") meson_clk_get_pll_settings() returned early (before calling
> meson_clk_pll_is_better()) if the rate from the current iteration
> matches the requested rate precisely. After this commit
> meson_clk_pll_is_better() is called unconditionally. This requires
> meson_clk_pll_is_better() to work with the case where "now == rate".
> 
> This fixes a hang during boot on Meson8b / Odroid-C1 for me.
> 
> Fixes: 8eed1db1adec6a ("clk: meson: pll: update driver for the g12a")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Good catch !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
