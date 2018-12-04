Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADB8C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 20:51:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A30206B7
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 20:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b6HOxbku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rWRyte2r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26A30206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNy/H8NlRKEMWR4lHf+GC1A9tptUCZ6y/Ks9AKNfk+4=; b=b6HOxbkuhTBO0t
	8sbBXK8FVYKgf9HtSQ/y7uLxLLh+VoKqANXXqSwYn9unaojye5NdqRRmZvnf3RdwJ555LhwbQShHc
	+DizhUiD8+023BlkWTGyqMjYf7fXXEdVU6tMJA/0quhX0DheX5Koc7cpWZrjqsNuDdEJtVhF0RSOZ
	T3voxuETLIj8K5jdHirnqXxrYyOZOlSApBpw/6m3ImAGLZGhJVGkP4hfD2PNuCYJkOwxOBe1dUT8l
	KEbeDZdOaPTDkY7W1ZCkyQ5yZQbU8FWV922X0xLo2h6bbVcBq1HnFbYKb8FGTJ4dKPAHHz0ABxSDr
	BbY+P9/YFE4Mu3PjZ7hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUHfO-0005QC-6I; Tue, 04 Dec 2018 20:51:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUHfL-0005Oj-7W
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 20:51:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so10711957wmd.2
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 12:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=8idMI1QWpQw1XXwvnboo4kdX5q3L87C3fJ+m2KpY/Rs=;
 b=rWRyte2r1Qy3etrxaEIS0iZibhZTIp6hXFq50TOxQ7B3sDy/sAWBFObcOKsWSy3Qgq
 A/nPzQh8bHbvDxuTLv1q+JJE3lk+H5LMnFdsC/enC888fPE0AiSCIDk5XuPNH857nToG
 nYtDNPRpthIuMEouWrcPouF9Y4UNlJRbR16zYJA41quohR32i0goqBZSgOg5rZPSGyb2
 8vrTBXmJ/k7PxbMAnuKR47UIIzYN8v+pcktfLCJVhRwLO9Q0GX+q2mXvIyazjgqLcJQH
 6kow7YtrBhc5HecVwERRZvVuigTq2RwjHODUXUCDJy2uN0iuRApL/30icPr/Acejh5AA
 ZI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=8idMI1QWpQw1XXwvnboo4kdX5q3L87C3fJ+m2KpY/Rs=;
 b=JDPJb7d6c9jN60IpZXK3Ss94fyG6ACjYujFAsA7RN+ns5rl5PawFzHD6y8haH0gura
 4kKWpUNWtjRl2dHhbhH4s7ANVbwc18EdEEgdm4CSHfS9bWRxay/Vy0/HS20dTAgfruUA
 zMGwH0B0mcr/2ukIrNnodeDtN6eMPl6r5AdaXOWQ9vOZDVJHC9KHDTZdfGrF0pMAYjd9
 HFKffr3r+mRex5Z+pwdhXuP7uwmBWpYFcYUdZvPtBXpaRHe7TqdtpncW0wr5idfjZ/Xw
 ofR6E9QpDJ+46NykX9KMzYb2u4NEtA3aRAqy55GVUbqKf/jBFDf8uLqWjt50vQLITzo6
 DOoA==
X-Gm-Message-State: AA+aEWaooiGr4Qf9OpSVre5e+VKk8Tf9uzOv+89r9swNS7om/Q6rjrOr
 Oi2VLNg7Yl/awNNk0ULdtO4kHg==
X-Google-Smtp-Source: AFSGD/UtriuerlV8/vlSemH7u2suPxSWnq0Fri8zbBYp2xxipjox7SVrm0QMDeMcOPWQiuq1k67taw==
X-Received: by 2002:a1c:a6d7:: with SMTP id
 p206mr13065960wme.143.1543956683733; 
 Tue, 04 Dec 2018 12:51:23 -0800 (PST)
Received: from xps ([104.207.76.94])
 by smtp.gmail.com with ESMTPSA id o64sm3797643wmo.47.2018.12.04.12.51.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 12:51:22 -0800 (PST)
Message-ID: <e152a2b038aa3e3e37e031eff5585008f4637ded.camel@baylibre.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
From: Carlo Caione <ccaione@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 ingrassia@epigenesys.com
Date: Tue, 04 Dec 2018 20:51:21 +0000
In-Reply-To: <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_125135_315000_CAC05199 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2018-12-04 at 20:59 +0100, Martin Blumenstingl wrote:
> adding Emiliano because he experienced high packet loss on Odroid-C1
> without "eee-broken-1000t"

Yes, it would be nice to have confirmation. I tested this using an AXG
board with iperf3 both in TX/RX.

> I find it strange though that Amlogic's buildroot kernel (even the
> latest buildroot_openlinux_kernel_4.9_fbdev_20180706) uses:
>   interrupts = <0 8 1>
> which translates to:
>   interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>
> 
> does the datasheet give a hint that this IRQ should be level
> triggered
> or did you find out by trial and error?

The datasheet says nothing about that. Looking at the GMAC registers
you can get some clues but we confirmed that with long lasting tests.

> > Carlo Caione (2):
> >   arm64: dts: meson: Fix IRQ trigger type for macirq
> >   arm64: dts: meson: Remove eee-broken-1000t quirk
> > 
> >  arch/arm/boot/dts/meson.dtsi                        | 2 +-
> >  arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
> these two should be in separate patches with "ARM: dts: " as prefix

Right, they slipped in after I had already written the commit message.

Kevin, Neil, let me push a V2 so that I can fix the commit messages.

> >  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
> >  arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
> >  arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
> >  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
> >  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
> >  7 files changed, 3 insertions(+), 7 deletions(-)
> > 
> > --
> > 2.19.1

Cheers,

--
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
