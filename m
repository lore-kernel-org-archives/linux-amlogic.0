Return-Path: <SRS0=LO2h=U3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FF5C4321A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 17:58:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B21AF208CB
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2019 17:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dRxjxz9h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GiHzQpHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B21AF208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rqd0YWbjkaMw2Mg4F1pbJjPBP9gBH094L6sx0RhTs9M=; b=dRxjxz9hPVBwJn
	1/OnffRoamvmt9z2YuaJzr0ElT3exLPQTyQOQ4Av1Ya5fAYHaYALpHDsoh0CfnNCP3trsv6JD60fv
	c7+TtE6ucToVkdQi9CA6la44AvYdRE8pivq1U+U69D0ZjyYjXyNGhZLHGqCF28vclmOxk8Hir8jp3
	i4wURrEfSBe8iQ4EGhJ/1wDJ1P744PY3lvuygQGCpNaQ1gYqs3Gt1sbt6e8WJ8/zjwmwIWVFzhO6q
	YN4s2h7xzs4MJRk6QJuEDieFsjvPNSqfqFBS3cP2jEUj5uji/vIOm+GDtQ9wSUSXOL6l7VrTcGwpz
	P0AsQoa848xMYDFtob2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgv8x-0000nx-72; Fri, 28 Jun 2019 17:58:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgv8t-0000mk-HJ
 for linux-amlogic@lists.infradead.org; Fri, 28 Jun 2019 17:58:37 +0000
Received: by mail-pg1-x532.google.com with SMTP id w10so2917285pgj.7
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2019 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Vl3V/b9d/YR3BoBzMucBuY8z9bflVwMcEzHAzE43M8M=;
 b=GiHzQpHEBzX787s/X1QIF6dApBZZr+1I94MMXG75kyPqsnypZvvVmyPXmqQ4DDWDP1
 BzcS004uag+6zBmiVow3iazQZwCovOnO+ZHlIt9I21QnI0F6Nflvj4dUWBUbhq7AbO/m
 SynTdJ4H2/6gv6sVDQ/Y6+Xb3rJWkBq67DXPBHgz+cu1AXl9k8kEn7My8wk8Hf4WKSc2
 DZFzfS/MxxvfSALWkxuMLiVFMJYmOEgRUhfPMprrAJXGAmg42GEl4SGnDGCvrnJcyTse
 bBCzUsjp+9FQDvCouNixum4aYfj7dm7fTO1MgaM/A1Gdfa8Xw4iAsFFkjztnwVtxortw
 zQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Vl3V/b9d/YR3BoBzMucBuY8z9bflVwMcEzHAzE43M8M=;
 b=Rq3yLrhTveExGxw5Rsa1qiZIx6rpNXVU9obThnqXP3XVK6d4pFNc3z0kzRva+6ufDy
 xzUVllWLAvxJH/Xvf9F6/eEHPqvNUCgSrgDpy/WvWNWL2U5b5zUYk5Dm+pCtEuQlp0r+
 V1276nvCj3z4Pc7PnHZyg6Dt4CLoASHcWaRISnOc3u4FvBBhhqYqzc3VRmlWzmVbKAdm
 z/Q5Q/RYFcwV7WNF18lHeLRhiv3cX/t8ZXRaa/212oeIecmAF26MXb1p6buVvb3x2C3g
 0z0oxwug/DmgUq2WPW2GE5jekiEz8jPtddPIWL7A7q6y/zSgGQeSD8NEel1QLEcIvrjI
 /NqQ==
X-Gm-Message-State: APjAAAXWKq4h4UpK6lw4FHpmjy2NWTxoDhADbOuaqBNx/ArQCNyiARNB
 ogrqQMqJnQQMAay7JYQSK7Klrg==
X-Google-Smtp-Source: APXvYqz3zRSNG8ksCoG/kgVrFj0M6c77+R2i6vSlgO/BJ1CePZMBP9OvFZEvXFjF5JaAwCqI6GsMBQ==
X-Received: by 2002:a63:e057:: with SMTP id n23mr10491079pgj.228.1561744714489; 
 Fri, 28 Jun 2019 10:58:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id 3sm2963791pfp.114.2019.06.28.10.58.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Jun 2019 10:58:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [RFC/RFT v2 06/14] soc: amlogic: meson-clk-measure: add G12B
 second cluster cpu clk
In-Reply-To: <20190626090632.7540-7-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
 <20190626090632.7540-7-narmstrong@baylibre.com>
Date: Fri, 28 Jun 2019 10:58:33 -0700
Message-ID: <7hpnmxr3qu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_105835_570792_4E685F28 
X-CRM114-Status: UNSURE (   4.70  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.
>
> These IDs returns 0Hz on G12A.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
