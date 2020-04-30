Return-Path: <SRS0=G+6o=6O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C30EC4724C
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 14:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7255220870
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 14:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCqpg3KR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7255220870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlQ/LMKdJJhLpmpRgQxbUpA5yosdWVeY0CBPmVCvL3A=; b=kCqpg3KRyuCDpJ
	mXLG1dc6PX7n214GDbTd308Um30OAzuE9h8vPdXg4SL4tjhbDcKIcIKQ2BSPQjqmNSdvzY0FfUNc8
	0nrPT/rWaS8NyZIJXPpS/B8SKwcHsqZafA0XHYdbSZbw+c7GUMH/BAmjsu5C0h8cKjWwve4pbd1hN
	loQqgdwpNPEATQTQyNFyyRvEKc7HqTpMz+25/v7000pJXuVHiE86dhl1F2scgOdYLJVqViYc8WEzp
	FlrBDVdjR2ygSJ018rp/M+njXEf8daJo2oo10LOoo0TgVS0Odl1e6WBWn1Zp7uYj/QSdYM7WgRTfn
	1U1jvxQDtGYwdhtHX9sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU9tu-0004hb-Mh; Thu, 30 Apr 2020 14:10:54 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU9tc-0004T7-2z; Thu, 30 Apr 2020 14:10:38 +0000
Received: by mail-oi1-f194.google.com with SMTP id t199so5319612oif.7;
 Thu, 30 Apr 2020 07:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UgTzeSieOrk7bgrXOEEKGS4vqDfJdjTM5De/Mq9VpvA=;
 b=aGZR5mcut/baWDjEh6S/x4WJD23SJDT83E2bP4iv/kJ50XsO7PoAJ14MZOv3zgo5xG
 KtBg2G+GDE6QRJoEIbhOr9iHjLd7kI9M1A6fZ+DdOqOrEKsGXvDk08Sy78/l6/zs4HQP
 iAKSCRHPfKu84HBLPG2P7HyS86ZnQIrlXXzaazpt8z0+/1+Ay6j4mR7lse6++UmCuM4Y
 /ZCZswVHH/sSzfhpOEhb6zG1GHVZBxngY2aV9/q/bZLilDV8ngvj6VGmstYyl2ON05aL
 gKClUiwQSnEbSE7RB3uh88Si1e/3nA3PSFmVBpb53avXLg7M8J/lMibUIZThKvqsNXSO
 oG+Q==
X-Gm-Message-State: AGi0PuZKgSabpOmgWuWwOlzSGq2yM+kaKkZStxdUOIVDvSYeGsMMG6zw
 4TXCrnZi8xorqrFvkQyRIw==
X-Google-Smtp-Source: APiQypLd3ij132amZqmzb1pb6Pu49V28sjYMfyg7bc6xj1bapelOBMaB7UdhZBZ0xlBAKCAGhjm7Iw==
X-Received: by 2002:aca:6546:: with SMTP id j6mr29159oiw.155.1588255835409;
 Thu, 30 Apr 2020 07:10:35 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w24sm1346250oor.47.2020.04.30.07.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 07:10:34 -0700 (PDT)
Received: (nullmailer pid 5452 invoked by uid 1000);
 Thu, 30 Apr 2020 14:10:33 -0000
Date: Thu, 30 Apr 2020 09:10:33 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: arm: amlogic: add support for the
 Beelink GT-King Pro
Message-ID: <20200430141033.GA5382@bogus>
References: <20200419055322.16138-1-christianshewitt@gmail.com>
 <20200419055322.16138-4-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200419055322.16138-4-christianshewitt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_071036_125664_556591B3 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 19 Apr 2020 05:53:21 +0000, Christian Hewitt wrote:
> The Shenzen AZW (Beelink) GT-King Pro is based on the Amlogic W400 reference
> board with an S922X chip.
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
