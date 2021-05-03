Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C65C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:08:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D009611CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D009611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bDT+kU09XYAgKQN4UCDC2nq6sZii+RsWaHvTB+Eei5g=; b=kb/CNM7k41fowfhfH9tD0BxuF
	OX1xSFWEttECb3BKH3cw32Zxfc9AKLdy6hRJ/Px0QYTx0sZi8Uxh0dMHoggMyQT7eV1YgmbySz83j
	GEsBX5MJKMfsAqe8YSAbX50av845N8ifW0fj6eIApQyI+h/oU2ZjCVTRddUYgVewA0Y3Wesj0tFG+
	v5Vyu77Pe29mz+ztpCpl69WgvG3Vc8xuM+KvOkRf7fGseDvc38OP7QujSIomyLd1+yIU+V6bhehqQ
	wnSdP8qdIIgN9ZVWn44kUxNl6HkKKZ5GCXJMRQy6YMKYY1TTeqqMIROs3XU12eHh8g+f7jnfxDm0K
	zEcUME/cg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaBU-00EBPf-Q2; Mon, 03 May 2021 15:08:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaAm-00EBIZ-4J; Mon, 03 May 2021 15:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6PeKiC6VK6oLLbn2cnMl1YHOLyRIgp6HOXyzm858/Jc=; b=Jawqs9YMEb8Symv7Lpmcol74bb
 hvaiQArI/R9mDQGDQ8k8F0iBeAG0HwwlbLmrE6GhFivZcDYCOQp4Ro+RCQ8mY4SUSSRS9KOzC7PQe
 SMJGDwYisFeXfd3d+zyK/C5BRuUrDKem2QWHi9/WQZSq8mN/8h3NUk55cCSA2H8wTva9iuEriIpb7
 x+3dePssbKsmAK6RBhE0YURdEHQPfMUfD1xKUzGEJgEdtcXam+d0olLn9y/GJyZ5Um7kE+v4004F8
 n2Y9WEpMU7+g4dveGIps8ItFMLaTMK33fihsMGCxgnaIzzQcu37VKKU/QSH/Fb4b09P4eb6b/y5m2
 HcfrlnSA==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaAj-0039oe-GE; Mon, 03 May 2021 15:07:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id u13so3970542edd.3;
 Mon, 03 May 2021 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6PeKiC6VK6oLLbn2cnMl1YHOLyRIgp6HOXyzm858/Jc=;
 b=oqa4C1F4z7emqDWN76F8bOb8wWgz9LKcoWLQp5PhjOKBtEbe8cLd+ops1lGKoVgNzp
 gGdpC6HkkUTTlE4/2ZnwVtRC2kgKVaYR+f/lxZ1hqUQKadePdiHxKeZ2mEplsQibxdq9
 pgYxnmNyUqMP3JeUUI3LJ0PfgxH11O7dYFxIuO0nlVlGI2mZtyPvLMqqfIxoEcq5HDEZ
 A2a6HlbpIcvwJPGuN1u5O5x7YLUw3Q8qIaYvAl3nYTeZGEKPpEye4C/rXhOcaAm0rPeH
 DLw3Q+BS3ddwk3N41iGdr3wj6hFDwf1QU3ZtryNMSHyN0+wNy+vmJ0cI/o9zKK5/9THf
 Hv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6PeKiC6VK6oLLbn2cnMl1YHOLyRIgp6HOXyzm858/Jc=;
 b=ooBykZgCliOQiKJbEXsh7aI19iq/sgfAK/MXG35OPBhUDNWv+UfrOFMfIEIoKbBoXB
 MtUXBT0Gv45K8AjhEJkpEy02tuWfTW4RiQyhfgfySTanWb5CWFWKkB7dTxepHg7LDD1p
 zo0Q1zjrQX3drmxDC50srG0w5me+LGmzreyFbpMD376FjT3UVXII3tpnSrGaqg1vhNVg
 oHG5VF7FAZShCGIDn3PabtldkbCqjiweBAVxE+cRhc2wWS2J/k2wDZlk+4s2DRpAy5Fm
 GIq351kt3DDvVmbCITYj8usavSLnYF0p3z1yJ/B+J54OARM1ytSRRtHW5HCGXjpQvQw/
 9cPQ==
X-Gm-Message-State: AOAM533j052LDD9l1v/4yDrgidb9THYJVEBxj+m/7+j7HsLxDeZrvMuo
 9AFyCdNibGZDlhAbJNsPYxDXaKKC0R00NFLVyaY=
X-Google-Smtp-Source: ABdhPJzgzq9cLDMHr7lN6DCxUbCsnFeyWmsYaigFQVj8/gCeiG6BqYvBX+GWt81IYnAJp8Wlw3VIkmKBQgMxKEiBATg=
X-Received: by 2002:a05:6402:3109:: with SMTP id
 dc9mr20519018edb.13.1620054461345; 
 Mon, 03 May 2021 08:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210503145503.1477-1-linux.amoon@gmail.com>
 <20210503145503.1477-4-linux.amoon@gmail.com>
In-Reply-To: <20210503145503.1477-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 May 2021 17:07:30 +0200
Message-ID: <CAFBinCCxMvomKt9E0jT_XXpyL1_-qXH4=zVDMNdbDCnZCsnT=A@mail.gmail.com>
Subject: Re: [PATCHv1 3/9] soc: amlogic: meson-ee-pwrc: Add hdmi power domain
 Meson g12a SoCs
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_080745_567554_15DFC7EF 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Anand,

On Mon, May 3, 2021 at 4:58 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per the S922X datasheet add hdmi power domain
> controller for Meson g12a and g12b SoCs.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/soc/amlogic/meson-ee-pwrc.c          | 5 +++++
>  include/dt-bindings/power/meson-g12a-power.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> index 2e07ddf2d6a6..ec402c4ab931 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -154,6 +154,10 @@ static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> +static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_hdmi[] = {
> +       { HHI_MEM_PD_REG0, GENMASK(15, 8) },
> +};
> +
the VPU power domain already includes:
  VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
whereas VPU_HHI_MEMPD is bits[15:8]

Having two power domains which are managing the same registers sounds
like it'll be causing some trouble
So for now this is (as I am not even sure what the goal here is):
NACKed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
