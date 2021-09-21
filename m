Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0CFC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5A060F23
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F5A060F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FmmfeGzoUVkwUSe+5XrxYVR/mXNuzaWLixEOzthHFZI=; b=g0ehjffsy5GterwIGyrOsXzwhp
	Vgb0gXWe1WHqVPyEcjDWC4jyCSMC2uMe9EmImi8d1ZlUNYsTdIwYYz6IyC+1c0hZsJEsjrCX+B3lV
	Yru0QhE6Uxe446UVcBz1/rJBMiFjArRFHDtvq8jFuE2bubJticytn1RijwQAjtKgwtj/JKyBLYIIa
	eU8ZbvviARB4Do455CRTVyXbsjKxo046a7OMKcXivwMIsXwnPeYY32uk/AUqYrrpFgaq5k+Khr+25
	nobXP0qqLPsy3ipg452z9bQA3bUV0VnyC8hREnOj1xMvDzcdD521CbZoq1PoO1COkjBFZ8H0E3YrX
	c5NDKdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSaID-003q2d-4J; Tue, 21 Sep 2021 07:34:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSaI9-003q1d-Gp
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 07:34:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t18so36415004wrb.0
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Sep 2021 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gvw2jIgyVHK3Qs3X6ZV+ASgc9V5L/DWol2KTZ5lZJbo=;
 b=qPXE6jFYbva9tSr5jNQflWpr6ABHYnwyZbBaYNXe2S4EBP/P6ufcAaNJrphLTsBlJ+
 jzUmbXdzWExcjJ+gbEzcw0X0P7zI2IjWneZU3UzS9wlRR7Eip0Pt7J2LbmUi4eDbyX9f
 5uhYCDpC/lQVIFM75z4rmfrnhHgmKwZcSc46XBzJQt2Hlx4n2V/crLQ9Ft6rHj+4Gqeb
 DSHtAXjoPQa0Oy+GqOe5vXhKxZ1r7FD9HvvkOqFz+TEZDzoSB0vkga511m0O+BIqrqQA
 IYKV8PynkTyDcjNnsah+Cs4B2oh27LzyjtQn2NaQnjjwDP9Bw4CBo1u/T8u98DGmrOTG
 5OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Gvw2jIgyVHK3Qs3X6ZV+ASgc9V5L/DWol2KTZ5lZJbo=;
 b=mTjKOPMPhGkWcn8U8W1OgME8Yl/jEQhsQ+FZcYlelO9Pqa77odznUbes3XzQmXO1TR
 CHt3bp8B7uSGfOzpDyUh3wP9ox+upeSVgc4xxNoIjYRuGJKpqhwnx7rOGF8TzTAsY9cW
 b/3wSkoFjjMzjz89sxqIW7m2+FsUemO4dGU3GbyFZDlyz/eGJeIaQx62KBqhZvZkIZHl
 xlWtYinD/Qy9ts69voLciEiqUIJBfLfVxFzVCQW3hcg4TTgxCuB2CvjeqAGa36f8RXkK
 LFRxb/9srbdoFB15FdZKvDNDsAyHc8+m5rSCJ9h9B1ggyHJOjcZ6b078N/kZGyIkn7oZ
 ZgdQ==
X-Gm-Message-State: AOAM530SuZSfiK/6jA8QoKUAsWN+x0sAPTNZrjFfI5S7PWROKtZxljm+
 7P2iq/Yh1/gSFoLViJPDquf2c/2uOWNRS4Nx
X-Google-Smtp-Source: ABdhPJxdkt9KYAa1LyK6tFKUzgfYd39Zci4cEw9ZNfjvHA26ZUD7NVbxqyMunFFnYre8BgC4g2QTiw==
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr32873961wrq.176.1632209651712; 
 Tue, 21 Sep 2021 00:34:11 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id k6sm1769721wmo.37.2021.09.21.00.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 00:34:10 -0700 (PDT)
Subject: Re: [PATCH 0/4] ARM: amlogic: add Radxa Zero
To: Christian Hewitt <christianshewitt@gmail.com>, u-boot@lists.denx.de,
 u-boot-amlogic@groups.io, linux-amlogic@lists.infradead.org
References: <20210915014659.5336-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <05337aed-d0e4-cb46-ef3e-c934059f4b5b@baylibre.com>
Date: Tue, 21 Sep 2021 09:34:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915014659.5336-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_003413_617245_BE70FFA7 
X-CRM114-Status: GOOD (  14.35  )
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

On 15/09/2021 03:46, Christian Hewitt wrote:
> This series alpha sorts the Amlogic Makefile, then adds
> support for the Radxa Zero SBC using the device-tree
> queued in the Amlogic maintainer tree for Linux 5.16.y
> 
> Patches are based on custodians/u-boot-amlogic-next
> 
> Christian Hewitt (4):
>   ARM: dts: sort Amlogic Makefile section
>   ARM: dts: add support for Radxa Zero
>   boards: amlogic: add Radxa Zero defconfig
>   doc: boards: amlogic: update for Radxa Zero
> 
>  arch/arm/dts/Makefile                         |  12 +-
>  .../arm/dts/meson-g12a-radxa-zero-u-boot.dtsi |   7 +
>  arch/arm/dts/meson-g12a-radxa-zero.dts        | 405 ++++++++++++++++++
>  configs/radxa-zero_defconfig                  |  70 +++
>  doc/board/amlogic/index.rst                   |   3 +-
>  doc/board/amlogic/radxa-zero.rst              |  74 ++++
>  6 files changed, 565 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm/dts/meson-g12a-radxa-zero-u-boot.dtsi
>  create mode 100644 arch/arm/dts/meson-g12a-radxa-zero.dts
>  create mode 100644 configs/radxa-zero_defconfig
>  create mode 100644 doc/board/amlogic/radxa-zero.rst
> 

Applied to u-boot-amlogic-next

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
