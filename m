Return-Path: <SRS0=2Oki=JQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D66C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 04:49:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ACA861077
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 04:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ACA861077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IaPfOxbOBsDo1fGQ1GPNYcKzVGDrRFNhna9j725aBwc=; b=lXqQ8T2MQrtX4BvKEiGo8cQDZ
	A5nAD9aqtHVDcr7P0C+CPlM7IFG74wrZVJ5/6/SjHh7A76GR4xmbrG9ggb+/nnvik387X1uViEhmE
	3RrJ/n8DK4CZpnbp8FHVxgTAK0SGNASgC2FQK6Qi7h3PpSwqIIPESLSQHWniRujgClW52KA+/zv62
	u9FUYOFOjouU3U5CdPjCd71mlYmxrXXUpBcP9efb56GZXAPdLWvQmNvWFNx1xnJwEXzwudDcDP7FX
	WQg1Ee1scxtw36nWwq/RDtWCl9MkI5e1ygLFNltcf45FqirCydhm/uN2J9Qmcc+Uq7sCO+GV5CqD7
	XCDYMXuNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYLr0-0096aJ-3D; Mon, 19 Apr 2021 04:49:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYLqy-0096a8-P0
 for linux-amlogic@desiato.infradead.org; Mon, 19 Apr 2021 04:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nwmKkdj5vxFBpFK3bj8w7Gz2YNFOXfPhegLyPurLzW0=; b=wV/TTEDYBzsSRoayU+dGbq5nsb
 jYU7wWdJh1sotCXbDRKsoG0VOHND8QPR1AvkFR64AvTZg0MnmYTnb2oXP9zg8tpbiedWrKMChFwqv
 LpfueAY62SDbBjY8YYGo3Z6iGqZRwCHk4uVRkB68i26LeAPxL5zMRW01RMvfGN3OSlBl/m52ClJsQ
 rCbtrrvdryeQ4lHYqECDPIeCsoRBLgr97t32khFJNpMM5WJKmWWhBpIQpBjas3vMa87s/8oql6/ii
 CWKJybcJWRZu51g46djjPq4wW9j1DNHxm5WBVtmG7qpj0iZKJKiNFMfS7mnkhliLKZ7cyQOhyVBEQ
 t93sg1YA==;
Received: from gw.atmark-techno.com ([13.115.124.170])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYLqr-00AzPJ-Pn
 for linux-amlogic@lists.infradead.org; Mon, 19 Apr 2021 04:49:42 +0000
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by gw.atmark-techno.com (Postfix) with ESMTPS id 99D7180570
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Apr 2021 13:49:33 +0900 (JST)
Received: by mail-ot1-f69.google.com with SMTP id
 u19-20020a9d4d930000b02902876395d43dso9223956otk.21
 for <linux-amlogic@lists.infradead.org>; Sun, 18 Apr 2021 21:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nwmKkdj5vxFBpFK3bj8w7Gz2YNFOXfPhegLyPurLzW0=;
 b=W4MI301dIWq4nhYz6CozFqUs6AkMNi3yfVb5Z5lVyuXqpCk7nqBtL9RXK53tHoJsft
 7i+fmrCm4gnIKPAt0yySV1p3aC36712HvgkLpaEF/mnWikR3rDm8Lf70Ku9GbZASg+UR
 W87UIat0VIetw05Bv6ab2AhIjKFhhHhkw1p4m800f+tmAwzuDaf/zXGWg2VoDcTPjwXH
 SrWn5roBqH3AKEZA22e6Q2x4HhevxjLBhcf0R3y3oLdYp1967kO7qAVEsJoBIpviGy5E
 SSD9i8Kq2usKmvBd4UddBwtdgd/MhsT9gITeHEqSA9FuMZc/wPVYNC54Z3MDeqbMDoJZ
 O3Gw==
X-Gm-Message-State: AOAM531MbM8YjM2Co9kz0aWgKwHvY3UZywxssXPJ3wU6RlIho3SjAZcG
 IljEDJWKnL4MjGwMwXQ3JrJnF71gjDKj0eVD9bUmXey0Y2SosLKszjcBUy3C7CT5pUkDJbKQGEl
 6m4ZrsimsJ3zVvAGzH87B344UXidUJcNCx2M=
X-Received: by 2002:a17:90a:430e:: with SMTP id
 q14mr10145490pjg.189.1618807761145; 
 Sun, 18 Apr 2021 21:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxUh9TJ2x/K//IB2lTaeXhs2rGXIpLK5cuzzNIi1YdNWpQlLZsRv610IvzYjHsCM08ZYf1MA==
X-Received: by 2002:a17:90a:430e:: with SMTP id
 q14mr10145444pjg.189.1618807760853; 
 Sun, 18 Apr 2021 21:49:20 -0700 (PDT)
Received: from pc-0115 (117.209.187.35.bc.googleusercontent.com.
 [35.187.209.117])
 by smtp.gmail.com with ESMTPSA id l22sm13247239pjc.13.2021.04.18.21.49.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Apr 2021 21:49:20 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYLqX-0016Kg-U8; Mon, 19 Apr 2021 13:49:17 +0900
Date: Mon, 19 Apr 2021 13:49:07 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, horia.geanta@nxp.com,
 aymen.sghaier@nxp.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, tony@atomide.com, geert+renesas@glider.be,
 mturquette@baylibre.com, sboyd@kernel.org, vkoul@kernel.org,
 peter.ujfalusi@gmail.com, a.hajda@samsung.com,
 narmstrong@baylibre.com, robert.foss@linaro.org, airlied@linux.ie,
 daniel@ffwll.ch, khilman@baylibre.com, tomba@kernel.org,
 jyri.sarha@iki.fi, joro@8bytes.org, will@kernel.org,
 mchehab@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
 kishon@ti.com, kuba@kernel.org, linus.walleij@linaro.org,
 Roy.Pledge@nxp.com, leoyang.li@nxp.com, ssantosh@kernel.org,
 matthias.bgg@gmail.com, edubezval@gmail.com, j-keerthy@ti.com,
 balbi@kernel.org, linux@prisktech.co.nz, stern@rowland.harvard.edu,
 wim@linux-watchdog.org, linux@roeck-us.net,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [RFC v1 PATCH 1/3] drivers: soc: add support for
 soc_device_match returning -EPROBE_DEFER
Message-ID: <YH0Lwy2AYpXaJIex@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-2-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419042722.27554-2-alice.guo@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_214937_978349_DC761AA0 
X-CRM114-Status: GOOD (  11.19  )
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

First comment overall for the whole serie:
Since it is the solution I had suggested when I reported the problem[1]
I have no qualm on the approach, comments for individual patches
follow.

[1] http://lore.kernel.org/r/YGGZJjAxA1IO+/VU@atmark-techno.com


Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:20PM +0800:
> From: Alice Guo <alice.guo@nxp.com>
> 
> In i.MX8M boards, the registration of SoC device is later than caam
> driver which needs it. Caam driver needs soc_device_match to provide
> -EPROBE_DEFER when no SoC device is registered and no
> early_soc_dev_attr.

This patch should be last in the set: you can't have soc_device_match
return an error before its callers handle it.

> Signed-off-by: Alice Guo <alice.guo@nxp.com>

As the one who reported the problem I would have been appreciated being
at least added to Ccs... I only happened to notice you posted this by
chance.

There is also not a single Fixes tag -- I believe this commit should
have Fixes: 7d981405d0fd ("soc: imx8m: change to use platform driver")
but I'm not sure how such tags should be handled in case of multiple
patches fixing something.

-- 
Dominique

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
