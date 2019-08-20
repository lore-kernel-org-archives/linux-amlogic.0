Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5854C3A59D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 15:58:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B81522CF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 15:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L/ZAVlOW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GS9g6xF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B81522CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0SpKLrN1eqYXIWG5/+5UuwhrLtHK/8uf0JuOGMqgDQ=; b=L/ZAVlOWMR8z+2
	MtpxnPmRi9KNevrC+09joipPZYX3hKW/vGW5ECw0EKyFc2LJXOnKYvOUbn19Z0scjHONsmQ/uneCN
	/K0QEmwu586XPu3OxWQZNSrg5E72B3oMtrcC8Y7l8KdenOhSRfv/odr/82BqnSaZP1Fv/TuBo/voZ
	lHUN6PGdbCTU40udCABGCedIHdMOyWjsnlh1L51A7pqiSZUodw//AAPeGQn+Ddid7vrGHkALw72hb
	WLFYYIHIPJs/FDEUjPEcR3nXGBT+WtCkdoK+1AKBqIjho0T46wp02+3bZOTfJIRLGcfsYE5NO6GpY
	kOZux8vHFekkyWvaxb2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i06Wg-0008Lz-ID; Tue, 20 Aug 2019 15:58:26 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i06WL-0007v8-0A
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 15:58:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id f72so3070186wmf.5
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1/YmrgEPUrwGQtAezrJUQUWG/f9Upi15vWYJgMwCPLc=;
 b=GS9g6xF7veKyWTADssGe9mR5DQi4JssJTUPczrOxNyJ5W3gN8tL1gXdGYtR2dXlUEf
 K78u/+/wLhYnW9UV4Hm0s60p4um2xMVZdJx06VnQEhjXDcA8ZJgdWhX2QQoEeUqvF54y
 tQ/h/5muYtc2+N15fjsXrc05/orwtJV8UL87CxiZ6rra9AYU8U1GjRrOdq8JGPmgKIzM
 HZJPU26BAoPtOz7PKMgXweSVGEBWt2t9f81i1knIv7F4g/V/k2JXm41BPfPJB/OS9Ggl
 Ji2tLzlg5pZ3qHRLQnYG9rvcsNrBs60Z5kQvGMntbxEzU1Qex6bEnPTfHN1rmU8FCvMu
 TjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1/YmrgEPUrwGQtAezrJUQUWG/f9Upi15vWYJgMwCPLc=;
 b=VPR86gEr9eWrNdDn+qt4Fb2QKGUkfalaubrZa3vcEVOaKaztMY556ZB6Cua3ievOyU
 iEzDGWYJ8alhOkMA6NOScVbJ+Zw2wo/+6CkYvSND2Ke81YIvtUTAqrRoeuIgqTFI1MiR
 i1p5iEvGbaaniwox9YYou3iDo55t3ZH7v6Wwb7wyWGefMrQoxnBOs7gEWT8OVixKT0lJ
 LjKkwdpxZB4Hwi/aRrmpP6hIZdplAG8/cLgu2pXinnPtwnJ2w2Hv3bCycAW5X5Kyx4t0
 ugAFLTMb0D5Agppg1j0dj62zPKo4FymOBzbKGX3N/YBpyVkQDMyfbRZ6elDG+SgmUPcE
 4exQ==
X-Gm-Message-State: APjAAAXYCXjyzlZ80umXCHqRqk881eR7Jt/+55Oxm21Wsx7YaLv4SHK1
 bmLA+kAdrH8lg7XkW1ZHfRSW4JdtsFk=
X-Google-Smtp-Source: APXvYqxDGXqyR8DBgTsZliBd1x78ESd2JtWImg3i35oBoTeWCwNaoZ722f0+PRCBQCmmgg742+NwwQ==
X-Received: by 2002:a1c:6087:: with SMTP id u129mr731005wmb.108.1566316682808; 
 Tue, 20 Aug 2019 08:58:02 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r4sm13892535wrq.82.2019.08.20.08.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 08:58:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: meson-audio-arb: add sm1 support
