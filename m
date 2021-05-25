Return-Path: <SRS0=3IHZ=KU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C3C47085
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 07:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955C461417
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 07:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955C461417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kcoJyr0dFhowntnwTHNprRgy8kGtkFecVddTKh2NOdQ=; b=C7DMipdZmlI3TMur9HoqlrE5qD
	rso+FamO7rtPbrPNhhzdkIHR2JaY2CTtkiIHNfFE1DB/9tPiES3wmo2llcbHmzDuvJfOX3WqrDfQm
	U4vC1hnx4r4IE9m81FhPYL8EqCzx5wxtUPHFSivUGQ+zbikunXx5Lv/LznYjbu4Xljt8d1d29eg8T
	fOSNTKywxXKmLXSlMmCHvyp9q2pn5qdTmo3bK/0T815qGQoI88gdWoXFtrcdapg/syH2lWIjFogsR
	dwNzW+UpMlvCdbEtZzog5ymJP2WRJgDLme/Jc9n5yAu3NsOnEWA4bAXi2YRcTVoS231Lr1u0Ctmfz
	Hc1wt4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llRSD-003saJ-7G; Tue, 25 May 2021 07:26:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llRRl-003sRI-Js
 for linux-amlogic@lists.infradead.org; Tue, 25 May 2021 07:25:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so12212917wmh.4
 for <linux-amlogic@lists.infradead.org>; Tue, 25 May 2021 00:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=ZEZhCSQ9uc7mF8AHjrZUH5gfKrJ3JXJlTrw+y889SUA=;
 b=0MtyI7ORZHyejQpBMbsmoHZs4a7igABp5xlbXJ9baaWTVC2DyPgURrJDuABUhyO1F0
 QeSG6jO1PIjsd3vAxfJahaXy76ghL9BrSWozCdgQK2RgiG5QwhAnJd6ffE+f6Fh/Ko2o
 3Fko/k8V+OIxpE/AWWpbLSDFCdJGqYZlDrLrQK1s6SuedlKz2MJXHbWRUclWsHyI0TsK
 u3v1ofn/4HF5ZwOR7I/eMwT6u5HLl+pnrBSvRcwPVdN6bdqDq7XDeSiifo1LlC1p92ig
 WmhSUo5liTi98NUerQXsn0Po4b6i9TYi/7w7YPMnwYkwq6gZrUmOn97vkc2m+pBgQO3Q
 JlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=ZEZhCSQ9uc7mF8AHjrZUH5gfKrJ3JXJlTrw+y889SUA=;
 b=pxYgeFs3/jdyehZdkcLVUrPBzY8XVbB/XMXxetsQXiTR1b9VyU4Yw0tKw3goYJcvS1
 sNa6qx9xWdr/ZOMHAP6o2sy/OTpOSLwE8KZLMtHEQ7hsZG+vcJCGDrvhDGVL7m34i3lK
 YJDR/QoLinxVMLCXMt8Xjo3MZc5xTmkDz57z5EFO5v90z7MB1nhnTr5mHhp4ldCWjDnD
 KcNVxYHManfqtWeLBy8Cxaj2McE1nW34MxUJyERC1YDzeaqwlv6QlORuZZQN7b1753Yw
 zxmqr1mhrIFL4ftK+3xi2Y3ULUXnVIO9y0XTfhllD17iNyrEWkeTiSjYQc0lNfbqJqbk
 YekQ==
X-Gm-Message-State: AOAM533CJqc4Jy0jjPyuk/yryvOkbXwIo3uf20D8PHP9qsV6BBKRsHeG
 +U1fZo7sMhUx8dxw7bl+ZMmEvQ==
X-Google-Smtp-Source: ABdhPJxhlteZuQ+HUmsDQzMPYu1gVw/NLhbHKMk2/ryWg5lxPizaWGte9GeVZfA7ZL9JogTA3irSYg==
X-Received: by 2002:a1c:e40b:: with SMTP id b11mr2468708wmh.123.1621927548149; 
 Tue, 25 May 2021 00:25:48 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id d141sm10158766wmd.21.2021.05.25.00.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 00:25:47 -0700 (PDT)
References: <20210524165136.400702-1-jbrunet@baylibre.com>
 <9f21272719a3983bda647147e8460615159875b1.camel@perches.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ASoC: meson: use dev_err_probe
In-reply-to: <9f21272719a3983bda647147e8460615159875b1.camel@perches.com>
Message-ID: <1jh7irb7gk.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 25 May 2021 09:25:47 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_002549_687768_064EDCC2 
X-CRM114-Status: GOOD (  11.83  )
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


On Tue 25 May 2021 at 02:07, Joe Perches <joe@perches.com> wrote:

> On Mon, 2021-05-24 at 18:51 +0200, Jerome Brunet wrote:
>> Use dev_err_probe() helper function to handle probe deferral.
>> It removes the open coded test for -EPROBE_DEFER but more importantly, it
>> sets the deferral reason in debugfs which is great for debugging.
>
> trivia:
>
> It seems that the use of %ld, PTR_ERR(<foo>) isn't particularly
> useful now as dev_err_probe already uses %pe to emit descriptive
> error messages.

Indeed. I'll update. Thx for pointing this out.

>
>
>> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> []
>> @@ -352,17 +352,16 @@ int axg_fifo_probe(struct platform_device *pdev)
>>  
>> 
>>  	fifo->pclk = devm_clk_get(dev, NULL);
>>  	if (IS_ERR(fifo->pclk)) {
>> -		if (PTR_ERR(fifo->pclk) != -EPROBE_DEFER)
>> -			dev_err(dev, "failed to get pclk: %ld\n",
>> -				PTR_ERR(fifo->pclk));
>> +		dev_err_probe(dev, PTR_ERR(fifo->pclk),
>> +			      "failed to get pclk: %ld\n", PTR_ERR(fifo->pclk));
>
> here.
>
>>  		return PTR_ERR(fifo->pclk);
>>  	}
>>  
>> 
>>  	fifo->arb = devm_reset_control_get_exclusive(dev, NULL);
>>  	if (IS_ERR(fifo->arb)) {
>> -		if (PTR_ERR(fifo->arb) != -EPROBE_DEFER)
>> -			dev_err(dev, "failed to get arb reset: %ld\n",
>> -				PTR_ERR(fifo->arb));
>> +		dev_err_probe(dev, PTR_ERR(fifo->arb),
>> +			      "failed to get arb reset: %ld\n",
>> +			      PTR_ERR(fifo->arb));
>
> etc...


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
