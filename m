Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABCBC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 22:01:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B572B218D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 22:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t10Q3HnR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OT1m23Px"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B572B218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2D2umuDlpL/jtsgj7PozUxjxgKbYY0twUEgTk5oha8=; b=t10Q3HnRe1HKcE
	ECEYya7/0fe2imFbEz9VoUhbOeo5qubC5zWP/UgeRDs3isw1kpNfnwVwM54qB5teIbgSOwGJEu+BE
	aqESvRSjCYkIUBuSz5fXWsD026DRllOscmM44uwCR+HPfd0uQwhXw7emMf6XULL1y9Y1OHZdFRPLF
	nvkMQzANhuAEMfwZlRYF/eNjXFrj4AHbNPCBOV2U7wwCsv14+M89S1W54HGDbAlnR03Aqib/FYzcd
	3SyDmrJS2fJ0Aec6Rte5TltLXLGZK927tvmLhajr1fyd140H2fYfkkbBcWbjjmgtqErTnwtshGNov
	TSSRxYcOIdhhCMz1LaWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4utO-00078a-2B; Fri, 15 Mar 2019 22:01:30 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4utM-000789-Dj; Fri, 15 Mar 2019 22:01:29 +0000
Received: by mail-oi1-x242.google.com with SMTP id v84so2214499oif.4;
 Fri, 15 Mar 2019 15:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j2k0JAt1vgLko7uklXZDWQMH70edhDufSMEPDx+hW/o=;
 b=OT1m23PxQz8fRBWNfe7XHZRvgfwxDD79V4MjxyhvEiLWQs9SEH53uwKqc0yRfsLg2s
 Cf/yfuz6sSQJV4dVbblzfdbcNqflU36bC9FrgMk0KTxqJ8jPga6WVlpELJyMXPZxefWn
 QPVjfdG/V7j0rPdPb/pa68xNckyRoE4E3hBAxc8In1mwG6Mx9j7LhsOGFfoCQOI1yE7U
 hfw/kUOJy4EemhGXj8cMUN9EseK5zqkEUSemQXGBMSD2LQmyQndr6YbRKVyKs2J/NXBA
 tRxdUFELVB62t4Cax2rZvP29yoy1n50ydWlWnNq46k4k6ZxIgRR6MqW4WMte8tUFompv
 4p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j2k0JAt1vgLko7uklXZDWQMH70edhDufSMEPDx+hW/o=;
 b=l5FL4MZjiEwn9BHxTZ2UbDV5TMgf95lB7+Li8LCl2aiSdXNG2Fp90NsfIdLEANGG/1
 5q9Hh3UIKgmRPkdpoQIP3aZwZxZiYwryS3ioLe4ilFjyypUdutcnLDM/yVvYACsiyLcx
 1lnfgmEK8P5HjVFLRVWesDyM2zudel8OV7fMQKKrgH5ImAZv4T+zeX67dmYllO8plMqe
 kJNyP0kqYhYyx2teeTw+pUvHMjS9/T0Pv8893OFcd2p7uXnhVlu2yhNw6UM1+UIt3H7k
 klkBSZoR9IoN1gvrqfki/Lgn7qoD015PSKjJA6NvaVuQxGzxwUPGfxcatEmP/pvR/4Rt
 6kaw==
X-Gm-Message-State: APjAAAUT9WSws4fWxnwA1U6+8z6b1coO+5iUea2V/AAhxukgeHXFArgF
 lxafUAPpcFpwdYTczxjwzR/eWOublNdIQFc9aQ0=
X-Google-Smtp-Source: APXvYqwAEzsOPuiVWkHO6Ot26vdR2n3mHJBCLvC6ctae3FitD75mkQPgBcR3bjvnewx5HEtl5I3p56CZMflw35MakaI=
X-Received: by 2002:a54:4e02:: with SMTP id a2mr3109547oiy.140.1552687287594; 
 Fri, 15 Mar 2019 15:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-5-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 23:01:16 +0100
Message-ID: <CAFBinCCiV21kB38SXqVYMmQ5YkK2MxXKhiTJrVP3jOCLDtuBBg@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: meson-g12a-u200: add regulators
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_150128_460649_ACFBEC71 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: khilman@baylibre.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 11, 2019 at 10:57 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Jerome Brunet <jbrunet@baylibre.com>
>
> Add system regulators for the S905D2 U200 reference design.
I find the hint in the meson-g12a-sei510 regulators patch very good:
  Still missing
  * VDD_EE (0.8V - PWM controlled)
  * VDD_CPU(PWM controlled)
  * VDDQ1_5

VDD_EE and VDD_CPU are *probably* going to be very similar across all
boards (Meson8b uses two slightly different PWM regulators on all
boards supported by mainline, but the basic concept is always the
same)
I'm not sure if VDDQ1_5 is specific to the SEI510 board though.

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-u200.dts      | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index f2afd0bf3e28..17696f356ff2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -14,13 +14,92 @@
>         aliases {
>                 serial0 = &uart_AO;
>         };
> +
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> +
>         memory@0 {
>                 device_type = "memory";
>                 reg = <0x0 0x0 0x0 0x40000000>;
>         };
there are two unrelated whitespace changes above.
please clean them up if you have to re-send this for whatever reason


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
