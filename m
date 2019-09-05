Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECCAC43331
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 20:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72200206BB
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 20:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H4o3k80x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="t3et7p6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72200206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+OoYTLMtJPif5Qtc4ik+rflW63TKq4LqnVPQyRUbxw=; b=H4o3k80xAWkF4j
	9NDUuDDJ0sour9jKNH0U/d2e/AWqEGUaUBALTDIzT/tH02V2MOVj/CCKzdu7RFxSm8wcM/8+4iP8y
	KJby+0XY7TD5P+8KvWHjWLLqDhmeG8Di/ETN63imlpB6HvQWzpStqUvXP4Nc68RLxDlYuAvrwpKdv
	gQyTNECs0YB8eWt2gbkDu77J61iQv8CRqV5hh/NkxhYuMOZuohQGjKwmuEX+vjTpFdAH8tlpjs8M+
	PybbAZ+Ed8OKKk91/mPlidEow9kXOEoDyttmCI+shky1Fn/FbNWOlc0T1jtt4NkK8hTkgt2IeDvo1
	xt1HevkGyJIJwKJ92tAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5yAY-0006tk-G8; Thu, 05 Sep 2019 20:15:50 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5yAU-0006sQ-Tw; Thu, 05 Sep 2019 20:15:48 +0000
Received: by mail-oi1-x241.google.com with SMTP id w6so3010826oie.11;
 Thu, 05 Sep 2019 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4Km6SD866R0K00m5TcRPMaTtKdzrbq/4ljlsuFwyq4=;
 b=t3et7p6L0/whLJE/CMRrP2K3uNDjk8pWYu6Z+iHJ/66Y1V1Y6L0cwifYXlDTXXLZU3
 3MBi7QwdaNrwDJDSiIIvPoke8D4qYmR5KifsoiZvryw5rCskksgTXJIgtTdbkyJgh8qV
 MJtYVr3BW9cjCbQ41WAa98hOnuGLeq4iDZN56LFw/ekt4nC8vTPzq264Qt5ezYI9sCTJ
 +c4RKH3NC5pp7zQoE+JvgkdxisarX3FPxmxyzSpxbX7RfbIIJzrBHCmsifjnzFTn+wL+
 HLYJB/guTPodagOyMZiPuYILX1K2IHMxDbuYFdTogyBfGFbE2z+fgHbQK52gQmjRpO/4
 8WXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4Km6SD866R0K00m5TcRPMaTtKdzrbq/4ljlsuFwyq4=;
 b=pZQPDQYuL+xVR9vIo8ZSAwCEvkZEX1Cz1w9NsijDxtJOJVLxNEQxgvLfL2YWe8DEwz
 OAPKGDxe7hH4fpuolKnkW0ov8ofL4gbFPaCguFMg7Tb7jHS653AdHMyKS4EUgdn5CjJc
 ehEMjMCZzw0ps27LnNrfYSrqdzuGB8JSQLzJMxoulqW6EXIOduo850DQW8BNzbJ3szF+
 eBI+vSQ2IBj0q9iu+fdUnPIl6gLc6FU5OEu20ZUt8ZK6An8m3r+PoQAMEOoSU2vc0hML
 rHVrewRRGZlIjaUFoiHzmikwICRixWu4y7jrXFkF43p0sRtn0r4haqmRwZYsZ0GDP6aH
 q+GA==
X-Gm-Message-State: APjAAAUpp2AiRJ5r7Ug62ZxSCMToR1+A10KcM7tnsp8tFvowng1rmm5k
 o89Ldd8YXavfdCF6Et7o3iOFViel10ceaLxvjlA=
X-Google-Smtp-Source: APXvYqz10+RYiYCkiOZQNb4X6pwZA8FC8OaEWNeVGyU1oIcgk9EjqHMgE+OjmcTpYIwU9qrIKMWD+qXHhX6pFCO82+I=
X-Received: by 2002:a05:6808:b14:: with SMTP id
 s20mr4202379oij.15.1567714545391; 
 Thu, 05 Sep 2019 13:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 5 Sep 2019 22:15:34 +0200
Message-ID: <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_131546_968765_411684AE 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Tao Zeng <tao.zeng@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

(it's great to see that you and your team are upstreaming this early)

On Thu, Sep 5, 2019 at 9:08 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
[...]
> +       memory@0 {
> +               device_type = "memory";
> +               reg = <0x0 0x0 0x0 0x8000000>;
> +               /*linux,usable-memory = <0x0 0x0 0x0 0x8000000>;*/
why do we need that comment here (I don't understand it - why doesn't
the "reg" property cover this)?

> +       };
> +};
> +
> +&uart_AO_B {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> new file mode 100644
> index 00000000..4d476ac
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "amlogic,a1";
> +
> +       interrupt-parent = <&gic>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       cpus {
> +               #address-cells = <0x2>;
> +               #size-cells = <0x0>;
only now I notice that all our other .dtsi also use hex values
(instead of decimal as just a few lines above) here
do you know if there is a particular reason for this?

[...]
> +               uart_AO_B: serial@fe002000 {
> +                       compatible = "amlogic,meson-gx-uart",
> +                                    "amlogic,meson-ao-uart";
> +                                    reg = <0x0 0xfe002000 0x0 0x18>;
the indentation of the "reg" property is off here

also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
aren't there any busses defined in the A1 SoC implementation or are
were you planning to add them later?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
