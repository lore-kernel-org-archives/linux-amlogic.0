Return-Path: <SRS0=mZQ9=RM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630AAC43381
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Mar 2019 18:07:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A9520657
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Mar 2019 18:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bTM17SJi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A9520657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jic23.retrosnub.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ng7HgpV0Ag8i/sw+c+QDH43WaWjPB5Nxl+66lwU32O0=; b=bTM17SJiUc9vVv
	99RH3o/zLpSwghnJnQFlMvl30be+JBtsbd9IMO9MLyyt4uoqj6v5Om2w8nR/Dg5/ytx16LETg5rG/
	2fgLR95cU1K5Hv+jpSVMIPem4FhY9iCVpR7ruRejTZUhSIU3ZLikO+2DHZ98qitxv3m0yuXHnSf5p
	ZYoK5mcNcwkRxVqkJeWUh5gfLv+G7PupETjMnY4fao1e4CD5I8E/eVtMzh1fSpFOADyNW/MaC1AQZ
	g+1mxj1gbKk/yTbpyvfzEGh2T8Ya7RS2sBuGwwJk3Wp8FKbXkIcI8yfwZ1WVtYW0vPd0jYQcpBNg7
	X+DjhmjOiwY6HsoD5gJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2gNS-0000se-5A; Sat, 09 Mar 2019 18:07:18 +0000
Received: from saturn.retrosnub.co.uk ([2a00:1098:86::1:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2gNP-0000sG-R0; Sat, 09 Mar 2019 18:07:17 +0000
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148]) by saturn.retrosnub.co.uk (Postfix;
 Retrosnub mail submission) with ESMTPSA id BA0779E7D57; 
 Sat,  9 Mar 2019 18:07:13 +0000 (GMT)
Date: Sat, 9 Mar 2019 18:07:11 +0000
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] iio: adc: meson-saradc: add support for Meson G12A
Message-ID: <20190309180711.08514830@archlinux>
In-Reply-To: <CAFBinCCfEDBcaXt=FBJ8hNwpq1CQ=tuCyXpd6fxHqiEfTwt9Jw@mail.gmail.com>
References: <20190304111217.882-1-narmstrong@baylibre.com>
 <20190304111217.882-3-narmstrong@baylibre.com>
 <CAFBinCCfEDBcaXt=FBJ8hNwpq1CQ=tuCyXpd6fxHqiEfTwt9Jw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190309_100716_007108_539C8109 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 5 Mar 2019 22:02:48 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On Mon, Mar 4, 2019 at 12:12 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > Add the SAR ADC driver for the Amlogic Meson-G12A SoC.
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>  
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> this new compatible string will be especially useful when we want to
> add "buffer" support which was reworked in the IP block with G12A

Good to know. Thanks.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
