Return-Path: <SRS0=8QoF=PM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64848C43387
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 17:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3697721872
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 17:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pkePtgZH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbdZX4vO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3697721872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DH+yuF8LYgSDadl4LjloAewUo0tMp04EroJQs9j5MzI=; b=pkePtgZHe+TZM4
	0psRzQQbBBFZxbZcnPVQzggz0Tr5f69k4+pSn+nLFE0vb7HiFNa5vz3Y+VQLtIneoQ02OLjzJM399
	06mxYDefp2mCMHgWbHJg1uUV4y/Y2PbX2dDNfal+wbzjCVwksb/IDRn86SWfbr2JZS/SPK2+405lC
	ozUTLbUUwrnna/oG7WvMZjydDJZXYnpLBdkmruuIZIq3tLcxhlhZH5MTRu8v+NzxUDNJjntHwxTGr
	ysi35yAYxnqop5OliNV2DYUhM3+QwHwNcRwN4OxvFKGcFU3UDs07YrB/Wdi8lVYn1XyMGuN4RM9/M
	2DVAAlmJS/nAs/G65Vhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfTff-0001Ui-Eh; Fri, 04 Jan 2019 17:54:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfTdc-0007gF-PO
 for linux-amlogic@lists.infradead.org; Fri, 04 Jan 2019 17:53:25 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1814218E0
 for <linux-amlogic@lists.infradead.org>; Fri,  4 Jan 2019 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1546624324;
 bh=+su/Qs+Cz0cYpN2qfT/2Jx3q5qizXMee64zZMYwRNDY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qbdZX4vOxsE6R2gKeCL5QY/yuke8CSeK63lwUf+fPp3IjSq3TrQnLRaSbYj5VozIW
 KYrU8RCwwGFnM+b30xL3lhKmJ9RwnMFsxazdQxqoaqCd/WQ1J42fHyLdS3YRT3ZNxP
 W4faCiAcjEUWOX9DqwZLOLcfFv3vtzwnJko+mXzc=
Received: by mail-qt1-f169.google.com with SMTP id i7so41199005qtj.10
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Jan 2019 09:52:03 -0800 (PST)
X-Gm-Message-State: AJcUukf5chi7aqEXhEPwuKAHuQi6+3SJUQrPPVPC58Z5mXozrz1LTR6n
 WeK1UlqilAfiR7DXUMmlU1A+upZbe8k2aejKlg==
X-Google-Smtp-Source: ALg8bN6A9gvdJDThaQyJEb2fcsKCnaiR7oYm2mjGYtl6z5WvAVM9xp8LskHUwx9Txu8y2EMxmGAhexuYuZ8/nBJ8+d0=
X-Received: by 2002:a0c:c389:: with SMTP id o9mr51688167qvi.90.1546624323140; 
 Fri, 04 Jan 2019 09:52:03 -0800 (PST)
MIME-Version: 1.0
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
In-Reply-To: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 4 Jan 2019 11:51:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLvSWF60eqLsXUcP5GL0ijgfE6XwvectiM1D1Y9LPpOkA@mail.gmail.com>
Message-ID: <CAL_JsqLvSWF60eqLsXUcP5GL0ijgfE6XwvectiM1D1Y9LPpOkA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
To: Loys Ollivier <lollivier@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190104_095205_170562_BBB93F2B 
X-CRM114-Status: GOOD (  19.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Dec 28, 2018 at 4:51 AM Loys Ollivier <lollivier@baylibre.com> wrote:
>
> Hello !
>
> This patch series adds a new GNSS driver for the globaltop GNSS receivers.
> These receivers transmits NMEA output sequence as soon as they have booted.
> Power management can be done via the main supply and optional backup supply
> as defined in the device tree.
>
> The driver has been tested using a GlobalTop pa6h chipset on a Libretech-cc
> board using the expansion header. Changes made in the board device tree can
> be found below for reference and testing.
>
> Loys
>
> Loys Ollivier (4):
>   dt-bindings: Add vendor prefix for "GlobalTop Technology, Inc."
>   dt-bindings: gnss: add gtop binding
>   gnss: add gtop receiver type support
>   gnss: add driver for globaltop receivers
>
>  Documentation/devicetree/bindings/gnss/gtop.txt    |  33 +++++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/gnss/Kconfig                               |  13 ++
>  drivers/gnss/Makefile                              |   3 +
>  drivers/gnss/core.c                                |   1 +
>  drivers/gnss/gtop.c                                | 152 +++++++++++++++++++++
>  include/linux/gnss.h                               |   1 +
>  7 files changed, 204 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt
>  create mode 100644 drivers/gnss/gtop.c
>
> ---
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index 90a56af967a7..3b3d4dcc47aa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -17,6 +17,7 @@
>
>         aliases {
>                 serial0 = &uart_AO;
> +               serial1 = &uart_A;

You should not need this as the UART is not used as a tty. It could be
that the serial driver requires aliases, but that should be fixed.
There should be some examples of fixing this in other serial drivers.

>                 ethernet0 = &ethmac;
>         };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
