Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358B6C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 18:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E757A611CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 18:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E757A611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80ZP8QlMxTfVCWRzngzLR6oAjyveQGLJ2kQrQYeLPPo=; b=qmGro2p/WWOcso
	C4GIpvd4ySbfW4hb58Pv35neNvXzuxfa0vKodGR0yNc837ggdtYr9/p2fFRFEkEc1RtRDlzdBhwXG
	ApRzoh477CNXM98OsGKUYdqscqFwqT2V8fQeJ/hLi0uoJTyMWDg+tHOMyBHyk7w6yHWAHuzwhDAYM
	jwi2sjlMu1YLez2jxxLHH/Nl0C4TybAOGYO4pmYnhhFR/ZghqL960FDA/RMeq3l7UjIVjWqYf4StJ
	4J75nXisEMcRrf6D9RJQ876vQXTwWgxyu4bCN/difwDa/IXg1Djor6V0lMTRNSXow2r/m/PZfrYZs
	5+JIIbOc392SpcjwpHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIESR-000HD4-Qn; Mon, 23 Aug 2021 18:14:03 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIESK-000H8p-86
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 18:14:01 +0000
Received: by mail-yb1-xb32.google.com with SMTP id e129so11825193yba.5
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qcrJUn9SIsn9OtjuWFuCLDPINuV6hNlpD1UCcJXEpKA=;
 b=TXhX6kzROMX7aShYApBsIAaTL/0UNLI2yhyqlPz1I1AyHDfKPAGux7G0aKABOlIh6E
 14COCM9PSN/nXqGZwo3uWS2B1FnmkpV9CA88m4ZYeuzvScQMZgXAvmvUhK2TlfwKMVPl
 Xv3Mn2AIJD4unJGAxw4Bf2bB7A02pZ0zmy0wJFmrHsgEgJj6TcwhYhZZZvq7eAmwq6uR
 jGFBxgtszxDNR6tP695CDgQgcowfRy2gr5Pq4F/6EToWr9BQlNx1M7iGQ9ggeq7z1dbg
 tVxgeP+2tWlztMPB7mprWN6vRK683goLVDdA0Xp4ZiRlEF1KpyFtmsLRwSA5dXVoYI7V
 FyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcrJUn9SIsn9OtjuWFuCLDPINuV6hNlpD1UCcJXEpKA=;
 b=i2DZOCQ32c8ks6ebPZ0ZMM6m9S3DNn2k+DQintlnMLWN9ndiU+pS2vpCWC4axijamD
 vAyXrdFFxGLyPvdt7IQly7vXbcfzNpc/9/PAM5bYhN+pfwuWqO46JYqXM8aM8qxN7pqU
 cPgv/comZKJC7uAJnsYqrNtvVnDLnD+WeoFiQ1hG9kvv66T8aPKJSoqYP9ckZ7yyMitQ
 AYJKQ2cu4/8ltXnHLOX8QjDaov/3BqJgc3A4RJ2fBCJxyl/OFcEz0RGbixZshPWxT+R3
 9tXQkybNmF1dQqNVbTSkFviuuzTheYuCpRSMUpVSgvmSsjq2sPrbbkCMxW1FKU0/yD9J
 YmtQ==
X-Gm-Message-State: AOAM530+s7GdeoJVxZJSpl0O+eKJklqEaSHQGANki3Af2S7sQdeFhTnX
 M8kwiplqNekVnneGI9B+nc0CKZ9XT9sy4PMHh7tqzQ==
X-Google-Smtp-Source: ABdhPJzqw6BPhf6oRCv5BRo82ewq6xgec0g4rBKEuXqPvbalz4BrNgRFkSM+GKVVNHr1aceAGL/E82+5mc8jUR1HrVw=
X-Received: by 2002:a25:b7c8:: with SMTP id u8mr44633182ybj.268.1629742424526; 
 Mon, 23 Aug 2021 11:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210818021717.3268255-1-saravanak@google.com>
 <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com> <YSOfvMIltzWPCKc/@lunn.ch>
In-Reply-To: <YSOfvMIltzWPCKc/@lunn.ch>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 23 Aug 2021 11:13:08 -0700
Message-ID: <CAGETcx_eUE1gLAaqXdLjCb2XxttH20066kXs969khnrEZQ71mA@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for "phy-handle"
 property
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org,
 kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_111356_360892_626F449C 
X-CRM114-Status: GOOD (  25.80  )
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

On Mon, Aug 23, 2021 at 6:16 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 23, 2021 at 02:08:48PM +0200, Marek Szyprowski wrote:
> > Hi,
> >
> > On 18.08.2021 04:17, Saravana Kannan wrote:
> > > Allows tracking dependencies between Ethernet PHYs and their consumers.
> > >
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Cc: netdev@vger.kernel.org
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> >
> > This patch landed recently in linux-next as commit cf4b94c8530d ("of:
> > property: fw_devlink: Add support for "phy-handle" property"). It breaks
> > ethernet operation on my Amlogic-based ARM64 boards: Odroid C4
> > (arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts) and N2
> > (meson-g12b-odroid-n2.dts) as well as Khadas VIM3/VIM3l
> > (meson-g12b-a311d-khadas-vim3.dts and meson-sm1-khadas-vim3l.dts).
> >
> > In case of OdroidC4 I see the following entries in the
> > /sys/kernel/debug/devices_deferred:
> >
> > ff64c000.mdio-multiplexer
> > ff3f0000.ethernet
> >
> > Let me know if there is anything I can check to help debugging this issue.
>
> Hi Marek
>
> Please try this. Completetly untested, not even compile teseted:
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 0c0dc2e369c0..7c4e257c0a81 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1292,6 +1292,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
>  DEFINE_SIMPLE_PROP(leds, "leds", NULL)
>  DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>  DEFINE_SIMPLE_PROP(phy_handle, "phy-handle", NULL)
> +DEFINE_SIMPLE_PROP(mdio_parent_bus, "mdio-parent-bus", NULL);
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>
> @@ -1381,6 +1382,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>         { .parse_prop = parse_leds, },
>         { .parse_prop = parse_backlight, },
>         { .parse_prop = parse_phy_handle, },
> +       { .parse_prop = parse_mdio_parent_bus, },
>         { .parse_prop = parse_gpio_compat, },
>         { .parse_prop = parse_interrupts, },
>         { .parse_prop = parse_regulators, },

Looking at the code, I'm fairly certain that the device that
corresponds to a DT node pointed to by mdio-parent-bus will be a "bus"
device that's registered with the mdio_bus_class.

If my understanding is right, then Nak for this patch. It'll break a
lot of probes.

TL;DR is that stateful/managed device links don't make sense for
devices that are never probed/bound to a driver. I plan to improve
device links to try and accommodate these cases nicely, but that's in
my TO DO list. Until that's completed, this patch will break stuff.

-Saravana

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
