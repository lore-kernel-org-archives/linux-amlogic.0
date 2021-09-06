Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0B9C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 09:24:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E857161051
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 09:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E857161051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCnIJz7ckNhrwO9/xjGY3TFalzoGG/coZhKub3Lq9Mw=; b=nb2rcr+7srfYZX
	Ty1EuFE2Ll+tuuGgi85kggaI4Vw791sOfNlWbh6APEGVswHppw+larKdPuQLJwG6iAnchUu1qgHJ8
	nKrS5bOdOVST3fI1ouNpmEBS5bvh8PHEzHKb+IPoLVRGGRoeyxIYNZWRgxV9U5CqiYDQcJgk7t+vr
	fYup3iX/jmbQhGH+JzowV/JUiIA06ObRX1DYevD8h36IpWXtZu16y2xGbw0HoW0QBH0zfnwn+A5Sw
	vG5vVcJiLrlOdNyMsWiXHklpYM10dp4keMkwOSjnEbg9DuJhYsi5FdgCNIiKXDNtCzTRZEuMbILi1
	jYoj9ShnV04LIA69u8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNArx-000Mtz-L9; Mon, 06 Sep 2021 09:24:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNArt-000Msv-HD
 for linux-amlogic@lists.infradead.org; Mon, 06 Sep 2021 09:24:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id b10so8875918wru.0
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Sep 2021 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=0WNNi3JNxBLCd82GRC70DvYt/axOC47YXAp+RlwhHeY=;
 b=08Bj6eC4ymjS6BQEmD39Bxg8GqwQjVRphNrAAz2pbdcobvVRWsM2moSuk6e6r1CExl
 d8JBygGvoiIXCb7cQTlPOmenxB6Ps8MX3Zz88iSJxc8eaNTKxihqI9JX5UHZiEcbhCKL
 DSDHHrmVX1tCwGCT2K15Iqug+1rdYAwfZAhsMmRw6Gj8zUFxyIH5inry3Pi8VGO+QUzF
 ArCtDa3bhcPmlk01uo9jZhVbBE6n3UkCBIoKcudr//oDkM6pwOdHXkeOE31+ndeRQzeZ
 o5KQskQTmaqrlZ5m9fAc9ZcTOptqgS7ghqXArsbdEi4b1eubE2KVzP6O3/R0VKw2J/ZH
 W/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=0WNNi3JNxBLCd82GRC70DvYt/axOC47YXAp+RlwhHeY=;
 b=ZEBUQQZgEwld/rNkALh0bMplCV8KRRA7aqJVVOLBi/Hojwml6z3XpIslob3l1zEUeK
 mT/mH34NwlVBlGq7dY+A8gDGsrAGpQIxnoWp808zFSg0h/8HH0XVfqji5W4EGBUddrQK
 Y+GVen2PO0W22kh1zhRrsn4MyPSX1sn1A/zW4DQfJCkzEwkSr7wW04/lTR6//eM/tBwP
 ztdtcmJgoe0iPFYskfiOr710RO1NmfCbpbLXoFcfxfaMoNDiFQBZn3BIexOkydckHj8L
 FJr/a0H/7oSc+h9mT0EqjGmn81PqT6sz5wQVk3EGOW8/yJAlVx8kMRL0P1n0LsR9d4gN
 VtuQ==
X-Gm-Message-State: AOAM532myf0HilrJ+SvWc1qFsmh7Pt7gwhKlSLSel1wDUbGU8x4UJ1OC
 Cr2JWpE5yRvBelh3qse/JhAg6A==
X-Google-Smtp-Source: ABdhPJygv4V2vzMRJKeYwz2DtxRgrK4Ik7kDwnaK7Jy9eAlz9GIf435+5UWz63EZSc7/ftnISFsUkg==
X-Received: by 2002:a05:6000:22d:: with SMTP id
 l13mr12081955wrz.410.1630920283228; 
 Mon, 06 Sep 2021 02:24:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x11sm7361820wro.83.2021.09.06.02.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:24:42 -0700 (PDT)
References: <20210812051059.1103641-1-art@khadas.com>
 <247c746b-621c-5db0-25c0-1ef0d0a0d77e@baylibre.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com, Artem Lapkin <email2tema@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: sm1-khadas-vim3l use one sound node
 configuration with VIM3
Date: Mon, 06 Sep 2021 11:18:36 +0200
In-reply-to: <247c746b-621c-5db0-25c0-1ef0d0a0d77e@baylibre.com>
Message-ID: <1jpmtmys2t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_022445_658946_0135B05E 
X-CRM114-Status: GOOD (  13.86  )
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


On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> On 12/08/2021 07:10, Artem Lapkin wrote:
>> Khadas VIM3L board sound configuration same as Khadas VIM3, its already
>> defined in meson-khadas-vim3.dtsi and no need overwrite it with different
>> card names and routing configurations.
>> 
>> Signed-off-by: Artem Lapkin <art@khadas.com>
>> ---
>>  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts     | 13 -------------
>>  1 file changed, 13 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
>> index f2c098143..06de0b1ce 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
>> @@ -32,19 +32,6 @@ vddcpu: regulator-vddcpu {
>>  		regulator-boot-on;
>>  		regulator-always-on;
>>  	};
>> -
>> -	sound {
>> -		model = "G12B-KHADAS-VIM3L";
>> -		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>> -				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
>> -				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
>> -				"TDM_A Playback", "TDMOUT_A OUT",
>> -				"TDMIN_A IN 0", "TDM_A Capture",
>> -				"TDMIN_A IN 13", "TDM_A Loopback",
>> -				"TODDR_A IN 0", "TDMIN_A OUT",
>> -				"TODDR_B IN 0", "TDMIN_A OUT",
>> -				"TODDR_C IN 0", "TDMIN_A OUT";
>> -	};
>>  };
>>  
>>  &cpu0 {
>> 
>
> Jerome could you quickly review this ?

Removing that is wrong.
Take a look at the Loopback sink - it is different between the sm1 based
vim3 and the g12b one ... this is simply because the audio block is
different on these SoCs

So audio-routing property can't go way, Because of that, the cards are
slightly different and should have different model.

However the model name here is
a) probably too long
b) misleading :/ 

>
> Thanks,
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
