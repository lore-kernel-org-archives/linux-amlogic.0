Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106ABC4727D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8382371F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:31:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6+K0Qft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8382371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p/PeLvoGTrhqOAVJ70E89e6XmmWtWCBfQKdFwZS3Foc=; b=S6+K0QftKxv7usdsUts8Ik3PB
	b3UmZmHEh07R245dUBY3UmLnwyPyPvKjv/5ddnZTHHj+FZQuGTeDkFxuN/ak8VsuHm6kLOPX4CIEK
	PHaW4RskBBmI5+AGw3NEE3e/iRU6/DEeR7NMtVm8VRFVrGaSL7TDCfLdcSYBohpadhsZ6QJeEBbGl
	YoMB5/ikwMK5Lk7gxpfHHvheWizkEN5K6NxwtTPsoUh24EQmwn5563y7C7VWxiwpe8hQcVljo+E8k
	H6b7d+wWx9J/SW2u7kYByaOOK+ZLO6m1mq4UohnectDhuXVIs8gVm4xfoqpYeKqEOPNbe1RmY+7/J
	716nXl8WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtcz-0004v2-4F; Wed, 23 Sep 2020 01:31:25 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtcx-0004uF-AM; Wed, 23 Sep 2020 01:31:23 +0000
Received: by mail-il1-f194.google.com with SMTP id t12so19243244ilh.3;
 Tue, 22 Sep 2020 18:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RgBQCzMtQmwIMiimJ3o9lxyQbCmVqCdm6KoNh0i+4hs=;
 b=KLCvImBghkZ1H4dJD65uVtWdzXhaHn3jYMFitgIN8w0dCVaH18S/bHsdOQjtZIKjWU
 fNAbqfKntdPGQZGZGfnZC/ZKNlzoBhVEUPIOmcMc1cJnkJwYJC1LeTKkw2NYkxHUlf8p
 WdKjgHK4TtOTX6hAQ2VDkD5x6jtS+7l9X4vNcmtc3vu7F4XorG4pujNNAafmkdzrlpiL
 p1yioHpoyMuijdJjwEqro1Pbi1u1TLZzED51YzYnlQdYxAL2592Coz6PlAvLKHWf4kr4
 rlVU1eI2FNO4GQZ/aGcUVeUs5wGdBQMNk6M27wXo/hRPeN2IWiWZfVYN4pDvc4k4wEL6
 hZkw==
X-Gm-Message-State: AOAM532tNcoWYzZWzNN72J/MSWxJF5mjQXmlZ3/eBkRpkCAvl9PhWnkH
 wgfID4CBGOSNmTOY7Yc+XVsys9+cG7LN
X-Google-Smtp-Source: ABdhPJwkK9aKoaJcCfiMhweECt8pD8K2e3ZKf7ZMIpCNkj3hN+SJ+lK+lcS4U58qgAFe+INSDKmhmA==
X-Received: by 2002:a92:8501:: with SMTP id f1mr6672836ilh.54.1600824682737;
 Tue, 22 Sep 2020 18:31:22 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g23sm8292465ioe.45.2020.09.22.18.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:31:22 -0700 (PDT)
Received: (nullmailer pid 3661228 invoked by uid 1000);
 Wed, 23 Sep 2020 01:31:21 -0000
Date: Tue, 22 Sep 2020 19:31:21 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: clk: axg-clkc: add MIPI DSI Host
 clock binding
Message-ID: <20200923013121.GA3661177@bogus>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
 <20200915124553.8056-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915124553.8056-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_213123_392239_9FB01BB3 
X-CRM114-Status: GOOD (  11.44  )
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 14:45:51 +0200, Neil Armstrong wrote:
> Add the clock ID for the MIPI DSI Host clock.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/axg-clkc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
