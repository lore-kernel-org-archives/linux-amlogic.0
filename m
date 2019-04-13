Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98BBC10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975AC20869
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIesJeGy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Wxm2Vrqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975AC20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcgmGdliXQaU1nfbHgNQUaAC32+SnR9RWogVR8JhkF8=; b=dIesJeGy+3Hzut
	ngR3ttcNmixR+H8mlmMN7pa9zlYTDL8qKGb51h8w+JEGlfodc59jkDDxWXYsuxmIaOwfVSjjAxPpL
	bba4TWUd8df8eBZO3uGC2wi9dcKUZ+Qyj2D1ROFvVozYGBfv2CkiTvnmlr7Eip4O+G7zVJDO/F+Lf
	d9ekpfo8sAqK9tn9bqpHZhD4Hpwk76P4h/45fKU6JG7G9GHFCxJzukrckNeulny1UvC4I34VX+dA4
	6GoEx4tJHLnN4rq4TSdDG5qndBNsSHpqC7BQ4216naYN7L1vE2XOGmdHitw9JMx7KnV3QvIOwyu3T
	AIc+pMwoFT5+/MTOc+Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFGuZ-0007Hp-RG; Sat, 13 Apr 2019 11:33:31 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFGuW-0007H4-AQ; Sat, 13 Apr 2019 11:33:29 +0000
Received: by mail-ot1-x341.google.com with SMTP id e80so10653320ote.5;
 Sat, 13 Apr 2019 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fNWzVu94jtQ2U8ecDCU7aYXiQ4YbXT+d1pdYft4GMaU=;
 b=Wxm2Vrqa9RDezfjYu2xSEpPLuHl7g9vkTihGAQ1PNm3CA/QWErU8Dll8Z7giuMgR9Y
 wDjBUDN4fytU+Q7NL7GDPqVLAX6MPVKvSJGYYK6Ql0nji+AA7ArEcRp6gL9QO5FWi+OK
 ZfKhQG1OYyEFxf385Q97bGIUAS/wcSY7oz3Bz0TfM3R6BJhnSws5Ru+JkCajxcm8UcQ3
 gEE4b5KZEWnp4LmQLzeDz4saagJ28VCzJCVFigisDmI5awDDVYOb6QHXnttwd34Au61F
 kq+UZ6mwiq82IzsaSr3//H5JCOUW77ikRMBxXYHkEi1RYpFVHSRM54wiJmOokW/GefkQ
 FE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNWzVu94jtQ2U8ecDCU7aYXiQ4YbXT+d1pdYft4GMaU=;
 b=NMC6G/dKz5msjDuZEWvbjVp71u6mhrm14h+I0DZo2Ii8tqO+SEYTp1uPjRA7z8asmU
 0GaAw+cBC1y2vNjpu5flkCPhSkYiJIA2XJZ4CQAfOONjI5NloSNJYKZlGVC9GRjFfULZ
 B+GES91u4Mm9wFjqBiIIyjVwlgI8taNqKOiWoXplOWOREIjmnyDyO5HatM2/9ec3ukHY
 rk3vh64gy9vOne6Oj0+hpkQLwZojt1/C5ydoROqefcmOMJLNgZiXRh0G4afgPTvlh9C+
 f0kffiLUK1Z0mA4dtqZ1b8CcBACZ1KO58dbcmbx5BJqn477teVPFlCSHdUtB3fxIukbk
 hctA==
X-Gm-Message-State: APjAAAWaCNiuAsj0jase7SN+60c4aoKsdDGdJ4vFsAFOBrLhjtLTq7+O
 g6qOBjR5JeVt5DJTAxGz0XzmBN0UMzeWVC0V62g=
X-Google-Smtp-Source: APXvYqycLqfZRrXmYKfVN47QKA7CnpnFkz3yV1BEkokWLGGmAH33/yc+n+pVKvSJPrfooBkH4HIguFa8fasqoYl7mh4=
X-Received: by 2002:a9d:7856:: with SMTP id c22mr18040111otm.261.1555155205236; 
 Sat, 13 Apr 2019 04:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190412092337.6941-1-narmstrong@baylibre.com>
 <20190412092337.6941-3-narmstrong@baylibre.com>
In-Reply-To: <20190412092337.6941-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 13 Apr 2019 13:33:14 +0200
Message-ID: <CAFBinCA3iFSW4K8FJN913CcsxM4YFc2Of9Ldpn7230Ss427mMA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pwm: meson: Add clock source configuration for Meson
 G12A
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_043328_388867_A84AA117 
X-CRM114-Status: GOOD (  16.91  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, Apr 12, 2019 at 11:24 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> For PWM controller in the Meson G12A SoC, the EE domain and AO domain
> have different clock sources. This patch tries to describe them in the
> DT compatible data.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/pwm/pwm-meson.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 2b03938039b6..46287cc8a0eb 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -434,6 +434,15 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
>         .num_parents = ARRAY_SIZE(pwm_axg_ao_parent_names),
>  };
>
> +static const char * const pwm_g12a_ee_parent_names[] = {
> +       "xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
> +};
> +
> +static const struct meson_pwm_data pwm_g12a_ee_data = {
> +       .parent_names = pwm_g12a_ee_parent_names,
> +       .num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
> +};
> +
>  static const struct of_device_id meson_pwm_matches[] = {
>         {
>                 .compatible = "amlogic,meson8b-pwm",
> @@ -455,6 +464,14 @@ static const struct of_device_id meson_pwm_matches[] = {
>                 .compatible = "amlogic,meson-axg-ao-pwm",
>                 .data = &pwm_axg_ao_data
>         },
> +       {
> +               .compatible = "amlogic,meson-g12a-ee-pwm",
> +               .data = &pwm_g12a_ee_data
> +       },
the PWM part is fine for me

> +       {
> +               .compatible = "amlogic,meson-g12a-ao-pwm",
> +               .data = &pwm_axg_ao_data
> +       },
>         {},
but I'm not sure about "amlogic,meson-g12a-ao-pwm":
the public S922X datasheet from Hardkernel [0] section 6.6.1.2 "AO
Clock Tree" (page 107) mentions two different clock sources for the AO
PWMs:
- AO PWM A and B has parents xtal, aoclk81, fclk_div4 and fclk_div5
(pwm_axg_ao_data has the first two parents swapped)
- AO PWM C and D only have xtal and aoclk81 as parents

regarding the clock parents:
I'm not sure whether pwm_axg_ao_data is wrong, G12A is different from
G12B or the G12B datasheet is "correct". can you please list what you
have tested so far and confirm that the parents you are using are
"correct"

regarding the compatible string "amlogic,meson-g12a-ao-pwm":
if there are two different AO PWM modules, should we name it
differently, for example by splitting this compatible string into:
- "amlogic,meson-g12a-ao-pwm-ab" (with parents: xtal, aoclk81,
fclk_div4 and fclk_div5)
- "amlogic,meson-g12a-ao-pwm-cd" (with parents: xtal and aoclk81)


Regards
Martin


[0] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
