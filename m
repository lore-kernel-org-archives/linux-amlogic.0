Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7BCC3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 21:18:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71113214DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 21:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KeJEIBlg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WfKFP2Ex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71113214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lj8MiFWaG5YzP290Hr6DGMCBLXnqcSH8M3YlFalOiLo=; b=KeJEIBlgw+AQw2
	bknCbnL0TbTafgZeaZ1ue1SA/1mS8cMDh/8BDVlT9EjQYiv8TAy92vV+EaS1vpzoYInd2XMoxMUak
	ugvpQMcfZQbByMX2O/nSRTDvQv0RQtryWr40Sq7fxj5xC9tLr5tghM5tjTViJ8DmDTVTnLyggaNf7
	sDkdCvLtmCGGeK8O2ZPVQQICTvrUYDZD9THhWHdes+pTLFs8AiLdnHzgdLSkHX66xF+xU44uYb+fn
	KJqzShPFPjZQKFNJ3oRKuV+dUhVXVe9dlDoDelNQYHCX4j2waR9z7vmD+ua2LWMMev7NhFSnW975B
	fcY7obiucTcr5JHzlIvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2irP-0008S5-El; Tue, 27 Aug 2019 21:18:39 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2irM-0008RI-9g; Tue, 27 Aug 2019 21:18:37 +0000
Received: by mail-ot1-x341.google.com with SMTP id e12so580678otp.10;
 Tue, 27 Aug 2019 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=79O2d4MxaNzshKkDgbf9PCXtK+1faNjqfacVtcjhXCw=;
 b=WfKFP2Ex7iHPWuOIN+wXVARM//Fw+EtyALZ2RHdD2VFf+u0UdwMzKBy3aPxg/7RPR/
 pYJqOuJj0qomXcd2rN3UpcOUFUw8Te0rvzryveTSoFLLKuz9uBTGHHZeGoXBb1HDcwkh
 P4KNTBURWbvWCfte0L+pEJbEatRgNmt4QzDU9JxVdcIW+lWwlw23gSLvYqoiscpm2ckT
 lsj3Bq39CEouDk2Ngp62twh+Oebm/Ssxc4voexjQq+sn44Nn+bJDjoNsV6Uc0Ij80O04
 D5nyNFuMbQtVPo3CMRAWfJUQc2XEfLcN0T6kVN+E6nNvnGMZkw/b7XXvq+TSsrC+CMJA
 0EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79O2d4MxaNzshKkDgbf9PCXtK+1faNjqfacVtcjhXCw=;
 b=GAipWY2hUXa4rHxJZvJBk6xgQKhj41PKVNCZNsRisEXTL5Lfe0vbta18qUitsUtKg9
 cKTlic9UFvXvD9cyiFGY5LLMZ8oMSj+JvN8/ovq45KbDUnvnau121/SIwaqV/jo/WMBt
 NbXXKs5t74/X5mxPL/v8y59JYO4HF6jcHxBmS7dysHkxjGwJJes56VbazRVwXnjCE+TP
 NCqcAKqjSA1iICfZtpnrB2og7tFEC3BXYaCcTBy8qkGoUbKIZxYPfdjP+8AM5dTN/kv4
 xGf+Hf29IJJ8auLTqQ/HBB0721yT51zCUvyIQKrCbgBTPmx5LnnoQRN6gqS+nyYOlgU4
 Eq2A==
X-Gm-Message-State: APjAAAXf1WjzYz2uPAXhHPFFk6edoufBcM+/Np9NP38SxyVsM7RKNF8C
 3CpbiZjBmhZFunSeTcsKMLokUQyJBn62s6gB97w=
X-Google-Smtp-Source: APXvYqwGwnC+flBOhOIUQLHX1WACuwTk+aVA1Xep4g6gD4QcHubhVgX2ByYgZ7v0D2tQL2mAd7UJqcYjnDBDStIY/rY=
X-Received: by 2002:a9d:7b44:: with SMTP id f4mr571632oto.42.1566940713518;
 Tue, 27 Aug 2019 14:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190823081427.17228-1-narmstrong@baylibre.com>
 <20190823081427.17228-3-narmstrong@baylibre.com>
 <CAFBinCBLVDVWPbDZ+_cPTbJNCavvzJH4A6U8D9XWVSR-j3fzFQ@mail.gmail.com>
 <c853d934-113c-2305-f229-1e2c7138fc3f@baylibre.com>
In-Reply-To: <c853d934-113c-2305-f229-1e2c7138fc3f@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Aug 2019 23:18:22 +0200
Message-ID: <CAFBinCBLxW2r-N0z10Z7uUpvdoPikkZ0Lca6J-NctGYXtuxb2Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] amlogic: arm: add Amlogic SM1 based Khadas VIM3
 variant bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_141836_340048_22DA89A3 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 26, 2019 at 9:42 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> >> index b48ea1e4913a..2751dd778ce0 100644
> >> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> >> @@ -150,9 +150,10 @@ properties:
> >>            - const: amlogic,s922x
> >>            - const: amlogic,g12b
> >>
> >> -      - description: Boards with the Amlogic Meson SM1 S905X3 SoC
> >> +      - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
> >>          items:
> >>            - enum:
> >>                - seirobotics,sei610
> >> +              - khadas,vim3
>
> Khadas asked me to rename the board to "vim3l", which is the commercial name,
> should I only change the DT name or also the compatible "khadas,vim3l" ?
I vote for being consistent:
- rename the .dts to vim3l
- and change the compatible string

> >>            - const: amlogic,sm1
> > on the GXL we differentiate between S905X and S905D
> > do we need to differentiate S905X3 from S905D3 (for example)?
>
> From a pure SoC die perspective they are the same, exactly like
> the S905X and S905D, only the package changes.
> So only the board DT will determine which eth PHY is used,
> if a DSI panel is connected, a demodulator is connected.. even
> if the underlying package is S905Y3 without any of these pins
> available.
OK, I see - fine for me then
GXL's S905W and/or S805X are the "special cases" then which (AFAIK)
use a different (smaller) package (so it made sense to differentiate
all GXL SoCs)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
