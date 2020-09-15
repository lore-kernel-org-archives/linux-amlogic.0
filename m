Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58611C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:46:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F542078D
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nBBe5ldb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dbghCkE3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F542078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T7GBlS1EN6HV8sufHohi96kIOp2r2bUN3wnYQUIAp0Y=; b=nBBe5ldbLjxfy2AL70nsaCSE5
	/TClSBHfDsjvukmoxoO2tF7dBpjVfBxBuVCfnrZv7AKIekladRG0qO8ow+HmMZdqKGKq6/NWlHIRJ
	fM49i5AhTIiv9TteGL/z5qYGmE5EJ6geCHZYMuowPREKm58VsKi5Y1Kib8bKk2Bbas69VkOGzPUP/
	3aB6tmbNA7ZglWYutyZsf6WeRBpERkc+BPu1JyeOteS7wUOhI6XtggdRbzEEnCJVlMvoq+ZEXgZiH
	lnmTD9DYyD2gfc1D6Y7A6BB4zFCcsRcn546St65QDVD4z0Xb4D8QwmxbVzkCP4lSIb3kldF8mGT1s
	p5OzqKlHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIGu1-0003mT-TP; Tue, 15 Sep 2020 19:46:10 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGtz-0003la-Ai; Tue, 15 Sep 2020 19:46:08 +0000
Received: by mail-ej1-x641.google.com with SMTP id i26so6724326ejb.12;
 Tue, 15 Sep 2020 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p5sSzZShC8ORfwakA39ohe9fpx/z+QIq6SJKz70/TTM=;
 b=dbghCkE3Hztc+UqWBaVJ5vK3WzRel4RlQnWexaWlRD1F19KQk+fmGvushQq5ZZHhru
 hJxuM67sWo4kXfUzRYoU0Vxy5nlcYXIQkRW3hwOTG3QsmGnLhR3cYY9LLWC+Wuajfbjt
 vbc2wmJQMO88nW/e5iX3bwe7kAfREFFuj4dSRxWEdv47EOzamDfAZUhqwpPVOsykOnLH
 G/pWuseRHRm0In86mQrDE/Tr7Xzy4ZvHWsmHP9opxWLAA+XRCi/zMAWNKg0xppBNUbJa
 cYSF96dfpjGBTBlm6AMkHrMgv4W370asMd4bShZiydmcRKychtYpWIBsUqiNiCQVwTWs
 Nmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p5sSzZShC8ORfwakA39ohe9fpx/z+QIq6SJKz70/TTM=;
 b=CAHuNdw8Lw0g6MKOqg1FvrxkkQCn0l6RIep/88PizV7EbjDMhS1jCvgc4cV6MJfW7S
 PUecMa68r3YkFLzpcxfGZKkmey6ncqghxgTLLcKskVGiAYB5Tbr6DAizafK2YVn1Ge6F
 XV7Vmw/G5owEpjAK6wDbakNLhBoM2chobU6Ct9PsWuvqJVIdjxabO0cpN738yT2b/H1D
 kEDy81YK+5GT9zO4xwaSYuUClWgip8vuYmXQUFl0GKqXC4/JFO9rZlWyYb/+7hZybx7g
 NkjmF499ltgHjAMNbwAp9ymaUAOR9LCKIhF9CzQrVPxgjVHzir7gqHv9/b4Co6EIBfWT
 +YnA==
X-Gm-Message-State: AOAM533KfzqYa9BMhKBxDdyGQeM0oxpx681UN/Z4UgTCaSj5mVThjjex
 XdPeh3QUgvYDYIUAT6jO2gkXoCC7BU5NZWnBXxI=
X-Google-Smtp-Source: ABdhPJy2LEJ8BwYCymGuaU1iN1I1+zohKpeh+4Eu1QEO9Ok9estRenU6CYefzM0h0DDp5c0zJ4H6XVdhuQFsCHIICqk=
X-Received: by 2002:a17:906:874f:: with SMTP id
 hj15mr22844624ejb.539.1600199165966; 
 Tue, 15 Sep 2020 12:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200904161654.24141-1-narmstrong@baylibre.com>
 <20200904161654.24141-3-narmstrong@baylibre.com>
In-Reply-To: <20200904161654.24141-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 21:45:55 +0200
Message-ID: <CAFBinCBDKuFkdR_mTyS=cYPAwCzs+TYSh1koR29uTnLmAtugPQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] soc: amlogic: meson-ee-pwrc: add support for
 the Meson AXG SoCs
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_154607_406574_FB72F553 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, Sep 4, 2020 at 6:17 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
> but with less VPU memory domains to enable and a supplementary Audio
> memory power domain.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I have three small comments below - no show-stoppers though:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
> +       VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
> +       VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
> +};
> +
I would put this above the g12a one

[...]
> +static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
> +       [PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
> +                                    pwrc_ee_get_power, 5, 2),
> +       [PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
> +       [PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
> +};
> +
same here

[...]
>  static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
>         .count = ARRAY_SIZE(gxbb_pwrc_domains),
>         .domains = gxbb_pwrc_domains,
> @@ -566,6 +588,10 @@ static const struct of_device_id meson_ee_pwrc_match_table[] = {
>                 .compatible = "amlogic,meson-gxbb-pwrc",
>                 .data = &meson_ee_gxbb_pwrc_data,
>         },
> +       {
> +               .compatible = "amlogic,meson-axg-pwrc",
> +               .data = &meson_ee_axg_pwrc_data,
> +       },
this one I would put above the GXBB one


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
