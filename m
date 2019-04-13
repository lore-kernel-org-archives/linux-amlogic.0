Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD59C10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 12:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 972362171F
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 12:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zp/1M9yf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="j718zd9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 972362171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dfe+ccmNiY+j3WUqagmQoLqKxmO9BgU9/SiJkQZDFp8=; b=Zp/1M9yficntnb
	pswQjsl3sCE3QeSBPb9si+osagBE2P8Za70pB4F7HP57IngUhF97mlOIhdTWNVkZdGun9XJXQU2aF
	oaaYQa9T0nVEekY+sT9iBlaJ0TewDZ7rDs76764tvt8vZ5bk9sWOS+Gp/1sPZNhuSCvsbbLKXfMJ6
	2qO+WReHXt/zj7IUvkzcqDqpCOcisonNvULp7M1k4rRfUO/DhUc7+3mtgxyXSLs+RsTE4McwaWnBe
	FQ6aoDHa2B/ouyqYI65HsNwxUf+gS+qauDa6vkVrocYiwU0kfJ0+LE538vBMq9sJ/jtzRzy/gx/Tw
	zNKaQButCEp09yiRQIcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFHMc-0000Vv-NB; Sat, 13 Apr 2019 12:02:30 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFHMZ-0000VK-3B; Sat, 13 Apr 2019 12:02:28 +0000
Received: by mail-oi1-x244.google.com with SMTP id 3so10157511oir.7;
 Sat, 13 Apr 2019 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYW1l5O3FluBf8+XNARKHUH9qJumpHRGxiYJg+cTA6M=;
 b=j718zd9ijociYSwQhRpEiQC/8sCqLoJhrI/XIRABPfmVE90t2uL8UlrXRdw/TRie9t
 QlrBfrouQ0Y6RhoDC8XkYRyTPz/LQFYt0TANlUQp11NcAoULMdSmMBBCarw3IU2ggnBI
 AsKHgUMYNkyECx5T+L7h8mCllopo42N6V8OgN+had7EaaHOwrJkk9FUMTTvuFRLps+9Q
 YjLbFRPhjInUO69rfKeYKCbv0CwtSeacI2ePkcgSQpTNjnjDAFAX1DA7OkKdshdMhL7L
 EKQHGxbBEh8xSwsGk3FBV9UFLCSWDlhvg4gqJC1dt76Make8kzP+bW6I15jxctTaIOkp
 cewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYW1l5O3FluBf8+XNARKHUH9qJumpHRGxiYJg+cTA6M=;
 b=ikFBa8svKfIl0czkdysTTu2IozheokoX/XTxL6KNWGgCJJzzBg6Hpzr1GHuGfkcQZp
 mNBvVIDJlx4ANk+j7RsLK2J1hDVRZDW+Fag7YBaGVJ6GkF2BToFeBEROxdSTB12gkatQ
 6LgsaXChZ2V+/1aDQvLejLJCPkTd7o/NSFMtMoY2CZ5SwdECLb4H1wqISb3rirnNTp4C
 0ypxDKoeRex2/UU9b6c+2OlRjksKV/jPJLwJwXUO77uNpa9OyEJiI6P8B6seWCP/DOrW
 l+zDhWw+Ppqg8qakPUknKNFAJIyTMhORkVf3T/sIckxwnhpdL3jHMihY7PyOriey3Tdd
 PS3A==
X-Gm-Message-State: APjAAAU7ch/CEiwTB1q1Y42geZ28BLldrfGkxsCjFmZ9kNJU11NGJu7n
 Pg2xhGEvVVDmlryKS0PDjEs+o35prMeb4FC+yZ8pebzI
X-Google-Smtp-Source: APXvYqzsKWcXSlWINfu/7neHTQkWozJwcAACSs3EG8yenqYsU7UgecbMArvvjB6K9A2LGvI0JPIguXUmwEVkVjUf+aY=
X-Received: by 2002:aca:b68a:: with SMTP id g132mr13342536oif.47.1555156945654; 
 Sat, 13 Apr 2019 05:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190412100518.24470-1-narmstrong@baylibre.com>
 <20190412100518.24470-2-narmstrong@baylibre.com>
In-Reply-To: <20190412100518.24470-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 13 Apr 2019 14:02:14 +0200
Message-ID: <CAFBinCDoxuM18+rRm0BR5usHYpBACXt+HzC6o3TFU-fqi3kkQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson-g12a: Add IR nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_050227_218287_3C1374D7 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: baylibre-upstreaming@groups.io, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, Apr 12, 2019 at 12:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Amlogic G12A SoCs uses the exact same IR decoder as previous
> families, add the IR node and the pintctrl setting.
as far as I can tell there are either two IR decoders or one updated
IR decoder in G12A and G12B.
I'm using mesong12a.dtsi from
buildroot_openlinux_kernel_4.9_fbdev_20180706 as reference:
  remote:rc@0xff808040 {
      compatible = "amlogic, aml_remote";
      reg = <0x0 0xff808040 0x00 0x44>, /*Multi-format IR controller*/
                <0x0 0xff808000 0x00 0x20>; /*Legacy IR controller*/
      ...

the registers which you are mapping are for the "Legacy IR
controller", so our existing meson-ir driver will probably work (I
haven't tested it myself yet).

can you please be explicit about this in the patch description?

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
apart from the description you can add my:
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
