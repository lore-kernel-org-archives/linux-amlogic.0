Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7535DC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 20:04:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2441F2078E
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 20:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ANFiKO1w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PH3y9sLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2441F2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B2Twdu1XoVVGk8OjJstkJwoofxjIL5rc6ho/A6GNDaY=; b=ANFiKO1wHgQqo3ac8fUEQS2RC
	kzVxWKZlH0ut2A/YbvMnrAgRcCZ+M0N49phrf8Coq/d3A0D2XecKwTvU4h6l5+xCioXI5hXdTPiYv
	esAULL0iJdg88kvG+XCaxJZgy2E5uOSmF5nSzKESmSPeilucEMWWmCr6viuhy1nGoAr8dLD4ccDDz
	upHpnnM1/22yj7R53s+cBbUMXKE9if0jDFSw9C6GoouExMQWt/XfntTht1kUzS+fJp27RvCNdGevy
	EPPyJH3bu5Ghvx5LQqmazGJyPGfANDwvIVNNWuct9rj1S/oMu0ISDndNWNqJXgLZK0aYxtnLVrWKF
	HIpbStnEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIHC0-0008GV-6b; Tue, 15 Sep 2020 20:04:44 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIHBx-0008FD-Bo; Tue, 15 Sep 2020 20:04:42 +0000
Received: by mail-ed1-x544.google.com with SMTP id b12so4245130edz.11;
 Tue, 15 Sep 2020 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VLKDKb2hqOkm7A363zOGeGMrkT18ahcERl8cCX3o8xw=;
 b=PH3y9sLztgyw3CJmJfG2SV+wUTjAmuGkywTHpU5Lw828iENIufekxVTxdpIkk1yJ61
 4AXVOOBCtkf1q6o2ey/oRGb+T2f2N564/jkjmmoCm3bgkECNDgTJYOGr+r7VkEYjdh9E
 V2VEgNnWZGRBNudMae2EBKPyckFxT5RH0/bSRI8Yo/iCorpRw3JaS24k7Oe5erl95hvP
 CVCz73FI/6r4Ii1JAIjEftd1IewkxH9F/SBvGsc/ITHydnxQms/6WvrRnCy08eF8/StP
 5UPPKmpqxXu6HtDgqJKyiNVolzXrdYMUM67yVU8hPp0EQY1BtAiB77HvHUAKgfgCaHGK
 rAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLKDKb2hqOkm7A363zOGeGMrkT18ahcERl8cCX3o8xw=;
 b=Cm6IaAMvB9BXFSHR7DOUjQOo73sqqWS0k1lVrdkbzU6MibX1zSbGfJOswe5bXwiS6X
 NlpAyUl2q0oJBxVQWESfipCXq0+Shn7oPtfbumuaUUyZU6+ZofQWiDfBjTHr/6Q4w7SE
 SYM7kUcP6Rih2wo0ghNjGvzcZt7Zbz/4RWGQLAuTtiDRG+MfUkpdnmsrWM++MC2wKOCJ
 pxI08yDuKrovk3oOf2YYmG6vXoZhccP0Xy5fYrHEeN7nw+rYvGDPAHKHi/KF94gtD/kn
 YJC3bB7J8wNUEwwsdICC8QY3DlbzXsXFEdd8qJOe8xj3q0NrzmPkk6reMQFRDydpXjtq
 gcuQ==
X-Gm-Message-State: AOAM531xNaDSXWP0vzmLLrghonNAfZ8sWVFYxufjgVxbf06QdEybiDDF
 S/OaeeoODKDq7z84jarvd4SZuZIRZJgVtY6e/YxtSaqdzRI=
X-Google-Smtp-Source: ABdhPJznwiU7gDjxGlhX7mV7m/E3LQs2BNJMDejZyDM65uf7+iiwIcD62u1g0/76v/XmrKZZ+Mv7s45qrdH7aToP/qc=
X-Received: by 2002:aa7:d6c4:: with SMTP id x4mr23711789edr.98.1600200280107; 
 Tue, 15 Sep 2020 13:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200909160409.8678-1-narmstrong@baylibre.com>
 <20200909160409.8678-5-narmstrong@baylibre.com>
In-Reply-To: <20200909160409.8678-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 22:04:29 +0200
Message-ID: <CAFBinCDgqu-fz9xhwC0-jEbQ3eY9RfZEb61-BR6Mwjbo3BOedg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: meson-axg: add USB nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_160441_435709_46E4D5CD 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Wed, Sep 9, 2020 at 6:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds the USB Glue node, with the USB2 & USB3 controllers along the single
> USB2 PHY node.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +                       usb2_phy1: phy@9020 {
> +                               compatible = "amlogic,meson-gxl-usb2-phy";
> +                               #phy-cells = <0>;
> +                               reg = <0x0 0x9020 0x0 0x20>;
> +                               clocks = <&clkc CLKID_USB>;
> +                               clock-names = "phy";
> +                               resets = <&reset RESET_USB_OTG>;
> +                               reset-names = "phy";
> +                               status = "okay";
if you have to re-send this for some reason: status = "okay" is the
default and so I think we can omit this

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
