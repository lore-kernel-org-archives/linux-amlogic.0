Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5229AC49361
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:34:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1606120A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 15:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1606120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZha/fOWQKOpW3v7dZb/zmhLco9oZcLZmJWcbm7HTfQ=; b=r0UYM75CI/xEU0
	CA403dDPyh4V0tg11BWrelOQgISlX6TDh04pKIuP8lJ/1bhHsZaV04uZ9JQwBV6N8+sVYsyh6yHWi
	ZD7X46qjliyJKmVSy94aLnVl9ZrvGVuf3tgaN2jIg2oDR4IE4SWVDQf8rx+N/8s9DKFPtF8TwRIoG
	JrAnbk1Nr5OG1DQo0EV70O3IopZ9K4cnkpi0wR8b2I9LAS6OWoV3/9o2k2zycsR4eW6+I+g8tlgIW
	YO+TDbLEvqVdrg9wrhVyGPFKw8mn8Ir3TnNrrzxLsmch6JabUSZwoYu5+sN7Q815NjGuIpQPEYWY5
	IlnQre8E5nRac8PQM4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luGVx-00Elpg-2u; Fri, 18 Jun 2021 15:34:37 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luGUw-00ElHr-QP; Fri, 18 Jun 2021 15:33:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id w21so9215915edv.3;
 Fri, 18 Jun 2021 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lXIZf4M/Wk9OMiaT+VN4VJVU8FiWIRaCbWAUXPgEmuw=;
 b=B7ozRKMdsIZaq6CpNHJIsNxfc7Y4J7UTN6kDIxjZ2eigM59O+qyBRu5WyYOxllcJqS
 KRiSIKk8kGaUxnxrmaA5F0JiqukeXaiNs/BpI7+azHPmO1mDg5FvPfRsGEza4HOh8K7v
 Xpw7H3VfrZ8Q4IeT/HhbdkpwPSIyaSgTXpWC6AYJ3JY0muXE5l2ISZQmAuoSY/gfQ6cM
 HPUmMuX/ID9Kfdiqh7q7s3pgPih9RzRnjMQ/3Iw/I9bZaQxqGUczLfviGtSEKZ0gxrkE
 +Y5qYTLL2YiIReOIDDGnSJML9EUYmGi6/xox47WBgWLx1kheJDwTE89FTeQfFO2Zjem4
 825A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXIZf4M/Wk9OMiaT+VN4VJVU8FiWIRaCbWAUXPgEmuw=;
 b=IUWK8zVvyqeXGdTAZLcqFQJTOA/zWJPISKMghhRF8oGhcNiYmw5oZIcxfcdqnAZBYz
 X/AMxNvC+zI4BUtfK5vXoRavqu5R+uJfBqijQvGqBEVR32fzCuK6N79bXPDOAS1POG4+
 HNzGROjPLv0C+FVsNPQCDUOHb1642n84ndrGnXEzWyVxJOve08r/eOLEu8bMHP3RUf3g
 U6vOXJeNViHWTjI6CIYB3s1w2SD2lQ6KG38tfqsYDYjWzaPJFnxZlMch3tVsL34xtMzD
 OSHffaq7fduSLR2H6CZ7l23yDT5CJUs9UkJTcHcvA2gir7qvmmM1oMbs/gDjX703gS54
 zV5g==
X-Gm-Message-State: AOAM533JUFdKnlGmTegP+FVhQL6EXnO48Dc5iO5mj/Pi+Vo5jILd3ZsE
 SbwMsNgXzm9YWZ/VuTFuc3q6xgD/N2Uud8WVqs0=
X-Google-Smtp-Source: ABdhPJwFJcPj6QNZ7mrUZAXYq1D2D8ElUkYJuaamLyvnmY7CMT0+IuOidETWvP+w4NxG1p7vSUDH+tDXXfIYEk1gkmE=
X-Received: by 2002:aa7:cb8d:: with SMTP id r13mr5853072edt.184.1624030413483; 
 Fri, 18 Jun 2021 08:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
 <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
In-Reply-To: <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Jun 2021 21:03:22 +0530
Message-ID: <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
Subject: Re: [RFCv1 6/8] phy: amlogic: meson8b-usb2: Use phy reset callback
 function
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_083334_907914_D05C23DD 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Martin

On Fri, 18 Jun 2021 at 03:54, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > +static int phy_meson8b_usb2_reset(struct phy *phy)
> > +{
> > +       struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
> > +       int ret;
> > +
> > +       if (priv->is_enabled) {
> > +               ret = reset_control_reset(priv->reset);
> > +               if (ret) {
> > +                       dev_err(&phy->dev, "Failed to trigger USB reset\n");
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> will this reset change the register values back to some kind of default?
> If it does then we're not re-applying our desired register values
> afterwards - which is probably asking for trouble.
>
> For shared resets (like the one we have here) reset_control_reset will
> only trigger the reset line once until all drivers using that reset
> line are unloaded.
> So effectively this new phy_ops.reset callback will be a no-op.

I know his register is shared between two USB IPs,
but I have not observed any issues.
>
> [...]
> > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> I think this breaks compatibility with existing .dtbs and our
> dt-bindings (as we're not documenting a "reset-names" property).
> What is the goal of this one?
>

OK, If we pass NULL over here there is the possibility
USB phy will not get registered.

>
> Best regards,
> Martin

Thanks

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
