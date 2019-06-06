Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEE7C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 20:03:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DDC208C3
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 20:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdHVmwHt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="esnTxM3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DDC208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2+e3oe3mYLcWAgmuqN/E+VdmTtOSS5SXnRaYPLydcw=; b=SdHVmwHtGnUL8W
	WyZbvimZAQiXQ6be7xUcZnc5wnsXraEBpnFmi8y79RsVH2rQBwuwDci+1BP7jS8u57UKPZW5Nptfb
	z3pykcJ+gmEqrqQMMCEfFd70A1w53iLDDdFbpDXxc3e1S3qqMjfk6mkXqRHATP0D2INy5hNz9Uj46
	rXCD1xWC9/uAuRfJlZg7sTHlCP8ztteSfBGJFh+s3pTl1JSNmuZPVEHfm0ThuDkJTu3NM94/Nef7Y
	KkGtiysmb6vWNwecJnqBdBOdpeeCWMR7izBf0CaoC337KDCZ/oRbluZVxzM05Nhlh4/2kA6nQ/QMt
	zLgnhsdwt4NigiDfDiaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYybE-0002ML-Ft; Thu, 06 Jun 2019 20:03:00 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYybB-0002L3-NE
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 20:02:59 +0000
Received: by mail-ot1-x341.google.com with SMTP id n2so2168251otl.12
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RIvsH3Ym5EcAwDwvS+b3p8z6BprcG74uoKQfADXB/r0=;
 b=esnTxM3nTkO1ix2Z6eEydRnxKZ5Kxa70R83FM0Ou2xWtaJzPe2BriMzf94k6w0BzRU
 6LTA4Sgj/fQmRXjJuWW6mq4ftpQcOPEoC2/GO5meQLdge39Hkrk0jcUuH+r5LStaw7Z/
 pV4rNdHG4gaOcy4D0CsFeygnrDuK0rWkP18iDpucmvAeTt1i+MxVBXtn8qsHtCM1jQx3
 0bCQG1lkjM/3PyBrdi2SCEltbEpSdpRFCS36tOhXizDPk05lTUKfRXdpcSToLDuG224S
 74AbWiCOFdjCrmgO6Ddhs2vQeRVHPb1aq/GnODfKTj3m3jqH7WShs27vHM5wPdlg4BNp
 oUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RIvsH3Ym5EcAwDwvS+b3p8z6BprcG74uoKQfADXB/r0=;
 b=Uq2T4//RoU2wTnLrriE9kBhYflJtCDcjI10MHmZ4Qwuy+BPI4XWvpNLytLERLXw3CC
 AFk+7sW1RX9BOzU32sHOFJJkq7WperuOWnTqpGNplG85j3NSinK/RNENpXyW0ElIp7hq
 ektsiGVDrliBwZGtwohX2mzPVSS+OJic9uMMnPqXiHIRR63gAU/uU1lo44+XdHefrQ5q
 a3v4LHE4BblqUQr3DzBcDuilkmZX+98md2Oq4Hs7RzGXF0rF/yW5G8CgYs6V2EyKnzr8
 fdIU3S/sw5Kg1PUVDMERxE5p39zsWWIBt/uJV74O/YdXfseutMUw9jgfCeG18XQWhs3v
 EU0w==
X-Gm-Message-State: APjAAAVNYc/fRpupKN9RAjQhwAMFlxsRukH3hHN7RJXy2vYgcWvligcP
 lIq1PckE0I2Yi3VJL8Q+HPWic+xMCAuVDOPCrU+CKCzx
X-Google-Smtp-Source: APXvYqx8BhBRTpsZfMPkHq8+kTin4ygRej8SSRMvvGxqRArgi61tGGpiaWenaZGYHV0blvgc7tXLrhUxTBm9OLICHmY=
X-Received: by 2002:a9d:14a:: with SMTP id 68mr15480307otu.96.1559851375583;
 Thu, 06 Jun 2019 13:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
 <20190606132439.25182-2-krzysztof.michonski@digitalstrom.com>
In-Reply-To: <20190606132439.25182-2-krzysztof.michonski@digitalstrom.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 22:02:44 +0200
Message-ID: <CAFBinCB+W8F9PL4ZgiQJxXu7qmgfORgbPB=6AM-kzXmChpjWyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Enable secure monitor on gxl
To: Krzysztof Michonski <michonskikrzysztof@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_130257_778453_71F8AA6A 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, afenkart@gmail.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

the subject should start with: "arm64: dts: meson-gxl:", see the git
history (note that there was a rule change to use "arm64" instead of
"ARM64")

On Thu, Jun 6, 2019 at 3:24 PM Krzysztof Michonski
<michonskikrzysztof@gmail.com> wrote:
>
> From: Krzysztof Michonski <michonskikrzysztof@gmail.com>
>
> Add secure monitor node in the gxl dtsi file.
I assume that this is to enable the GXL and GXM specific commands?

> Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 3093ae421b17..fd75538ee9f9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -37,6 +37,10 @@
>                         };
>                 };
>         };
> +
> +       sm: secure-monitor {
> +               compatible = "amlogic,meson-gxl-sm";
> +       };
>  };
if you keep the secure-monitor node in meson-gx.dtsi then you can use
something like:
&sm {
    compatible = "amlogic,meson-gxl-sm";
};

the compatible string has to be added to the documentation in
Documentation/devicetree/bindings/firmware/meson/meson_sm.txt with a
separate patch
devicetree bindings should be backwards compatible (at least that's
the rule of thumb)
you can use a fallback compatible string so this new .dts/.dtb also
works with old kernels (which don't support the new, GXL specific,
compatible string yet):
  compatible = "amlogic,meson-gxl-sm", "amlogic,meson-gxbb-sm";


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
