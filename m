Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C36C77B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHSXQrgN/21NgiviVjgaxp/gCoSOonCoGgoXvCzou+s=; b=1mv1U0LYax67xt
	0HtNVeh6IT0lN+CPEHYyc9uR2io/yXkc5kprKIlJdr/bstlQjgA98rjiKvfkYLo1bMKKfVMfhJkEC
	CcNknpGpxlqhT7ga2EOUwB7ckRBWFlv9rpQAvocsYLAsJYHR9YNmMsxXanTeLFxlwG9uZDHj85nTD
	wq9uX4YqOqTSFDQhFAFA+Eoso2ZRsLnEDNYRxoJ2H+eJytUFJQdwKf4Eizf+pOtq63L9J2vx74zaD
	e9Qzx11mAhcHyIK7mb1TuP14yFgp5dikcKE9G0AcUb5ITQMZYPXKWUKuKtsuMgG9g4JiDPa73kh3q
	6FOggBfwcmmIDeI4cK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82c3-00GgzI-0G;
	Sat, 10 Jun 2023 17:42:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82bt-00Ggxy-33;
	Sat, 10 Jun 2023 17:42:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD30660AC1;
	Sat, 10 Jun 2023 17:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA234C433EF;
	Sat, 10 Jun 2023 17:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686418964;
	bh=PahXCgyPj76KySfEBE99L6HcX3V7pO0Pti25w6elUbg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GAijoixuha5UwXmNzveDG/CArdpP5R3fMR4KZqIHapHWVoalTSdR7ynG7SjFszTGU
	 Tuhw6LFmFSuH+byUFgLEMIh5D1QLlsdp4AOrjqj/Mr33xdoRzhH5XK/V0+fo7Od0xz
	 xdjn0Lg5zBqamZKNwiTpOpB5zUPgL132+Se9iGJpkGOlce+ZNBB6RslUxE1lFvFRfS
	 FQCjcsG0NSndD9SFcph0M+NvyVxCTsxRo03e0Dk14fm+fAfrX8u9OEf3uudDq0/zps
	 K0zeNDpovJBDLn9+eedXInW2+Fas2J9EVIB+uQJqb44LIfYXA5IiHLxjv4rMZaWX6K
	 HQEEx5nHkfcnw==
Date: Sat, 10 Jun 2023 18:59:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: andy.shevchenko@gmail.com
Cc: George Stark <gnstark@sberdevices.ru>, lars@metafoo.de,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, andriy.shevchenko@linux.intel.com,
 nuno.sa@analog.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, kernel@sberdevices.ru
Subject: Re: [PATCH v3] meson saradc: fix clock divider mask length
Message-ID: <20230610185918.7c85b66e@jic23-huawei>
In-Reply-To: <ZH-4qsNcLGiQFiSE@surfacebook>
References: <20230606165357.42417-1-gnstark@sberdevices.ru>
	<ZH-4qsNcLGiQFiSE@surfacebook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_104246_041110_2F81D218 
X-CRM114-Status: GOOD (  21.43  )
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

On Wed, 7 Jun 2023 01:52:26 +0300
andy.shevchenko@gmail.com wrote:

> Tue, Jun 06, 2023 at 07:53:57PM +0300, George Stark kirjoitti:
> > According to datasheets of supported meson SOCs length of ADC_CLK_DIV  
> 
> the datasheets
> 
> > field is 6 bits long. Although all supported SOCs have the register  
> 
> 6-bit
> 
> > with that field documented later SOCs use external clock rather than
> > ADC internal clock so this patch affects only meson8 family (S8* SOCs)  
> 
> s/SOC/SoC/g, and mind the grammar period at the end.
> 
> I believe Jonathan can fix when applying this, no need to resend unless
> he asks for it.
> 
Indeed - done and applied to the fixes-togreg branch of iio.git + marked it
for stable inclusion.

Thanks,

Jonathan

> FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> > Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
> > Signed-off-by: George Stark <GNStark@sberdevices.ru>
> > ---
> > Changelog:
> > 
> > v1 -> v2:
> >     * Update commit message
> > v2 -> v3:
> >     * Update commit message
> > ---
> >  drivers/iio/adc/meson_saradc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> > index 85b6826cc10c..b93ff42b8c19 100644
> > --- a/drivers/iio/adc/meson_saradc.c
> > +++ b/drivers/iio/adc/meson_saradc.c
> > @@ -72,7 +72,7 @@
> >  	#define MESON_SAR_ADC_REG3_PANEL_DETECT_COUNT_MASK	GENMASK(20, 18)
> >  	#define MESON_SAR_ADC_REG3_PANEL_DETECT_FILTER_TB_MASK	GENMASK(17, 16)
> >  	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_SHIFT		10
> > -	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		5
> > +	#define MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH		6
> >  	#define MESON_SAR_ADC_REG3_BLOCK_DLY_SEL_MASK		GENMASK(9, 8)
> >  	#define MESON_SAR_ADC_REG3_BLOCK_DLY_MASK		GENMASK(7, 0)
> >  
> > -- 
> > 2.38.4
> >   
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
