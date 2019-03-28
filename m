Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1224C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:18:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C202173C
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txbVC1jH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90C202173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOK0NokzjILbgbCnueTunEMRYMHFyx2EK7QTp5PWBQQ=; b=txbVC1jHkaeJpC
	sjz1lJlYgx3AugG55pOGci4+c465vy+kt3VzFs2VBFs2+vgke+MRDdISF6eG1Vcd5lbncGAMmGcgL
	GrZEIVtD8Iyi0bAUdBvzcqYI2ypRzUQDQ1Jz6P26HA98dwX+aDq9FRK0mReLPRwLzwnCSmpC7wlxK
	QlhtK0q3f98DRMYb2zIOUIlO7Pe0hsxuHoHVMwMF0RHG6oHix3Tos+x3O5s18YEr/NijxVp6KZOJU
	IxIAfF312o9th1rn8OHlS08fQkHUyX4RSsI2wpNtWY7XuIW2ARU60FvbhxO5bY5JcW4afMx8jZ7Mh
	qqoGcRXDqkgEEJ4GaQlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Wmx-0000C4-Lb; Thu, 28 Mar 2019 15:17:55 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Wmv-0000Aj-26; Thu, 28 Mar 2019 15:17:54 +0000
Received: by mail-ot1-f65.google.com with SMTP id f10so18666859otb.6;
 Thu, 28 Mar 2019 08:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XKFOM54+2ObR8/c8w6Od7RwzgBu/+7D27/71aliV5p4=;
 b=BbnuXWxB2jxqZjzT/X3HhMjiKNjgpFBMSOCr98Axhyb+vO+XUfL6sEOjXBCIFbTZGU
 xd+MmmrKsl3RT0B1+JSo/oOn6CaBt3ZVQhd/tr/tTvr5lXcBpiSRjAwdG1fN30Qq3UEX
 hPylc7LBEYJd1DuMo/epYb1Lb7hVFJiq4TIbsiEa+VGSMK0bodzo7XD6qH6FLYXPumzC
 CsZHN2U/5cBVbkI78UJz1BU4piR05KDhR/3wFFrgYWsYMaOyZfTDau0C5EnesdqWEMEc
 ONdLZGNVFbVCUkDo4OFakuUvRWMZr0hLJhwVFtB/i08tAg40FkPT7yPVPbYqjz1OVAWx
 VAzQ==
X-Gm-Message-State: APjAAAXpJ+D8pq8Wzwvso2AMqH8DNeqzLjUsx7t5FrvUlsYih5FT4vPP
 k4YPvk2bDzZcLw0eqVyf8g==
X-Google-Smtp-Source: APXvYqyZVOfpGivqBJFrF/WwRAJa1eBMhSkz6MphVqYtlW2MeS2UwGq7L9c9uFOOQ6wgCU+onKuicg==
X-Received: by 2002:a05:6830:2090:: with SMTP id
 y16mr21668080otq.97.1553786272041; 
 Thu, 28 Mar 2019 08:17:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 92sm9846886oti.60.2019.03.28.08.17.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Mar 2019 08:17:51 -0700 (PDT)
Date: Thu, 28 Mar 2019 10:17:50 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 G12A compatible and ports
Message-ID: <20190328151750.GA21381@bogus>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
 <20190313141030.5958-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313141030.5958-3-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_081753_111457_BB93E777 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 13 Mar 2019 15:10:29 +0100, Neil Armstrong wrote:
> The Amlogic G12A SoC has a slighly modified DW-HDMI Glue with
> support for HDMI 2.1 and a different DW-HDMI register access.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
