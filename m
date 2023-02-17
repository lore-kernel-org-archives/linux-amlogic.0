Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EF3C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 10:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhYl4AzosvVVcRzpXej9utAh8uAC4PbhYMu/p34yXFw=; b=DY8QZ6eCl0bmJy
	0iR+MKrmvA0v30N9cWq6jlq0nkm3x3KRgkNLOsTMq3YiiwGvvENPtuWK3GMbDysqTgyoOuYuq7OQb
	N+fLE3iyC5+5DVfe7A/7Z4InzocahUAVFgesf/qgKid5wzDBfKNt3ib6+jSXYIFCBO61Rfp1H854j
	oDiyTkanCiGeT9CD9bGOSyeTzmRor5hessA+wDF1/nfBLhDr+o8sqZVe1yuzQ0eUxvdl7jHGg/NML
	F7HDiOV4AKDvfHJVfGOTlLbLzfomqgKvcOX2lm3Gx9JlKy7PVOY37B99kBUn4PSD9j4/5nfWVVTEh
	lOGH22OIEWrlTvJFd6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyIC-00Dk4E-OV; Fri, 17 Feb 2023 10:48:40 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyI9-00Dk35-I7
	for linux-amlogic@lists.infradead.org; Fri, 17 Feb 2023 10:48:38 +0000
Received: by mail-pg1-x52d.google.com with SMTP id n24so300664pgl.13
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Feb 2023 02:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676630915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dF9wSEnG/pmDi0OCoUdB59pDnnwR7ktou0i6CnZGcss=;
        b=XNcOCdRPlUBDkS9BuZrMFmRNlt0v9NkGEVPQRhipDqIiHiXlav4XsiPkGLkbOg7QNf
         0ArOCNqExS/98VguhV/rFgZvk1WyhbYtSM1YE7inAjJ29HxT0QCF5R7h5buzZmjXPhk0
         vcwWf7cGv/NG7fsLTwkSZeCh7sve9+kKmcmLXT2S215PZNzx12cw84+uGhAva7WEKlqo
         bfmJ1EIFI3xUrsKSRb13AAAuCjnTcpTmq2WsLvsGiFGVoYzyF+qxlQB7OA6wfTbbNFil
         JcpnjcZJeSo8rWG6a7fAvsyJnTyITKDKiRpc9BTgVMoi30MbPTYczncLyKM9Y5aaaBZs
         Kz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676630915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dF9wSEnG/pmDi0OCoUdB59pDnnwR7ktou0i6CnZGcss=;
        b=hwi5mUsxa7Kx+MBsLn+XTFCjhboYVnYXKN2pm/9Lx+7uI5qJiZNW4UkrTulC/vI1JD
         w/0wOxELAkADOS55vBA6nwmKvom1ul1nnWtZ4qSy/I8yxUQHQIbCiAMcx3laE1lGXOc2
         btW4dWY0JOeYO9PjOS6GUyALWWkQ9nbfrAjUUNY/UCv5v2AdEW5T8Zdt3231C69lduE6
         3+MYSRQBxdODaSCfTON4bKQOBFEPQsmxZXZFVeUOtLLaaU5BnPCzALlP39xXjpQ05ymc
         ZodHkXBqMQbbhGbJK5I8tnO2gGsWhJHgGs1hdgSFbSEAQb7GXfJoUHe/gkOyVSfTlelm
         x7Lg==
X-Gm-Message-State: AO0yUKUNtjybhMGWd5ayOy4EsJ/F1bd6kkcqFyoZaS2G7qZlG1BrImfo
	pxwKaEMdI+oXEb3VXogIj7HZpKxcc+3xdhnXMMJ/YQ==
X-Google-Smtp-Source: AK7set9FzbxOqH5midfBwv8pE9z9p0qY6hnqhEYjUEOxExFohj/9qD7nGH42u0m45DFwSi3Z2IHgC+QdZ/yUe4clls4=
X-Received: by 2002:aa7:95a9:0:b0:5a8:ba5b:575 with SMTP id
 a9-20020aa795a9000000b005a8ba5b0575mr1432692pfk.40.1676630915302; Fri, 17 Feb
 2023 02:48:35 -0800 (PST)
MIME-Version: 1.0
References: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com> <2553f3bc-b1e6-4af2-fb6c-def486dd99a3@gmail.com>
In-Reply-To: <2553f3bc-b1e6-4af2-fb6c-def486dd99a3@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Feb 2023 11:47:45 +0100
Message-ID: <CAPDyKFpCEzubkJ=roniomXHaWrY5AOqfPZmNLbMbBnubHzZrEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: core: add helpers mmc_regulator_set_ocr_vmmc_up/off
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_024837_642657_A5B44B38 
X-CRM114-Status: GOOD (  14.52  )
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

On Wed, 15 Feb 2023 at 21:14, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> A lot of drivers use this code, therefore let's factor it out to
> helpers.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  include/linux/mmc/host.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 812e6b583..f93fb8c7d 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -597,6 +597,23 @@ static inline int mmc_regulator_set_vqmmc(struct mmc_host *mmc,
>  }
>  #endif
>
> +static inline int mmc_regulator_set_ocr_vmmc_up(struct mmc_host *mmc,
> +                                               struct mmc_ios *ios)
> +{
> +       if (IS_ERR(mmc->supply.vmmc))
> +               return 0;

Rather than adding these two new helper functions, how about adding
the similar check in mmc_regulator_set_ocr() instead?

That should allow us to simplify some code in the host drivers too, right?

> +
> +       return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
> +}
> +
> +static inline int mmc_regulator_set_ocr_vmmc_off(struct mmc_host *mmc)
> +{
> +       if (IS_ERR(mmc->supply.vmmc))
> +               return 0;
> +
> +       return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
> +}
> +
>  int mmc_regulator_get_supply(struct mmc_host *mmc);
>
>  static inline int mmc_card_is_removable(struct mmc_host *host)
> --
> 2.39.1
>
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
