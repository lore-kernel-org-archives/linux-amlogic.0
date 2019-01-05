Return-Path: <SRS0=wai9=PN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FC6C43387
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jan 2019 16:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEA72087F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jan 2019 16:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2XGEejR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqRt4ped"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EEA72087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGKUk+EIeXo3XM3Ib1Q8LDcVoKgpl27J8oUfd5v5tPE=; b=P2XGEejR0OLWfp
	QJOSAGb61hKToqsSqWna+Rnyx5viySKlxLhnB90sDq8o4IqU7+rkfqIQgmwZN4C6I5HqspXARTZVB
	WZ5tx4pUJuV2QhE4UmcU2ouqQA3aiQ+SIODiJnXu0x5Q27H3qXsS7qF6jmfAdQ2QErOYxUWOdjD4q
	pX1yVJXtZ2in0sjLGtS9lY1MK5c+nDZLaigzK9lc6bBZ+SSkrtf1yaelAKAwyifIjbw1mRCtd82Zb
	FruhAwlaZO77u7c7/4jHAywnmz51WwEWiCHEBIOKyW6vYsvQf6398be5HEsuEI6XVGaUcq4ZuijIH
	fPfmqwdpXyisbwQ+Q94Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfozV-0001vj-Bh; Sat, 05 Jan 2019 16:40:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfozT-0001To-0F; Sat, 05 Jan 2019 16:40:04 +0000
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 509102085A;
 Sat,  5 Jan 2019 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1546706401;
 bh=ySrb+rbphNkf3LVkBFKXb5+bZ+pG16+NCn9BcPz+c0U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hqRt4pednMW15qjLV1NdpZWilBWag6MHnC+FOXqFgx5Fi1p0xkDSipIvAckZ/m3Dz
 cxhT5lbzbpQgJ49R0ERzBb+ectmTp4YkAV8Pv5ggOdYUSv41kTSrph55GnN5so5zUK
 6J8sQ1u5v1bYd8OHD6Ha12Allgv3MYRJJUiV4cRk=
Date: Sat, 5 Jan 2019 16:39:56 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: meson-saradc: update
 temperature sensor support
Message-ID: <20190105163956.195752d6@archlinux>
In-Reply-To: <20190103230209.GA21801@bogus>
References: <20181227215020.9803-1-martin.blumenstingl@googlemail.com>
 <20181227215020.9803-2-martin.blumenstingl@googlemail.com>
 <20190103230209.GA21801@bogus>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190105_084003_070253_2BD83FE5 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, balbes-150@yandex.ru,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org,
 pmeerw@pmeerw.net, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 3 Jan 2019 17:02:09 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, 27 Dec 2018 22:50:19 +0100, Martin Blumenstingl wrote:
> > Meson8b and Meson8m2 use a 5-bit wide TSC (temperature sensor
> > coefficient). The SAR ADC registers however can only store (the lower)
> > 4 bits. The fifth (upper-most) bit is stored inside the
> > MESON_HHI_DPLL_TOP_0[9] register from the HHI register area.
> > This adds a syscon property to the HHI register area so a driver can
> > fetch the HHI register map and store the fifth TSC bit in there.
> > 
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt      | 4 ++++
> >  1 file changed, 4 insertions(+)
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
