Return-Path: <SRS0=sNlH=Z2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C858C43603
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Dec 2019 19:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CBC32077B
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Dec 2019 19:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/DgmvaC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CBC32077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+BsAjqUHP1R8eNnoB+IlqzvAd1lVi0n08IE9QVFoP4=; b=G/DgmvaCkEq/31
	FDkD+eFcNQQ4hndgsfOXrQ5wwHgRawWgQDIRfb9RWnXpEbmWCqoW+89v9BqigTlhieVwykcgVq/CJ
	UlA8sEmA0rlx/QnUp9mG50Dx5gz2Y62F/mPMB3JZYOcRerEGdjoowALrV4NpX0eFI6ICyDBRTP5LW
	N9ELDwdkapRiopZnulcjodJ66FCmKK9dq8nNtzUT8ocAGmi5HNlGA1Gd50d/rLBBDRShmn3mhWSBM
	ozRUjCY5DAnqvqZmM+tfDiYiL7BUILUOrVezgYRdEnmYlSaHQyBkrF2axaiz2TCFMxr6HUuyHj/sj
	nwH8c/be/0b+RzYB84cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icaIu-0005VT-UM; Wed, 04 Dec 2019 19:27:16 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icaIs-0005V4-DD; Wed, 04 Dec 2019 19:27:15 +0000
Received: by mail-oi1-f194.google.com with SMTP id a67so333251oib.6;
 Wed, 04 Dec 2019 11:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LV4dBd+pyosFpb8ZOXcuCmQqFB/Z1VrnDg7zb35XO+A=;
 b=AZBu299Ozku4AyWdIPgZFl+pxMLrCvR/p15GbR0FS+0dFWD8kt8e+zsoYgPzbA4Nx1
 XKngLMDNlCdi4yYJjT6rcv6uoJxMTl9ftb9HeVDI0pKI9sZT4YQJqLs9JOu6I0HLwCk0
 9ZrFMOjrdxuXpsUpHnm8m7YOo4HQOlnB0q7LjGONpfADPLnyTco/MTurAbCNXakyH1oz
 qtNwkLWI7NZ+7t1Ha3P3qB9046H2s4JCky7W7gWYlBlX3Oz+3gCwkxxyxA0Oi75Ol9wP
 9vUMsExtKeIXiLxE1ZR9sOo17g38vHb6xmTvKWXKRfNaHo2BuPYz2Y3qWyhRGqh4zWKE
 YyZA==
X-Gm-Message-State: APjAAAW1k8GI4tx4azjjPhD2A1yi3gyVl2Z3fJbWd6Z9q+vY6Jy6/z+T
 fhmVBtbCX5U2XhIc/yfqkg==
X-Google-Smtp-Source: APXvYqyWJX9gBPsev6B4b8T+yjKHMepyHXDfO09PT+6reBKfa28zaBZj1dCvX8NyEatzxLKyG/Veng==
X-Received: by 2002:aca:3012:: with SMTP id w18mr4151923oiw.33.1575487633657; 
 Wed, 04 Dec 2019 11:27:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v25sm2037370otk.51.2019.12.04.11.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 11:27:13 -0800 (PST)
Date: Wed, 4 Dec 2019 13:27:12 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: amlogic,gx-vdec: add bindings
 for SM1 family
Message-ID: <20191204192712.GA6599@bogus>
References: <20191121101429.23831-1-narmstrong@baylibre.com>
 <20191121101429.23831-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121101429.23831-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_112714_447870_45A01CE6 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: mjourdan@baylibre.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 21 Nov 2019 11:14:27 +0100, Neil Armstrong wrote:
> Add bindings to support the Amlogic Video Decoder on the Amlogic SM1 family.
> 
> SM1 has a slightly different power management handling, thus needing a
> separate compatible.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
