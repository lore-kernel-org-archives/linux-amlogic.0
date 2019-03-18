Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55796C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:57:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A68020857
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:57:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quE0XzGo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZThueQky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A68020857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOe+Zq541lz7KD2NeN6ndA9ryhEzduIG4DjSmXh0dBw=; b=quE0XzGodvryD7
	UWOqpP4Cb24tHW6BhSKuPme3wwRIUXfhk5CESXX+u4n/ieNNeoD1eKZywf4FJx24NTBzkLFXEoL06
	aPt62d0nHXoKPvi/mHMA3DIH5VpDum8FyBysZ16eX7iSDVEmo6iFZKdTI1FcX34EYI7TVcCZk7NZ6
	RAJXBUQKIly3El1KU1SIu7TB299rIX4ZSBPrDVZZET/iOAm3b9YkI6v/2qoIz2J31NNFMR/ZdmUvC
	eWTFuHGFOjs2EkNynsVrblpOMjycUt4AnXhI4DsI2D+OQaxGBy6eJBeKi4ltmqaHvVU6N+9L5+x1v
	FnQ68PoNp7eAMvvcAj3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5yO6-0005Jv-Td; Mon, 18 Mar 2019 19:57:34 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5yO4-0005JY-9c; Mon, 18 Mar 2019 19:57:33 +0000
Received: by mail-ot1-x343.google.com with SMTP id c18so15537529otl.13;
 Mon, 18 Mar 2019 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0p8gYDpd7YrV8ybeAAOUxyt+BLOwQuu/NEHKvIZfe2o=;
 b=ZThueQkybG+BfXb3iWjfRnaJBh3Ra+r50JK3rf83Z+GZ+fdr/cO2oM0BkLqAOQCNhG
 pX9IN+GRMRxn0zV/8a9yjZ1fZk8wZy4Ki2yFokZNcOfvBEvznZMPx/5wtUF3M74ugrQK
 jp6VQxYIxDhdn4Ouq0WBvyiLG/fFCiY3aeb3WB9qL4Os+ETqMUmh+JsNVhQR92qIL2aK
 hu6qSG600uodPmBxjXyA+efmXwwAa635hGmLYCf1ZjeDeSvq9DH2k2T4KN7FKDBgGIXY
 474oFjKTLdBwng2Q1zLZde1DRZfsmxDWuhAG1beJKIQ1byrzvkuzuvbyLVnUVcvqzL8c
 ZwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0p8gYDpd7YrV8ybeAAOUxyt+BLOwQuu/NEHKvIZfe2o=;
 b=ABeAri4F0B7gl8YZJvs21ILzUihH8+82192Xp14esXPRa7oX/6YD7OYjF2OJ5puZ4j
 OQnoMTPBkQswR+aPcF92sgO46qJ90zyaF16Vod9i17b8C9/dVDH59ITKW0ZnH4S1bYzG
 J4xVI4pK+tGCwGBP5sPjz3SjHm/HElTzMhixXkJBqHhiU0AR3JVM3rl9HRxqGxfEXdCs
 e26Vp01xrlxsdUgDr4Aow358dvaoYIz06W1cUiN/RzbPJDmpo/ShLGFuJSWRf5cmsnL0
 ecL6JbV7hwTwNF5sG6PUyvvoNl65V9KGWFoBKB+RcVMqtje2KmntaBrIQTQjk+KCWrDZ
 Q13Q==
X-Gm-Message-State: APjAAAVljDKUlnPlzINbEx1IiFb+Y+Ii25sqM/67stDdvEKZr2Xg08wC
 d7Y22yId1jxCNZRqGDedIwFYB+fyRCe/cd/TUIs=
X-Google-Smtp-Source: APXvYqyyvxIO6pD9izhEnsXhJSu+xQaJVK+1ROEnE/N4Xsw7DUyXqyQ1fKNnbLM50FEj1YScOuhY8LZtDhUyKZ5gP40=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr11285345otk.86.1552939051103; 
 Mon, 18 Mar 2019 12:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190318132655.30040-1-narmstrong@baylibre.com>
 <20190318132655.30040-9-narmstrong@baylibre.com>
In-Reply-To: <20190318132655.30040-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 20:57:20 +0100
Message-ID: <CAFBinCCLrL3p=h2pXrbAnyLPiDt_3mfK4pkUhprghzbj826p6w@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] usb: dwc3: Add Amlogic G12A DWC3 glue
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_125732_361894_BF9D8F36 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Mar 18, 2019 at 2:29 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Adds support for Amlogic G12A USB Control Glue HW.
>
> The Amlogic G12A SoC Family embeds 2 USB Controllers :
> - a DWC3 IP configured as Host for USB2 and USB3
> - a DWC2 IP configured as Peripheral USB2 Only
>
> A glue connects these both controllers to 2 USB2 PHYs, and optionnally
> to an USB3+PCIE Combo PHY shared with the PCIE controller.
>
> The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
> routing of the OTG PHY between the DWC3 and DWC2 controllers, and
> setups the on-chip OTG mode selection for this PHY.
>
> This drivers supports the on-probe setup of the OTG mode, and manually
> via a debugfs interface. The IRQ mode change detect is yet to be added
> in a future patchset, mainly due to lack of hardware to validate on.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with the small issue fixed (see below) you can add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

my opinion is that the whole driver is looking great now!
I hope that it will be queued for v5.2 soon because there's no NACK
from the USB / dwc3 maintainers yet.

[...]
> +       ret = of_platform_populate(np, NULL, NULL, dev);
> +       if (ret) {
> +               clk_disable_unprepare(priv->clk);
> +               clk_put(priv->clk);
clk_disable_unprepare is called automatically since there's now an
devm_add_action_or_reset for that a few lines above
clk_put is also unnecessary because priv->clk is obtained with devm_clk_get()


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
