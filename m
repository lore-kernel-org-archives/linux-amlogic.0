Return-Path: <SRS0=MCOz=W4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B400C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E108021897
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gv97yuUl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YLB6RCVg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E108021897
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PdbDO3t+T1DqhduGOhyJbbafzVziaFIalzIoulaF/A=; b=Gv97yuUl8UYRxq
	9vV4ujsTtiu5Cub6RVx9YEpID0BX2cGP1PJBqQiixiOkGaQWG7KqnNxi/oZSwKJEiAUcCjTzOsIqQ
	6tyJH+g0REtd8OpGjG84Ovqs2h5G2nl1d5SFEG9DPtJYOd+qrMPo8VYvK9pQvXBSuM/LOuhMqcqly
	tOyD1uP84oAgKP2NuBs/SPkNmydpGIIR55eMlFLUTKF7OL044j7mmv0b/pSApAgmqLVjOgQou/Xbp
	EC1TWCpeLsGU2FSNbLr9ryyZGh3jmwe2zZjtTooVTLdPecMTS9/IqMYNa7HYl8VPksu9UsLvuXwxU
	j4bhu+2EF8wqJbWPydrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4OEq-0005qH-28; Sun, 01 Sep 2019 11:41:44 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4OEc-0005fl-1f; Sun, 01 Sep 2019 11:41:31 +0000
Received: by mail-ot1-x341.google.com with SMTP id 100so11165969otn.2;
 Sun, 01 Sep 2019 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r+ifEZAzJQwmHDrw7qQ44oHKKTpN0loOr0Zh74/UU5o=;
 b=YLB6RCVgPnAMWngSByRnivbUT7FyzLApPl0dPg5dI1mq4pCGW/khzy3JZBzh4hzSEC
 k6eCa6/JJE47EY6NMtQo280U4nH5vO90SMV2n1E/B9+PexgS5CQleUAqXeUIoYTtr9d4
 i6ip9pXV6xy3l1o/6KhPNaY8TOw3b7/Kb1lUM1Pk0+AK+USpFtd3BQFdOMu6vziSCtB7
 xGB8flqBsf80JGZwXkL1G4ezynHokrH5n14l1PwuAVYMJFUt8XHrqfv7M56/poOG+dfE
 Sid0/29YUrTMvV50/yltifLs5nZPnaj+ubMR5WOyn4mv/CD/ggXZM2ELNQqN8SC4WWyt
 jTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r+ifEZAzJQwmHDrw7qQ44oHKKTpN0loOr0Zh74/UU5o=;
 b=pduS8JTE8zem5TCysY0djTIMpwUI6AWX+fwRzEqQwJvsgtljRpTMIJ2uzwTRJ9JZti
 m27FzRixbBIbEkL2K4nFTH2K9UH0BV/D8tObJEKYD5MznuENslW9noSJTkudrv35vMM1
 +VJbWvGEjOxxifoGrpn1FbRo7lpQidnPzv6vbBG3iAPu5uFz95evWIul+bBnoncNnjnG
 T37sRZDIiBIuqIHfBRePHzVlwxyIPhdm82fPpN9nyMAcQObyuenAei5S0PpC6HAKhfyr
 Py72Z/dPHeUBXEOIDg/qVoivUOpIfxqchOmi7BMpbVkY6R/VtWyBJaRhw7fAPlFsOv8z
 g9Pw==
X-Gm-Message-State: APjAAAVB5Y6pDeXMVwipGR2NL2HPlO6vfsE/zlx1gUb94hkbDl85IEjj
 opyov9v9NfxHp8ujSof9rg6z97WIcIOyT/i+G1g=
X-Google-Smtp-Source: APXvYqx5j+6QgoQYDILBAc7XTNLaYWT6cuFB2toneCe5Tn0bUMhwPnpLrnv61xMBV8BeutJFkCmQZ0J6X4i0Lph2H9Y=
X-Received: by 2002:a9d:6c0e:: with SMTP id f14mr9265369otq.6.1567338088855;
 Sun, 01 Sep 2019 04:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <20190828202723.1145-3-linux.amoon@gmail.com>
In-Reply-To: <20190828202723.1145-3-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Sep 2019 13:41:17 +0200
Message-ID: <CAFBinCBA-sQcshd9iAVn=ZDBKkDN3OgJs-WjKEhVLw===b0AdQ@mail.gmail.com>
Subject: Re: [PATCHv1 2/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to VDDIO_AO3V3 regulator
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_044130_089272_63EA8A14 
X-CRM114-Status: GOOD (  16.68  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 28, 2019 at 10:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per shematics TFLASH_VDD, TF_IO, VCC3V3 fixed regulator output which
typo: "schematics"

> is supplied by VDDIO_AO3V3.
please add a short sentence to the description (since you probably
have to re-send a v2) like:
"While here, move the comment name with the signal name in the
schematics above the gpio property to make it consistent with other
regulators"

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
with the patch rebased (see below) and the two issues from above addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 98e742bf44c1..a078a1ee5004 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -67,17 +67,19 @@
>         };
>
>         tflash_vdd: regulator-tflash_vdd {
> -               /*
> -                * signal name from schematics: TFLASH_VDD_EN
> -                */
>                 compatible = "regulator-fixed";
>
>                 regulator-name = "TFLASH_VDD";
>                 regulator-min-microvolt = <3300000>;
>                 regulator-max-microvolt = <3300000>;
>
> +               /*
> +                * signal name from schematics: TFLASH_VDD_EN
> +                */
>                 gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
>                 enable-active-high;
> +               /* U16 RT9179GB */
> +               vin-supply = <&vddio_ao3v3>;
>         };
>
>         tf_io: gpio-regulator-tf_io {
> @@ -95,6 +97,8 @@
>
>                 states = <3300000 0
>                           1800000 1>;
> +               /* U12/U13 RT9179GB */
> +               vin-supply = <&vddio_ao3v3>;
>         };
thank you for the patch but I think it won't apply on top of Neil's
"arm64: dts: meson: fix boards regulators states format" (which was
applied just after you sent this series)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
