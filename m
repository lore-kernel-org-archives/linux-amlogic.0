Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B34C04EB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 22:21:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0483206B7
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 22:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZcPlpFK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sYp2FxAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0483206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b89YBsdgLPgrNvLrhKv+vqRKvR23OVI522D6uvWrFbQ=; b=rZcPlpFKiM+Xjz
	9d9IxNU0+NKBUOCXvceFMjC8jnCCrd4TSibLn/jHoEa7PyxE/70Q+eUSF55IhOxYe+DHmN4yAmy0n
	h5Ahs4b+wzy+J5VD+s7ZaNSMcny5+OUpbkVpxSMw1uJ0WQIueT3IXV2PiacnnKf+5UuXo5HxZybVg
	Sawe2gmF/3TdsUaG52HiDgPiTlr4llqpAYNFhFXbzZp8ZYSNaXm+OhQJVxmRVppDbsjgBc9zr6Wb5
	UsBM/bpzuZ7bK9VxZd45ISBmIpSMb1IBM4o1FBSdZmgTfDyPogv9z6o3/vGtl4O32OQZSLZiYsYt/
	X+UH4Po0G0HGV4dpa5gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUfXw-0005Ls-5o; Wed, 05 Dec 2018 22:21:32 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUfXt-0005KX-8B; Wed, 05 Dec 2018 22:21:30 +0000
Received: by mail-ot1-x341.google.com with SMTP id w25so20170714otm.13;
 Wed, 05 Dec 2018 14:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTASaRgjxa3Vst5bpuF6+cd2n2tSchKcjLVtiHO069g=;
 b=sYp2FxACt0DLFadFk2vfA9fJ422ZekmQi9vEKs8lIgNJN1s7oL9wK0m7BanMZA3yy7
 c8cvEvJ5etUWyeS48yVBQJJmmKUIlKodpS7y+QgT8gNod9AB58p+S4xnWPL6xiq5jh/H
 Qo6XknuWFcjOPZ1TbexXG++cWgrfSwAAXwWJSWVHEK4h2nds/+0g+ilVTBmi/K7Q+Gv4
 N3zCkf7WVHnR0YeO/7tSy/eGqLx1KMxsxT3ovENMQN+rAVSHBGildV4sJKn3K8MbDpd4
 C0Q/AR+GZn+WJATu65WiEsnYu/vQiYF6JdqTZVuUNdAjgJ1Fzve0Ve+8TpbBvse7qBvA
 mCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTASaRgjxa3Vst5bpuF6+cd2n2tSchKcjLVtiHO069g=;
 b=YEZli3kdbdehQriR245JWMy5rlDRo4mTs2mSJ+X4yCyaQ5pKgh8Fg2ArqIdQi2TiBK
 RWcqe5J5xEL66Im63ztb5cUF3qgh9/B6y3QWM3IYUMgdYQTYz4AQ4WenPtqBasC5SWnA
 JDtOMONNDRFgTkfNp8C53Rhk/zDg1i89SkBJQWGv3/EEYtdIIZ8JANxY0d8oF8n39uWq
 I2JBtb1xmSAEGp6Nqtiya7FDUmEal80ScSGlzcyTYZ6ZDzWQOQAvKOFYS0VbP01d8U1I
 5RN8o6PqKte0BoYufigoWvRvRKXduVDOZwTYojDRqEqvUJovLyAj421cfoXKU813XIL3
 2Ptw==
X-Gm-Message-State: AA+aEWabV+0WIDrwhs9fnwMuznlqN1x9YB3VG7ixsNPHAs2NERhKrxrW
 CoWeCAWflMGLvnB84iUu2ekZbwFpHu+B4Lf+TUw=
X-Google-Smtp-Source: AFSGD/Vo/T0/wUyUNN8u30JelLkFkDChU9W7k2UB+bhHyl8utP5WZLJi8t8vmP+k1/ZVK3DFpkOCp1Wt+WBL7rWOhzA=
X-Received: by 2002:a9d:7749:: with SMTP id t9mr17459249otl.342.1544048477730; 
 Wed, 05 Dec 2018 14:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20181130170634.9467-1-robh@kernel.org>
In-Reply-To: <20181130170634.9467-1-robh@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 5 Dec 2018 23:21:06 +0100
Message-ID: <CAFBinCCyiOurskMNYeJaC3YHZF0CCVJg7q61Gs=wdZYAH83NCw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
To: robh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_142129_293526_2A54E4AF 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com,
 Neil Armstrong <narmstrong@baylibre.com>, maxime.ripard@bootlin.com,
 linus.walleij@linaro.org, baruch@tkos.co.il, david.brown@linaro.org,
 jamie@jamieiles.com, robert.jarzmik@free.fr,
 linux-stm32@st-md-mailman.stormreply.com, jason@lakedaemon.net,
 jesper.nilsson@axis.com, f.fainelli@gmail.com, khilman@baylibre.com,
 gregory.clement@bootlin.com, zajec5@gmail.com, ludovic.desroches@microchip.com,
 linux-arm-kernel@axis.com, antoine.tenart@bootlin.com, wens@csie.org,
 arm@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org,
 alexandre.torgue@st.com, jonmason@broadcom.com,
 Hauke Mehrtens <hauke@hauke-m.de>, slemieux.tyco@gmail.com,
 haojian.zhuang@gmail.com, vz@mleia.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, gregory.0xf0@gmail.com, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, linux-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, baohua@kernel.org,
 computersforpeace@gmail.com, eric.y.miao@gmail.com, sbranden@broadcom.com,
 shawnguo@kernel.org, nicolas.ferre@microchip.com, rjui@broadcom.com,
 leoyang.li@nxp.com, mcoquelin.stm32@gmail.com, vireshk@kernel.org,
 carlo@caione.org, jun.nie@linaro.org, linux-oxnas@groups.io,
 shiraz.linux.kernel@gmail.com, tsahee@annapurnalabs.com, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Fri, Nov 30, 2018 at 6:07 PM Rob Herring <robh@kernel.org> wrote:
>
> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
thank you for cleaning this up!

> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
on Meson8b Odroid-C1:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

>  arch/arm/boot/dts/meson.dtsi                   |  3 ++-
>  arch/arm/boot/dts/meson6-atv1200.dts           |  1 +
>  arch/arm/boot/dts/meson8-minix-neo-x8.dts      |  1 +
>  arch/arm/boot/dts/meson8b-ec100.dts            |  1 +
>  arch/arm/boot/dts/meson8b-mxq.dts              |  1 +
>  arch/arm/boot/dts/meson8b-odroidc1.dts         |  1 +
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts      |  1 +
for the Meson changes:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
