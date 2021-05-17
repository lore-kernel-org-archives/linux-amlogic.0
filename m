Return-Path: <SRS0=PyQ3=KM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273BEC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:54:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0415611C1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0415611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wY9ngQf6kKwUL5FttlqH/i9m24136f2AEjLcK+1XPl4=; b=TQkkNI5X5smDLoDCphDbpIrXU
	jrif7fAAPypGvlogNSYnpSyowGEYq/dFQkEZCOMfMTBLJwNNrYnOM+HGqXQpAS+eTBTA1ZsGgB+9h
	o2SWPOZMm0wvSCo3twGyPo/v1Vw71zVWXs1vBgDnXOJVv6HynqkkUaXwR+BayTXL5RN73deqFWgMf
	i2Y8U2M9FtNop1aXuGgwzrO3++QhvMrLJdmv9JThAuW6Ulx//iwJEiceT/uyp44/XWmfWWAjO73lN
	4eIb7krOmvEa7X+Bge8+kR0Ucr71lM5tDtfAFXKPI2eyA4e/8FdSUhvc//WrrncJf3U3N/kQMkyoh
	1xyZwkpFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1likG0-00G9Wi-Sw; Mon, 17 May 2021 20:54:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1likFx-00G9WK-B4
 for linux-amlogic@desiato.infradead.org; Mon, 17 May 2021 20:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WzNUoUY7AUzQjydPiHh/ZS4e3yrInAcISdLJEmYM3yc=; b=huRqZ2yn1RXOJgaBnteW71uZvw
 6sP54NjatFhzsEuSYXmnzSjIOKoSRpmyrO5ISLKNyhcs04vbXAgEZsCi5BdJhhSgHnrK3p1mExFtl
 zk85aW0Ecuw2qHWir1BX05JFYatsaKv+r3FzkskTPP2lTPHjuok3XjQJKwSGkE80DKFnsl4B97aL7
 KGYm+8tRd6RNL/dEBp03YQJvuMkwKWEtX6gvDUhmHsmBVrSAehsBDyHuZlnxD43xOe/ub4Sb16Clz
 DmliWMa4uWVtyJEx4GnjlEDVokleGNEvyC0bMVseSviE1zWczZ0o53lYNaH1kgsPXuHXSHIFVjypC
 aYF1bXww==;
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1likFu-00E99t-02
 for linux-amlogic@lists.infradead.org; Mon, 17 May 2021 20:54:27 +0000
Received: by mail-io1-xd2b.google.com with SMTP id z24so7225613ioi.3
 for <linux-amlogic@lists.infradead.org>; Mon, 17 May 2021 13:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=WzNUoUY7AUzQjydPiHh/ZS4e3yrInAcISdLJEmYM3yc=;
 b=Wh5JfGpUaPJojzaNAJdl3t0QkhsYdECNwc7XO4FVOOoiBQrXIcmGr2ZP/wREltRbB1
 fjEXaxhFvw3FgNeJWbg0ErSkZ1xl1iAapPD0SVAtsr7JYb/yFf5Uk2eBTTBtd1frw1la
 Ym7pwwlLrenCybZD5B4vp0ky0zwOxWJDHqUuRc0HOjyQqLVH2/KqIskhf1FsSL+Dp8/e
 xYxjMOaPVELZdOjae1WMx6QQWjjpfKjeTO5K3l7dItJheVjfWhhY8naIoVnRcTHKuoHY
 vU1S+zxJviCcNNw3R5CIkt4m0RtXmJFEGfYG4RDLsM1HBzqv7VQhrv0iKi2dn7GZlKJi
 58zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=WzNUoUY7AUzQjydPiHh/ZS4e3yrInAcISdLJEmYM3yc=;
 b=TusmdN3UcyUCd8fYLazCGIE8OdSxMk/h67yTN+rgtBq8v4TXps02X0kfrYcJ9VKyem
 nyO9O9X2w099p10E/zpwtnbK6VyesSDiijjoYhFR59pgNDouL6JodWl1ZR84oEM5ani7
 wC1cg3MorCXbXGfghbgJmvQBqYlv4Fg/SQhBhIbmzl8ZY8j3ofosG7q4JgDt4tSSjasA
 nl8BhojllktMMOYhJEj+3eDq/4Nq5khJrGobvRlKlrxlJiNbPCQCKI/vtMx02TRMtu+4
 SP/1hQfPOBYUc78Mi0JS+APE+GyVe2il462hlA61N3M3xwSjZ01c3H1ij8sEQAd8XWVM
 ku9Q==
X-Gm-Message-State: AOAM5322X+OQ8HymEWUBNnefbqMFb80JbqaCO5zDoDynNlLzriPEGXl3
 5gQ+MXAJ6hJ9Lmw2RWdZoNIOiQ==
X-Google-Smtp-Source: ABdhPJxip/qt7R4PId8aNCMSR9857mihgvMm44XHKbpxBIiXIVxpmhORCNHvc6siUldmvVcddtNCWQ==
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr1906162jad.33.1621284862780; 
 Mon, 17 May 2021 13:54:22 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:17ad:f4bd:897d:c28a])
 by smtp.gmail.com with ESMTPSA id v16sm9581998ilq.45.2021.05.17.13.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:54:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] soc: amlogic: meson-ee-pwrc: Rename "get_power" to
 "is_powered_off"
In-Reply-To: <20210517202115.1004065-1-martin.blumenstingl@googlemail.com>
References: <20210517202115.1004065-1-martin.blumenstingl@googlemail.com>
Date: Mon, 17 May 2021 13:54:20 -0700
Message-ID: <7hcztpt72b.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_135426_079765_F6FE6E98 
X-CRM114-Status: GOOD (  10.60  )
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

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The name "get_power" is used within the Meson EE power controller driver
> to indicate whether a power domain is turned on or off. With the
> original "get_power" naming the result was:
> - true = powered off
> - false = powered on
>
> Rename "get_power" to "is_powered_off" to make the naming consistent
> with the third argument to pm_genpd_init. Also this naming is easier to
> understand when reading the code without looking at the implementation
> of "get_power".
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
