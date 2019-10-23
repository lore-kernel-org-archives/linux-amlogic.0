Return-Path: <SRS0=Dnil=YQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E319ACA9EB9
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2019 12:58:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E41821906
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2019 12:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XNtSkH/G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZPB2IwX5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E41821906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uuHauAR1SPQVAve3mJgv1CPiW1a5NtbynU0vP6dew04=; b=XNtSkH/G1E+8rEM4t2ZrnNj9cU
	+xFHj0oLyte8VHpst6JLDl/OD8AzWpSjk5P+3om2ZhuA3U8jENbk/JvsYWiCV36e3cASj3lK4vlqq
	t+6g71kuB8+nshP8pNsNMimvQkhYHk4szIMpYpVF3a21SmtGMWGReBoVYU/r1L3K2Lq75fuxabNJ/
	5ttg+NlARXTDwoz6E+BtRtHp9L7b1DkMVuuejHzIfhEL9gOH2wzmr9gjIifPrvU41FklJYc0Vclpg
	97/1oA5Kbr6g0LMWpqYt0lnnfRo38XAPFhE9MovsXaq2tpWs/BBzciV+QMiJupYeWT8e+rabyRedT
	9AbXdcIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNGDk-00067S-EP; Wed, 23 Oct 2019 12:58:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNGDh-000649-IL
 for linux-amlogic@lists.infradead.org; Wed, 23 Oct 2019 12:58:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id v3so6282498wmh.1
 for <linux-amlogic@lists.infradead.org>; Wed, 23 Oct 2019 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=LPwRM5SkXWTw1iz0OjlwN2KREKzgEFscadlMI1wPDW0=;
 b=ZPB2IwX5HOazqNIIwS1xuTBbA+AmiG3aY4vZ58AJpEMoyBhzjUwpHL6BHCj7oqBTMv
 E9rBSjGVUNlWSoNQH4rzvJAh5WFSSqVO67B/ib4CgrWZiK6eftbfKW0eHWO8NklXyg2D
 kbr9oo9zTKO5S0qusGbhrDBTJkJMARjEtz5aUd4WcldnEMGYus75S1axmmG1RLLeUPrc
 qxQne30qVmKM0Om6cLO34du0AA6wZQ/BNujxh4SNJzCfF0vjzGDE+T/aVPXvP1vp6VeK
 UHE8mJ/k2wo7qaqii9Ysw6yn9hlxB38xkHswaclEhXVK/5QaFQnT+2IM3obLdcNue9nj
 r19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=LPwRM5SkXWTw1iz0OjlwN2KREKzgEFscadlMI1wPDW0=;
 b=NbYeCg8qtpOYzt+PkAB8vCt5U+i5c+2Xc64tb/OL9ZijnUDwb7Dz1YIWICfeoFym7t
 KXFGpibUr512FQb93ORyCn8dtrXYkaTWIeik3GDTwkWHlPlJFjyNMdEay2osu1drijxR
 KemyKgcsB15vvlUWDS32e26QcUE9G65Gx/tWWf+vM+4X1U+0GkCJ9KUvIAqQsWFjVzLA
 j0cDPwsPgfHmG5ehtsx8rIsPlpymbTZvf3UaZut9sKHTLxQaFixT5k8a/E9vj6iGu8AP
 vaGAro+4d0gFR2wqkg6gvsM5hVJ19XwKIrclWU3HM8qBp5+JzXkz/zkAZbuHsyJMhvFp
 ZpRQ==
X-Gm-Message-State: APjAAAX66Fn7ngSVcQOvvBUXwagFoGDNHD2g3tAn/oNtrDi2LMujkFHs
 vroVqjFrJ5BHdkD3miQEu+INB9nGinM=
X-Google-Smtp-Source: APXvYqywg2S9jhWSpoqOwVWViWWqnSo8imGRG7G2PLFS19YVBwtNMBZCrjdmF62eeLsIl1tDrAHmTg==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr7952882wml.170.1571835511464; 
 Wed, 23 Oct 2019 05:58:31 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a186sm20669867wmd.3.2019.10.23.05.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:58:30 -0700 (PDT)
References: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
 <1571050492-6598-3-git-send-email-qianggui.song@amlogic.com>
 <1j4kzzvnrr.fsf@starbuckisacylon.baylibre.com>
 <4e4aa76e-d315-2b99-91f4-6667eb5221e7@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/4] pinctrl: meson: add a new dt parse callback for
 Meson-A series SoCs
In-reply-to: <4e4aa76e-d315-2b99-91f4-6667eb5221e7@amlogic.com>
Date: Wed, 23 Oct 2019 14:58:29 +0200
Message-ID: <1j1rv3vcsq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_055833_671342_8039F6D5 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin
 Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 23 Oct 2019 at 14:33, Qianggui Song <qianggui.song@amlogic.com> wrote:

> On 2019/10/23 17:01, Jerome Brunet wrote:
>> 
>> On Mon 14 Oct 2019 at 12:54, Qianggui Song <qianggui.song@amlogic.com> wrote:
>> 
>>>
>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>>> index 8bba9d053d9f..e8f6298fc96a 100644
>>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>>> @@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>>  	return 0;
>>>  }
>>>  
>>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>>> +				 struct device_node *node)
>> 
>> This function is the fixup for the a1 family, AFAICT.
>> It should be named as such and it belong in pinctrl-meson-a1.c
>> 
>> Every controller performing fixups should have their function as well:
>>  (1) AO of gxbb, gxl and axg 
>>  (2) AO of g12 and sm
>> 
> OK, Will try to move this function to pinctrl-meson-a1.c. That should be
> better than rewriting parse function for each chips EE/AO alone.
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = meson_pinctrl_parse_dt(pc, node);
>> 
>> As said in previous review,  meson_pinctrl_parse_dt() should be called
>> for every SoC to parse the *available* regions.
>> 
>> The fixup, if necessary, will be done by providing a callback
>> 
>> IOW, please:
>>  * rework meson_pinctrl_parse_dt() to only parse the avaialble region
>>  * don't call meson_pinctrl_parse_dt() from the extra function
>>  * provided the extra function for the AO controllers of the other SoCs
>> 
> That means I need to move not only ao fixup but ds to extra function for
> old chips do not support this.But it will touch other Socs, should I do
> this in A1 pinctrl patchset? or do this rework in another patchset.

I don't there any problem doing in a single patchset.

For example, you can make a first that does the rework for the older SoCs
and add the "extra" mechanism then another one adding A1 support

>>> +	pc->reg_ds = pc->reg_pullen;
>>> +
>>> +	return ret;
>>> +}

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
