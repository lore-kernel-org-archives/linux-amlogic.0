Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0A1C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 20:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E23B60FD9
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 20:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E23B60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUfirN77X7HgL50x/myWg7/rYGcSteYerLswqv85sc4=; b=NjB+WmkaxG+gAF
	oUuA2aLZTJzHKGQE1cHuPUvt1KmhTPqe03/DVEOhLGmeroQF61dH3m8KN7NcQUdQPkVIGcZuoi862
	DSkXG5PNk4G3SFvgxAs3VNHi0yTwqw/1rHD8CanjBNfLEThVlLU+iv4sDtXfSIi0L5n45ORuwqemc
	z8+oYqQwhgFFuxEI7N6VabKrVRdc0nMJFLKASQYnoDjApVjb0lgzo46rnHENzrGZYyJAGPQB331wJ
	PwA/U4aKyVMgme28nOI/6Peq7iYFzO0Mw5bWTv8TX7/QgD+X4YXIWbiKlppiK2tSrJxR05O27iPo4
	wW1qROyUZOKSPo77Qjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG5h8-003RGv-95; Tue, 17 Aug 2021 20:28:22 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG5gm-003R9m-33; Tue, 17 Aug 2021 20:28:01 +0000
Received: by mail-oi1-f177.google.com with SMTP id o185so920887oih.13;
 Tue, 17 Aug 2021 13:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rjhi87l6/w+/P962vY2ZGzukN6DuCOJ2CH0XWyVvt40=;
 b=ePeUQqSHXGMzE8jDd+hTmjqGyvbnX2EUu1K33I2OCMmxrnH2HQXmuMvSikjhWJunO0
 rhfTaTgvb02qcuKs4m4HZP2g129DXXV7nzJuGe7DzsQcHU3u6YT9tclQ5FBEK1oAFXCF
 xNu7FjHbovTgnyza7B2bmNk8GUj+2QiPzpCBAUnXvdPckZUaOTopJcCdWutSL9Eqt77E
 xukJZvrG5aJuasGrE+zHX6qC1yoBUSfMX1szuMxdCsq6IRbxQCv1lLjr+K2TQTwHmzaU
 XlU8J0R0mKQmYD1fJNUS4erPCRryCAQu/sDRsC/OyVj3ezvULViwTJNor8llEL7BeejC
 hoOw==
X-Gm-Message-State: AOAM532caE5Lk1ezPXv6Tl2LtNtw1oju6NOaqUHtXtrTop5eElOFjsny
 bAsjIfxf3fJ9YLTobRsQGg==
X-Google-Smtp-Source: ABdhPJwv/9QnEIj8A3PE3LKgBldQYunD/YuwLLutOtEHIYEdDK7sVGuf1Fa8kpw+p8Nd31U4HFq3bA==
X-Received: by 2002:aca:bd8b:: with SMTP id n133mr4023748oif.75.1629232079512; 
 Tue, 17 Aug 2021 13:27:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z26sm722154oih.3.2021.08.17.13.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:27:58 -0700 (PDT)
Received: (nullmailer pid 784061 invoked by uid 1000);
 Tue, 17 Aug 2021 20:27:58 -0000
Date: Tue, 17 Aug 2021 15:27:58 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for Radxa
 Zero
Message-ID: <YRwbzripmlsoG3Fp@robh.at.kernel.org>
References: <20210810102613.25149-1-christianshewitt@gmail.com>
 <20210810102613.25149-2-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210810102613.25149-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_132800_160517_58DEC9A6 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On Tue, 10 Aug 2021 10:26:12 +0000, Christian Hewitt wrote:
> Radxa Zero is a small form-factor SBC with an Amlogic S905Y2 chip.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
