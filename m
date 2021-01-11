Return-Path: <SRS0=5e44=GO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18883C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 22:24:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A0322D08
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 22:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2A0322D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M6A5nWtLiCPxcIuZ35Pv99a3vXxiL5M2YoCHqmrG2CI=; b=PTlF3P5cKN0FSpcK+LOu/nh29
	zJGdPNiz9XqUb1O9EEWCI9OVLZuLdF+JZkItt18dK1xsjJ71Q/P1lfr7a2/0qkT/2iVERrsK6bvNC
	3njUsWDWxzm71CXiqnP67xLZ2YVo+xdplygdoETYcOcTVmlnwjbez6i4f/9MY6PPF2iaouj+dNuHl
	syTinBLLDWe0dc4EOlE4q4Xra8/kFpfTfEhcF4KgG4aJS0fe3Jfak4Kv+WOx8IAYwbk+1e1HeE5IG
	5VjFULyzFprYh9nsNwP8NYVd2vpaEWzyNrNNpJaqdeErHLNTl5+CYjLhJDNYgWmVBepkXvyCbVWRk
	rIfSSp8GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz5bo-00056v-Ac; Mon, 11 Jan 2021 22:24:20 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz5bc-00050d-0K; Mon, 11 Jan 2021 22:24:09 +0000
Received: by mail-oi1-f173.google.com with SMTP id d203so310637oia.0;
 Mon, 11 Jan 2021 14:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KoacxLrwG781qT5RG7YqfWItnfklIT+YgSdisL9jVhg=;
 b=Vt53nUhBD+bk8xs9yLmHDB/Fq+lYZVxw++GKXoqIpesXp2jZfVkdulgj07zPTtr4Y1
 /02+1ZrTO5JD1eq6OatRDCLfXOmevT3H4fHzWZmSFm5Omk0Yhd+wWpnA7XIm3q6aEXSY
 9MGUoahoXCgmC4H96O+fdC3MCXw3eCndECwUObrY9HkHgGCtEImiyBU3IRGDpCeFhWfn
 Z5/TZh9aKT4DLP7d46huF6ifzNeqNYnEXS17pqs1veVSF6QWGgLAYHfEQKnD1rd2vT4P
 CN07yeOgROzN3A+rNfUHszrTQBdAStkRoxTTWgJPnLDp0oC+TCHB5fB52q7IOoB9MUwv
 1qfw==
X-Gm-Message-State: AOAM53153Einm9GveOGIg6VVl+Hh9muQKZSdhwimMl21mLHKdgwGObeQ
 IqdZLJPkH4abfpJSibNrsA==
X-Google-Smtp-Source: ABdhPJwYdKgyRVQAbZFYeZx2MSTvcx37NH1sC+LDnpzYisFoBMSSFNUVxQm7CmWiF0U0a+z3t3+3GA==
X-Received: by 2002:aca:d54a:: with SMTP id m71mr591460oig.30.1610403847004;
 Mon, 11 Jan 2021 14:24:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h2sm186107ooa.25.2021.01.11.14.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 14:24:05 -0800 (PST)
Received: (nullmailer pid 3166438 invoked by uid 1000);
 Mon, 11 Jan 2021 22:24:04 -0000
Date: Mon, 11 Jan 2021 16:24:04 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: Amlogic: add the documentation for
 the SECBUS2 registers
Message-ID: <20210111222404.GA3166382@robh.at.kernel.org>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210102205904.2691120-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_172408_126230_1CF52028 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 02 Jan 2021 21:59:01 +0100, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> contains registers for various IP blocks such as pin-controller bits for
> the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> The registers can be accessed directly when not running in "secure mode".
> When "secure mode" is enabled then these registers have to be accessed
> through secure monitor calls.
> 
> So far these SoCs are always known to boot in "non-secure mode".
> Add a binding documentation using syscon (as these registers are shared
> across different IPs) for the SECBUS2 registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
