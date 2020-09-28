Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024FFC2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 20:24:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B28A206E5
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 20:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Vk56N4f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qcxx8srT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B28A206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c6J28100BjEGICnuXM6dAgsb8sRs6yRnEBwQQKW2XSY=; b=1Vk56N4fSRsqx2UqsOuhw5lrp
	R0LVlD+mRT7jivgcJ8eNKrt11YHi45b2ZlFOyjzMo928hTofmiF+c1oL9lqR4R8OJw73O+sQBu0DQ
	vdvkP3njcWl5sOb8bV2xNFFFaNeRYodyjTX55bZ82/tU3iE6+HCvpQ8XF3tOpbG2KQuHXPmn72jwj
	AOeWd1ffilNghwiTzaRiW+1/QL4ko5iXCK/gAXwu13eaomvhXDs3nMIeNYyT+9Bw25e5NhA2DLIJh
	VlRwzOwIqTu5G9/X3nv5oKwdwfVXx8D2qDCGeU/58Z5iozjr8Y+6OQ1TXxrBjZkZzFRnqsriSz/TQ
	wuSVLy2Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMzgs-0002V0-O3; Mon, 28 Sep 2020 20:24:06 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMzgq-0002Tn-FZ; Mon, 28 Sep 2020 20:24:05 +0000
Received: by mail-ej1-x642.google.com with SMTP id i26so10866112ejb.12;
 Mon, 28 Sep 2020 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1J3xfX6mi+yH7vokRWfQjm7Vu2SF03BqzqPZ3nviNoE=;
 b=qcxx8srT7SomaH8XuJ4Kl7Kwksp5hSYaB/IYqbbZl8eINeqiD5PSu86lQ5BkdDBNkS
 8rG4BTru6BYE8xCZRH0+lUWWPvgLjyvhz6Ng+xGjnEZpL1lAyQu/SLmWIpRWII4PcE7Q
 M303xrS51KomeLbXTDGh+T6C8Vbng/sqUQZX1lmKFF5pBfbUgoNOrik3dqzCht+45X+e
 b+6wfsIaz6xd/b5DzpvzmrwOBD8Hko/AArruIRiVs5NyPEzqhXa380+HR3B3F8YlRvNP
 bBF8gm1/IVLUTW/lB9erkPt4Wkg9qTxPSAnzgQvcCT7GvU0zJp8VW06yyrtwhu98VoBT
 E25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1J3xfX6mi+yH7vokRWfQjm7Vu2SF03BqzqPZ3nviNoE=;
 b=KqjvxMIa8fdzoVjufaryBROAIvTNsQP6XDcqkF+khsna6yPjxoNedf2waRVvlcHYfu
 rMa40G3DiAlOOx/mOEQzaGBHh4gR60fdZuAtxeqbjQfJ24QH+cO+jQ8VO3Foa6NagxIY
 g8FLpN5PG8H5khCz/4Ee5gqXgSH/yrQDqWpxxy39cm18d0zlABNLeoc5I+TdhUASfTKh
 7yv9TmkDB+KKujK4Oq47GRbewQORiQ2g05Dl3q93Ba9F9T3Ms4rdKTQR08F+0Y5YiQMp
 o4Pysnk4f/Ur+gjXS9WFEGfDgfKzVI7NJqyBWBlRDGtmg6UoFSE2cgXR2/gPfyFcBAsH
 Y7TQ==
X-Gm-Message-State: AOAM530PT4xHfbpBVhX5ITjRbvjBOv26iHwnx/N+210nJk6C0nKfl8ES
 ipbNwgV0z8r7UFDGAWuCp4+f9l+MFpuqM134aQ0=
X-Google-Smtp-Source: ABdhPJyNwJznKhbkYlvL5tC9TERwX8tgB5MOPOWV37ylEdBY0oUGQGsaTist/nbW+GeLLVJypFukRI5bQks82mNJJuA=
X-Received: by 2002:a17:906:e216:: with SMTP id
 gf22mr529801ejb.2.1601324641833; 
 Mon, 28 Sep 2020 13:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
 <20200925221403.GE3856392@lunn.ch>
 <CAFBinCC4VuLJDLqQb+m+h+qnh6fAK2aBLVtQaE15Tc-zQq=KSg@mail.gmail.com>
 <20200926004129.GC3850848@lunn.ch>
 <CAFBinCAc2-QV3E8P4gk+7Lq0ushH08UoZ0tQ8ACEoda-D8oaWg@mail.gmail.com>
 <20200926144513.GD3850848@lunn.ch>
In-Reply-To: <20200926144513.GD3850848@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 28 Sep 2020 22:23:50 +0200
Message-ID: <CAFBinCD8PWB52qD1X4jsSbkGw2C+x14QUPcQ8R-fUugOOPx-DQ@mail.gmail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_162404_549286_863DD3F4 
X-CRM114-Status: GOOD (  23.01  )
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
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Sat, Sep 26, 2020 at 4:45 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I checked this again for the vendor u-boot (where Ethernet is NOT
> > working) as well as the Android kernel which this board was shipped
> > with (where Ethernet is working)
> > - in u-boot the MAC side adds a 2ns TX delay and the PHY side adds a
> > 2ns RX delay
>
> So that suggest there is nothing on the PCB. It is all down to MAC and
> PHY adding delays.
u-boot with it's 2ns RX delay is the non-working case
only if I manually turn off the 2ns RX delay generated by the PHY in
u-boot (phyreg w 0x1f 0xd08; phyreg w 0x11 0x9; phyreg w 0x15 0x11;
phyreg w 0x1f 0x0; phyreg w 0x0 0x9200) I can get ping/tftpboot to
work

the Android kernel disables the 2ns RX delay on the PHY side (and as
far as I can tell does NOT enable it on the MAC side). with that
Ethernet is working

> > yes, there's only one calibration value
> > the reference code is calculating the calibration setting for four
> > configuration variants:
> > - 2ns TX delay on the MAC side, no RX or TX delay on the PHY side, RGMII RX_CLK not inverted
> > - 2ns TX delay on the MAC side, no RX or TX delay on the PHY side, RGMII RX_CLK inverted
> > - 2ns TX delay on the MAC side, 2ns RX delay on the PHY side, RGMII RX_CLK not inverted
> > - 2ns TX delay on the MAC side, 2ns RX delay on the PHY side, RGMII RX_CLK inverted
> >
> > now that I'm writing this, could it be a calibration of the RX_CLK
> > signal?
>
> Yes, seems like it. Which of these four does it end up using? I'm
> guessing the 3rd?
I need to double-check but if I remember correctly was close between
the first and last one (and I think the first case won)

> So i would forget about configuration clock inversion. Hard code it to
> whatever works. It is not something you see other MAC/PHY combinations
> allow to configure.
we have inversion hard-coded to "off". I'm not planning to take this
into consideration unless there's a good reason to do so

> I think you said a value of 0x2 works. I wonder if that corresponds to
> something slightly larger than 0ns if option 3 is being used?
I have tested 0x0, 0x3, 0x4 and 0xf
the first three values are working, but 0xf isn't.

I'll try to reach someone at Amlogic to clarify the meaning of these
new register bits.
I guess Florian's patch is a good starting point for what I need -
thanks again for the suggestion Vladimir.


Thank you all!
Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
