Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC19AC48BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 13:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9CF613EE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 13:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9CF613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EqC+KxrFG7mG+OKvznAP5z/ZWXRwGluZkYXaHXitSo=; b=bocQFbMoYKd2al
	AGO4ECJdLK9LV245gLQOfhzuX8kRHDrdGjv6MxIC8/GSqrZ4305fKq8PMqrRI+gVDUtSwxMeKwbz5
	LSVfVugTbnrql/QZJOKDplRuGfh3H8D0iC6zzo0oHUS8CDt6wk8UXYV65rg1KIIgC+4m85BAmqIgi
	VrDPs5jhKtGNSPNZe9pu4uAJji5cxw3OYVlbAzC5uifYBeUmj5M0htTMmg6FK4lSbDaZooiwvOj5G
	a4k7oCsf3+WTTw2PD0qjgUmNaBOzHMQoR+SQmGp4QEB5G4/LFjr/RmWR/WJgXezEUkwQMDSu3RYmz
	67H4/AFb8bJujTADLCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luEQG-00EBNg-FW; Fri, 18 Jun 2021 13:20:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEN2-00E9Jf-0q; Fri, 18 Jun 2021 13:17:17 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gb32so7724096ejc.2;
 Fri, 18 Jun 2021 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xe2YpkukwsI9XJ2VLSi+FEFdvQRSF1UaOoSGG+bZomM=;
 b=Mc2f2pnPIQcufzu0lHZhOm3iA+HWdT6VFLclBezA7WXxctT9yYLB4XWHvhP0h7+ZPV
 uopEX2SxAwI9yt35rCVCvWwww361AegD9Nw10Hy+FhV0AMO20QvdKiScRy28iHkLLsYV
 kl0JbOhq0TlkV4uPiACtcNjT91HhYjm818SGpdGeO9/qp6B0dGAmX8HSd2C/U0KDbldg
 A320+0O8Lhr5Ifx3Qv1ntPat1F1uT2eCtApVj1l9gyZxL4GzKPD+xbmv5+zHY3Bs2efD
 695PkunXhYHR51X50QKmXD6aAN315YQLVUj3afa60ANPI9E9DAlLShzwYMykOYDOyHio
 Ku+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xe2YpkukwsI9XJ2VLSi+FEFdvQRSF1UaOoSGG+bZomM=;
 b=Y94f5X9KzE3w+JBN9BE6A4AO4l6elr37/AYinHn5PlZbA+W85372mELTSfT8cUAkET
 UuXN/gzB0TnPLUW4alGatetaW1zxge1YYVQV4bey2JIB8JrewSfjKnLc+uoCj41MHCEr
 sZ0ne6+QN0Wdl8mFx2nqHquuhz7xSN03NCrqEkVmNHZKMo50MftRW+bssjbUdPaUK+nR
 9nYLrWvd/1ASR+yka/X3dpJJtQq44DgHBZ+euiOmiuQbVJfhpWVswwsNPyrGJFLM94/t
 GAJnZJbA+0ZxKuS87EmZpuYmkJuueTAZ/Jq9ngeilO4gCKwLY8sWdbCZ9DnT/oVlMjSK
 N+dQ==
X-Gm-Message-State: AOAM531PjGT2xlWgj4gGq15qRN9PqJdeNOukNbAn6PnpFidvDkG2pEh6
 xGdfTn0eZKXZUXB4zpbmClQ+ZhtukbSSUrWzVWA=
X-Google-Smtp-Source: ABdhPJwbkF3xpqpTv93ehYc9hAa6vnirG3fKe0UpaQmZbwEVzm6hODm2XBpQqJbfDfQrpr4kaOQe04vaKVMBM1pn1+8=
X-Received: by 2002:a17:907:3da4:: with SMTP id
 he36mr10852667ejc.108.1624022234610; 
 Fri, 18 Jun 2021 06:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-3-linux.amoon@gmail.com>
 <CAFBinCAZn13-GpMw-b4=rd9zwwNCtvmv0Oq0BXt+1PTTQ+Gngw@mail.gmail.com>
In-Reply-To: <CAFBinCAZn13-GpMw-b4=rd9zwwNCtvmv0Oq0BXt+1PTTQ+Gngw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Jun 2021 18:47:03 +0530
Message-ID: <CANAwSgQ=LydfoWSAo-YPOBNHu_mwOMj+6dv0pm11k-ErGAsJ2w@mail.gmail.com>
Subject: Re: [RFCv1 2/8] phy: amlogic: meson8b-usb2: Use phy init callback
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
X-CRM114-CacheID: sfid-20210618_061716_116412_DBB52909 
X-CRM114-Status: GOOD (  23.99  )
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

On Fri, 18 Jun 2021 at 17:56, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Thu, Jun 17, 2021 at 9:43 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Reorder the code for bulk clk_enable into .init callback function.
> Depending on whether changes are made to the dwc2 driver this is
> either fine or might cause some issues.
> My understanding is that drivers which are using a PHY should use the
> following code-flow:
> - phy_init
> - phy_power_on
> - phy_power_off
> - phy_exit
>
> dwc2's platform.c [0] however currently uses the following order:
> - phy_init
> - phy_power_on
> - (remaining ones omitted to keep this example short)
>
> So with this patch and the way dwc2 is currently implemented the
> phy_meson8b_usb2_power_on implementation might not work anymore.
> That is because the clocks are turned off and in this case all
> registers will read 0.
> You might be lucky that u-boot left the clocks enabled for your case -
> but in general I would not rely on this.
>
> In case of the phy-meson-gxl-usb2 PHY driver the ordering is different
> in the "consumer" driver (dwc3-meson-g12a.c).
> There the order is:
> - phy_init
> - phy_power_on
> - (remaining ones omitted to keep this example short)
>
> I don't know if the order in the dwc2 driver can be changed easily
> (without breaking other platforms).
> Until that dwc2 driver issue is resolved I suggest not applying this
> patch (even though in general I like the approach).
> The same thing also applies for patch #3 from this series (for
> implementing phy_ops.exit)
>
>
> Best regards,
> Martin
>
>
> [0] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc2/platform.c#L157

Ok got your point of view.
Thanks for your review comments.

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
