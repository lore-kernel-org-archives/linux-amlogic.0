Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09F5C48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7751F6120A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7751F6120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hu5YHb13QC9eYUK9J0oFbs1atetda/slTzR+lgV1hHs=; b=Fy4FHf7m88RjgS
	g3MbvlHbK9C3B/WEAhjByEI8fyxBwSh3N2IMoBmfhKXl2cVKriuZAfOrRhIlAqWAGzK0EnOcXt0m8
	o47aAk/Hl9GL/IMy0uMMpx3mDF0zxJZXJj48wfnHBwgFeZ1Dvw0/8T9jgftKMnNidb/tc0I8qq0P9
	hFhHGQl/xBwpQUyOgZXFBNtTDXetV/7UaZPM8R/N63eA5pQlnju+1xczcPIOmuw9cVmXHCao0dHeh
	RH0Z2+kzN0Re7fs9HuR5kBeQv6cWHkkixX5OG290TY3Be9tPMghe/7ZujYNOOMJ7KVv26NnrDanw3
	pP2bW/7BqVHzvQs4zEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luGVI-00ElTy-RD; Fri, 18 Jun 2021 15:33:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luGUa-00El6A-41; Fri, 18 Jun 2021 15:33:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id s6so9154924edu.10;
 Fri, 18 Jun 2021 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7+uP79JThVaX8f53c7eMngvAvys/A7Np1BX1mntKjE=;
 b=mRLykS7ioyfUInLCKyugxfYIbQA1nW7S1oNhEUyFkiSp7eggq3BCN3mamatVEHbwvH
 sp4rxG+AX6EV/kIEvdI7+nPD6iVJU3/mhL3KvRMXMyTj/erLDUE/3q1QDNwhRjzLpgLb
 yUfFZaEEO5KIIUtp7JuhS5Rgv40SLegrVmV4CoHEBheMMkVvmR2k+7bkwMho5/kuXodG
 IyiSjFjRXWQeoxJ6PVHHAY6Y9bnDiIiHWaSZ+gdyBu/O1GSMfoansFSBGUxOqtpntgj4
 xuYw20gmMzVdOFH3POAEcLJY0G9mNDR7wK49JcXX4YqhOGy9HnmezEoQTKegD6O4kHuD
 dLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7+uP79JThVaX8f53c7eMngvAvys/A7Np1BX1mntKjE=;
 b=sQx+3PCMd6GzFToGeqw6TS+UFV3W+OWt+eF8i7qJBlEWL/JBwQ6HdPZxK3zeqZRISV
 ImzrPLkIkwqRQpWiJBj8NPzypSceInGwyAM01dA91AUwrvCeyL9MfhcdcvodHBpXteXq
 FK8jVJowznHIRcf/mqBWO/FfEVzvLQp2Dh7p1wrCTBwsL5OcWx5WzmM1UsZi26orKlT8
 dfrBCaeXrVWdw7909gW0qKejZCP4i4K57EK3MU7kalU1rp5QK1MrQ3XlbKShdyz+lXCG
 A3WnvhFypzOjF3JCyEd+fFm0BAJEWl867u6Ir7ryyd52gg8xLeQSJ4oOSFUBBu5My0fG
 8X1Q==
X-Gm-Message-State: AOAM5319WEQXAkvA0OxzFUv/a7cyvjNEwa3kjIploej9BZz5T4WOSDMD
 L+KMeUDJPUY78hUQNN4nDC/OHcpuk+9TFl7//9M=
X-Google-Smtp-Source: ABdhPJzVpYdl46kNg1iSo7yUJy2SDRIUByyY0vMTJTeroezDWoNPYoH2CNyDv8bb6R/+Yej27Wl9gPheNol3ueOZCCk=
X-Received: by 2002:aa7:c40a:: with SMTP id j10mr5732813edq.59.1624030390723; 
 Fri, 18 Jun 2021 08:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-2-linux.amoon@gmail.com>
 <CAFBinCC4_bsTEwj5+=iH-ZF3LpSzSjN-x44Yr_XU4R9=Wzq-Mw@mail.gmail.com>
In-Reply-To: <CAFBinCC4_bsTEwj5+=iH-ZF3LpSzSjN-x44Yr_XU4R9=Wzq-Mw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Jun 2021 21:02:59 +0530
Message-ID: <CANAwSgSbr-NZknhQXjhNQiDcz9FNOdFjZKsHhBk3bbEt_UCCEw@mail.gmail.com>
Subject: Re: [RFCv1 1/8] phy: amlogic: meson8b-usb2: Use clock bulk to get
 clocks for phy
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_083312_213549_E76BF63C 
X-CRM114-Status: GOOD (  16.22  )
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

Hi Martin,

On Fri, 18 Jun 2021 at 04:03, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Thu, Jun 17, 2021 at 9:42 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > +       int                                             num_clks;
> > +       struct clk_bulk_data                            *clks;
> personally I'd get rid of the num_clks as this value is static
> instead I would add a #define with the number of clocks and then...
>
> >         struct reset_control                            *reset;
> ... use something like:
> struct clk_bulk_data                            clks[MESON8B_USB2_PHY_NUM_CLKS];
>
> [...]
> > +               dev_err(&phy->dev, "Failed to enable USB clock\n");
> clock -> clocks
>
> [...]
> > +       priv->num_clks = ARRAY_SIZE(meson_phy_clks);
> > +       priv->clks = devm_kcalloc(&pdev->dev, priv->num_clks,
> > +                                 sizeof(*priv->clks), GFP_KERNEL);
> > +       if (!priv->clks)
> > +               return -ENOMEM;
> by using a fixed-size array as suggested above you don't need to
> dynamically allocate memory anymore
>
>

Thanks for this tip.It works for me.

> Best regards,
> Martin

Thanks

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
