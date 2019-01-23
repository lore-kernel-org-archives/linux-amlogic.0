Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB7FC282C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 15:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA8C2133D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 15:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="brhZrOJK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+6WJkTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FA8C2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDkyB7GarSgcCOJaK3OvrtvKArQfJt02pwVV5ytSl68=; b=brhZrOJKemVFgP
	SZtkHerNztl6QVzsAIyI3FSdqRI0wp560KXLPZ8JUyC6aWUzLcpzbQumi/faGKJKzUWiv7Bj51OWV
	PDp4AkvDGOdMbI6CQs09EDsqtFUa8omeWYp2/1pySopk3fJ3tgIdNM9OJCc1BOR4apjuu7pdIVuo5
	VPcRACvTqix5bQWMcMx76Z5QQh7Mk8uNwz979P7GWZ+Kg0Lgc+k34Q/vj/HwMslvcGpNAq1iUIqsK
	caCfx/4wNY5+ehTrI9gd0a9J3+bGa4D35PPAdRR8GZKQA640DqTFu6VxlSUBAMUGn3t5X/GX3ClBq
	8mMnn7kYNCflYW6oeidA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmKRH-0003MM-KZ; Wed, 23 Jan 2019 15:27:39 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmKRE-0003M3-Sj
 for linux-amlogic@lists.infradead.org; Wed, 23 Jan 2019 15:27:38 +0000
Received: by mail-ot1-x344.google.com with SMTP id s5so2227976oth.7
 for <linux-amlogic@lists.infradead.org>; Wed, 23 Jan 2019 07:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dYpHC0eFfgfiP/v5zSDaYT6m96U+a6iTQdTmvMW8q6I=;
 b=D+6WJkTR5fCtbRLAGcaLmJ53KCYTxvIqk0WAN4hqrqvuaak9DG3mfO9fydZ14YVAN9
 HnGEJx3OZnfXVqrPj2SRN2nCgR0bWaQJzhPVpSf1kaoYAHlhdm1pirYM9xCFlmaXmVgP
 HfRnJcTrEyKdqKw029R5YPcQ+Swzik4xhRezVnFTsN8Pn7PAyhZfr+zNM2lrpwCnT/yY
 cgRO9HmmKj6NxQlUCeskMQ3FtlImhtsN5LOHh36PVsJ7qf8LzrCCxbcivMuccsGe0FQN
 6y/IB2y9r8tlYv9GiTiwc0yiej69u+X+cLfSKmuALn6ZbHmzLNCn1PJWkQYGfCGjdRJi
 vtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dYpHC0eFfgfiP/v5zSDaYT6m96U+a6iTQdTmvMW8q6I=;
 b=iIWMf1nP0XqtPxG4NUQ7fhqFLI9Q8WcRPeimhnOY3HhU1izW3g0yDyn4IsGg55gUIx
 DfXSvpDrAJ4kCS3qJmwxzlcxPQIjO27OTouq/rHXzWNpUqlQyWxIYciD7cHPy0bvaQ45
 kVOYHWK8sjhP4oe8vRT9CYWYUoYo1bgRTgNai2I22FqkGZQSLiROxbm5Tx5g/Bw1FSNj
 pjksZvj1CiSDTrcq7qVediXerK7uY0HbuS2X5TAOgfAdTbq3IJntq8G6GhG9y8bhxJZe
 RLTjXlcHWGc46LEKNdipHk/wY7w4D63uHLg3+RoY1Bfe1cdPMtfkXSEPCnUXdirCfvdR
 Zjew==
X-Gm-Message-State: AJcUukdrfEHSbqOGiJt1CxbuT2In3wd5yFUQMcMXpyRhF2oHc8KXIotw
 0+qBMoXpg+qczaTf0VpJeBt8Vf68NAmNv9h+T+8=
X-Google-Smtp-Source: ALg8bN6S2adO5EraSEuvb8Y7TCZgSjjqMbNUEonAK5TKhk9TdZbK+uLw9Q+ECp8E2VL79QRgct4/wYJei9BWlAgmscU=
X-Received: by 2002:a9d:6297:: with SMTP id x23mr1574564otk.63.1548257255993; 
 Wed, 23 Jan 2019 07:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
 <20190121183723.25231-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190121183723.25231-2-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 23 Jan 2019 20:57:23 +0530
Message-ID: <CANAwSgQp2bc+HdTdX915bSUHRdZaJbXoriV7guK58G0bNwBtyQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] regulator: pwm: suppress EPROBE_DEFER error message
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_072736_930736_3879436F 
X-CRM114-Status: GOOD (  18.34  )
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
Cc: boris.brezillon@free-electrons.com, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Tue, 22 Jan 2019 at 00:07, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Suppress the "Failed to get PWM" error output if the actual error code
> is EPROBE_DEFER. This makes the behavior of the pwm-regulator driver
> consistent with what most other drivers do (which is: print all errors
> except EPROBE_DEFER).
>
> An example where this cleans up the kernel log are the 32-bit Amlogic
> Meson boards:
> multi_v7_defconfig has CONFIG_REGULATOR_PWM=y and CONFIG_PWM_MESON=m.
> When booting such a board (for example the Meson8b Odroid-C1) the
> following message is printed five times during boot:
>   pwm-regulator regulator-vcck: Failed to get PWM: -517
> On the sixth call the pwm-meson driver is finally loaded (as rootfs
> becomes ready) and the "VCCK" pwm-regulator comes up fine.
>
> Fixes: aa66cc6630a408 ("regulator: pwm-regulator: get voltage and duty table from dts")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/regulator/pwm-regulator.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
> index 3f53f9134b32..7789d181ae67 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -357,7 +357,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
>         drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
>         if (IS_ERR(drvdata->pwm)) {
>                 ret = PTR_ERR(drvdata->pwm);
> -               dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
> +
>                 return ret;
>         }
>
> --
> 2.20.1
>
Please add my. tested on Odroid c1+

Tested-by: Anand Moon <linux.amoon@gmail.com>

Best Regards
-Anand

>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
