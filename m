Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05951C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4z/IcpeT9D+PTwjmmdFGbHzXx48IKnRr5j4tXfc9XQ=; b=XW9fH0nJT8Wt+k
	2joodjnjORN0399CxxnAyJBRr/37mWc0vrt/odFJX7Seo+bJxEkdaWp9IRMkG7+HtEcaw7kIKtoC5
	HL1hoZVsHHCewPXlabLYvEcvYjQgyABV8zNHAZgBaCv5zueIUBrJgFeb5uvfI9yj/rVFSZocA0J0f
	EsTEn6XHF1YsFpq/Z5ku8N8B+1axJ9pqdwxi9DIHL0WiyDBB17Kv/txZmIahkNSQmcxD6ctuZMRKX
	/nSPNCu9Da+Rn7NllfGcToAvokEXXjwZgfJWNtPmscsynh+OQrMI8ntsrZc70ApZ6zSnX9UruZLxf
	/qIz4C7F3UsAEucKf68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzenp-006qbi-J0; Tue, 21 Dec 2021 13:03:37 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzenZ-006qUt-Ph
 for linux-amlogic@lists.infradead.org; Tue, 21 Dec 2021 13:03:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g11so29260373lfu.2
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Dec 2021 05:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EbFMqfLUV7jqbg8sJZLc2clgBzqbVKTSLl3KdaBAXZM=;
 b=U8DREYfaMAZ0dbfgkMS4Up6G506OcBayGPwepAX98LgXHrPGUKa05zz8TLvojVHKnl
 Sdj61ODtqDJhJQVxESkLRYQXETkYCozpuqQ9KNxSHaW9+pj7vs7Y/f/fDxepaOuDQpVN
 NetS8jpTdck2zqqiiVfqm9tc9IaojIB9SOhfUWZUkbFz9l9qExgqRFwgjVuZB2wu3aAP
 ylRNY58GUklfXnWjxJ4Vs7wzTwJpWvXZHEeQs38D/wIdyLfUqwrjH2ejhRu5sChshk9t
 LnDNgx2kqu3kcT5/v7WTZjuPk02YfrrARdYf1Y9pdnYayUE0A1p/MdJr/EZTQt9Fk99c
 67sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EbFMqfLUV7jqbg8sJZLc2clgBzqbVKTSLl3KdaBAXZM=;
 b=TrK3IVNTPXMEuN2wIsv+Wyo9kcyWETvCqUsTNEhfr6kpYm+Wsl/CwGDTgmnDGfAaV1
 UUNxJ1PYfM2Of4+6qS6aVmXP+S11EsGTLc/AwYnBooy1WKlONzdYnzc/bw/0CFyXt6D6
 1047lRXKvrNOYoOwiG8tAtHcre78OHWDSLQeCW3gXkUysZKdlQVPBuG9lwsD7VRguSVN
 vaLmiSZkJljw82VfrUVaMXgR37wONAF95ZLnFz0TdGayxj7YmZLdEIbsk2HtjGaybcde
 xWANJBX/QeZu++faxmKSdkB60mzWPkY6OaK07VoFZDJI5JTP7dd7Qzitznd8iE8RdSWB
 YSzQ==
X-Gm-Message-State: AOAM5331T/o8af5nX9rFJ7wfs0GM7LeWx8ccEWm21ZsplMybxkVZoG2F
 Z1VyxuUPpar7LGrgknb+RLlOrvwkj79eCkcjTUiwNQ==
X-Google-Smtp-Source: ABdhPJyj2JiEdgIr2ylZYEDZ2Yav+CgsmjJXAaF1llCj1oEB9JMNfTLdHSw0NUdOMpsK1Wsgmg9lPE+EcZv+5rRY4cA=
X-Received: by 2002:a05:6512:310e:: with SMTP id
 n14mr2985967lfb.167.1640091800421; 
 Tue, 21 Dec 2021 05:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20211219153442.463863-1-martin.blumenstingl@googlemail.com>
 <20211219153442.463863-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20211219153442.463863-3-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Dec 2021 14:02:42 +0100
Message-ID: <CAPDyKFrbWqMSTPvpsYD40yiHvowkVrTRDrjqpt-v3yhJZ9JRgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: meson-mx-sdhc: Drop unused
 MESON_SDHC_NUM_BUILTIN_CLKS macro
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_050321_888594_C15040B4 
X-CRM114-Status: GOOD (  13.81  )
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

On Sun, 19 Dec 2021 at 16:34, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Remove MESON_SDHC_NUM_BUILTIN_CLKS because it is not used anywhere in
> the driver.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-mx-sdhc-clkc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-clkc.c b/drivers/mmc/host/meson-mx-sdhc-clkc.c
> index e1f29b279123..19200b7079a6 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-clkc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-clkc.c
> @@ -12,8 +12,6 @@
>
>  #include "meson-mx-sdhc.h"
>
> -#define MESON_SDHC_NUM_BUILTIN_CLKS    6
> -
>  struct meson_mx_sdhc_clkc {
>         struct clk_mux                  src_sel;
>         struct clk_divider              div;
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
