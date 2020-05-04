Return-Path: <SRS0=PlEO=6S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A3DC3A5A9
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 11:01:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 167CC206B8
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2020 11:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eA8V4c6P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Er757pB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 167CC206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WuCYec1mqArZcXM/wTSiRiL014ojXq2pgOMMjlmfCk=; b=eA8V4c6P0sWtDL
	M/cdIUAjbXOEvNC/rlyp6ky14of3qG+CuzAW4TAtIDr4xmCzhBRAWFePfUC/MPQ5lU70R8Wmztj1F
	sMKl1+Pl/V1mXLYdLJ9ZHufkkjzns3hVUkimrgcxbMwGcBGdyUKPxU0R+ikcFVO5PWwuuLIG5VaHS
	ku3AqKWaR0kS7OZYNWqCYImrnpC0D8UFuQ3NNQSXzxQckuzbuA4ToCLWJj4LYHjMJexV3Jv28osyt
	8SZ02lDtvDqZ7mytmMTYGQyYMY9xyNO7dyOZwoHAi/n/sD4Kaf4avDuLMZfKXLXTcNvJoOZHRaWG5
	yk882XLrwpRNh/zsMxIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYql-00060f-C6; Mon, 04 May 2020 11:01:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYqg-0005wS-N0; Mon, 04 May 2020 11:01:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id g13so20346466wrb.8;
 Mon, 04 May 2020 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8gYfSI9LTcswBBqFfe7141haPYxExZ3uMFkC1/HLr8o=;
 b=Er757pB4csDycjVcXCmOh++3Va7lgE/d3hS1HwCih97sW3prXSMjWizDZgcytRdk2r
 cgapq+RDFM+tDupAohhSg8ByjenyW/Q8Yws4pugfIcFlefT+6Q6R9EE+E3rh13EpzY/3
 P9y278S5lJGhcqYVZ2Rhc9+/RtR2avv6UH8d7mMtlJ9vTSumQRNNIq32eJdJV/CSLTa7
 4zQdDdXqyYMte+9YaWiE3+o0kzV7xQ/mDLO+6+B/kyZFUY3Uvb/zsy9VuGafoWwvHFjd
 iBmCjFCKvfe/8/gFjPRDDFJZkZ0EQJoyw6jlKn4KPWkr9Ky5yIEriacriuQ89w37U+hw
 WpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8gYfSI9LTcswBBqFfe7141haPYxExZ3uMFkC1/HLr8o=;
 b=tYivqeX/3UZC4YyILtZ/SVo6ATlXr/4NeTTYIieuyl3URb2P4fi+KdkfTn7zY6EZ+5
 ViL+4d7PtF0lC143CKQrH78Lulj9f+1DqFWY1shMV9GBueAUB/k4RAnRlPaYeEkNB/7X
 ym7QHAbgmFucPBQr5Kjt1u/DyCLklIJh81xfSgCBZ1LJlRieJBpw2Y/976zI/RIVqlEQ
 G9/+ibkErySv+8J98fiR1wZ2tGwraN3eL34E5y12ajWqmAdHjs5nLSMQ4Zj1k/vkl6AD
 gKS0cxlUU6wRYnZjaht4+WeaQ+0x1rKCNFobpwMDtvsS0QFiXufyAu//gwB/LouKkbRv
 bQFA==
X-Gm-Message-State: AGi0PuY9LX38t2g/0uJD4Th/6ZSiDjF6UM5CaAuQKOHXSWpY1PMjGxv6
 VSf7SxsbdkCesvK3EW2evvmVoM0xUwqI0xjgitY=
X-Google-Smtp-Source: APiQypJbvlr1zD1X04CH2mq6hBepmWIB7EJ18lS67KkLbsAn42ZYeKKB8H4UVnOmZIuoTF5rZku2E4lnkGqfkgB+hCc=
X-Received: by 2002:adf:f641:: with SMTP id x1mr18421592wrp.151.1588590080839; 
 Mon, 04 May 2020 04:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
 <20200502114752.1048500-7-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200502114752.1048500-7-martin.blumenstingl@googlemail.com>
From: hex dump <hexdump0815@gmail.com>
Date: Mon, 4 May 2020 13:01:06 +0200
Message-ID: <CAKTihDXu2ZC3p-5w41-jZQ0x9kbcPnVyuwB5zgE3sDA6n3SiaQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] phy: amlogic: meson8b-usb2: Add a compatible string
 for Meson8m2
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_040122_792261_5FD21CF2 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, May 2, 2020 at 1:48 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The 3.10 vendor kernel sets the ACA_ENABLE bit on Meson8b, Meson8m2 and
> GXBB, but not on Meson8. Add a compatible string for Meson8m2 which also
> sets that bit.
> While here, also update the Kconfig text and MODULE_DESCRIPTION.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Tested-by: hexdump <hexdump0815@googlemail.com>

> ---
>  drivers/phy/amlogic/Kconfig            | 2 +-
>  drivers/phy/amlogic/phy-meson8b-usb2.c | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
> index 3495b23af797..5ec53874d1ea 100644
> --- a/drivers/phy/amlogic/Kconfig
> +++ b/drivers/phy/amlogic/Kconfig
> @@ -3,7 +3,7 @@
>  # Phy drivers for Amlogic platforms
>  #
>  config PHY_MESON8B_USB2
> -       tristate "Meson8, Meson8b and GXBB USB2 PHY driver"
> +       tristate "Meson8, Meson8b, Meson8m2 and GXBB USB2 PHY driver"
>         default ARCH_MESON
>         depends on OF && (ARCH_MESON || COMPILE_TEST)
>         depends on USB_SUPPORT
> diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
> index 436dfa1a8a04..03c061dd5f0d 100644
> --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
> @@ -302,6 +302,10 @@ static const struct of_device_id phy_meson8b_usb2_of_match[] = {
>                 .compatible = "amlogic,meson8b-usb2-phy",
>                 .data = &phy_meson8b_usb2_match_data
>         },
> +       {
> +               .compatible = "amlogic,meson8m2-usb2-phy",
> +               .data = &phy_meson8b_usb2_match_data
> +       },
>         {
>                 .compatible = "amlogic,meson-gxbb-usb2-phy",
>                 .data = &phy_meson8b_usb2_match_data
> @@ -320,5 +324,5 @@ static struct platform_driver phy_meson8b_usb2_driver = {
>  module_platform_driver(phy_meson8b_usb2_driver);
>
>  MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
> -MODULE_DESCRIPTION("Meson8, Meson8b and GXBB USB2 PHY driver");
> +MODULE_DESCRIPTION("Meson8, Meson8b, Meson8m2 and GXBB USB2 PHY driver");
>  MODULE_LICENSE("GPL");
> --
> 2.26.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
