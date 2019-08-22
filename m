Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995E1C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 13:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C91322CE3
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 13:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jSeThlWf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIpf24nR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C91322CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLrbMTEIP2zosKYk/vfh22T+EZx5CYcjgDoigOi63IA=; b=jSeThlWf/oT2Rh
	851M5zjAyweaeWTru8emBF2qyUeA0+yU/FR+YK2rUSm75gIA7zpdCvlPAys36mVSElBrjdWnua8Qp
	6csc8V3INh64CPnuALTkznnGOMw6IyZkhGYxBcVy1+nLU35SLzeEZtniHAttmGhxZyiJ0hNJks3V2
	rV8lXjts7JD2kES7LgudggD/oN0aJ4Lvqmv1pgpIL9LIFt9irmf798zSXnJ//Eemz5XVG7N2jQu8E
	0MhUVpDncg44/4tL7L7QCY4CxT7QJOrXVL1ar3yvcOGObuxk8j5uobAv2PT0WHJSnVrrK7xXu0xdB
	lUSOB1nbc6uVrMr0YVxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0nWe-000565-5C; Thu, 22 Aug 2019 13:53:16 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0nWP-0004uC-Gr
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 13:53:02 +0000
Received: by mail-vs1-xe42.google.com with SMTP id y16so3897005vsc.3
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tuGMouOtFOL6qd6oBESyF32JYfPiKh5leEjrSnKcwpo=;
 b=RIpf24nRH3NUjh7tR/MywKsXGcriypUW3Nw3anrRX3qatgw7KCnHTkXo3cU/OFH3X2
 NQeZCbxcPKcmtt7MbN/GPbEOg9oYcgPV2XCjK02rdsa0QPEezNRFzYcsNkaBHcH5Pe6y
 UqMYqZIINSZ39LZeTGVvj7L/jZXZFHzYNFSUmk7gxCW974AGFMP85ICYFbaLD2jmircr
 bHH603dKDy9u//yt275AVzVyqZ+GIXaLMYfSmSyxAUt/ZZqlHex64BJXlaG9J0iUkY1B
 SY++cLbJvsB6MHyhQotX+Y+tXTaF1SCJAFRyK71QAX/he5OHCp3ajltLGSNtA833uZNO
 esaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tuGMouOtFOL6qd6oBESyF32JYfPiKh5leEjrSnKcwpo=;
 b=J+Y0Lsq2r7yr7i1PP/9BytHN5DUVLr1CgxLFhxx3J3zHm0tXGXLXmmr26Gh9PHKSbC
 NfaS6QmVrv0N+xiERabntO/zOU5Wg5pPyxS6cHifAd5fZrTYXDN3x1XnXt9a7Sd5aSU4
 58Bo4Fw65NPGKAKhfPPQgffH0nWGEIK3Dfn00n6H1V1JExTjzECZ/RsKBnBAfTYLz6v4
 ltLIe2I3f4ygTw6LqA3UC6T2WAEhxDRKBgx//4NIrNABhWtnyV3OqR/xlPxBLyQY9Ogo
 JExocHKj32nTxIS8ZH5XX2WoeMKR44ijY597oLAS0J0WMCdYlgyjr9gUuIxAMRuKDggs
 oQAg==
X-Gm-Message-State: APjAAAVr24DmyZ1X9/ZFVXzgyhnbVzVxvS70yHzHlUYVelL7+oJqFVVj
 shcsiyfUC+qbG4tQyUwnZBpSc7+gnEfttDQH+16X5r3Jt28=
X-Google-Smtp-Source: APXvYqwLUBPKQGwaCHNT/xqZtRG5kBo+RsrpLvjiu+PO1wXYnj3Lf88aoVFjhAhrpB2zEipWIW/7o+VlnllMarHDCvA=
X-Received: by 2002:a67:61c7:: with SMTP id
 v190mr24937528vsb.165.1566481980346; 
 Thu, 22 Aug 2019 06:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190708173330.13217-1-martin.blumenstingl@googlemail.com>
 <20190708173330.13217-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190708173330.13217-3-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Aug 2019 15:52:24 +0200
Message-ID: <CAPDyKFoFQ_QvHD-+Mg_VAR5rqs3CM_h7dw25p81JTzE1Yz7d1A@mail.gmail.com>
Subject: Re: [PATCH RFC v1 2/2] mmc: host: meson-mx-sdhc: new driver for the
 Amlogic Meson SDHC host
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_065301_569598_A31D0808 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 jianxin.pan@amlogic.com,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 8 Jul 2019 at 19:33, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> WiP - only partially working - see performance numbers.
>
> Odroid-C1 eMMC (HS-200):
> Amlogic's vendor driver @ Linux 3.10:
>   7781351936 bytes (7.8 GB) copied, 134.714 s, 57.8 MB/s
> This driver:
>   7781351936 bytes (7.8 GB, 7.2 GiB) copied, 189.02 s, 41.2 MB/s
>
> EC-100 eMMC (HS MMC):
> Amlogic's vendor driver @ Linux 3.10:
>   15762194432 bytes (16 GB) copied, 422.967 s, 37.3 MB/s
> This driver:
>   15762194432 bytes (16 GB, 15 GiB) copied, 9232.65 s, 1.7 MB/s
>
> 1) Amlogic's vendor driver does some magic with the divider:
>       clk_div = input_rate / clk_ios - !(input_rate%clk_ios);
>       if (!(clk_div & 0x01)) // if even number, turn it to an odd one
>          clk_div++;
>    It's not clear to me whether what the reason behind this is, what is
>    supposed to be achieved with this?
>
> 2) The hardcoded RX clock phases are taken from the vendor driver. It
>    seems that these are only valid when fclk_div3 is used as input
>    clock (however, there are four more inputs). It's not clear to me how
>    to calculate the RX clock phases in set_ios based on the input clock
>    and the ios rate.
>
> 3) The hardware supports a timeout IRQ but the max_busy_timeout is not
>    documented anywhere.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Martin, overall this looks good to me. Once you moved from RFC to a
formal patch I will check again, of course.

There are a couple of calls to readl_poll_timeout(), for different
reasons, that I have some questions about, but we can discuss those in
the next step.

[...]

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
