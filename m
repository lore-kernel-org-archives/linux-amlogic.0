Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E69C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 20:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC4B2208C3
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 20:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNTqgTGJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JD7JeQsA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC4B2208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lINr7TQYjbsrZKUd4VJFePGA6Fujm3+OKIiHlaj+As=; b=BNTqgTGJ3epvVx
	6tdCLLl4LWreXdCeOvLHC6r+8PxcYWzcghtyHS/hkr1Fzzi24oz4dH+aK0NJ9tFRfA355wGfkIUqf
	NlXTBw7/TUGy8xV3QTQseYPueCRhA0fTV/RubOZoU9ujhi+FmrCrMbNwwwA8U44Ah7Js8d5m0MEZt
	9CNI1vrNKmmnOL8QPx+wo4n1h16GOOMFSr+9Wan1sdvRgFYABejUzuAQL3sAl22v95DqCUBY+XYr4
	6h6seFDcfohxyDYze5q0FuUzTqzMWjT9IEwGheeYC3FAretkQiMm7+MZ+wYkk5BZMZp+7ZO4yOoNe
	3lua0hInBtkgX2Imm2Uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDaeq-0004aO-Of; Thu, 26 Sep 2019 20:46:36 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDael-0004ZU-QN
 for linux-amlogic@lists.infradead.org; Thu, 26 Sep 2019 20:46:34 +0000
Received: by mail-pf1-x443.google.com with SMTP id q5so159028pfg.13
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2019 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5A93QbhcJ9OxEL8d529nmFDwwgHPcXf7jnflqd7ri+Q=;
 b=JD7JeQsALzOQnI/4qgjCyDszf1kSiggpL1jpjmpP0ZrOIuc+rH3npuK/vS6qQ+APdk
 DOxSlr0vPjLBh+8bgundu2vrbnLYxdK8cJ9A6n+FIHz1xHDLi0z+VJdL82dvLTGdo8zF
 HduM+63/IdGaaCFE3qZPWGsNkoTiLLi6WDvI4TVwW4s2I2xZ5uUu+xDZXrPM1SCBrSno
 243VhgJkvY50yMHStaZPEVf1H+Otom59J+UCdTgAuVfnoDnn2+GtT1dZFqBM3z7sWZnu
 I935JuXgwOAV/a1Cyl2iPYd9RP8KwljZunUy8mZqpja4Q9GsaO0IKxZjvyjVaxIis/71
 qQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5A93QbhcJ9OxEL8d529nmFDwwgHPcXf7jnflqd7ri+Q=;
 b=JA/2vv8P46ysK42xJaYwgTmtPKyzk/e5J73UqNS1r5cbUvAvTBbw+Ok9kJ2l/mnrC5
 hZF2W5OLBQzKdUFWMkBHTLejQUL1yq9WFZoIWpcH0TS4+Um41u4LSCLstmgRST2WojK4
 EICxdgqcRpBt1A6WMWBVIe1aKcgz1BWbihhaCp8jwc4W7E17utOEKMMzhjN7WUUR8WT3
 9kP+9pblsqNGeJ56HFLiXy986PEis/l1478Y3ptBpIyeYZZTlJayDxLQuITl5ZqJFVVd
 SnWBt0IU5tDPlwOrw4HgmSq7OKbn2SdoIowQNSFnjNSD3PkzzMBoTWpyYgcFHA+wbE4I
 vYbA==
X-Gm-Message-State: APjAAAUdBkgLNfjx5w5tf7BEKQQa0RoXsNG7fazz9oKfUMal6LqtDhTs
 5X+y+0w8pDxzyJ4r4CXdBtMf9Whqv/Rx2g==
X-Google-Smtp-Source: APXvYqzG2OOdfG5XCHclCet9YXaUJwXijZtrIpDdndqleeF+PAsM0A80TkkzpTkrpdeInKpWjGPpIg==
X-Received: by 2002:aa7:9a48:: with SMTP id x8mr415038pfj.201.1569530790856;
 Thu, 26 Sep 2019 13:46:30 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 195sm169718pfz.103.2019.09.26.13.46.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Sep 2019 13:46:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org,
 jbrunet@baylibre.com, mturquette@baylibre.com
Subject: Re: [PATCH RFC 0/2] clk: meson: g12a: handle clock hw changes while
 in suspend
In-Reply-To: <20190919102518.25126-1-narmstrong@baylibre.com>
References: <20190919102518.25126-1-narmstrong@baylibre.com>
Date: Thu, 26 Sep 2019 13:46:29 -0700
Message-ID: <7htv8ykcpm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_134631_996362_09AB2649 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This serie aime to support when the suspend/resume firmware alters the
> clock tree, leading to an incorrect representation of the clock tree
> after a resume from suspend-to-mem.
>
> For the Amlogic G12A/G12B/SM1 case, the SCPI firmware handling suspend
> alters the CPU clock tree in various ways.
>
> Since we know which part of the tree is possibly altered, we introduce here
> the clk_invalidate_rate() function that will rebuild the tree from the
> hardware registers in case parents and dividers have changed.
>
> Finally we call clk_invalidate_rate() from a new resume callback to refresh
> the CPU clock tree after a resume.
>
> With the clock tree refreshed, CCF can now handle the new clock tree
> configuration and avoid crashing the system on further DVFS set_rates.

For clarification, does this series work without the other proposed
fixes[1]?  or is this dependent on that?

Kevin

[1] https://lore.kernel.org/linux-amlogic/20190919093627.21245-1-narmstrong@baylibre.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
