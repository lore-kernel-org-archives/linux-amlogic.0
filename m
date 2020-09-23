Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B1EC4727D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:28:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1596E2395C
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oC2ts2WV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1596E2395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xli6eH4B/lYKLaEoUR8teYKrOQbYhCjr5t4vdIa52Ck=; b=oC2ts2WV/5Gai4cp7FrqPE4db
	nQ3oigpUvTJSxuqK6DLbTBTZElzhXsKkDgygR/n5qwXqnl+nxapPS3GhHZXf/bZIH7Yd+D6MXZI1Z
	NHVvzNXuAuuSaO/Fi72oEi69GD2iSHwRpav3QoIc3oL81PkO0vPuXZ/mV5Lo/3g1BjTvxcYYuPr8x
	iz4jMiRWYs5e1Cz6wklhwJnwYwuWMgW0F7Hgdxz+/CcGtNrfzWqI/RwLS+0e7ac3dYiTBi0K4Keox
	Rl3ACTd5flwhr9jzyJEfcSyVrNAJCfufhgRVvNPX4fizpKUDMSXg2TJzK4Po1lefUMYxZhQC/PaY/
	YvpEwh2sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKta6-0004Ia-Se; Wed, 23 Sep 2020 01:28:26 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKta4-0004Hd-LQ
 for linux-amlogic@lists.infradead.org; Wed, 23 Sep 2020 01:28:25 +0000
Received: by mail-il1-f194.google.com with SMTP id q5so12711472ilj.1
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Sep 2020 18:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wOFsOWTjSL4FRYR4bymj2SkxEWR6B/1aPP2FtvhSKOI=;
 b=BTpdsb18Bx0K0f2hOk8J5lHkyGHAXe9k/NaqZkF0ytlxVAHhaolcsudu751moa7QdP
 X8ugLUNyX1SbeQeRSALZxZS9yZETmziLO5giAa17D9VClM3ppJWXdUTNBxE7irDf6NeR
 4EN3b/9YPMnnxWlR/Tb4dYOQtotxOCifrwUezgX5OMdCP+TnWgFmk7AdYOtAQ7hIrKWi
 gvDA908q+VC95j7Uh7lXmsZrfoneanx0sfcMUV2CrngEg/64eRkILba4HT44ye33uzzB
 K5xLQ4NjjYqu8lngENCV8AlUI1t5+Jez7Hon25r2c15148jmhk8J26X/u9uXDyj3bIQI
 muyw==
X-Gm-Message-State: AOAM5328Dvm7qzQXgoyajwYglq7YL82wvt7FbwBXe8R2Z+Uu2DaFu7Lq
 7o4QgARAQ1gAG2dJCeVuvQ==
X-Google-Smtp-Source: ABdhPJyH2nFFin5pTlEaPxsP4fOtHfm6oOn+qr9bRGNajCNvS0DOljj+PsMwGVw/ytYsc0e+Uq3tYQ==
X-Received: by 2002:a92:c7ac:: with SMTP id f12mr6724566ilk.2.1600824503966;
 Tue, 22 Sep 2020 18:28:23 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id u14sm9873738ilj.7.2020.09.22.18.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:28:23 -0700 (PDT)
Received: (nullmailer pid 3656192 invoked by uid 1000);
 Wed, 23 Sep 2020 01:28:22 -0000
Date: Tue, 22 Sep 2020 19:28:22 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: display: panel-simple-dsi: add
 optional reset gpio
Message-ID: <20200923012822.GA3656163@bogus>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <20200915121912.4347-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915121912.4347-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_212824_723788_17D19C1B 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 14:19:10 +0200, Neil Armstrong wrote:
> Simple DSI panels can also have a reset GPIO signal in addition/instead of an
> enable GPIO signal.
> 
> This adds an optional reset-gpios property.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
