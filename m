Return-Path: <SRS0=mZQ9=RM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90542C43381
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Mar 2019 18:06:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5462C20657
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Mar 2019 18:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXF3UaBS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5462C20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jic23.retrosnub.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewDpRTrmnHa0oJQY7sp9eiJqw6hCVHvlsDAvD8GzN18=; b=iXF3UaBSUCVs65
	52yoT0j9T0jNvqFMNh9viOnxUawfSIgEepIwCyEQPiiRI/q7/IoYa7L8MRC6VbKN0y0ZWFkqqt5Mp
	uSymC25Xe8Da4I62KIlWyV4nitCQIaKlmAD72Jh3o2BGIeHH8u14LFn77MRmCd+WLg+2XT1Dma6yM
	gsDUuLBVT6kVFsFepbiZg9EoYkYLIDpBdCS5HkAl2TwzmdglfReF0AlQsGQnlXD6dFn35xCPKD/3U
	Lb6H1R3Q76kipP7l7uPnr7Fuu4/YFZs1153c6xvoUFRIZDx0SPwXl0HivsePaxH+ATbLRyrSd7hxT
	Wrbw7/LUxK4DJtyNsbjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2gM4-0000Yf-Fs; Sat, 09 Mar 2019 18:05:52 +0000
Received: from saturn.retrosnub.co.uk ([46.235.226.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2gM0-0000Xn-D9; Sat, 09 Mar 2019 18:05:50 +0000
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148]) by saturn.retrosnub.co.uk (Postfix;
 Retrosnub mail submission) with ESMTPSA id 8BFBF9E749C; 
 Sat,  9 Mar 2019 18:05:38 +0000 (GMT)
Date: Sat, 9 Mar 2019 18:05:35 +0000
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: document the Meson G12A support
Message-ID: <20190309180535.070a82de@archlinux>
In-Reply-To: <CAFBinCA_bGFDOA5sLt26z++=LCtD_3xuaChQWDYJY2D0s2nHZQ@mail.gmail.com>
References: <20190304111217.882-1-narmstrong@baylibre.com>
 <20190304111217.882-2-narmstrong@baylibre.com>
 <CAFBinCA_bGFDOA5sLt26z++=LCtD_3xuaChQWDYJY2D0s2nHZQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190309_100548_576554_C57282A7 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 5 Mar 2019 22:01:38 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On Mon, Mar 4, 2019 at 12:12 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > Update the documentation to expicitly support the Meson-G12A SoC.  
> typo: explicitly
> 
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>  
> apart from that:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to the togreg branch of iio.git and pushed out
as testing to be completely ignored ;)

Thanks,

Jonathan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
