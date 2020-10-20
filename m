Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983A5C433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 12:47:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D04A21789
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 12:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pkT/H6t/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D04A21789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PIi+4zQQFNi1xcymJK3Icxwi6JH5rZdZSXPBGAA1C8Y=; b=pkT/H6t/3PhN39L5l6QPnZ1VR
	qe6dvtL1ydKm1XXwcCLE+S+3HJQNI6h+sU1/cy8z0fm2IWVOvHZ/PnFySG4yhrNJhTTRqTRtQXboW
	gYDxuO7M1R+ltNYIbBIgj0WRgwtkAqo8W66XOY3GXwpC+t4dwB0oftTlltkAtcnr93q9PBi5YgtWK
	8nhcD7n9O2GumpQJDulRtI8BxHOZFFUHLJeeig4MIRnXFX32lTfW7JWL2RTUIoAMFBj08XMkjsaqS
	AASlP33JJecWAWsXlqtgS/GqxkzXVreiYsOyGhHZMmMKwRlSn1tcpbjS61bIih0wRco6YvH87hf0/
	oTd/8V1Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUr2S-0004PX-FS; Tue, 20 Oct 2020 12:46:52 +0000
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUr29-0004FB-NQ; Tue, 20 Oct 2020 12:46:34 +0000
Received: by mail-wm1-f67.google.com with SMTP id q5so1724570wmq.0;
 Tue, 20 Oct 2020 05:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rFgnG1vSkkyK/xq5Jk1boNhv0QfkAfDy/vvM6EOb0AY=;
 b=KhV4WablOy1iUwXgoHR+mU7WxMQvZrb1RArQbl+riCfoDtbgwnihvHIuwuHRqDkjRS
 5nZoCpMw8eXYi8HjlWEAhRuq+5gpqHst6EWawNzSVRhV2ygeL7jj78G/hNw8ABC0UNko
 tpYUmRDDI4VWFqE1nVCqVE1w9hLrnDRM1+HXlBevjEv8wZpHBfFQcQpdxprawzebJVYr
 qoYCtdNLhh6lexkDxS9PPHc5Hv/TbdQaTjDorSKfb94x9Qz1H5g6QFuIX3XmmHu+8Q0Y
 +o4KkPP3NYQUhuvwkw0GylnMvuclJ6j4vWZbKox3+70+iuR+c/vbBNou0RxhSqRB0FXZ
 zd9w==
X-Gm-Message-State: AOAM533xo5LNEWVvIjxxB4pIyGlLSh5DFH41bJzU/YqmBCOChEJ0x5Lp
 SbcrU5oV+8y6T53ZLi94TYjo7q/GDoXSCiFr
X-Google-Smtp-Source: ABdhPJzR7mSRo+VV9fwmhBwtIWaxIafEvh7cEQ+kkSaj1XCjmEhrNlI9TkfVnE2EoMcdB3hGTRvZmA==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr1908297wmb.109.1603197992217; 
 Tue, 20 Oct 2020 05:46:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id 40sm3029489wrc.46.2020.10.20.05.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:46:30 -0700 (PDT)
Date: Tue, 20 Oct 2020 14:46:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 05/29] arm64: dts: amlogic: meson-g12: Set FL-adj
 property value
Message-ID: <20201020124628.GY127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
 <20201020123404.GC127386@kozik-lap>
 <20201020124404.by7skr6rvqrqwgbi@mobilestation.baikal.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020124404.by7skr6rvqrqwgbi@mobilestation.baikal.int>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_084633_794429_94C2E111 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 03:44:04PM +0300, Serge Semin wrote:
> On Tue, Oct 20, 2020 at 02:34:04PM +0200, Krzysztof Kozlowski wrote:
> > On Tue, Oct 20, 2020 at 02:59:35PM +0300, Serge Semin wrote:
> > > In accordance with the DWC USB3 bindings the property is supposed to have
> > > uint32 type. It's erroneous from the DT schema and driver points of view
> > > to declare it as boolean.
> > 
> 
> > I think the driver uses it as u32, so what do you mean by "declare" in
> > context of a driver?
> 
> I meant that both the driver and DT schema expects it to be uint32, while the
> dts has got the property as boolean, which is wrong. The same problem has
> been fixed in the Amlogic Meson-g12 DT schema example:
> https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/T/#m225585212162b9f5cccb1a7088850fab8792b7b3

Ah, I got it.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
