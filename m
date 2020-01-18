Return-Path: <SRS0=J37j=3H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33896C32771
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jan 2020 22:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 055AD2469D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jan 2020 22:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mRwLqYPv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Hma47cnZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 055AD2469D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6My/eVtP0LflZUP6esF5rumv1UyxLwhaMtIVWyfupo=; b=mRwLqYPvIPIZkV
	du28lXYed1v3MX0eVx6AP2dLii+G13UXdvwRdjAu2kUW40PhHhVqscr9Iu6r+wIW/KPsqUNyhFg9+
	mtFYfYuohPyX+9rrvPCRKLimSOzW9gpK6xOt7yo7SQihw9OyBTMZZlaQAmEEg/Ob3Yh2Z+YoRxyJf
	lzSJTTbK77Tt6OZ0Mq7kqopvZ1lgmQaAkwEveVphXfEQD5NyEQNgEGPLjNfp47UNyDGmhNyZaFolG
	kpLfVwLwCqpIRUhNG0ii54Jqu6L6HIUPX20M1nyJm/PeHopOST4s18PpS1hAS9Bad1X0B3Yeng72T
	xOF1LsUj+ZWQgsvia0VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isw99-000470-HX; Sat, 18 Jan 2020 22:00:47 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isw97-00046g-9M; Sat, 18 Jan 2020 22:00:46 +0000
Received: by mail-ed1-x541.google.com with SMTP id dc19so25870209edb.10;
 Sat, 18 Jan 2020 14:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hhGX1nqtyoIZtWHowHcHPTDuXomALEwGp67YDIAs05A=;
 b=Hma47cnZkW8SDZySjYMuPSLqtSqE+IGLh9ZGHEFQJ7/WvVbaeTgLg5nEdn68Vy0dCK
 GUBMZrRmAWrTo84VZE44KJpsZFWbb1YoVyTe6dCcVTbLHIJHY/7SAUFl27ZA4Kr8ZVID
 BijVsnKRqrvLW6r9pjuSbPKhlMb5Aaei7Niboxwmwr2HPBl/F2yJpy3XtSVI6Xz09G8m
 hZwYqoMwOLqnUbyrNTdQx2+v5XDeC6RmkSaUKqrMWGBja8VIZgczhZk4bYCaG4KFh3sv
 WHuYswNS0goNqezzYhOH8T07sY0avlTpkA7XYSTvuyl+k6G+wYkk8RZhv4ALnNcG8kI0
 4t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhGX1nqtyoIZtWHowHcHPTDuXomALEwGp67YDIAs05A=;
 b=tDRWlSekvIy/4iCf2jAIcXsnrD2IRCCNwly8KzJ1+nrihFaVIRPgOWPzaHnOj23mdn
 wc1rux/JZab6Wd7rdO4ffea7TFHUFf5gu3tmRi5StZwRNB8enjOfRzbtRPvUAbUJamRa
 167T4Bxkhbpv/K42qM+wdDhJ45r2+rtkpvQ1Sbry2RmVtxEYcMdKVHYGHEFCIWelEz6a
 4Kzf5+SULdEIU3JBGTTeomtpuo/3u3+2oHRFdPzRQ1F5ffBHwXH96SC1hFUU3Coz5QDN
 JJmZQxCYzNMFNPQndZp8JyzkE5pMSOySkvXUXXPEee1ZqF0tiG0trqtlRPgKHYwYDLuh
 IRjQ==
X-Gm-Message-State: APjAAAUNcZ7VhlD344b6ZsRDzcdkKPXx0VokLW+qFn9LhTHu733ot5cB
 kgKddSR/imA3sZoB0lHypSl9g1N7z4fu92DJSUA=
X-Google-Smtp-Source: APXvYqx5U4qXgJUFLodBAh/Su0iA4o4YjM2gOenS+CuMOI6/b0kQEpYd45al918MVd/znVyYVIAaXhGujEJ328y18VE=
X-Received: by 2002:a17:906:2359:: with SMTP id
 m25mr13932991eja.22.1579384843512; 
 Sat, 18 Jan 2020 14:00:43 -0800 (PST)
MIME-Version: 1.0
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com>
 <1579220504-110067-5-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1579220504-110067-5-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Jan 2020 23:00:32 +0100
Message-ID: <CAFBinCAZ1iUKDnV2ewrT0ytXjVbpbZVpn-Ybj9caN4Od3Z0UEg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200118_140045_328887_E4DF7440 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Hanjie,

thank you for this update - your patch looks great now!

On Fri, Jan 17, 2020 at 1:22 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
> Adds support for Amlogic A1 USB Control Glue HW.
>
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
> - a DWC3 IP configured as Host for USB2 and USB3
>
> A glue connects the controllers to the USB2 PHY of A1 SoC.
>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
