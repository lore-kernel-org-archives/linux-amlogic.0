Return-Path: <SRS0=HNkX=7J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EA1C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 May 2020 08:53:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB8A20723
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 May 2020 08:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpzot9nx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jap5XRLq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB8A20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtu3IusdUPw/q8hvc0P2wQzAAkgB7r09mQ1UKNI0ZZ8=; b=jpzot9nxcU5JZU
	lNaiAPZOq+A4dJUvdYd60EndRdB/Iic/qC2AtfMG8N4Fwg78jjil37YqMUhf7ClPCWtjQGBwcHugk
	PXlxgP/C3AStvqm1YdCeTyy83p1b1DSyjTmqhc85IIV3anRL2vZf6SK+9Ik/BPbXBrjLAlSsPmMRt
	qmky1lO8RMtSUY+1ZSzfB+u71gnu8xWW84BDaMZue0r4JoWTBb1WX4+iWFEQNhvKs8FeTS9kqg7r1
	+lFgwdbc4SI+lSwxnnuZoMjB8IM2ragtZvrgLrXhaSDTtzpuOQWo7lLXeq67DGpUdIj03HpnvYAGW
	+ihKqWh/e9/bswKvYMzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdroQ-0007hp-EK; Wed, 27 May 2020 08:53:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdroM-0007gx-QF; Wed, 27 May 2020 08:53:20 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AA9F20723;
 Wed, 27 May 2020 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590569597;
 bh=21T7sPdQCrYT7yx27IXVTIKRDL60nkltAXenV63O92M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jap5XRLqUYxuDAD+TFlFFCsHfOP1n3cKaPyUG1wx2aWwZQaFUekRMDW5RX+f7/9nm
 whX6Bap6JcEsdXGAX8+ZaqqRHA3ogx/2NUaGIZYYi9y0L9B8LuYr7f7tH48GfX3we0
 QoWeiz77MD8CnHHgOj5Uo7bFhFlrdURuXiqNDiGA=
Date: Wed, 27 May 2020 10:53:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH for-5.8 2/2] usb: dwc3: meson-g12a: fix USB2 PHY
 initialization on G12A and A1 SoCs
Message-ID: <20200527085315.GA168054@kroah.com>
References: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
 <20200526202943.715220-3-martin.blumenstingl@googlemail.com>
 <40a874eb-1a2b-533e-ee3e-bd90510abaf9@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40a874eb-1a2b-533e-ee3e-bd90510abaf9@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_015318_872025_23C128C4 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: balbi@kernel.org, hanjie.lin@amlogic.com,
 "kernelci.org bot" <bot@kernelci.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, yue.wang@amlogic.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2020 at 10:17:31AM +0200, Neil Armstrong wrote:
> Hi Martin,
> 
> On 26/05/2020 22:29, Martin Blumenstingl wrote:
> > dwc3_meson_g12a_usb2_init_phy() crashes with NULL pointer on an SM1
> > board (which uses the same USB setup as G12A) dereference as reported
> > by the Kernel CI bot. This is because of the following call flow:
> >   dwc3_meson_g12a_probe
> >     priv->drvdata->setup_regmaps
> >       dwc3_meson_g12a_setup_regmaps
> >         priv->usb2_ports is still 0 so priv->u2p_regmap[i] will be NULL
> >     dwc3_meson_g12a_get_phys
> >       initializes priv->usb2_ports
> >     priv->drvdata->usb_init
> >       dwc3_meson_g12a_usb_init
> >         dwc3_meson_g12a_usb_init_glue
> >           dwc3_meson_g12a_usb2_init
> >             priv->drvdata->usb2_init_phy
> >               dwc3_meson_g12a_usb2_init_phy
> >                 dereferences priv->u2p_regmap[i]
> > 
> > Call priv->drvdata->setup_regmaps only after dwc3_meson_g12a_get_phys so
> > priv->usb2_ports is initialized and the regmaps will be set up
> > correctly. This fixes the NULL dereference later on.
> > 
> > Fixes: 013af227f58a97 ("usb: dwc3: meson-g12a: handle the phy and glue registers separately")
> > Reported-by: "kernelci.org bot" <bot@kernelci.org>
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  drivers/usb/dwc3/dwc3-meson-g12a.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > index ce5388338389..1f7f4d88ed9d 100644
> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> 
> [...]
> 
> Fixes regression reported at [1] on SEI510 board based on Amlogic G12A.
> 
> Felipe, Greg, can this be queued on uxb-next for 5.8 ?
> 
> Acked-by: Neil Armstrong <narmstron@baylibre.com>

I can take this and patch 1/2 here if Felipe acks them.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
