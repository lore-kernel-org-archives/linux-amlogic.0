Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA9F483ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbOC1TOXrFQ9+RglvzOiYiIHARp5BMzKKXPqfk0ini4=; b=HHBJE+/3empTOY
	tq1oBPvm4GN0ljAsh0H9Xao6VOGokdWLG1D0NUxQpMVQ5tl+q7qBsRgxGA7u8aQzNwtK2XnPcb5ZD
	b6LSPVo93cUvZYWbgUnrUS26Zk8d2CpzZfRNO5j2H67keqtehupNEHGD4d35E2KSfaRl9DFN0L5Mr
	JJO5jr4GCo068VjWVLfx9OYbNu9oI92NPWfi7pVLpcRttiRckXdrmGCyCc/E9AA5wjdvZIdshNyd+
	wfOWJWHGEgpj8Q9h3Uj5gNow9XHauB8Up5lX+Aye2iX7eXb22tyRA153QJNd4lFj/K4l5qmjLYm5O
	dKBH1Vrf+Rr2DDdHPADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lWV-0000000HXDp-0szd;
	Mon, 23 Mar 2026 20:05:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lWU-0000000HXDd-0qdQ;
	Mon, 23 Mar 2026 20:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F598600AC;
	Mon, 23 Mar 2026 20:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FC2C4CEF7;
	Mon, 23 Mar 2026 20:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774296313;
	bh=UZ9ChSt7XSFj5XUt7xiPIRnO4bztL5/cVzJffKBGDwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c0ZNdUlTt1+GePDysp0DSARn/iM2OTvuKxvIdQGh9IDA4QS2WQzHYU37aoaFaR6ac
	 BVAYp0koYuwLVZ0jULgRwbaxC2sbvY6e3SiY9HLLpFxgYNhpdWdbHpK9CC1w6AkvJ0
	 K/Dy6MMAzSo0Taqmqxwnz6zQzrgxMuKu28gA1BoJTpL/BdVq/R5utrLgFO58qsx8T0
	 PLAy8ItkRiyc3gjlnEcTheeYEtYlvlOiWNX0HPiHtfd/mClH+2aGiyuL6rllIM8BD4
	 KdNexGiGIanUM3yrGGllm4FAusSstNJDJpjt290u32hsbsjN6osd/3wq8JqnuLOMk6
	 vfHAnc28BW3ow==
Date: Mon, 23 Mar 2026 20:05:01 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jbrunet@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] iio: adc: meson-saradc: add support for Meson S4
Message-ID: <20260323200501.6c116226@jic23-huawei>
In-Reply-To: <20260323-quizzical-striped-husky-68e24e@quoll>
References: <20260323013408.429701-1-nick@khadas.com>
	<20260323013408.429701-3-nick@khadas.com>
	<20260323-quizzical-striped-husky-68e24e@quoll>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Mon, 23 Mar 2026 08:54:21 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Mon, Mar 23, 2026 at 09:34:06AM +0800, Nick Xie wrote:
> > Add support for the SARADC found on the Amlogic Meson S4 SoC.
> > According to the documentation and current testing, it is fully
> > compatible with the G12A parameter set, so we reuse
> > `meson_sar_adc_g12a_data` for this new compatible string.
> > 
> > Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Signed-off-by: Nick Xie <nick@khadas.com>
> > ---
> >  drivers/iio/adc/meson_saradc.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> > index 47cd350498a0d..3ac48b7842c4f 100644
> > --- a/drivers/iio/adc/meson_saradc.c
> > +++ b/drivers/iio/adc/meson_saradc.c
> > @@ -1313,6 +1313,11 @@ static const struct meson_sar_adc_data meson_sar_adc_g12a_data = {
> >  	.name = "meson-g12a-saradc",
> >  };
> >  
> > +static const struct meson_sar_adc_data meson_sar_adc_s4_data = {
> > +	.param = &meson_sar_adc_g12a_param,
> > +	.name = "meson-s4-saradc",
> > +};
> > +
> >  static const struct of_device_id meson_sar_adc_of_match[] = {
> >  	{
> >  		.compatible = "amlogic,meson8-saradc",
> > @@ -1341,6 +1346,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
> >  	}, {
> >  		.compatible = "amlogic,meson-g12a-saradc",
> >  		.data = &meson_sar_adc_g12a_data,
> > +	}, {
> > +		.compatible = "amlogic,meson-s4-saradc",  
> 
> The point of compatible devices is to not add such entries. Drop.
It's used for naming in the userspace ABI which is supposed to reflect the part number.
I don't hugely mind the names reported showing the compatible part.

Jonathan

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
