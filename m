Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0D8C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:33:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06A761351
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06A761351
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9STw0TE6KrpanwRODXz3UL5W8F0ATND7PSK5XeOM58U=; b=OTd1eMPMnW+cmc
	0apAWELEbm7OhABv1TaZVR4nPX0zkOPrR7BE32mKo4SbETKzfEwO0SBVTu/6noRnBnMV8oFdv96uK
	sjsQXDV8Xrf+F1hvixjyjCmDwzp1QBPMlpwcSdqVxoNbDHuEwrGVfPU53tAcdLMDj8pzzVKWQRLsw
	WEHo6O782v4rS8AIWHH0Rxujbn04R3hP7CgEt0VDRMhPAx6bdLfmnxNEZDpwB8YyUY+GgFpiZPc0H
	P69Ci4xQx1WSNoJwSCMmidRyIZuTuLRkUhukOYqtyam+shD1SATakFIGn46J5qmoYS5dK+VNLgUeF
	oDPiDLFGuJrSOM1FFfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0a5-00Bzu2-0n; Thu, 17 Jun 2021 22:33:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0Zs-00Bzct-0V; Thu, 17 Jun 2021 22:33:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id u24so5854071edy.11;
 Thu, 17 Jun 2021 15:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OaoP1XPBwGk1yK5n09/1HQPhsRu1MIRshfXxsvpXFEY=;
 b=AuD2WdEmm3enMlcrr8WgqrpyI6kR1vZW7RtXxN7W1WvwB/4/+XMMUMSVDGN7mp0ZCo
 2IDJMrYjYjClOYU19NJnG8qCyB41siT+DQ9ltGLm3gpGXcJpCLtlmAFhgSQxJnUjZtTU
 0F58BykXf/Ihm45GNEvbJdkG/NBf4oa+4AEur2xLoT+WmGhxRNm9NemCGoaKMF/oWtQV
 iOCKGr5lf5NCgHGyWvmy5J7BSpJ5J600tdiHjyX4hN0C+J0MxOp2tTv94KunSanPfEHV
 sK7oGw/gFHqiK52SyahSOWZmoKPQ3KOZmLLT+A4puT069ncGTav4cWjRwbe4j9kJ+QAB
 hFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OaoP1XPBwGk1yK5n09/1HQPhsRu1MIRshfXxsvpXFEY=;
 b=UZcxq5/accwcCfRep61Qn4IabQsKe0eQjZzs0bq4QmDBRld5Hq4RgcfneabBYtgSlP
 uXveID8LmONASxeQSpqpTG0YlXSKMzKddvCDuY5auRbjMN44+2sgZJiHCPkcyNL8hnUt
 RvvgorNR9wd5Wji7Y7n/S3yQIcNlWu/W6P+JpocgUp0+CuO5xdy//K2s/uqOVyAxKsD0
 XK3rbN7+k+oHEbqTNzBBSZoiBuu6WAmMK2R58jngE9k3WOa4m93DHxDNI+t77ynX9HA4
 u24xEZhrU5FZF5kE4KiKD4dLcPHQpX7eufyo2Cdo0+YOhTuLojxa9y78QcdafToeVsF7
 tSeQ==
X-Gm-Message-State: AOAM530rSmFGZokvKCr6GJtIxUV7lfnTM8Bibq8Jat8+h/R3RDD3Z33m
 p6SGkEzH5UxSykhesaejv03qmQNw6UtYUjqjNt8=
X-Google-Smtp-Source: ABdhPJzH7Auby+UpfdN925mgN1EmQk+eJ1uoHhcMCWAa33jXnDkaDWCJ17XcAI3qk6jxhazLHLxEu83SYBoFGqBA38Q=
X-Received: by 2002:aa7:de1a:: with SMTP id h26mr812353edv.176.1623969214809; 
 Thu, 17 Jun 2021 15:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-2-linux.amoon@gmail.com>
In-Reply-To: <20210617194154.2397-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:33:24 +0200
Message-ID: <CAFBinCC4_bsTEwj5+=iH-ZF3LpSzSjN-x44Yr_XU4R9=Wzq-Mw@mail.gmail.com>
Subject: Re: [RFCv1 1/8] phy: amlogic: meson8b-usb2: Use clock bulk to get
 clocks for phy
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_153336_097941_CDBCCFCE 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 17, 2021 at 9:42 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> +       int                                             num_clks;
> +       struct clk_bulk_data                            *clks;
personally I'd get rid of the num_clks as this value is static
instead I would add a #define with the number of clocks and then...

>         struct reset_control                            *reset;
... use something like:
struct clk_bulk_data                            clks[MESON8B_USB2_PHY_NUM_CLKS];

[...]
> +               dev_err(&phy->dev, "Failed to enable USB clock\n");
clock -> clocks

[...]
> +       priv->num_clks = ARRAY_SIZE(meson_phy_clks);
> +       priv->clks = devm_kcalloc(&pdev->dev, priv->num_clks,
> +                                 sizeof(*priv->clks), GFP_KERNEL);
> +       if (!priv->clks)
> +               return -ENOMEM;
by using a fixed-size array as suggested above you don't need to
dynamically allocate memory anymore


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
