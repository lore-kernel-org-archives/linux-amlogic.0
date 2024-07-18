Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE95C3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 07:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:Message-ID
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLYNFIUxTrVY0XmeGursR9Bi7D+peMNf597i+pG/i7M=; b=nQJ5XWFoOLsrL6
	CjnPraAWs/ZJvTBWf4k+PzR9Kiw5MB8A95tWma5Oq6wvZyU0Itu/xN5eykxaX/hf8HQyzGXtJCZFP
	Qe9dfArJCV/9Je6p+2sX/H1muGphPIrV3/tp3DUppqbCEmCaUOavxUoAAwxc99MJneuGMq5vf2d+5
	RIka1VKWvaElEA39TiI/EXly66xFSCZVABgrQKXsifczUK8aK94DErhCdqtEDvAax2GnTLYpFVkIl
	NvXRfmmvT/67ufOIuXNjFWrJJwmMf9LTuJ9fPq461LS7o+JWZVh6gFqFo/hkpGBV92Ia3+gZvz+Fb
	8SemfOgXjasiLSnYpOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULDE-0000000G60v-0C79;
	Thu, 18 Jul 2024 07:06:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULDA-0000000G5zb-2GCT
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 07:05:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4266f344091so3361515e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721286354; x=1721891154; darn=lists.infradead.org;
        h=mime-version:date:references:message-id:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfv35sh3gYQtuyIGmcm2dQB4xPWrXbKxJ/DGyIqTwEg=;
        b=r8TD5teYTiuZcbigqpe5EwyACVb19jcW2cIwDwwZhWWm3NWSJiYIyW6paagxG3NcGx
         worPdID2ERPxYbO2LksWwKlTRkdNWdevgrQpBkGEUuEij69xAjiM1iPy93SnAExF7YMF
         GvS8xY4h97oMgB63H3tMa3kk0jWojrYHtZdv+nTfZxlmTws6C7IqTNyu+gsUnMGv+imQ
         TtkxgxjrUmyfAmayx7yUxQ/g0tkRjWZJ7WZpJRbNYW7LgmZxvnF+VSR6bj5nDdnfs8Qn
         FDQJk/0ayCTqVz/frM10HotPdGJ7pD03KHViI336uWRJBtUEjyo/XGEEpFhOkL3qWDH1
         dtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721286354; x=1721891154;
        h=mime-version:date:references:message-id:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfv35sh3gYQtuyIGmcm2dQB4xPWrXbKxJ/DGyIqTwEg=;
        b=tch/7gf+g1Og/m289AvimF1TJUiANiurKnyh9y/AoTEIceklii8bvIm+6nDk9vrwlr
         E+NDupCM9YRD6WFwnhhxFHRkoVsqToDLNoU0K02xX/yi1npUx6rtVO12a/Mu8uvxRa9I
         FTYDEMjpw2nMmjIv34QeuTua4nWFmA4ETke8O6NBiBzQA5uvblcznXUooI3cdgTwoABu
         fRtXLZx039Tyy2KYZ/cW58k2xh7WAIrt4gHnp4zj3KrWFy3pHlnOQatfANGUZLBl9YgE
         OM5jvAf+OPX+sxXloJJm1JBXP/YQcJJfYlpmmDC73ZYgPnZuaTQv238pL5Wph5qlmJjL
         Umzg==
X-Forwarded-Encrypted: i=1; AJvYcCXGnToHo/AEnEV7x0cYPqvLSVibQPPkFt/lAtjsA74ExNJzDBrLqiCmdFakOHZ1OCsibU8kDQjwx6uYwGC3JK3wfkH+MDy/2FkgA3IZLU2cJNw=
X-Gm-Message-State: AOJu0Yye8wib+ZZwSfcDB98Dd/Oh1inlhZXYl4rrNZXy6IZZETEHJHf9
	pV2nHQNM2u0tGhJKiHAC3CCPdWar2V9eA4alx9v4UtFWH7K//AuhhyyWuwYi81g=
X-Google-Smtp-Source: AGHT+IFTOfM/mQUajELxmAa5WkTAStnDIYPtSa8XPZN2j5zMvI+mGY2wGnKvPVh2ONzOHqDJuGcDdQ==
X-Received: by 2002:a05:600c:1c9b:b0:426:66fb:fcd6 with SMTP id 5b1f17b1804b1-427c2c99bf0mr21833815e9.3.1721286354188;
        Thu, 18 Jul 2024 00:05:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c77efba3sm23784375e9.28.2024.07.18.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:05:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Jan Dakinevich
 <jan.dakinevich@salutedevices.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
In-Reply-To: <7db2d8ae07a9ef1a226dfd08a3f88f8a.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 15 Jul 2024 12:30:21 -0700")
Message-ID: <1jzfqho5pp.fsf@starbuckisacylon.baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-8-jbrunet@baylibre.com>
	<88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org>
	<1jv81cgv4z.fsf@starbuckisacylon.baylibre.com>
	<7db2d8ae07a9ef1a226dfd08a3f88f8a.sboyd@kernel.org>
Date: Thu, 18 Jul 2024 09:05:52 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_000556_716763_E6B06151 
X-CRM114-Status: GOOD (  18.81  )
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

On Mon 15 Jul 2024 at 12:30, Stephen Boyd <sboyd@kernel.org> wrote:

>> >> +int devm_meson_rst_aux_register(struct device *dev,
>> >> +                               struct regmap *map,
>> >> +                               const char *adev_name);
>> >> +#else
>> >> +static inline int devm_meson_rst_aux_register(struct device *dev,
>> >> +                                             struct regmap *map,
>> >> +                                             const char *adev_name)
>> >> +{
>> >> +       return -EOPNOTSUPP;
>> >
>> > Shouldn't this be 'return 0' so that the clk driver doesn't have to care
>> > about the config?
>> 
>> I don't think the system (in general) would be able function without the reset
>> driver, so the question is rather phylosophical.
>> 
>> Let's say it could, if this returns 0, consumers of the reset controller
>> will defer indefinitely ... which is always a bit more difficult to sort
>> out.
>> 
>> If it returns an error, the problem is pretty obvious, helping people
>> solve it quickly.
>> 
>> Also the actual device we trying to register provides clocks and reset.
>> It is not like the reset is an optional part we don't care about.
>> 
>> On this instance it starts from clock, but it could have been the other
>> way around. Both are equally important.
>> 
>> I'd prefer if it returns an error when the registration can't even start.
>> 
>
> Ok. Fair enough.

Actually, thinking about it more I changed my mind and I tend to agree
on 'return 0' which I'll use in the next version.

The initial request was to de-couple clk and reset. I was planning on
having clk 'imply' reset to have a weak dependency. That does not make
sense if an error is returned above. I would have to use 'depends on' and
don't like it in that case, sooo weak dependency it is.

It remains fairly easy to change later on if necessary

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
