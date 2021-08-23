Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB4FC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 12:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7F061250
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 12:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB7F061250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsLd30kzEBsIXqCacHWb9tKmx9EaDoZP4Mw/j8xa3f8=; b=KpFlqhrGQTnlBw
	YwK4YMEv8wrV68kaYNG4u6W+7yhFpghubjEcPhGQCNoah/L0XtxWJXnYLGlSyy4XzU2O2tCoHITWG
	3Flos1AVNFgTfwAxSDD4USCYrWgZvN75C3VyhXq7iyKFNTCW8PF0byiTOaIxkd4+cHy0HTT3yN16W
	r2u/8sVwTTZHwnWo2gwGOIpZssBnkybinEcbKVRsGx0ZRW3TjMtuVqfu5/vh3gjTSQ11Oyqau7r+B
	Bn34PKnxY0N0LKLK20kz6b+C/bTWkzNfyrSpEz3OEbhwjbtTeMs/G4oSEGigj89e40cJ0cVFWtSqN
	thCa9W/FswTudtAqG1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9HX-00Goq9-Aa; Mon, 23 Aug 2021 12:42:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9HU-00Gop3-Dh
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 12:42:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91B59613AC
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629722543;
 bh=Ggwchvs84GPqibIZ0xAZy50qZZakHVUzDDoEZDT3RE4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fYIiyM5D38HotAoVHmZ6D96y9UDs4if2vYuM3pTEjSQFdlJcXPhC8xjNO/d0YOsE9
 Oic+ml2tbx05Jp8FuIyacnTfi3+LI7ypjLqXnwMY2x1cCVfDvEYDYtMHkDvufavKke
 nXt3sC9jbUkKVpKButofYUbBDCmyn5QHWny0MV2oa/Dkr6B8gIWBBudOwP+b3U71Vk
 MxC4HI2nmwkquME5f6I54hWuXb409tV0agSOtFKIt3k5zzGEq43j3xudvE6hlIEmpi
 0iykN9W7+Do0pHH2ueZvFltE6zof6lFhfEfEy9DDMIoUmKAtf3RNlz7wKqlB7VF/Re
 CDsjTeunJ/F5Q==
Received: by mail-ej1-f51.google.com with SMTP id bt14so36765584ejb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 05:42:23 -0700 (PDT)
X-Gm-Message-State: AOAM531iaXsT8Teja72X/frOb0Kpx8aKVWhFqi+3UbSV6sKxdKtY+5U+
 eXliknyeoW1+sjo8Da2trTK0yEx0G/SWvRp1tg==
X-Google-Smtp-Source: ABdhPJz9aEVSU49faJLZnqJhCIZ53qCZLTmM1TpsMhCaPqt3iGo1r07w4vMA2hc4rS/swQ+zi21Afq2zu8Y5LNN8jmw=
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr35853250eje.341.1629722541063; 
 Mon, 23 Aug 2021 05:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
In-Reply-To: <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 23 Aug 2021 07:42:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ50mU2OfHs5eJmgn_8YnJsAsQXzGrzr4_3LQFb6336hg@mail.gmail.com>
Message-ID: <CAL_JsqJ50mU2OfHs5eJmgn_8YnJsAsQXzGrzr4_3LQFb6336hg@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for "phy-handle"
 property
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Saravana Kannan <saravanak@google.com>,
 Frank Rowand <frowand.list@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, netdev <netdev@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_054224_514348_111B2D6D 
X-CRM114-Status: GOOD (  14.08  )
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

On Mon, Aug 23, 2021 at 7:08 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 18.08.2021 04:17, Saravana Kannan wrote:
> > Allows tracking dependencies between Ethernet PHYs and their consumers.
> >
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> This patch landed recently in linux-next as commit cf4b94c8530d ("of:
> property: fw_devlink: Add support for "phy-handle" property"). It breaks
> ethernet operation on my Amlogic-based ARM64 boards: Odroid C4
> (arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts) and N2
> (meson-g12b-odroid-n2.dts) as well as Khadas VIM3/VIM3l
> (meson-g12b-a311d-khadas-vim3.dts and meson-sm1-khadas-vim3l.dts).
>
> In case of OdroidC4 I see the following entries in the
> /sys/kernel/debug/devices_deferred:
>
> ff64c000.mdio-multiplexer
> ff3f0000.ethernet
>
> Let me know if there is anything I can check to help debugging this issue.

Looks to me like we need to handle 'mdio-parent-bus' dependency.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
