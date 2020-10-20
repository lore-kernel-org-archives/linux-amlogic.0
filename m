Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95546C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:44:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2D22225F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KEUYORMj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="s58/7tB+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2D22225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZLXyIihNDEX+ys4NWiGzM6RGOidfDCqXB79kW+XQDpA=; b=KEUYORMjLhB36tjOtdpRa0drt
	zUnrfeO87q8q7GcGDQAG6cl/KUvid7btTrK1Uy0WNL744g8qSdTtnur/S8sbVnDUe7nFEYINLpSpe
	/681CPwtQ+SXZLVRB15FkUQ5rJHMgL1SRDmDdM1NBqmJrKDSxFJHO41qYcRxORd9LWQf32OnCBqQs
	usN5DWn9L4m4XXYjA4yCOoR1ibV1c9+3IPSJ9OVdb7vJ+o5Txxrek3lk/NtE0Vsx4QEuRfZTLH1F1
	M7au41QOClyMRSAZnVdcMvRXy/j/LPGJJZFGeOmThQ1Un9qq148ZHaJk+UoN/2wbZjNaPic5E9qas
	Be4CEPjfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxYf-0002nj-64; Tue, 20 Oct 2020 19:44:33 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxYc-0002mr-Bu; Tue, 20 Oct 2020 19:44:31 +0000
Received: by mail-ej1-x642.google.com with SMTP id o26so502619ejc.8;
 Tue, 20 Oct 2020 12:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UejFXLAUwGSH8601Zu6OOT1x0jb0F2c7x3s+9oz1WE=;
 b=s58/7tB+NgvtwusrdD4BLngVHW11vXJ6fBWAyD8+14MnTYHwc4YNeC3HFsonLcJfUR
 hPcw7oguuWbSu+oG8XpCMMPINIFonB0JLIMeAxYAf/9PRD1WYd3xnrQzn6BA3n2+wtq2
 icnfaAL241XCkLw+IhGXKQ659GDngSt9gMOE+f6Tzx+Vt9VPq9XQt22M/yf1r+KZFLSP
 O77IMESqU6bFQ4keTG15/pSRxFO2zeu+26y5MwfJvHBpMPl9HknA4RpKP7ZMLkPxz7E/
 cCVxipJ9SmG9zN5RB2QUstlfngwhG7n6Sk2jDqV5ZIYqB+nVQNvB59Eg0kQ3+gHaZdR2
 TPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UejFXLAUwGSH8601Zu6OOT1x0jb0F2c7x3s+9oz1WE=;
 b=dTSXnYq6ccymGmzdWH+9NhLBDh9KAiPdBe9O1KH+q3dwS8VnASswfkPK3p2PlLkexD
 95Aq8q0HWhtPnW9L/pk42iqREzMPN0vU6bo7nsWv/F0S9LRruF6Jzot20h1QwTEY5hW1
 rEIyw5hzyL0E2O4A3KQCP64hzX9AbM2lAcOunA6JncQTEtj5PGsjUTu1Rjf7C4m8toVv
 ogznwGWWxmQsqWA6EnSl4LGaNqGihM0KtOG6k20cL8YtpPs46Wz94FFFi30z9daZnL3v
 HwbcdpnsMgrTVYNWm3OZu3IZS3v3f+LA0IDY/+s/73a5xFWwfsGI4qhpcy8mvpK53jzH
 C98g==
X-Gm-Message-State: AOAM530vzAQvjPC+zBLmPgIxJvU1M0wsjj98HFEnXmbZElVQdNtujyQn
 bFc+fF83oXZ/Aw+Gkywuvl2bzGs3LmqPSX8YvTc=
X-Google-Smtp-Source: ABdhPJygK31IMFHIazJUem2mUrvkicCxIa4MC8GuPdDTkoi9wixwUf9nTULwwBWOUTRQGr3GvmqPevtTgG9JThnrFe4=
X-Received: by 2002:a17:906:2cc5:: with SMTP id
 r5mr4909402ejr.328.1603223068976; 
 Tue, 20 Oct 2020 12:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201019224649.14302-1-khilman@baylibre.com>
 <20201019224649.14302-2-khilman@baylibre.com>
In-Reply-To: <20201019224649.14302-2-khilman@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:44:18 +0200
Message-ID: <CAFBinCAXcmnbzuQg4syZiDM0jvivHpiPzYYdtGOG1E81QMc3mQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: meson: enable building drivers as modules
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_154430_409761_4F3A843D 
X-CRM114-Status: GOOD (  13.40  )
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

Hi Kevin,

On Tue, Oct 20, 2020 at 12:47 AM Kevin Hilman <khilman@baylibre.com> wrote:
[...]
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index 5fb29a475879..2dfcb7b6e664 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/power/meson-a1-power.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/firmware/meson/meson_sm.h>
> +#include <linux/module.h>
>
>  #define PWRC_ON                1
>  #define PWRC_OFF       0
> @@ -193,6 +194,7 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>         },
>         { /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);
>
>  static struct platform_driver meson_secure_pwrc_driver = {
>         .probe = meson_secure_pwrc_probe,
> @@ -201,4 +203,5 @@ static struct platform_driver meson_secure_pwrc_driver = {
>                 .of_match_table = meson_secure_pwrc_match_table,
>         },
>  };
> -builtin_platform_driver(meson_secure_pwrc_driver);
> +module_platform_driver(meson_secure_pwrc_driver);
> +MODULE_LICENSE("Dual BSD/GPL");
This file uses SPDX-License-Identifier: (GPL-2.0+ OR MIT)
do we need to use MODULE_LICENSE("Dual MIT/GPL v2"); in this case?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
