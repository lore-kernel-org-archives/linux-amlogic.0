Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD869C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Dec 2022 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKRIZ54vw75/G/ne/nuEwPBg0P5w/Z8jR3Ug+qYwyPg=; b=t14XJGD/YYxdAR
	AjwIz7vB4RrPzSimzyBcFAQEIhqlSGO2M5uG3RiBEpl+DFG7SyzRxirusG9LAph7pSqF9Jpl+j6T3
	lTPAkHN+HCphB2BSSZwPr2ot3/X8KuPA2yfb8pm8rdypFf8aTaJMkyR5YbJuYSnI1z3mARoe7+gBq
	6d4TwmZT2/1mFplneHz3Fy1757D4v4n0SmAPXtX7z4ShIb2mxy5sUzBIlhbJkPmZGpSYoMhFp1uvk
	spy8mzQPOn7TFwbgem/B6KzZSJP4T7JzHkTa19PWwyZzoQTp4wZrydGC9iw+1SJB0Tg7gcF1U0ZuF
	o15ggv+Uaodews94peWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7Rb-00CBER-2z; Tue, 27 Dec 2022 10:44:27 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA7R9-00CAym-Tu; Tue, 27 Dec 2022 10:44:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id u19so31042379ejm.8;
        Tue, 27 Dec 2022 02:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=68vBCw6bqbSxmWyxJkrB96vahDi3yi1yg52EXBqY4Lc=;
        b=gRoX6+kI9KA9+migqCp2uA7BPvTFQKnEQwXlO96NFpeby3w0fWaBOIA8C8Kp8fE57S
         zpbgL+NHPC1hOCRG0pQMKdy9GbEWftxQpepMHYnSzOWSdsRdFtkZvjOEjk981f3gyGMH
         G910tw4qs36ndIXdVId5btHFfpqmI/IODQj0DoXKochMkaj7sZP3+X4Fq6S+VT0Gff/2
         ZHNm2kwLnT8H5G+qDRpyuM2STzVQkX9ZDqvrAtElq20YGugqlLVRk/LYy+jAVpDFV9cv
         ns3LJOPxLubRtIrMgBxS5VnJRR3clY5OEvfUi5oCfb7dgQuIL8lzABZtD3iW7HF1svz5
         etsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68vBCw6bqbSxmWyxJkrB96vahDi3yi1yg52EXBqY4Lc=;
        b=Snfd8awQim4VQq2QZBaBM/9rgWvEtC6vQ9RWcu5T6OgYgGtIWt22w8g2IXl8JvCMna
         I5JtzmZBFjBZHzZYmJf01p9sf7q6DgonkvDpyOBWUiYnNSJW8SaoQmB9smniIicR5/0n
         6S4Ic0HbBWo/APmwJ4KdYatPkF4qowwqObGO0DKf8h/8WXEENetQ3RSD4dki022tq1x8
         NUuOCksH/9C4gOYXa5C+tBf4K2U4W8SQl1bVwRv1s3yRdBsU1TMgq5mLyxNyubVl7SKQ
         GYj3hCOuXz316P5H3u4GxZXpe08knxZ2G0+jyBWASZyAJ1LR2wvKYmiglMhYGotvGyQx
         RaKA==
X-Gm-Message-State: AFqh2kpHimEyVMVfnK6oIXwt7+LxujtU7MDtlDnP+bKnjRZs1rlGlzZC
	5Gt3FtarmVsRvsM2kWo6tyny7TSWlHDFsuHGDUfePAP/LCI=
X-Google-Smtp-Source: AMrXdXu5VFHuh/cEmcgpseWWeyI4+5iziJCeeVpQqF/wPp7/+RyvWqGkpoqHb8ygRnGrPKWwluzpwSKX++vJr4cQ0Vo=
X-Received: by 2002:a17:906:3989:b0:7c1:1f28:afed with SMTP id
 h9-20020a170906398900b007c11f28afedmr1714756eje.678.1672137833979; Tue, 27
 Dec 2022 02:43:53 -0800 (PST)
MIME-Version: 1.0
References: <Y6okoXpwF/LZewhv@nemunai.re>
In-Reply-To: <Y6okoXpwF/LZewhv@nemunai.re>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Dec 2022 11:43:43 +0100
Message-ID: <CAFBinCBaLLxO0ox9LJKS+LaQs4eqmtH_6Sbcv70rTLZz3b2qZg@mail.gmail.com>
Subject: Re: [BISECTED] arm64: dts: meson-sm1-odroid-hc4: USB not working
To: Pierre-Olivier Mercier <nemunaire@nemunai.re>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_024400_009147_E4387319 
X-CRM114-Status: GOOD (  18.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Pierre-Olivier, Hi Neil,

On Mon, Dec 26, 2022 at 11:48 PM Pierre-Olivier Mercier
<nemunaire@nemunai.re> wrote:
>
> Hi,
>
> On my Odroid-HC4, the USB 2.0 port (the only one available) was not
> working. While it seems I was not the only one in that case[1], after
> some experiments, I found that by reverting the following commit:
>
> 703e84d6615a4 arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
Thank you for bisecting the commit!

> it solves the issue: USB is working on latest stable (6.1.1) with this
> only patch reverted, while it doesn't with vanilla dtb (with same
> config otherwise).
[...]
> I didn't read the specs, but I also tried to inverse the patch (disable
> usb2_phy1 intead of usb2_phy0) and it didn't work neither. Apparently
> usb2_phy0 and usb2_phy1 are both required for some reason...
After reading this mail yesterday I could not make much sense of it.
Now, while re-reading it I remembered the time when I worked on GXL
USB support and wrote the following comment: [0]
  All USB2 PHYs (which are internally "connected" to the dwc3 roothub)
  need to be powered on, otherwise USB devices cannot be
  enumerated (even if just one PHY is disabled and if the device is
  plugged into another, enabled port)

This is probably also the reason why I left all USB PHYs enabled by
default in meson-{gxl,gxm}.dtsi (and so did we in
meson-g12-common.dtsi). Instead we're disabling the &usb node by
default (and enabling it for boards that have USB ports).
For readers not familiar with the default enabled/disabled: typically
we disable the nodes for IP blocks in the .dtsi and then each
board.dts enables them on demand.

Neil, what do you think about this?
Should Pierre-Olivier send a formal revert (with the problem being
described as part of the git commit message, such as in [1])?


PS: Neil has probably taken some days off, so please give him more
than usual time to reply.


Best regards,
Martin


[0] https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=47722220660cfb935e27e62d385959ecc296cddb

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
