Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED171C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Feb 2022 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NvYhbQmiQmlVlpaVj4FvskpEqFcjOtSyGWWBswziM8=; b=sX7cUQTSGLdgGf
	RvT0PlhNMjLL+PnDn6poL3rhMxesQRrpTZcGAS20fy3gOcd+1HtjAQkcf21FH3LZmwzEsQUKSDYxR
	dstg7YKy4kbFwHsJplsp+h9rwxm8R6L3ubh6KghDRThoy5OtxIK7BzbqVPYXLSxck0O+IIlYjsJdo
	8UHcr2eSpHaXogdxeMxMIRmriFKdDG7D2rlxHFMxhOVnNc4ilZDSe9xp32FCeZ0HNTAzhziZQX7de
	qTcl6+RWTSMfZkg9OZww/Hn3SIUMDQb+0DwOW4WSK0W2YpPFlC3p6h6BVzuykwjpz0jE+PMNfS1LF
	GP30I2kdSj0IMp1y6Mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHCIR-00Bqfd-23; Mon, 07 Feb 2022 22:15:43 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHCIF-00Bqdg-SH; Mon, 07 Feb 2022 22:15:33 +0000
Received: by mail-oi1-f176.google.com with SMTP id x193so18741372oix.0;
 Mon, 07 Feb 2022 14:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0PV4HeoPHyKxyJK+Cen0YeHP4HwTJe1tl9BLVocuArQ=;
 b=Oz5zggeaFAa3D/5xN3Z8Ca9+9S5pLBj6GklwO1btO4y/Grk78TOGs+SGh6Of01rCuP
 BuPBK76CfgG+HdwlI1GhpHlBQPHyF29PCEAGyQKscSUBBqXbqpjhq7Kpya4SlaY8T8TL
 tUCsDd2hZYYmNzhDczEldckebeo9W6QgyYXpmf4VxrUy4jbMJpPKMu/CnItF5IgTwXp3
 XjtTel0Tr9dxF3rsjqAv7qnNlDghyJHmlmaxep/BWMwQYS6oO7k396+J8Ue4buIrFbhF
 3pDqe393we40WpmcFtiJIDc22JF+XWdc+cdl62BS8hWhulc7lU+64Dj5VPDBRZixVjTj
 LnIw==
X-Gm-Message-State: AOAM531YlT+kk1hWIrS6Mj0xDWL4uBf70sA+kK+9iF2iG6L+T16n97Ag
 bWEm8QPvfFh4hYpjqSqHiEEDT/2HiA==
X-Google-Smtp-Source: ABdhPJz9aWY+u9C0GkaHH8DOjPZWltUVHGIUnCtuIieVh5g9dlpzaor9gMSlbvw6WHRZFJ3bfr0Btg==
X-Received: by 2002:a05:6808:2386:: with SMTP id
 bp6mr492103oib.152.1644272131239; 
 Mon, 07 Feb 2022 14:15:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t31sm4902258oaa.9.2022.02.07.14.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:15:30 -0800 (PST)
Received: (nullmailer pid 1022275 invoked by uid 1000);
 Mon, 07 Feb 2022 22:15:28 -0000
Date: Mon, 7 Feb 2022 16:15:28 -0600
From: Rob Herring <robh@kernel.org>
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controller: New binding
 for Meson-S4 SoCs
Message-ID: <YgGaAH2+xiNmTjIR@robh.at.kernel.org>
References: <20220119070809.15563-1-qianggui.song@amlogic.com>
 <20220119070809.15563-2-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119070809.15563-2-qianggui.song@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_141531_933769_2D2D8493 
X-CRM114-Status: UNSURE (   9.19  )
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

On Wed, 19 Jan 2022 15:08:06 +0800, Qianggui Song wrote:
> Update dt-binding document for GPIO interrupt controller of Meson-S4 SoCs
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
