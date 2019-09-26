Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129B7C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 15:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8EC821D56
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 15:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nPInK+Z5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddZiXkOG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8EC821D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPe9a52PjjZh2yLKURpqtA1Ek65E+Qa0kkozKUTkgd4=; b=nPInK+Z5fCYZwN
	xN05lrb8edkR4CNHtsHrb4cnJasCwW76XCmGsBOqfZ602Ph/HC1sAeNWvNxsLMm+kBKNB3sWapmWp
	oUtNPz0LvD8UNdvGa5evLzCcW8KqHMSxiovLZE4kf1gXMRKFJiNqp+uJ5a0Tkf3l5Kg3HzTWF5JmE
	sUdxaFJ6Bgwib00am4+SvVJYcEuBf3lDiiYsPals1FaZ3uvjgC+0UNiXeiEJ7DPweU4jswEZhF90J
	QcYslzsVQ2e4gUfFrGYOc6TAITJ/mmQR7cRQbHpownVpISsAGwjyis8dVHyGd7KMnl0OpPlIRtSF5
	67RHgwyeVp/zkS7T6tSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDVr6-0001CG-Ag; Thu, 26 Sep 2019 15:38:56 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDVqu-00011K-2N; Thu, 26 Sep 2019 15:38:45 +0000
Received: by mail-io1-xd44.google.com with SMTP id b136so7762058iof.3;
 Thu, 26 Sep 2019 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Li57q73MX1RVx23YfgpvWF5w0x4ow2nEwbE6KvqKXw4=;
 b=ddZiXkOGcNyt3yIpQx4T3/Gj0lMxo5fD6jC8orTuZHFI28MUf8nRRhWDRT3KHHhPSL
 2QkgJq3B3CkBEs2qVqnO2XzZ/b3xh0C5DItoQmeyhM7ZssdZUem0rhRUJRkkwSEPuqhb
 TsfJnifEzBgUSl6rNTR6Y/I2+QwUfSAfrIXzYsLw6zlKsb4ORWAJKTPEGEaz6/z2Rrjj
 grlrAU5A1pz8Td00+qZCozRZVZZTVsLUU1RticRT0EcsJ+s0Plpjbpu5nuzCJcIz9FmW
 isHVVt8SUg33ne8/OYfOzsug+Y6qdnVxsb6lh7qYLCuzfIGgUWWjX5c1x0HLg9PR8gQ9
 I1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Li57q73MX1RVx23YfgpvWF5w0x4ow2nEwbE6KvqKXw4=;
 b=dzDsidgm+U4jOTHgvHlMmYqNVnkz/2jwZKSmfbN+v5Jgylp/oQ4o9LIjwKJN3HSeM6
 ecY+3uzR/8dN3AG3hoItsATgQ08wphDm2ydFF2mKp2wlsFHs5KizpCfGvSes35tOiTRb
 O+B4Fv2GeLSNr6wEMep1/XN+Oh7NcNwt4S1Fro1TrbLTkmF7hvzUYUJb7UXdra+0BL8C
 A3KCNsL3FOmzCT9T+PpD24H86ff6pCIYrZbg8YcS1ABaXQi6ARCukZMT8sP7Askh2J48
 2g6i/vPe1mbt2PFx2fcQBAPUnTAx6I/AXaMglIseklo2KTZrgyQozG59ze3Wr72n8MhV
 YZJA==
X-Gm-Message-State: APjAAAWmhGnNRLUnjqMkIqTfcWXXaVCu00OZ8e2JqcyzcqeaI+ws/abA
 0lF3fTATkLmIGMOs+KODHzIlrjuXtU0wlqhvNng=
X-Google-Smtp-Source: APXvYqz8oVdb4PXIBRw7lIbY55HKL5mDby64gFcwc20gU6l9i2bzFhmg5ZIz7Rt3qIXsTSJXHdzLp4EDv7kKxqLjQbg=
X-Received: by 2002:a02:e47:: with SMTP id 68mr4042317jae.126.1569512323132;
 Thu, 26 Sep 2019 08:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190906122044.372-1-linux.amoon@gmail.com>
In-Reply-To: <20190906122044.372-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Sep 2019 21:08:31 +0530
Message-ID: <CANAwSgT-RDicoTxe1574_0KhCJ0=JpRGXydjGPdedJ+sULRfpA@mail.gmail.com>
Subject: Re: [PATCHv3-next 0/3] Odroid c2 missing regulator linking
To: Rob Herring <robh+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_083844_139721_5C1B5FDC 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Fri, 6 Sep 2019 at 17:50, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Below small changes help re-configure or fix missing inter linking
> of regulator node.
>
> Re-based on linux-next-20190904
> Changes from previous patch's series.
> Build using Cross Compiler.
>
> Added missing Reviewed-by Neil's and Martin.
> Added few suggestion from martin for rename of node.
>
> Dependencies:
> Changes based top on my previous usb fix series patch's.
>
> [0] https://patchwork.kernel.org/patch/11113095/
> [1] https://patchwork.kernel.org/patch/11113099/
> [3] https://patchwork.kernel.org/patch/11113103/
>
> Hope this series get picked up for 5.4-rc1, finger crossed.
>
> Changes for previous changes.
> Fix some typo.
> Updated few patches as per Martin's suggestion.
>
> I will try to commit less mistake in the future.
>
> Best Regards
> -Anand
>

Gentle ping for this series.

Best Regards
-Anand

> Anand Moon (3):
>   arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
>     regulator
>   arm64: dts: meson: odroid-c2: Add missing regulator linked to
>     VDDIO_AO3V3 regulator
>   arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
>     supply
>
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 53 +++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
>
> --
> 2.23.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
