Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA69C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 977792087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lb4ccKeb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pELLvVDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 977792087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bn5fLHmWcFN+gbHbvJpSbFcghgGn17cwkFaN2xqSuJ4=; b=Lb4ccKebEMs3Sl
	4ipwPxUSpAUXUCOGmhNta1RriT+yi55lOaFVEZ/CQeWt+kNFvcLHzLYqiy3GlMBmCKIEIYz+2Zley
	+pN+agua+gyuveX6wdZFFW4dq3sLDfFq8Ho9Qgl4cknohwmD+zFr+oo286BeJRVPGDxiHGDpkWw20
	7CwJB5lhA+69KJsmZHAryZ9pK/sEkOZZFIP85qvfIEE+bF79QUQR+DLuRbu797wG1JmpdZjn1+LNo
	rsS0/PZG9N9SPRK8uTgE80AB0ZvPkc/FU8BUi3t5IBzUMD8i1M8I34SRFTjXNs2G6AxHg6DCmPY2t
	+q5Z7tnY65LvtagKVgNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKSta-0005oK-Eo; Sat, 27 Apr 2019 19:21:58 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKStY-0005ii-DF
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 19:21:57 +0000
Received: by mail-oi1-x241.google.com with SMTP id l203so5533952oia.3
 for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2019 12:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dl4sPWHvtIbxgrJc1mG0D08dqZTYwvfuhtEglk0YIMA=;
 b=pELLvVDb25I15N32giJO3bSPLIlU17YzwgNG8xW7mEvBMna4DWw0kKIb7tfcdqo1RZ
 nS5Dq+KKUJN/we0/q6ANQxfab50qpL+BEzkAjoqpxMeI2ThZa3/9xlb7UbTWK8YAkNQE
 o0x7iFnb2bBSjBiLG+J0p5wgoUqqrRn9FppCDdeNik+OHCTCykq+tV7FSTN6Ohy4mDdC
 EOpChY8m0uW8MO+m3kav1AF1RUwL0XxWZQ3Qu6RYxDc7RvAr08A7LwC5A43+iZxtR9jr
 R1KjrDYj5tWSCPkSc2Mbbu7qhHWLG49zNrZG873JxPB+ImKfl5VVB0VHf5Y5dPX18INv
 hL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dl4sPWHvtIbxgrJc1mG0D08dqZTYwvfuhtEglk0YIMA=;
 b=SZVD6sXw+/zTmhMPzXYZfy5ev4F+vUeKP3bIBOtdR9xvIDNOJ3jxjttlJIUsRk3ZSE
 58ZD31o4JUwZDUZcsbJ0pWl8Pv1moKRDYd2wNosJ9t9Z8FebJx0PxocQBKnqfHBDfQcE
 0Iqd7zD5JT7Z0rjit6ztGMY6ax0TT/d5z/XVQ3Gou+EGAUoYOHd20POTRALT0mPvhpyi
 9bGA9aGSBn9m8sq3qW2nK3rYqAJ0dzPG0gGnupogCcgR/e8cnBEmI4/n8DpM80NfxWzP
 DHL/yGUp5KbFvnEe6f6t6sQ6VXFW7+g0B2NOAM6QtsA15PCfNS1cdebbMj56js3o+1JC
 E01g==
X-Gm-Message-State: APjAAAUmT7Ni9QDHtjBZ99/2D4czTjAT4h97PuYd5CVOhXDMPRNmovkk
 oiCSm97xzzxAigWYKozcWuhxu5yw5o+3cx9j52Y=
X-Google-Smtp-Source: APXvYqxGqdLBuMP3LYM+4ZBxOnoJEx2t4P64t25bW6/lCDyU6cVNMOAx/tdVFvfxRdOIgLZhsK6EKG78Kmy47KpoR5k=
X-Received: by 2002:aca:4482:: with SMTP id r124mr11703404oia.39.1556392915645; 
 Sat, 27 Apr 2019 12:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-4-glaroque@baylibre.com>
In-Reply-To: <20190418124758.24022-4-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 21:21:44 +0200
Message-ID: <CAFBinCD_qJw6-_zsnKFhsVHUHd2K2wJ3S9EsXGrPPxZ1SWn=uA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: pinctrl: meson: Add drive-strength-uA
 property
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_122156_446381_2BD7DF87 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add optional drive-strength-uA property
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> index a47dd990a8d3..b3e4be696ddc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> @@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
>  "bias-pull-up" and "bias-pull-down", described in file
>  pinctrl-bindings.txt
>
> +Optional properties :
> + - drive-strength-uA: Drive strength for the specified pins in uA.
if you have to re-send this series for whatever reason then please
mention that drive-strength-uA is only valid for G12A and newer

otherwise:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
