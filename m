Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C88AC48BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 20:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC3461284
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 20:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC3461284
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2dfTDnKMFES/q+UF4RzKhJ7ZkhwRKAIoxiGy3C+QLw=; b=nY1qsAXZheY1TN
	yQOrJ+eo7LOVjF0E1N6rxVmgiAkH3tzexTdN10usbybkjV9DAKMgkLmR+i75m5+ore8Me+wmv0xqu
	ukR2oByUnz4F8gMlACLdRZ2kP/CcZDSn6n2WS4y0tmvJcJ1YZcd+6XXuC3II5YPZl7UwRpB3BBfvU
	jQi5k7yMdc86iYUH1miVWjzbjo5tygEzbmIrzVEJdI95nqNsniYlSOrT5KNBwW1taFhtD/44NqyyG
	0t9PefvPBbvyiV96KzS0Kul3G6K6g5B4078zsFLYhjstoMo58pBSNlQNOtvPHLtyRx7C22gcF/PoA
	MtsE22Ph1xvqPVcdEADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luKli-00FPeW-NN; Fri, 18 Jun 2021 20:07:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luKlU-00FPcK-U6; Fri, 18 Jun 2021 20:06:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id df12so7693813edb.2;
 Fri, 18 Jun 2021 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jd6Y9FdRbI8WadsWZ8AlDZHBohYqsQzy8vJ8yBRlmjY=;
 b=NkcH1LO5w4su6nqdC6W+7rrRp4CL85LjmCG4Xm9yjd68m/9Qu+lZD/z92BsQP8JIFT
 rnQNsTX5bLt9tO05Yg5lD58qMlFRQe0oFo0EXj81q5Y1UAXZ8vVNN+ZKY/7o0JumIp4g
 m6laKU+RGHL626SDXA0pPxO3WwVGtR55PmY3gLFLazY0NmL4tompZZnpUNvpZQitC/ac
 EIhxE/KEfCAzsZFF3hazazsBGqFPLd0qJTK5NZv8mQUXil25YRSS0XdtC1zjE1q/3ioh
 GzibQePBbyWvj3biOHS9oVhvWi0R6eXe0AgFA+CkVdTr80uIpkFzzpkpOlXCTf2mH66g
 UtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jd6Y9FdRbI8WadsWZ8AlDZHBohYqsQzy8vJ8yBRlmjY=;
 b=LeKlaR9YhZgmPNmdHhIrhlQXuVot25mWziFC+ObPpTf8nwtManNXcfV2pg2ZwzcrT6
 dkCqiiEDuu4cM02lhRrtscM+YmTeoY9eic7E2gMPyNRHVXdBSit361W9OCsnabjXw9PP
 /ssjL9n3sbE8GzgkKnf/lDNUNsgyFbH8iU7pq79tdrcS0VA5ktry0G0SnaYrXrxLxe32
 GtOgXMvazik3t8NwaJrmJDAoHncE2koYk5mZlzoaQ79GGFCwNS7CS3n2WcNhJ5RXdvGR
 lWe95nmtwsA/aopc9oHnycikn6LTYB8ps9Mq0DKN29rHI0cMeRoJCTbEIKqhZtPlu3a9
 2VyA==
X-Gm-Message-State: AOAM531+dlurFhiDFXQeBGrdoNcXhQEiYyPrK34BY4jK8AImsStL49XP
 dj4jPHp+lM+0y2r/f8Bp9WqJIWEJqbRBErGnpPY=
X-Google-Smtp-Source: ABdhPJy/eX13COPO4fwgWcbKjgdq/roFKgUhw73XmjuLqQVOrKeFvYgYKC+Ud97JzQ6PtlAQofSyde0mLEhzq7onpSI=
X-Received: by 2002:aa7:c790:: with SMTP id n16mr7323619eds.98.1624046815446; 
 Fri, 18 Jun 2021 13:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
 <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
 <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
In-Reply-To: <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 22:06:44 +0200
Message-ID: <CAFBinCALsnpbJGEb4LBLd_jy3E8fOZAQaacz-P7ijfkeyYg2dA@mail.gmail.com>
Subject: Re: [RFCv1 6/8] phy: amlogic: meson8b-usb2: Use phy reset callback
 function
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_130657_031527_B02FBE90 
X-CRM114-Status: GOOD (  15.53  )
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

On Fri, Jun 18, 2021 at 5:33 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > For shared resets (like the one we have here) reset_control_reset will
> > only trigger the reset line once until all drivers using that reset
> > line are unloaded.
> > So effectively this new phy_ops.reset callback will be a no-op.
>
> I know his register is shared between two USB IPs,
> but I have not observed any issues.
have you checked at which point we're then actually triggering the reset?
I assume that you will find that the reset is only triggered for the
very first power_on/init call - which makes this patch effectively a
no-op (yes, we're calling reset_control_reset then, but that doesn't
mean that a reset is triggered on hardware level - see
drivers/reset/core.c at around line 346).

[...]
> > > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> > I think this breaks compatibility with existing .dtbs and our
> > dt-bindings (as we're not documenting a "reset-names" property).
> > What is the goal of this one?
> >
>
> OK, If we pass NULL over here there is the possibility
> USB phy will not get registered.
I don't understand why - with NULL everything is working fine for me.
Also no matter which name you give to the reset line (in reset-names),
it will be the same reset line in all cases. If it's the same reset
line before and after: why is this needed?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
