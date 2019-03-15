Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDAFC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D2D21871
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYvQzmWP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Wv1vlatb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D2D21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDjb8o0mx355MnKA/jcQ29b668jtkpjxy/jW/hqDUvg=; b=SYvQzmWPpXsy+q
	EdZmf90aqlp7eHAhnSZy5TC+/VR/YzspOuxRoDk/wH7YW6YoPR4iG6P1K4VBUS/L2jZL4NzCtv/c5
	4L4O50+0NDQVcPjELbbQ1oA/h2tNWCOV6/OdafM8KsjzIbK5UBqvD5P7Fr+4bxN6NFAI13j/Fvi3i
	QDrr+eQtv0mq3zS6NNqXiA6kJl1TKAqZBnuF4ddA+ZQolMQ9VIQN5fVSJKZ4rpwhXWHCfoz8/ktsR
	PxrR6/W6hrt4jcwIeVqDRJspiVyQebtKDiYeLx1WkONepQwLXmNKwY6Wgzcyu1xVmUeNc1ThlgqKg
	BGlYi3BWEqoDfQSoltTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4u38-000216-2D; Fri, 15 Mar 2019 21:07:30 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4u35-00020e-K2; Fri, 15 Mar 2019 21:07:28 +0000
Received: by mail-oi1-x241.google.com with SMTP id a15so8489358oid.5;
 Fri, 15 Mar 2019 14:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SWxNjAccAcXWTbaO89TLI40dCP3xjQ327HPneRU/0Jk=;
 b=Wv1vlatbExctWioJq+H7Lewc7enajIjU+MaYu3cQAkXZTKLu8SdyAX3zhbJPWA/slX
 t4yp5wopDXvY5ONZm/ip2MQjBAscqoR68jvPtJ7K7FO/8yQRfxfJW27FhatGi1Pdg/DT
 9DFOPjiSbfJAQLmuF/nol+JorWoPC9CbL/eqHSY3RFFk9UCG3Af7uyWWpXNhPA8PGAag
 YFX00qbeQ8BtdLgQHiI6IXI4pq/xrkbxTc3WeCqQ0yojNir7w/OV0k3qjZ/qb6efLPto
 wdqgKFPSnliaCnORmUVLKbmBsSfEklqxUoQG0cp5vTcEMpE8zNW14kTj4W57KXwJp7Fu
 dpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SWxNjAccAcXWTbaO89TLI40dCP3xjQ327HPneRU/0Jk=;
 b=Qrkdt/MNPc7w913JBQZrCQicz64hErwGMxaIOFZ3Kp9yZNnPhmgcwrRY2ULdW4MzhY
 y+C/EkookPCfG6NAKe57jKhiC6sLYSsNt25LiPUa/hq2GuzOPhTSTIFJgs33fvbqWX6M
 1jQ+LdNOIdDIqsJpzu+GzPKTZ3yvMErIe1mCfhuBOFp79fBfcnGTMIAEji3ijDPD5J40
 YNLdi6kbguwMrQLb6LINk1kFiYX2sWm3E9F24/B6rpV1gvz8BcF0NgYlZB+NA86hrNba
 u8HpDqEyE45j4cANGdCjbkfQKvcpC6Q2rR35cBlokmVPlGRcayIPhbas/CGFhRzgby2A
 ZGCw==
X-Gm-Message-State: APjAAAVlm7y/nzXWXNSVn1Kil6Vyetq79SGyIiY0iJAj8h5tjt/2sa/U
 vxHyzGxHF61Y5DaysmkEIB3AcjiRVLE2Ruvdvuo=
X-Google-Smtp-Source: APXvYqz6eHpbwaTol9R0UvijVk9S8O4jMZmHOSIU8vHKIdr6d5Eq9/tDWmigxSiNH6gGnTC8ebw+lH4Vsg42YFprEFE=
X-Received: by 2002:a54:4e02:: with SMTP id a2mr2981199oiy.140.1552684045898; 
 Fri, 15 Mar 2019 14:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-2-narmstrong@baylibre.com>
In-Reply-To: <20190307151342.7381-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:07:14 +0100
Message-ID: <CAFBinCCF81Af=5F19NT337Tfx+oQzx7-zFu2063z7wSfU3qfjQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: meson: g12a: Add AO Clock + Reset
 Controller support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_140727_653926_30EB6BCC 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, Mar 7, 2019 at 4:14 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add nodes and properties for the AO Clocks and Resets.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 191d31db9853..0eb5220da82c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -122,6 +122,23 @@
>                         #size-cells = <2>;
>                         ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
>
> +                       rti: sys-ctrl@0 {
> +                               compatible = "amlogic,meson-gx-ao-sysctrl",
> +                                            "simple-mfd", "syscon";
> +                               reg = <0x0 0x0 0x0 0x1000>;
> +                               #address-cells = <2>;
> +                               #size-cells = <2>;
> +                               ranges = <0x0 0x0 0x0 0x0 0x0 0x1000>;
is this supposed to be 0x1000 (GX uses 0x100 here)?
my understanding is that G12A has the AO CEC at aobus + 0x100, so
using a size of 0x1000 would make it overlap


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
