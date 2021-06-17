Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760DEC49361
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346BE61004
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346BE61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSQheGKUUbg7AGc+lcGZz/PA8YdWqj8Fnpurz4CzSCI=; b=3OAIKxEIHkjiS8
	ETL2oSmUkTIApiSNMOVrWlv8GgIyIXds+FTYcY+GBMp5RZNshHaWPpQjhyZ3IAdcWgYoFcIqzAugK
	zQwA5riXyhF2026mH4GsBP3rKJ3FCCbVrMsBtjw6XwWrx7lDGcb4Q/sw7rMm/gTSeV83j7uLIrLyH
	5p41BokUOS7ch6IW9uLeaqW2BqQfuXRXJNM/yiVbyZyj6Q330dNivBD2f4OHWTVKHcssGQqypDTtD
	Bz76sGjm49NJ42W5iio3STDac1uKerG1CaY3Eqhguc1uxQ4UOf/z1sgYZyD16Me6t87lS1aRrES5p
	IW0WXGKjzRmBtzk8uCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0JM-00BvfC-V8; Thu, 17 Jun 2021 22:16:32 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0J9-00BvcA-2y; Thu, 17 Jun 2021 22:16:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id og14so12504205ejc.5;
 Thu, 17 Jun 2021 15:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AwVsJszErVtiyw5bOlSHdlACIUbk2leEVGsI22Nm16c=;
 b=kJNfxLLxB72H4z5568lAYK6FwqUG64zbFQZGgHu0rNw3JSMmfIYJbli8QZgaHLkqwN
 dqGNlVi2B663P/UJFyPxXHsOhsML6veC9Sd2PIGMz+hwSi5aFjrSo3GNcjioZsymEJUA
 Xhw6CnEwgNZYNP8zdNaBu9ylCoLnUsO5jungvWWNorKlZiHs1kgXoMFXvdFI1r7NaBvB
 RiG6cxxfC+TpLGLP/RjArtcTWQvjExLFct8del+j85LN7oAyvABr2nfvp7j0pfgPYSCq
 xkmpWB1uJFj/dGkh35bZJSCxegWSck8lfgZIDsnyTimeTZJqygEl2DagMKzgWpmXb54G
 LfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AwVsJszErVtiyw5bOlSHdlACIUbk2leEVGsI22Nm16c=;
 b=ZtyFVIjkl4lZrnd+L33kaLU9j80F6bUlCwyqaKYPqLlMxhKeo14nmHL0GR6WnjTFzB
 6RZvL6eFAMBayWA4FWKYBr0sWpw117/OpCHNV7BcPJOuKX1L/VoxX/MbgoRARKiLOfCL
 z/xPPFv7Q/Eo9OnrxsxMCP+HPxTOcVcLd/VGKHUl1Ss2dAEw3+zrG2t9eZMRrfy74DBT
 RJZwu0ivg6ChMtuDoWPsBnHEKjquYZYrTPlebReM6Uyvmo56FkvCaBFd8MJUiOU4kyr7
 vd2m0RY0SiEotitG1frMi4HpyJzaaii9MBQimNnkr23KRv6WRPyVZZWAvtyLeOh4SQaf
 liaA==
X-Gm-Message-State: AOAM5314lZ3MNquNFpgQ7u29EI1OoHs794GQWY2ylOoYObYSeviPPcWY
 6fRZvIWbGapb2e42Y20YKj5XhirxCdZVopKqvvk=
X-Google-Smtp-Source: ABdhPJwq5lDCttRtdcLtp8xWWsEyuZqDh41mR0y7tmleLZioJ3kdB5nIgDKCGPjdhNhzugBo1SrbqHNC/5oB4qsNROA=
X-Received: by 2002:a17:907:9607:: with SMTP id
 gb7mr7735421ejc.208.1623968177208; 
 Thu, 17 Jun 2021 15:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-5-linux.amoon@gmail.com>
In-Reply-To: <20210617194154.2397-5-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:16:06 +0200
Message-ID: <CAFBinCB1rrmJ5=M0tSGS_47BarFcrs2Kz5qFzrHw8+OEYxX3DA@mail.gmail.com>
Subject: Re: [RFCv1 4/8] phy: amlogic: meson8b-usb2: Use phy set_mode callback
 function
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_151619_195863_93AAD17B 
X-CRM114-Status: GOOD (  13.24  )
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

On Thu, Jun 17, 2021 at 9:43 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Reorder the code for phy set_mode in .set_mode callback function.
> For now configure the phy in host mode.
as mentioned in the cover-letter: to my knowledge these register bits
are "static"
The settings for dr_mode == USB_DR_MODE_HOST mainly apply to the
second PHY (usb1_phy)

[...]
> +static int phy_meson8b_usb2_setmode(struct phy *phy, enum phy_mode mode,
> +                                   int submode)
>  {
>         struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
>         u32 reg;
>
> +       switch (mode) {
> +       case PHY_MODE_USB_HOST:
> +               if (priv->match->host_enable_aca) {
> +                       regmap_update_bits(priv->regmap, REG_ADP_BC,
> +                                          REG_ADP_BC_ACA_ENABLE,
> +                                          REG_ADP_BC_ACA_ENABLE);
> +
> +                       udelay(ACA_ENABLE_COMPLETE_TIME);
> +
> +                       regmap_read(priv->regmap, REG_ADP_BC, &reg);
> +                       if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
> +                               dev_warn(&phy->dev, "USB ID detect failed!\n");
> +                               return -EINVAL;
> +                       }
> +               }
> +               break;
> +       default:
> +               dev_warn(&phy->dev, "USB ID detect failed to setnode! %d\n", mode);
> +               return -EINVAL;
I have tested this driver already with PHY_MODE_USB_DEVICE (on my
Odroid-C1) so I don't see why we should drop support for this
Also if we want runtime mode switching in this driver then we would
need to undo the changes from "case PHY_MODE_USB_HOST" above

I suggest dropping this patch until we know for sure if and which
registers need to be updated based on the DR mode.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
