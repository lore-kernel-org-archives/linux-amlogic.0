Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02758C3A59E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 04:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C810F217F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 04:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VBe1jUxM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNQY2SpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C810F217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXb9LjHjgePvV4vJm5UZoiv8fpcYeyW4GgsgekvtymM=; b=VBe1jUxMj+khf1
	tuq82TKumStJRkkSfezgx/bNknDyaGBgHCzJqXPWYDexyooExscno/ka6aXIG47q+MTpRHQkA15v0
	jcUYvoQpV/ibr9nynZD6NVbkfYzw+DzBCKb/Hks4+jaLsTtfDL58QnYmXIteTnjD8dpbGEUpzH5HU
	qTWglv5lyQdm3nqYFxNP9OBNvOQKr5mVII3PMOQ9x41kUBDY1r/NyrNRYC/526wHWQJwTllWbew+I
	xkidjK1SHqnhvuu2b6Dru8ARo/0Vmcd2i6/EnDZ8X+UYvm7pnaiBLTruh7kGfGt7T9MRQPDE528QY
	WESRmzfMytEzgWyJgfWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i26lt-0005gs-40; Mon, 26 Aug 2019 04:38:25 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i26lf-0005N9-7A; Mon, 26 Aug 2019 04:38:12 +0000
Received: by mail-io1-xd29.google.com with SMTP id x4so34036615iog.13;
 Sun, 25 Aug 2019 21:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1exAYWMUyyRgKmul096n+B+OJhwM6f4sJVMKQ8yVO4=;
 b=sNQY2SpHNTmIlNk/wEGcudVnHQM83F7hQaS1ETEjI79e15eMZ/xtylyHzPmznM+1R6
 1IA03XGhcgR92W7/4Jezb2kbTUHRHGW4TRqQTKB7ssDi1YSl+eQvvPiSk3hy/aOjFHc+
 3l1PR0QAE2VQsmxiOJwbV6clUiMsSCrMoAcb72aw4cNsQZWt/c844lUQLo4RLaFZmuNi
 iLMbl/Ggw7uLD7MVLEMbeww3FeArGoHVn/PyZG/gcn8HH+sZTalWC8u4742g1hxkd9Zp
 01oU8R2vwCiRvGUawpE99qLI/drjYNbfoEH6BEkNM6s/tm0vknYY9BWV/PKXQKn18hW1
 Orig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1exAYWMUyyRgKmul096n+B+OJhwM6f4sJVMKQ8yVO4=;
 b=RD2olp1jlZVLYEyw5xq3ApdpU8zbKG7GuBc3dpkBhkmsGmtOTUd0IrU4ZEUb0l82bc
 qnAVjLbUxRPZ9ZjOWK9tqSRee1FLnthotal2hdAXmzunCmiTXRbxrfrh1FhJkUbSSmaR
 zveQayRix5IKjqTARa+e5gEaKeWHvRCqjxOa1n1tK4tP5Guad4APclVEJFqhVdvySl8c
 yKofUtf1TWxLCdaqQRg4cqGFcKpqqz4W/U5PmA8qpoth9rBrbkO+ZIbIEBgOlugnpGo3
 fRb6lV9mMHkQ4iq/lqz+pktYGx5tq1RnHpHh4Os2i3Ubu0hV+wNyUxDGlEhY9a8XV7+p
 q4RA==
X-Gm-Message-State: APjAAAWA+wUC/08BS60CGF+lHPr1WvzCkdhd5A6yCH1Y8RR51/gSQ4Ve
 TouexCsOP3JAZ8NjlQnqgldr+tT+sovtzqxNVKM=
X-Google-Smtp-Source: APXvYqwEEY4HsG8gz1jj+r6ZLb2rp/DiM2S4ZMAN7B0+HDDxv6FuAymB/Jnl0NRYtaRzdacjMIKfIX+oi2ihc+NiIOE=
X-Received: by 2002:a6b:4409:: with SMTP id r9mr22335208ioa.75.1566794288499; 
 Sun, 25 Aug 2019 21:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190824184912.795-1-linux.amoon@gmail.com>
 <CAFBinCCkEE8==-Sqqj_=Ofnx7_H-970dETwEmEPohs74806ZMw@mail.gmail.com>
In-Reply-To: <CAFBinCCkEE8==-Sqqj_=Ofnx7_H-970dETwEmEPohs74806ZMw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 26 Aug 2019 10:08:01 +0530
Message-ID: <CANAwSgTsua_x6fi7NzC2XjcV19OJcN3NhOT_niKXN4RR4X+qVQ@mail.gmail.com>
Subject: Re: [PATCHv4 0/3] Odroid c2 usb fixs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_213811_288954_46508FD8 
X-CRM114-Status: GOOD (  10.13  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sun, 25 Aug 2019 at 02:48, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> thank you for the patches
>
> On Sat, Aug 24, 2019 at 8:49 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > Anand Moon (3):
> >   arm64: dts: meson: odroid-c2: p5v0 is the main 5V power input
> >   arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
> >   arm64: dts: meson: odroid-c2: Disable usb_otg bus to avoid power
> >     failed warning
> this whole series is:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks, I have some more patch in line for this board.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
