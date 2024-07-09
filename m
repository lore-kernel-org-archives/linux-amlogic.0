Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B89C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOQwefukZk2c8N/7R0P2Ood7nIkUF3+e+sbLaxwSLWQ=; b=2Zc4pon36oSYm/
	EeZMZuebFbQBCRLw9q6uMl82ayGsdIq0bjwv0EFx4SDlmsvplQa6+OTYBg4jjKW+gQhNSepsmAHJH
	WlxloQcTYD/sTr7SDcelFmdjfw5SHwWhuy0bA4I7wZqZkd2thb1CdjZs5V8vogaDmTLr1g3RFRff/
	6NFcojUeJ8NpWvGuChCRvjs2Zker4Jj7WSwbEuYDn2TLm0eJmlVcpe9Qbv4QF+bNbiigeHyJyTibA
	bR+Z/DEh98/RcGScfUwdZkN0iMHBcf/lopLio0KU0wa/vLIGXJviLx+T1VVorxS1ywZeVEg5YhsTN
	vp8e7RXffIj4mLV9YtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR8ol-00000006wYH-2lbt;
	Tue, 09 Jul 2024 11:15:31 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR8oa-00000006wTc-2G5J
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 11:15:21 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-65651296d91so21888747b3.3
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720523720; x=1721128520; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amibtjMeBpHYdoWGEAnGfjOuZ2WN6rEsWzK1yJggVqI=;
        b=LQD4Fhm8nsj0ukTNm3ytosJiht8auqkq/Nnujv900gyAmOXkFfPmRZyb6gI2HHk/4A
         O6NoivNc8UN+EMf3f7q1o2E2t//KyqIULgW2eWLxLHk50rBbzPrUw94V84wdYa9icDqp
         Pi9y62zzr6OFgwAqlzt3+pTeMtIvGucLxrPrE8M0Af/xhtyxpYC7UIoN8S49Pj+fGdb7
         OYC922nLdVX5udW4SPaa3wnZkLjmyKhOnJOSxzh5jDiaJDF5xld1IPM3X8VYdENSwBhT
         uRk1r+mNrlx27ycyAsb5NRb2yXOhMgcPBlvjd9Ih3I6frx85lUqLw+yriKfJcGIMTOYR
         VBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523720; x=1721128520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amibtjMeBpHYdoWGEAnGfjOuZ2WN6rEsWzK1yJggVqI=;
        b=ieKqmLyJennE0uFhRIO71RSiwy1CRG4ttu5e8sw5HENtNWyslWVS+Mx/FEPl88d1Zm
         8g3ntH7wcV1uvGReJnShZbmXsXhb0V/4pPFDr4uAeeMwMyhF7OyTFscSWj5fyPOGb2Oz
         YyYLa/khhBnIvu8Je9+45k91LmbYoSOhiKoVSDXi7eabhH1Xiw8a1AKNIQZHftiYu5md
         D6FxxspnSh3TPS+qIGU37SsE8kQv91Wv6Sm9ZgTlwmnTvRvJqtG9k6oHpWBYWbfsAw46
         USVEY3U5mqpN6R3qXP6nUXlfVec6eA58K3A6a/56ObQVDRZv/DSXYohf68AuyiGAobue
         2VQg==
X-Forwarded-Encrypted: i=1; AJvYcCU5om4KqkCkKEY2tfGLTePb1v+1EL99tfJuGceL52OBuTikGCT/+1HgUL2iJ84JvUMF+h5EqxOMvqL8duNF7qjBMww6Tq2kHL/+JUhPdA426DE=
X-Gm-Message-State: AOJu0Yw1eTkTFyMcAeiYKWiql5kt4H676kxCnwZmT8WizmJge6IhbfYT
	jl7MIY+y4CY8R9EVFolo3qL0autk9xbwcUhnCcJGhDSl78Cubp8+bY2U8F+Qxq3DJrUsWGQAEEU
	fhUUoci35m1TFwOcsLSJQc25HQxR6w1PMoSL68Q==
X-Google-Smtp-Source: AGHT+IFZPKT3QneE1vinb0l0LrB8IBVWI9enPV/6FaauTcqtNWGCxq5Rdp14ew2EtEqk25i4Zh3v1NHOT10WrvY4W2M=
X-Received: by 2002:a05:690c:7306:b0:64a:e7ec:f3d with SMTP id
 00721157ae682-658eed5eae3mr32126757b3.18.1720523719826; Tue, 09 Jul 2024
 04:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <871d6b708de8bb42e1fabd8a601dc9a9a217cf00.1719863475.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <871d6b708de8bb42e1fabd8a601dc9a9a217cf00.1719863475.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Jul 2024 13:14:43 +0200
Message-ID: <CAPDyKFprG1iwNDegi45d0KPWiZ7QNthGUWihY05UQ63MCvs=2A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_desc
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_041520_603052_5A484D87 
X-CRM114-Status: GOOD (  22.18  )
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

On Mon, 1 Jul 2024 at 21:53, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct meson_secure_pwrc_domain_desc' is not modified in this driver.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    4909    4072       0    8981    2315 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>    8605     392       0    8997    2325 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Re-based and applied for next, thanks!

Kind regards
Uffe


> ---
> Compile tested-only.
>
> The .is_off() function is *always* set as pwrc_secure_is_off(), so it could
> make sense to remove this function pointer and call pwrc_secure_is_off()
> directly when needed.
> This would save some memory and useless indirection.
>
> I leave it as-is because it is maybe here for future use.
> ---
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index df5567418226..62857482f874 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -46,7 +46,7 @@ struct meson_secure_pwrc_domain_desc {
>
>  struct meson_secure_pwrc_domain_data {
>         unsigned int count;
> -       struct meson_secure_pwrc_domain_desc *domains;
> +       const struct meson_secure_pwrc_domain_desc *domains;
>  };
>
>  static bool pwrc_secure_is_off(struct meson_secure_pwrc_domain *pwrc_domain)
> @@ -110,7 +110,7 @@ static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
>         .parent = __parent,                     \
>  }
>
> -static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>         SEC_PD(DSPA,    0),
>         SEC_PD(DSPB,    0),
>         /* UART should keep working in ATF after suspend and before resume */
> @@ -137,7 +137,7 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>         SEC_PD(RSA,     0),
>  };
>
> -static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
>         SEC_PD(A4_AUDIO,        0),
>         SEC_PD(A4_SDIOA,        0),
>         SEC_PD(A4_EMMC, 0),
> @@ -155,7 +155,7 @@ static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
>         SEC_PD(A4_AO_IR,        GENPD_FLAG_ALWAYS_ON),
>  };
>
> -static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>         SEC_PD(C3_NNA,          0),
>         SEC_PD(C3_AUDIO,        0),
>         SEC_PD(C3_SDIOA,        0),
> @@ -172,7 +172,7 @@ static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>         SEC_PD(C3_VCODEC,       0),
>  };
>
> -static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>         SEC_PD(S4_DOS_HEVC,     0),
>         SEC_PD(S4_DOS_VDEC,     0),
>         SEC_PD(S4_VPU_HDMI,     0),
> @@ -184,7 +184,7 @@ static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>         SEC_PD(S4_AUDIO,        0),
>  };
>
> -static struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
>         SEC_PD(T7_DSPA,         0),
>         SEC_PD(T7_DSPB,         0),
>         TOP_PD(T7_DOS_HCODEC,   0, PWRC_T7_NIC3_ID),
> --
> 2.45.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
