Return-Path: <SRS0=ofbE=5H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46442C4332D
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Mar 2020 02:24:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14DCE20739
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Mar 2020 02:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgXCe4ci";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vIXRN51V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14DCE20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bj7zhRQciAmYMhyw974aA1GYgN0Taa4i3U9/dsBzv8=; b=pgXCe4cipQYgqg
	mUggOJx8bsQDD4SZCx51ZZfmLhJGQSpJfhypK4Jot/scIfb1HyveTM/dJB4tklZrNficQGduxopSR
	oo5vZNOFC/Conhuv5dZA0W2+CIIoJdrFRKDa+S0WYuTk6QmA7nr/7M83pL0ga7zRFb0mXD9FjoFQO
	4rcpLIFx3fI2acYPOecGVQC1aJdKWRsGLdAK1Ohzc3vUGH/lLHW0K6Phjl9kQgLh+xD0CEL2CUtMZ
	FSxOYpX1rCMqUeQLhCtwMC70n9Uvbz4Lv/1i89z5fL/NnZjmnJorVdBvxoKbsUb0tL+LZaE1WiHxL
	lyhx2DaIf2d58M5qy0TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFqHO-0006W1-5O; Sun, 22 Mar 2020 02:23:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFqHJ-0006V1-FW; Sun, 22 Mar 2020 02:23:55 +0000
Received: by mail-wr1-x444.google.com with SMTP id 31so6198342wrs.3;
 Sat, 21 Mar 2020 19:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioMqBUlgEP197yOqRJldZRP4FcdjiAk47h+WqmBXfrA=;
 b=vIXRN51VH1yI4dp+CvD6MX04O1CKnXPkgl4TbZXa4W9rUq3G7vS392ucc3BQ4CHgTP
 r/huLkYYD+y5ihfiM9K09Tmj0EussGjo/TYnXlRJrzZGUYK82+EJbWm6OPnOgmDCOZTh
 c/k/WtcD2Atl5L9ug+jX2T9Y0sfxUUTl0qiDcMtu374q35nD51SAm/t8SW0oM8iwZ7Wy
 FbC2vtFm4MLu19K+3cRQTFOJyEL83n1amdV6JoynnUbh1oIbiiTwDFD/lEMqk9j0dfzj
 Dx19M2ViyyEWsQrp/PkQwVU+wYi6QRjE8HbQfu69sLyse99XC3LkZDp1N9fkazXq1IGC
 KYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioMqBUlgEP197yOqRJldZRP4FcdjiAk47h+WqmBXfrA=;
 b=jDZSb0LJ5ds1zNyG7l2i813Q6jPzuIndUiuLnBZ7ZyjVt0s9Mt4A+Qph/xvmpQs7b4
 ILKJcRA1BwcEAQFbbDokkU+9MZEvTgRqsfiW/4j6R+zIWqiArvQ7fS5BwAa/OtX7bTLI
 Xz4ArPyr3rIrfhyTCZWQoN19IQ68OUFvko6iD5lMbhPA86quG2f6im4T0uygkRJKzTKF
 DPLX9ankSR8CWfBvDbWt5hv9tgK8sSoDYmUTkW4680rkVrhzm/A++tNlQiqjo5ewVuwb
 UrnKI5WmKc+oPA9WOoxcR3npBBiJ+hyQ+DjkxWYXbUbzDu9q1Hn57QwQ14p4P3eEGieW
 k35A==
X-Gm-Message-State: ANhLgQ1aBRz5VMt/T6cfXCAcZkRSCC+/XDjlF4LncLLi1jhFLPFieODa
 2UkZDwEqMXiUkNWSlsyH2tcUAm6V5iRxTaayZeY=
X-Google-Smtp-Source: ADFU+vsFdmXWrsHJPw61O9GrgiXWOvmQz4H1EzO5bX6oaejYFzkLeS3cOLXLjMwlseimcBcMImN4sKDPyS7I5pYtUto=
X-Received: by 2002:adf:ff82:: with SMTP id j2mr13878951wrr.48.1584843829809; 
 Sat, 21 Mar 2020 19:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
 <20200319203427.2259891-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200319203427.2259891-2-martin.blumenstingl@googlemail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 22 Mar 2020 10:23:38 +0800
Message-ID: <CAKGbVbvDEkfLyhstd0+akqq0Amt-s-JMayxiQA2OxEfZPwj_CQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpu: mali-utgard: Add the
 #cooling-cells property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_192353_543869_2977B18B 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Fri, Mar 20, 2020 at 4:35 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The GPU can be one of the big heat sources on a SoC. Allow the
> "#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
> the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
> overheating.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> index afde81be3c29..33548ca2a759 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> @@ -107,6 +107,9 @@ properties:
>
>    operating-points-v2: true
>
> +  "#cooling-cells":
> +    const: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -162,6 +165,7 @@ examples:
>        clocks = <&ccu 1>, <&ccu 2>;
>        clock-names = "bus", "core";
>        resets = <&ccu 1>;
> +      #cooling-cells = <2>;
>      };
>
>  ...
> --
> 2.25.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
