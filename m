Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F18C27C4F
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Jun 2024 19:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgf5IYAaXcBmep+8W+bNY1/jv46KwJH8bY2V4TV9GpI=; b=VZvJNNcRcfiE3E
	v3HD7YShzR1PvVFGPacKqkxITTvfkfuPPyrgHJhAW5PKjoTEG3uyky/MSkahQyBaRS8DBLBsHrgwA
	4bjL2uzVAArQfGPCrCT8GyV50rpkPigqJqswTcc2hTZUpUf0XexTPBh8dttJYb0nOFRDH/gli2aTW
	v6H/3lIrY7px4cJzGLZYZJEaooI0duR07xgeBZyTUZUGiyAnutLIT0yitewqZKd23GDWfcMZHtNE1
	kynpmQNwtULj/vkWUdHKIocHKI2BadlNhXnDXhDyr1/83c5QcLzw0vQvqWVxTwi6GmzNHsXX7Ngii
	Gm3fntekIKgQQ7Qgl5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNdiz-0000000GrJt-44uE;
	Sat, 29 Jun 2024 19:27:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNdix-0000000GrJR-2wPt
	for linux-amlogic@lists.infradead.org;
	Sat, 29 Jun 2024 19:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF5ED60ACB;
	Sat, 29 Jun 2024 19:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398E0C2BBFC;
	Sat, 29 Jun 2024 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719689222;
	bh=5KGeK61hekuM2DL4N6jka1C8+Duo42iFnEkFlYpnIpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dnfyZREM0d9EjHczaxm7+jr4aTjM+8EeWwXp9f1+sV2WCzKWJ8TVXOCD5cMjlczJw
	 xChe8Rfq/zaLEI4S4uG68PKMyR7gjxFu/jcZFboP8C3Vyn+3xBOUp5AYo0GvrgEM8P
	 /H8+5ghHehX4bes9RVBT61bsVWO75+bQK9Ai6AN9W3UOrmFCGh9CoSSOkuhcVtjFhF
	 6Q16GDmAPNYjJIZyn36YZamA349hlCns3Dj+IQh6xEiiQdM7fAGhJ4AOdV2prNEzKB
	 oL+Y7SUwsjKyQFN/v99++8omYK+a4KRJAS2kAvPh8j9e53+iIygHUljN86EhgHTVFa
	 rgCGk1F0mqOPg==
Date: Sat, 29 Jun 2024 20:26:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] iio: frequency: add amlogic clock measure support
Message-ID: <20240629202653.7285acb5@jic23-huawei>
In-Reply-To: <1jr0clgdpt.fsf@starbuckisacylon.baylibre.com>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<20240624173105.909554-3-jbrunet@baylibre.com>
	<04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com>
	<1j4j9hift4.fsf@starbuckisacylon.baylibre.com>
	<190ccd62-0803-46fa-87ee-0f9cef5a784e@baylibre.com>
	<1jr0clgdpt.fsf@starbuckisacylon.baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_122703_915880_6F6045FD 
X-CRM114-Status: GOOD (  36.73  )
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

On Tue, 25 Jun 2024 18:59:58 +0200
Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Tue 25 Jun 2024 at 09:52, David Lechner <dlechner@baylibre.com> wrote:
> 
> > On 6/25/24 3:31 AM, Jerome Brunet wrote:  
> >> On Mon 24 Jun 2024 at 17:51, David Lechner <dlechner@baylibre.com> wrote:
> >>   
> >>> On 6/24/24 12:31 PM, Jerome Brunet wrote:  
> >>>> Add support for the HW found in most Amlogic SoC dedicated to measure
> >>>> system clocks.
> >>>>  
> >>>
> >>>
> >>>  
> >>>> +static int cmsr_read_raw(struct iio_dev *indio_dev,
> >>>> +			 struct iio_chan_spec const *chan,
> >>>> +			 int *val, int *val2, long mask)
> >>>> +{
> >>>> +	struct amlogic_cmsr *cm = iio_priv(indio_dev);
> >>>> +
> >>>> +	guard(mutex)(&cm->lock);
> >>>> +
> >>>> +	switch (mask) {
> >>>> +	case IIO_CHAN_INFO_RAW:
> >>>> +		*val = cmsr_measure_unlocked(cm, chan->channel);  
> >>>
> >>> Is this actually returning an alternating voltage magnitutde?
> >>> Most frequency drivers don't have a raw value, only frequency.  
> >> 
> >> No it is not the magnitude, it is the clock rate (frequency) indeed.
> >> Maybe altvoltage was not the right pick for that but nothing obvious
> >> stands out for Hz measurements  
> >
> > I'm certainly not an expert on the subject, but looking at the other
> > frequency drivers, using altvoltage looks correct.
> >
> > But, we in those drivers, nearly all only have a "frequency" attribute
> > but don't have a "raw" attribute. The ones that do have a "raw" attribute
> > are frequency generators that use the raw attribute determine the output
> > voltage.
> >  
> >>   
> >>>  
> >>>> +		if (*val < 0)
> >>>> +			return *val;
> >>>> +		return IIO_VAL_INT;
> >>>> +
> >>>> +	case IIO_CHAN_INFO_PROCESSED: /* Result in Hz */  
> >>>
> >>> Shouldn't this be IIO_CHAN_INFO_FREQUENCY?  
> >> 
> >> How would I get raw / processed / scale with IIO_CHAN_INFO_FREQUENCY ?
> >>   
> >>>
> >>> Processed is just (raw + offset) * scale which would be a voltage
> >>> in this case since the channel type is IIO_ALTVOLTAGE.  
> >> 
> >> This is was Processed does here, along with selecting the most
> >> appropriate scale to perform the measurement.
> >>   
> >>>  
> >>>> +		*val = cmsr_measure_processed_unlocked(cm, chan->channel, val2);
> >>>> +		if (*val < 0)
> >>>> +			return *val;
> >>>> +		return IIO_VAL_INT_64;
> >>>> +
> >>>> +	case IIO_CHAN_INFO_SCALE:  
> >>>
> >>> What is this attribute being used for?  
> >> 
> >> Hz
> >>   
> >>>
> >>> (clearly not used to convert the raw value to millivolts :-) )
> >>>
> >>> Maybe IIO_CHAN_INFO_INT_TIME is the right one for this? Although
> >>> so far, that has only been used with light sensors.  
> >> 
> >> I think you are mixing up channel info and type here.
> >> I do want the info
> >>  * IIO_CHAN_INFO_RAW
> >>  * IIO_CHAN_INFO_PROCESSED
> >>  * IIO_CHAN_INFO_SCALE
> >> 
> >> I want those info to represent an alternate voltage frequency in Hz.
> >> I thought type 'IIO_ALTVOLTAGE' was the right pick for that. Apparently
> >> it is not. What is the appropriate type then ? Should I add a new one ?  
> >
> >
> > The documentation at Documentation/ABI/testing/sysfs-bus-iio explains
> > what the combination of a channel type and info means.  
> 
> Oh missed that, Thx
> 
> >
> > For example, out_altvoltageY_raw is defined as it used for the frequency
> > generator case that I mentioned above. in_altvoltageY_raw is not defined
> > which means probably no one has needed it yet. But it would still be the
> > voltage value, not the frequency.  
> 
> Got it. So the type I picked is wrong for sure.
> So, maybe I need something new to measure a frequency ?

Yes. Seems likely we need a new channel type to me.
In theory we could abuse an angular rate channel but that's nasty so
lets not do that. :)

Jonathan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
