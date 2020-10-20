Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E1EC4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:00:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E16F2225F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ArETq2wE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q6P2TcP8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E16F2225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XtbGdZbxBaLe6I/RuEOwbQO7+Bd1CnjI+vTTw6n3CZ8=; b=ArETq2wESAtDybUiZ4hoS+TY6
	4pnvDjiH2XkR5XpmP++S36BgLWYfYa5vHUzI9uxU6AT/TOKmewDwli2O/GlQd0198qReZmqOPL5KT
	ml9US7yb/euWHEK9ZwirBD9CTVpdP7wvmPasSGbTROpmxcInmZgIignK4yxfDSRzCNEuwWdee0bGZ
	+CcRvdA48Tf7JqEGFzZK9TJrWplCXB9M7gEOk/9IQykuW1xI0qh0FillTIRPa6hj2r4ud5h5Sae3a
	f6T3N7HOVHCC8QH4tJ0JwusA/I/et94V6lxRsgB8P7dNUZstaOlw+MgG851GkS8RSe7MnX+IBuhDm
	ktTPQaqsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUykF-0008AT-SB; Tue, 20 Oct 2020 21:00:35 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUykE-00089j-3D
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 21:00:35 +0000
Received: by mail-pj1-x1043.google.com with SMTP id kk5so1070655pjb.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ehJTgQK+jvHaWoYT/Sgm6HAaNherPc/KXjHhyZ957G8=;
 b=q6P2TcP8lhBHHpIq67nl9e4koJ1gaagX1jdYnAiLPclTmOisOLMYU+CE7u3IZRZvo5
 t3Htc1MQlQWrclXlIk/JwVv6HHJqeNpelSw+eZpteaAbUKYanU+e7EKgMF2nqu5dY6Y+
 6zz39Rk3XPvvqRlxYvLnFA3gcmWn9N9hw/0rRRqSvevYYwaEs2D9F7MwXlGfejCnSjAn
 mMtZ9qoIneO+IrHh2T8K5uzb90WgwLaV0eYmHeVB8Rd72PXLOGWreGIMo95blAcILz7W
 27Db5JV5jtrAE3gxC1VoEXfw8c4RI1KhpLL5jkQtwwCkXYhc8TEYt+0bcTWPB0vjXtIW
 90kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ehJTgQK+jvHaWoYT/Sgm6HAaNherPc/KXjHhyZ957G8=;
 b=jFUlyJde0MB7QsovHiC4AWKiWlJO9OfI9icQwLclBliopqwx6BdVMn27wgyy+wXfM2
 I7nRF9BpRjYN5TGps/0TZyS8q61yVEas3armE8592e6ATy1WEXnKKPSU5VvSTodnb1Wj
 a9vkcah2BFJ6GWtdEnTnfKaKpaNVF1xN6iucE5c4LmKWqdSHamBFZvi/RLnNT5ZwzkXd
 q8tlah1uk1OAaXU7gxq9+1kW3/be7G7zGD3uqkZR9uKnGPM3Z/uPU//yLNrbiGA/s1b9
 8r3RnKsoletcUlLIydrP9G6v3FUVHaMA/VdLjCrHZ0Sj10hMGhPgbtE/CZO0ZD4PQY+3
 /6xg==
X-Gm-Message-State: AOAM5327DPbEOaBoZs7bHfAXEUBKkQ5IC21nCfxFfH3XQXXvCIHEYqS9
 5mXO+hddrnOsegR8xWYPsOaQnw==
X-Google-Smtp-Source: ABdhPJwz4EtlYE+QMTKTa9kMc0Jd4XV7TkBTC+xltGTf7r4iWnuUjJ7nOLgAPGKYENLBYC4It4Y/BA==
X-Received: by 2002:a17:90a:6a4f:: with SMTP id d15mr18936pjm.80.1603227631674; 
 Tue, 20 Oct 2020 14:00:31 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i126sm2975641pfc.48.2020.10.20.14.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 14:00:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] soc: meson: enable building drivers as modules
In-Reply-To: <CAFBinCAXcmnbzuQg4syZiDM0jvivHpiPzYYdtGOG1E81QMc3mQ@mail.gmail.com>
References: <20201019224649.14302-1-khilman@baylibre.com>
 <20201019224649.14302-2-khilman@baylibre.com>
 <CAFBinCAXcmnbzuQg4syZiDM0jvivHpiPzYYdtGOG1E81QMc3mQ@mail.gmail.com>
Date: Tue, 20 Oct 2020 14:00:30 -0700
Message-ID: <7hpn5ck3yp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_170034_187085_CA418C55 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Tue, Oct 20, 2020 at 12:47 AM Kevin Hilman <khilman@baylibre.com> wrote:
> [...]
>> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
>> index 5fb29a475879..2dfcb7b6e664 100644
>> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
>> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/power/meson-a1-power.h>
>>  #include <linux/arm-smccc.h>
>>  #include <linux/firmware/meson/meson_sm.h>
>> +#include <linux/module.h>
>>
>>  #define PWRC_ON                1
>>  #define PWRC_OFF       0
>> @@ -193,6 +194,7 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>>         },
>>         { /* sentinel */ }
>>  };
>> +MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);
>>
>>  static struct platform_driver meson_secure_pwrc_driver = {
>>         .probe = meson_secure_pwrc_probe,
>> @@ -201,4 +203,5 @@ static struct platform_driver meson_secure_pwrc_driver = {
>>                 .of_match_table = meson_secure_pwrc_match_table,
>>         },
>>  };
>> -builtin_platform_driver(meson_secure_pwrc_driver);
>> +module_platform_driver(meson_secure_pwrc_driver);
>> +MODULE_LICENSE("Dual BSD/GPL");
> This file uses SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> do we need to use MODULE_LICENSE("Dual MIT/GPL v2"); in this case?

Since the SPDX header says GPL2+, I'll change this to:
MODULE_LICENSE("Dual MIT/GPL");

Good catch, thanks!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
