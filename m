Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E7EC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 20:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A502086C
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 20:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1csHhrK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bN/9a2Ic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A502086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KsThjwOywrEaEAZiV6+D+Cswi3cgZasxzarsINrp8o=; b=Q1csHhrKLoS1Vz
	+Bb+H227D7YMoC7VGr/tIO94q25dESgHTOIl6l0+sP5rkkTWQYOOv96bPQ/6mcPODlxRydCjAtNG6
	teRk6UdJoYK7+RACir1kGre8WL4TsIezd2PeBfgCGtWK/bWQ40JLPDAQxn537p+Ftr2mBT8S7D2I7
	V8Uuhw0o0OZjcNZt+JfA3Q8Kk+7OyUqvoq+woxvAMUxVdPVoT2yQvtjEmoQV3QPvQWHc2i3mnPjzY
	Uy8gphfqwPgUgMBRp/NY081+LdYVoKkvRhKi68pHbRLnUm9zbnWvzuJ7PEPKzj+ZFKZBpa/pLttPm
	z3ZhCPkM2HHogEY4l7ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAhFZ-0005Z1-W6; Sun, 31 Mar 2019 20:40:17 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAhFS-0005Hy-Hp; Sun, 31 Mar 2019 20:40:11 +0000
Received: by mail-ot1-x342.google.com with SMTP id e80so6687191ote.5;
 Sun, 31 Mar 2019 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tuOXAbv3J8MIItCcPhrIAhsPpVIiIOHz9DlA2MhFrvU=;
 b=bN/9a2Icb8kTa8BTFjyJnjT9+QkuhDJiyZkwUBEI41Yf6Cp46OzTZ6Rqmty+cSrWF3
 LCy6O5Gk71eM5tiZ6QFstzXEgRHu6TdpyYU3uwBP7LHsjlZEsNIBssNuaW8wHyHVbA13
 Swcng2LUtQ17AyJp3W4o2CaFKCk+ESnTQpVim7S8NXilOFPFNdyPTsjro9g/ExNtuPFk
 UBFLA1AaTlLdQYWuyoBN1kxX/j7XllEP9tI7V9fccIr5B24xm/aippHzdoMY1nC7NeCk
 Pcte0gapIm5tyq2Iz8SSKcUWt16qeI4RoONTgRGuNuvDnGolbMTB4FYcQaf0Ly+3qsTV
 J2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tuOXAbv3J8MIItCcPhrIAhsPpVIiIOHz9DlA2MhFrvU=;
 b=RyIrWGahdNz0qzjHph13nPbDZeTcambjXZImekIl0V7U5L9iRT0FEEIQgDvTZGjKsx
 6AuWX/Xq9Phi+/aDnJz+eQTgkpcAQe2JfDfSMFrYvWF77kBXKvCEVTdsMREn9SuYtW9e
 5crHLxRrmxXunat9vCI5/Gn2BsZg00Rv5iTHjMs5ukEXWMK+/cSAqLZ4Kq8bgbdH9ycG
 zK/uTrePoPTuLWE7IHjSv2ltCjkjI4La+Pjeqys1+yFpfdKaWSi5mHqGoyX26XHgNLv8
 UGSsf383P1gfdH5dYBANiho76pWx7O5rwXraIPpzuQLX0MUB6GzYPRIFDAte1i8EK7ob
 RmZg==
X-Gm-Message-State: APjAAAXDjR2MjK4b3YyPJVBpjDBtmSHfIFVcfdytMoZRpD5tgClNcT3w
 R2YN7/bQBwZvyTrLKeSdC3X/7014uXkCXWKCTeU=
X-Google-Smtp-Source: APXvYqz7vwnAicuK0j8AB+0BTgjMdFbNCYY1OyUChZCo3VH210NS3/ytS9lexvsbiOvNTToenmiS3lo48nCo67UWJ0g=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr41923482oth.308.1554064806858; 
 Sun, 31 Mar 2019 13:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
 <c0d6e2a75efc26eb1af49506e6c2cead394abecb.1553914418.git.chunfeng.yun@mediatek.com>
In-Reply-To: <c0d6e2a75efc26eb1af49506e6c2cead394abecb.1553914418.git.chunfeng.yun@mediatek.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 31 Mar 2019 22:39:56 +0200
Message-ID: <CAFBinCA3L650-9s0-y_hAP=pS2n=E_YTxn3LnRL_CTs76u2H9A@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by
 devm_clk_get_optional()
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_134010_640488_EBDC1EF2 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Mar 30, 2019 at 10:12 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use devm_clk_get_optional() to get optional clock
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

thank you for this cleanup!

if you also want a Tested-by then please give me a few days (until I
have time to boot with this patch applied on my Khadas VIM or VIM2)


Regards

Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