In-Reply-To: <1566315581.3030.18.camel@pengutronix.de>
References: <20190820094625.13455-1-jbrunet@baylibre.com>
 <20190820094625.13455-3-jbrunet@baylibre.com>
 <1566315581.3030.18.camel@pengutronix.de>
Date: Tue, 20 Aug 2019 17:58:01 +0200
Message-ID: <1jlfvnomly.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_085805_189136_95CFF017 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 20 Aug 2019 at 17:39, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Jerome,
>
> thank you for the patch. Just one nitpick and one real issue below:
>
> On Tue, 2019-08-20 at 11:46 +0200, Jerome Brunet wrote:
>> Add the new arb reset lines of the SM1 SoC family
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson-audio-arb.c | 28 ++++++++++++++++++++++++---
>>  1 file changed, 25 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
>> index c53a2185a039..72d29dbca45a 100644
>> --- a/drivers/reset/reset-meson-audio-arb.c
>> +++ b/drivers/reset/reset-meson-audio-arb.c
>> @@ -30,6 +30,17 @@ static const unsigned int axg_audio_arb_reset_bits[] = {
>>  	[AXG_ARB_FRDDR_C]	= 6,
>>  };
>>  
>> +static const unsigned int sm1_audio_arb_reset_bits[] = {
>> +	[AXG_ARB_TODDR_A]	= 0,
>> +	[AXG_ARB_TODDR_B]	= 1,
>> +	[AXG_ARB_TODDR_C]	= 2,
>> +	[AXG_ARB_FRDDR_A]	= 4,
>> +	[AXG_ARB_FRDDR_B]	= 5,
>> +	[AXG_ARB_FRDDR_C]	= 6,
>> +	[AXG_ARB_TODDR_D]	= 3,
>> +	[AXG_ARB_FRDDR_D]	= 7,
>> +};
>> +
>>  static int meson_audio_arb_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>> @@ -82,8 +93,14 @@ static const struct reset_control_ops meson_audio_arb_rstc_ops = {
>>  };
>>  
>>  static const struct of_device_id meson_audio_arb_of_match[] = {
>> -	{ .compatible = "amlogic,meson-axg-audio-arb", },
>> -	{}
>> +	{
>> +		.compatible = "amlogic,meson-axg-audio-arb",
>> +		.data = axg_audio_arb_reset_bits,
>> +	},
>> +	{
>> +		.compatible = "amlogic,meson-sm1-audio-arb",
>> +		.data = sm1_audio_arb_reset_bits
>> +	}, {}
>
> Only slight preference, I would keep the sentinel on a separate line.
> Your choice.

Agreed.

>
>>  };
>>  MODULE_DEVICE_TABLE(of, meson_audio_arb_of_match);
>>  
>> @@ -104,10 +121,15 @@ static int meson_audio_arb_remove(struct platform_device *pdev)
>>  static int meson_audio_arb_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> +	const unsigned int *data;
>>  	struct meson_audio_arb_data *arb;
>>  	struct resource *res;
>>  	int ret;
>>  
>> +	data = of_device_get_match_data(dev);
>> +	if (!data)
>> +		return -EINVAL;
>> +
>>  	arb = devm_kzalloc(dev, sizeof(*arb), GFP_KERNEL);
>>  	if (!arb)
>>  		return -ENOMEM;
>> @@ -126,7 +148,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
>>  		return PTR_ERR(arb->regs);
>>  
>>  	spin_lock_init(&arb->lock);
>> -	arb->reset_bits = axg_audio_arb_reset_bits;
>> +	arb->reset_bits = data;
>>  	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);
>
> Since SM1 has two more resets, this needs to come from device match data
> as well, or the last two resets will be unusable.

Absolutely. Sorry about that.
We are still a bit early in process of adding the support for this SoC.

I'll wait until I can do more complete tests to send a v2.

>
>>  	arb->rstc.ops = &meson_audio_arb_rstc_ops;
>>  	arb->rstc.of_node = dev->of_node;
>
> regards
> Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
