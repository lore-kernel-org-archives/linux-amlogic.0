Return-Path: <SRS0=RHkW=ZS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B9BC432C0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 01:22:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAB52071E
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 01:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o+NlFoMV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZsjGN9G3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DAB52071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItyAYKpAJ0GRJyK8+tW1dIAzPw7YJ5yF/1brtL5/pZg=; b=o+NlFoMVVfkoQg
	Kg3bLG9gLdeB7sVyqf167GftywTSUawkD0ubbA+czTLi1WNKnlEJoFWPC59pahj7IGeKt0u0EtrhL
	JvBWYk2rt5X9C5B1ePNmN+E9/OpxdFwdErd0UDyLRsKpJU8ZmfpvxkYRs84Nejjo0wGP/NaEp1Ua1
	YCvUp3Ui8cXRo2zvvUZe6U9gXc22a4RTX0d+2kDbpe3l8jwfjCLMrr+jGo8rHtXwNURtqB0Nxufar
	bHe1/T7OWK8kF3GdM61IyiWpyX77S0ChgWRcsjhQhOUiZJC/ANV1sKVjRkBcCoZCB0iv9ckLRbRcv
	ZnUeCqlXrGhLTIX5TvEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZPYl-0002n9-MY; Tue, 26 Nov 2019 01:22:31 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZPYi-0002lm-4j
 for linux-amlogic@lists.infradead.org; Tue, 26 Nov 2019 01:22:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id t3so7668502pgl.5
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Nov 2019 17:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AtPRMYJsiWkwHiFFHZwBcUcKfK6FWEVPRzt0kULjoMk=;
 b=ZsjGN9G3y6QPq/SuMUBdQdPjWMaaqGTsg369cIOxGzFWf76C6KhXoa28fC3PDPNsv+
 7QWs10eF6lz9is8be53GzoigIeoomf7xOruNp1Y/bJBePCpSOXYLOA4H2/KJ77cRhk05
 x0KvyJoRGbdZ9bbhy/XpP674iOcUGGYfS/H2W20tUStvBWi2ytsJmsFm0cuVxx0LrVhE
 fJVgEsvqgV4FirojN5oa+BaOcKBvYRvapbjhDDbYa7cJEo8dtqNlxLA6y+V/jXxspakD
 Spg4rGfGWHPFYnszQbpNq8GQ03LpilTeTOS2V8qw2dZ1gjduJRffPZoij6u5G0iQYIDa
 y3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AtPRMYJsiWkwHiFFHZwBcUcKfK6FWEVPRzt0kULjoMk=;
 b=ivu9RTpLqa8VFivv9m6QoLBuqLrkCb0tcETgV2RhrJke+fcIYGoj2eA49ZkgRrmp3w
 vksGkqoaBVhRXzqCuvv6oNBAUfqh2EiVeVWmYbzzam1N6jTjSbFNYc6Z0Mw+rBMIRYdu
 APcGpVIUv08cfuj2tJNzbaFLIlDcnQuNJb4rOqRI33VmUBwfzfmPg7ae93enwDcc/oCI
 En2uE4/mQ3iyPMg5CYtALEcjpEqJVbAvefQBDMIsnrgXlFszvMQseZn49qOBCM+ZRlpk
 buQ7SeEz35augR5E4nNOHeZx/Z18doB2waauaWHtkv3N+LuCKm6w7sHFczDhy/Kpc5GD
 Gvpw==
X-Gm-Message-State: APjAAAWvXBeL2WrrkT2BHFIxWfp+iX503qQt20C6ZMTEPt8lwSfC7fEI
 LY1RVUIc/2giXOqoiwGFCv3xWA==
X-Google-Smtp-Source: APXvYqzCduZpVjmTaqiZExnNw3OMBfwJqTBjnW12KeeSXsvhWXRVkr9xrQzORP/oWCYG2oNVoKbw8g==
X-Received: by 2002:a63:6a47:: with SMTP id f68mr35998951pgc.35.1574731346647; 
 Mon, 25 Nov 2019 17:22:26 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r15sm9985094pfh.81.2019.11.25.17.22.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Nov 2019 17:22:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, robh+dt@kernel.org, ulf.hansson@linaro.org
Subject: Re: Amlogic 32-bit Meson SoC SDHC MMC controller driver
In-Reply-To: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
References: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
Date: Mon, 25 Nov 2019 17:22:25 -0800
Message-ID: <7htv6rh1ny.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_172228_247116_AFA9BE4F 
X-CRM114-Status: UNSURE (   6.25  )
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
Cc: mark.rutland@arm.com, jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
 linux-arm-kernel@lists.infradead.org, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> this is the first non-RFC version of the driver for the Amlogic "SDHC"
> MMC controller found on Meson6, Meson8, Meson8b and Meson8m2 SoCs.

This will need to be reviewed/merged by the MMC maintainers, but to get
some broader testing (including in KernelCI) I've added this series to
the 'testing' branch of my tree so it will be included in my 'integ'
branch.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
