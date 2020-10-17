Return-Path: <SRS0=WgVV=DY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C9EC433E7
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2020 16:24:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA7C20758
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2020 16:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SuwPC8Hd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Mb7l/y0l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA7C20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FxiHUMD35fc2yCs+fJHNaNEf/hSEKq8vlqlEOLi9/yc=; b=SuwPC8HdGC0Tulu/DRGkOu2uZ
	329DNqvZ9geH5+NuVn+fazw/HldsI0sBO5CagXXocFKl1f6pRUU/YXIf1v3t1fIvahWXi52Q6fgbE
	qgNYEa7jx/g2lGaZFGbFi23QKSj4kAwNAVZZIGbAOQWiIeQbBialidg9sotrbVMEL2wQPM3J6kkK4
	4/gBylS2EB20ogb/RCNTIYJoMdCgZeIIplNJjNUNhiwhPCWwy/PnLhY2fxZ9UPVDNln5qzZvtltVr
	cREZsN+hpsIiNF63hWQ4A/soO+WaYNtH5KO0w7qb4q7+q1UF8NeNbB5GfMVMX59WtYRsH0zr1QDzy
	JIqdYtDcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTp0d-0006jM-Kg; Sat, 17 Oct 2020 16:24:43 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTp0c-0006im-5w; Sat, 17 Oct 2020 16:24:42 +0000
Received: by mail-ej1-x643.google.com with SMTP id md26so7812690ejb.10;
 Sat, 17 Oct 2020 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/6V3G2pS0iQZfx+W1jRBDC69XLzC43FFM/6CPSrA9Q=;
 b=Mb7l/y0lTEQAwiCPHpZdkuuFvHUnYpMqZCoIxuGW/CkLxWvPMURzXMTPY35/Tektvc
 ar+q8WaHHQ0Nt/GCabmIg9v/Fbfh55Kcfyve4bzE2PSrmeughqxQuYzwervrsYrmRaKH
 LtVQ0TNfiiWeM2GVTQS+bf8rnjz+iJbC8ZmxTJurDYk59IQQrximctWWjW7jcp9kSWjW
 0YOqnVAAWEuu6Kvupgk3YZWE4H9+3/lf1AGGII/j/3hIGrD4yV/54sR7ec5i53fY2PJ0
 fgh6eQYno8LC2NWNVWqoWWVw9bOr5wBz1ABL8HB1AEWrxXwt7Af4Pl5BNXPXRQtk4BRV
 cB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/6V3G2pS0iQZfx+W1jRBDC69XLzC43FFM/6CPSrA9Q=;
 b=Wv+ASfZhNIoTnYYjjdzbqs79SH3bKMLBA5cAUCC17KF9Z2Uks2gYLTb/luQf2fcYcY
 gfQTAfxu8Zmn4O/0LzEmJL9rwCwnb8WrhLKzjnQIsEgXejiNfF3xk3n6ao42wDQq0oU3
 yuQ4oD+pU8zxTFnxxNu/fxs/JJhksPKVCSrgpPg2fiyn6y71GRMIihW7ux+URREFXrw5
 5lX18Ys+J4AEtfhbprNPBOhQEuhFJu/C7SaxP0oWDLF3VyjAjtgDwLBYxWlst+t6p5en
 BB3uskeSPpi360/cq+gPN/x/9By45oqx/A3ysYzLfyh/6NDXSnsemVI4JDgGl7Z9VrrI
 yL7Q==
X-Gm-Message-State: AOAM5303qzEATyJhqW7W5JUmFgyLyZx3wP43lBAdLMKYegZ8Mu4GRMjT
 BsR+A0Kq1i1G6Nw6XvGmmDFHz+LNxnKDSnL2ZMU=
X-Google-Smtp-Source: ABdhPJzF2+3ZIgOLCQvR2OG2EkAfu6+o/CfgWgqvonHqkXJ9AVKeiTSj5PjoOZ1xz2nSHAUaclcvx8Fg+EmdNtGHZo4=
X-Received: by 2002:a17:906:1a10:: with SMTP id
 i16mr9192336ejf.162.1602951879778; 
 Sat, 17 Oct 2020 09:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201017160928.12698-1-trix@redhat.com>
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 17 Oct 2020 18:24:28 +0200
Message-ID: <CAFBinCAqvqp14ygOzQW=OPi7CY5z7qAcvcUHZs7Zf6JaHbNYXg@mail.gmail.com>
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: trix@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_122442_246927_5B146546 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Tom,

(I removed what I believe are irrelevant recipients from this reply)

On Sat, Oct 17, 2020 at 6:10 PM <trix@redhat.com> wrote:
[...]
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index e03988698755..66dc452d643a 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -591,17 +591,15 @@ static int meson_sar_adc_iio_info_read_raw(struct iio_dev *indio_dev,
>
>         switch (mask) {
>         case IIO_CHAN_INFO_RAW:
>                 return meson_sar_adc_get_sample(indio_dev, chan, NO_AVERAGING,
>                                                 ONE_SAMPLE, val);
> -               break;
>
>         case IIO_CHAN_INFO_AVERAGE_RAW:
>                 return meson_sar_adc_get_sample(indio_dev, chan,
>                                                 MEAN_AVERAGING, EIGHT_SAMPLES,
>                                                 val);
> -               break;
>
>         case IIO_CHAN_INFO_SCALE:
>                 if (chan->type == IIO_VOLTAGE) {
>                         ret = regulator_get_voltage(priv->vref);
>                         if (ret < 0) {
for drivers/iio/adc/meson_saradc.c:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
