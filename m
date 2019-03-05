Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95917C43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 22:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C98204EC
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 22:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uq0LhOQt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rPvcM/T3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64C98204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiSgoVVEeM2zhT0lsReS9WghlTkUQin8Tc7tGXGoIgM=; b=Uq0LhOQtmdys9W
	yx6z53BnfY7izbIfeTS0FFzFUqZQ+1CmYFFpUKRXQeXtsvutRFZS/HKFCI7WJliM/CWBno/Ul9KzB
	AlmtTNKdKiqP4BISgVd8MiqjVa3dVSAGIsq815UEyVgCjb3csR7Y7Q1CmvRaPrDCVTywLuBo2Uz8B
	JDnggrFJrGlSRYCkp7kwIitoAf/GEGPAN1dMXIx2P+8VmhhCic6IhqxQ0MF1coY0WVS+G2fnhwNTl
	Ka3/zAOJkOwrIQBsHOI0ThNRtD0G3pd1Ny/JnreqqayKcHqWEDa8Cq1u+TBbIKxjXAfTdUewFdU8M
	WVYOdafsqMt2dc5HNdiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1I9M-0007kZ-TY; Tue, 05 Mar 2019 22:03:00 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1I9J-0007jm-Nx; Tue, 05 Mar 2019 22:02:59 +0000
Received: by mail-ot1-x342.google.com with SMTP id t7so8841233otk.8;
 Tue, 05 Mar 2019 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDuXQsCaigZVdUoEjQk7N6E//pnQjrXnjYStu66ogns=;
 b=rPvcM/T3MNVyM2nZIM2Su4JZ+sON5tpVo5shJRkNvDFmQ5kca1l5f7YJ1wJMdrB5ku
 C7Ml96D5i6pUIoVPtTcwYspfWgbHNQv3cWtqhFCYrsngzr1laDw+VWdqoRNqzaIGhr6+
 /iP8OwfvJc5tO5nIwz1P8sdUKBLJA6RqzPX0aktTmyT8gOWwyFdkZ26e5emlv406wr2b
 RpQY6hsvx6DkD/kavXGjkL2mb/tqlsX5PE4p9Z0f+c6kRtianHrz4A/+pTxD7NMwXock
 XtEhntWQ8r3vf4Met1w8657hSN4rzsCH3Z9aNq7fuHXwCv9K29JbDXjFHwV2pCD1lJQZ
 KzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDuXQsCaigZVdUoEjQk7N6E//pnQjrXnjYStu66ogns=;
 b=ZAXMMzljwwgFyLX8+JzvHBMiefHV7KE2JKv8m8rF8x0nnO72dHGcoJweJ+2t5NB8Ty
 5FU9itf195zLWTRnH99YAZ0ZDp9wrtxFx5ErFFgGG21IVB1ID7TF0pAODM6hj0v/RK06
 U8FejNEv1tgzYgxALJINa+Mh3BOPjTu0iuE+sxQ/ggx4Vrt5q5LS4E5WQjE9pPERLhTa
 SL/kChovKu45tTlmQoAH8FNxcwKYcmUbv7/iC64PqIEenE4QP1F/qTljQIi/24yGNLdM
 dx5g9dqTxsgDEyZOPkfQVzbMmGSwia9qpKyn/Dv6hJjYWniYHamYJ9firHwYNweCB3oI
 gZHw==
X-Gm-Message-State: APjAAAXUHZX25FcTvQcBg/0I+g+8VO6kIdRPEsnKmcoPqi3D4PwCkPfc
 Bgj6JuVV/EqY7LA5qTKp7ZFktOBsoX1690BLDLQ=
X-Google-Smtp-Source: APXvYqwSuvIrjMyWTYmxCDvwYh2qNIiDpIEXGC3ZZ7AoUWyWRH/eOEmxllLqutGxbyiAbe6e0IiILAfsZUSmkJ6M6QA=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr2390395oth.308.1551823376548; 
 Tue, 05 Mar 2019 14:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20190304104916.3937-1-narmstrong@baylibre.com>
In-Reply-To: <20190304104916.3937-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 23:02:45 +0100
Message-ID: <CAFBinCAkMSeMuXj++cWBYP4WFwAMEwm-EFHtLA5X85oe6kekTw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY
 resets
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_140257_871491_E56AB9A8 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 4, 2019 at 11:49 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The G12A Documentation lacked these 2 reset lines, but they are present and
> used for each USB 2 PHYs.
>
> Add them to the dt-bindings for the upcoming USB support.
>
> Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> index 8063e8314eef..6d487c5eba2c 100644
> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> @@ -51,7 +51,10 @@
>  #define RESET_SD_EMMC_A                        44
>  #define RESET_SD_EMMC_B                        45
>  #define RESET_SD_EMMC_C                        46
> -/*                                     47-60 */
> +/*                                     47      */
> +#define RESET_USB_PHY20                        48
> +#define RESET_USB_PHY21                        49
because it's always hard to look up, here's the reference to that
information Amlogic's buildroot kernel
(buildroot_openlinux_kernel_4.9_fbdev_20180706):
kernel/aml-4.9/drivers/amlogic/usb/phy/phy-aml-new-usb2-v2.c uses:
writel((val | (0x3 << 16)), (void __iomem *) ((unsigned
long)phy->reset_regs + (0x21 * 4 - 0x8)));

this translates to:
- (0x21 * 4 - 0x8) = RESET1 register / reset line ID 32 and above
(reset line 0 is at "0x20 * 4 - 0x08")
- bits 16 and 17 = add 32 to that gives us reset IDs 48 and 49


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
