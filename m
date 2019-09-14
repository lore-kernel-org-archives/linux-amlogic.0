Return-Path: <SRS0=DBdr=XJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C329C4CEC9
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2019 17:28:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAC62054F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2019 17:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSGro8IN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MgUN1SvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EAC62054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Z62H8PqTnH+eLM9Z/18ruOmz31DoJtzcsCYSLZxvX4=; b=CSGro8INu0NuTe
	lwxsA23f7CFiog6WDmu+Xb6ZeLKLd2pON/ahe4sH2vsrkJrZPGZY5hBrKUyocN9cF98Sqst2uC7qZ
	gZn1skIvUQ1+s6dLO3GwoI0jj5Rzt6sntafL7bSCWE65AmicuiJfOBuywgslIfwTiULohhu2ZoCSB
	GZ8qTK4o5ap1lsR0D2TwJqItx7kyk28E5TUEyPYU8QZqODugWaGDURuqeDWETbDQZrU13tzyOPPAt
	lrxJt99sVQTAIF44v4jgtB++6ANbSIDbbLZjENFPX4kEBYeH5s3R4LtBOd10hZL99U4RiaMjiiJiF
	7j5OIi3yoSTCXsQB2pUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9Bqv-00046n-Bw; Sat, 14 Sep 2019 17:28:53 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9Bqs-00046L-Nt; Sat, 14 Sep 2019 17:28:51 +0000
Received: by mail-oi1-x241.google.com with SMTP id w144so5204339oia.6;
 Sat, 14 Sep 2019 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mA5mzxsxWnYShGZnGYHnIbq5CGiyFdSMEe2+j4i+v6M=;
 b=MgUN1SvM7yJm/8hPixwOVkO4Z5JXQs1ePB8BdjNQ9TnYTyLE7jeREeQ2oxDSoLE/Sj
 YtsTrQ59ePZpJyj/tDDvYwqDNgVLVPwpojBYibvc3+6YpzYvwo0OuMd6CGCc/0raWziV
 ICiYwQMfHk+9W+a6B5nvz3fwsHFpfpkjHAyxXGlqcfM5vfifm+0p5D01zHucaR12Akcr
 CDi3/DjNX3u3wekkM0L7ZtNzKRdjj0vphCE2RHFDyvSdbrZHKAuvVE5fAcZY4spJ3jYO
 0hybFDEoenEbsm1/On+Kq2bAOwBY41fXRCBRUuI0on4CA3x1UurrDfCXRz7dPUKJpmxy
 Ixmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mA5mzxsxWnYShGZnGYHnIbq5CGiyFdSMEe2+j4i+v6M=;
 b=NntN89tusg+7x9Y2GNmyHPJlUcUDv/dC/diVuMz0+27bbprnFvdyJJxf0RmvEA7FIg
 OhC/+HFy1ELFoZiDlEjkLkO9uBU57Yz2eNU/6lcD19FillEJ10Q1+OsmFzPHMgkBTczB
 turRmEb+A113YB6nJWGgqk2gedn4+MF+l9Mof0CWSmM+3P1B7XADtHjXf8mWx3x7OUxx
 srRnVwr8JeZNXIv25+0/I+1VsOJD788QyRbR2uyGLzsgf9jpniWbcUCwLIcN+mdJ9UXX
 S1zFu8bt/uyqvRVicc+JEItuk6JECfvLLp98QtzTrCvuo0hX2tdXWhyf48NY/Gg7rbl9
 NXhQ==
X-Gm-Message-State: APjAAAWTlXZkL6ft4jbplxJX4r9nFvzRWxUmEXMZD8G7+xrNmuanC+5J
 wVCVYGHfLRViqAoo+hFQIpms00a5/jEsJ3s06l0=
X-Google-Smtp-Source: APXvYqyVRQJX+2iGdouQY/84grVpTaJtdKUwyl2adY9/dPWR24A4Xhdw1if4wm/5/CFwY5bCokeMy6dwm9vC0eBwrkw=
X-Received: by 2002:aca:84e:: with SMTP id 75mr8360168oii.140.1568482129617;
 Sat, 14 Sep 2019 10:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Sep 2019 19:28:38 +0200
Message-ID: <CAFBinCAcZLLtG2pYQ76wE5BjeA1fnARzb0o7aWFBNpQabLBjDw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: Add basic support for Amlogic A1 SoC Family
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190914_102850_780738_EB6F850A 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Tao Zeng <tao.zeng@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

On Thu, Sep 12, 2019 at 10:20 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>
> A1 is an application processor designed for smart audio and IoT applications,
> with Dual core ARM Cortex-A35 CPU. Unlike the previous GXL and G12 series,
> there is no Cortex-M3 AO CPU in it.
it will be interesting to see which devices will use this SoC

[...]
> Jianxin Pan (4):
>   soc: amlogic: meson-gx-socinfo: Add A1 and A113L IDs
>   dt-bindings: arm: amlogic: add A1 bindings
>   dt-bindings: arm: amlogic: add Amlogic AD401 bindings
>   arm64: dts: add support for A1 based Amlogic AD401
for the whole series:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
