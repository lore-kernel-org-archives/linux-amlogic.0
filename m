Return-Path: <SRS0=QFoF=T5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8227C28CC1
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2019 18:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 838C12184B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2019 18:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vBt1nVtX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F6umrA5v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 838C12184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu/VPTG4NAbT1RHiIKjsiWnN7R4xGbE0DtgdSHawsms=; b=vBt1nVtXaiGJgq
	gA2QBUBJOJaK4gWwrkAe6eIUMlQzt1VzU9Q9FYieKnyJ1UKeJ3bDoOLfEJxjRMaQw4fFVJVRt4nYW
	VhLVGZ4/sgxAlia3FwSBdNglnt2gQZdA3SHYMS8Zd6qNhsdUIoQrUljZKA+UQxrxANKp6zZw2K1Vz
	kCuNlvVz6UCAnUAPlD+vwuW8Ukiprf87Bp6q+6OmcBlfbtnZmkqB7lbTv8D3V+aAO5wQM//6c80mh
	IKrXaf9bEppZS9taNycZNsLj8HtUx05IcvF3ZpwIaBmpGBov9AxLQA/ptGjf1QwFExiO21NaPNgn3
	GaUDNJiBL4PUSkbfQblA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hW30I-00064k-4f; Wed, 29 May 2019 18:08:46 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW30F-00064L-NQ; Wed, 29 May 2019 18:08:45 +0000
Received: by mail-ot1-x343.google.com with SMTP id t24so2944146otl.12;
 Wed, 29 May 2019 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZqciIyIwhNV/sHfg7yKs2DBtNwzOc9301XGXD64ZpLU=;
 b=F6umrA5vVhg7FYm3YxM9CPXIT1/fC0p8oz3rQuWtSZIr1DLRRLP447fdg1z10a8RXA
 s3stQquLSBD9WnhT/YctqoLpNa8q1A/NhiirquY7/qTDqQHbGvnKWMdTeyhV8tRhgjap
 p5nbNeWyi9P1yOZ7PicltL76xoa1CVyEFvCxJxDwyTK2fSQBnJO685cEmgSVf9od4FVS
 ruUm2h138e6Fc0WLClAarGD6gppw0TSgWM/XWXztUvBLRjrzhC45oVCfmpfazbskvTMw
 mO96D5V0oyU0ZxLYS2S+aueSYQJwV9nebXl8BKT+D1JAhuBvBFXTT8wvilCA34xA7+xz
 DA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZqciIyIwhNV/sHfg7yKs2DBtNwzOc9301XGXD64ZpLU=;
 b=GPlNkAQgZ74mso9lCTaU+QC8AJqsPsTGM3/7/9U3kFWN0Ore+U1XjzxVtS0Hvgi7pe
 +hPPXPYd+E0x+Yr9vC0AbiKomXHZEED2gAYzkEE2N8lULFFtu3r1oHzXBcZgQVImWmbT
 xpxwgB08Fyc9DZLv6yi5mdXDo4dqn2REvEcC5kNnIBIGjTVdBwDMMsI2BkS6/tdPgetV
 KxN6RzZ9FeDWBPqTAhSoL93cJZvhN3hzybUPf2ds/+x1AeaEPF1A7/rLmSNCUurDUkgr
 7sRc5hwCqxzz/sBgTu2BSX3xIJ9XBFtYjRkNmp0w6DK6wwIXeO1nFU757I/eyvG1rlqy
 7oTw==
X-Gm-Message-State: APjAAAXkAmGLajUUniAlQM31sekLnanuNwWo8gupYM9xcPcOPXW7BcN4
 YRod6E4vKTSJwXg+nKnEcFMvDx+c0zEGDyXQWsQ=
X-Google-Smtp-Source: APXvYqxwk7iPwTnvooR6G+8asbXi2Yw5DbYyD1vDk+TyUrgU9x/Eq/8XReg/kqx8GMzQxm6aPn58ViHbD6tOsA/Ctv4=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr69739914otb.81.1559153316582; 
 Wed, 29 May 2019 11:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-3-narmstrong@baylibre.com>
 <CAFBinCBTK=6OW4kG=i0KZe-+AzGVXyou9g0frnh9yqLsdmB5+w@mail.gmail.com>
 <b54c7899-95b3-1202-d70b-9b8ee2955164@baylibre.com>
In-Reply-To: <b54c7899-95b3-1202-d70b-9b8ee2955164@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 29 May 2019 20:08:25 +0200
Message-ID: <CAFBinCB9PZ-mjyjCafK24cH3sN5E1r4vt1z=m+uvkHsmRW2PFQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] arm64: dts: meson-gxm-khadas-vim2: fix Bluetooth
 support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_110843_765538_03B004E7 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: khilman@baylibre.com, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, May 29, 2019 at 12:25 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 27/05/2019 20:36, Martin Blumenstingl wrote:
> > On Mon, May 27, 2019 at 3:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> From: Christian Hewitt <christianshewitt@gmail.com>
> >>
> >> - Remove serial1 alias
> >> - Add support for uart_A rts/cts
> >> - Add bluetooth uart_A subnode qith shutdown gpio
> > I tried this on my own Khadas VIM2:
> > Bluetooth: hci0: command 0x1001 tx timeout
> > Bluetooth: hci0: BCM: Reading local version info failed (-110)
> >
> > I'm not sure whether this is specific to my board or what causes this.
>
> Which kernel version ?
5.2-rc2

it's a Khadas VIM2 Basic (thus it has a AP6356S), board revision v1.2


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
