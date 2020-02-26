Return-Path: <SRS0=KJO1=4O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C186DC4BA12
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 15:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 963AA21D7E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 15:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oa/LQRc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 963AA21D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciB6Q8KYH8XO75H/4czz2swB6s99AWd2c1vF1WJeOew=; b=oa/LQRc8U5ixHd
	ZdIADOrhZVwxndU/mgl08/OeYfgkAvk1i1GJAdvapbEKwdL/rZ/8lDGh7YlYgYD8DzOPlkqmgwtFT
	wIHAjApapWD0iwQx09KKfHksECIFV4eXZQxCkxXQm6vcvBuOqoq9yMj9oRDaD0MqtW6K2kPrCHJ6V
	dKklukNiN5hElkLnFH+ReMEHj08k5Pqwm5JGEdpv6uykNaSPW475nh6TAoUW38TNOz1uL8Y/rDTel
	N4Llz9nQ7ogAJFEW7iCzz7SvUj5BUBu9TwGIS4/Yd9/GMI9zMGKvXgZ4kFVV3Qv0rhPdlMXUbMiX4
	dV7kf0FiKM6T+Jy39NUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6yd8-0004h1-KU; Wed, 26 Feb 2020 15:29:46 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6yd6-0004ga-Nn; Wed, 26 Feb 2020 15:29:45 +0000
Received: by mail-ot1-f66.google.com with SMTP id p8so3262484oth.10;
 Wed, 26 Feb 2020 07:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L2eDFUj6+ZgHsv30b3IWHnryr2PQNv2tUG/pwmYNTCY=;
 b=nH4G0njItIfbVZWGSpWffHsOyyLSp+8vu6uuU/H5G+2C9slbyLAbwSOU7HCuCfPaUQ
 Nvy6HMRAcC0OPRp5QkfuD69QvDKB/mQ2SqS2VFsDWdavL0FevKqbOxM94cnxsWTofeuG
 0oiYcXgW3Bk+aUgwA47RZwqfX3+4ZPu0+/scueSDVXMMU0kgaqnHVvMxn5HB3dpB1K1+
 ygK3UWLtANtAivTyVBdSUYRGYMjw+wyzyqYA4KfJHvb+0og0YKefIfa5wzglz9bIOfNW
 HBUF7HjbBgfSsU56zrjcgvHV6FPMuUCU21y1FQWyXKAeNuzPF32tmD0SKdZL1K2h3H0E
 +S6Q==
X-Gm-Message-State: APjAAAX6Me0Cy5THWFKeu5l77z3nqR/F9/SnnqGVOyq7NRz4lWY5aJJX
 uM8VNtfT9iGP67EO2rLrQw==
X-Google-Smtp-Source: APXvYqwkgLOQ11KkhrIdopjRwjvsy1oDDhHlY1VCalaAfJDndkzbKF6J3ryE55DovBte5OZJt1wggA==
X-Received: by 2002:a9d:6ad6:: with SMTP id m22mr3775162otq.7.1582730984108;
 Wed, 26 Feb 2020 07:29:44 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r2sm874632otk.22.2020.02.26.07.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 07:29:43 -0800 (PST)
Received: (nullmailer pid 5886 invoked by uid 1000);
 Wed, 26 Feb 2020 15:29:42 -0000
Date: Wed, 26 Feb 2020 09:29:42 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add SPICC SCLK Source
 clock IDs
Message-ID: <20200226152942.GA5832@bogus>
References: <20200219084928.28707-1-narmstrong@baylibre.com>
 <20200219084928.28707-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219084928.28707-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_072944_772870_A14D7181 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 19 Feb 2020 09:49:27 +0100, Neil Armstrong wrote:
> Add clock ids used by the SPICC Controllers of the G12A and compatible SoCs
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
