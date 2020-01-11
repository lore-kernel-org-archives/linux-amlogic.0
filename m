Return-Path: <SRS0=NecF=3A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CBFC282DD
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jan 2020 20:45:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 647A02071A
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jan 2020 20:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SJYHe0We";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GF+UHv17"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 647A02071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvJZ5CZ6gkaX3CtNjeOtzNWG+UrrtOjoGeqz75IH98U=; b=SJYHe0We7cUELL
	rol1Iab26tJkjuan/120LrJzk7i/6mA0jrtmjNITkI45ywauaxkKDjZHv+XSgw0M6L+srCgKe/Hj9
	5DNyJxcxAeRDQJAihY8opPQwfKzkzSIsiRbVM2zj9SbV8/FEx61IiCSxR3qxtoi783w/TPfLYITMR
	ZtGaCYdVOL2bU7UyrdCWpND2FvQykVGTKcQ+HFiRLeNcaD71G8QBs4ZfIVRhJ3bHRop/2vDgIjHzT
	kWQRcYPFbc/Is8k3VV8OzKYr7mlHt1LScFKE1aQX5YNVHtAwGg7mI2xSyd2JNGTcQaoJEJoXd4yBM
	QawWX1FPZmxZNEIVTv9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqNdP-00039U-KB; Sat, 11 Jan 2020 20:45:27 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqNdM-000393-TJ; Sat, 11 Jan 2020 20:45:26 +0000
Received: by mail-ed1-x543.google.com with SMTP id c26so4995376eds.8;
 Sat, 11 Jan 2020 12:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fptJHxfJcn8XPXLFZgO9QVg2TjNMVukyouEJjCWDXV8=;
 b=GF+UHv17+im9hGltahc9unerkHkyQ5OVQwSM50qplG7IuREOcD9QMEgYUblCEqN3N/
 0OPv7W8dvRSeoheT6OzralJLFc/pzzaOVIpL/4AsoHIHWeAvrs9l1ohuyF0cllD182AO
 nol87ON0HLhrbhewaDhNPnOO/XyY7xHUhu6BA/DiC0dQ0ljBV2Jw33WUVlttfemgj74x
 oBpj2x1V9D2QBf6OHoEUjhmVo0mxOGwPVoNGxvK7np5dmL6UTj8SeB2PDfKMKFx2mDUb
 GxcVozLSn++R9TAG1YaHI/GWTRuQOjDj24OnYvwWI6bTNlkkcalppgx2r/YDVv5Zdztr
 t6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fptJHxfJcn8XPXLFZgO9QVg2TjNMVukyouEJjCWDXV8=;
 b=tYDfazlakZV0tmscq+4K1s+ChV+Hsip4e6JfdPQXKCDmmHw+LR5wJmi33PPpeqlUcK
 gCnXtrrh/mrzdohmb6EvbSLRvY3/B9Xvs9yYBFiG6fralx335KkXnVR6kbT746GfPuMc
 zhvAsXt1iLbfAZkutL2kk9OSbVWjs4tPtUuR57/45Khg2SXavtY46o3rlqc+OwLg9qBh
 GJzfbG2Ml9i9ONrLEtZ4uhw7yBsGpGlRlsRKNBrtFr8xFV2SGp2RQaxbmE+riHLq2kzZ
 1jmUnixToXrtttMy+3+YvCpIh3m6CzfWARoPwCWNb8NstW12nKeZndTHgRrhZgWUlThz
 d6Jw==
X-Gm-Message-State: APjAAAUJQXUYIEchQzI+DRVZojDHhQ0H7FA0P9W17ynD6LGRj1PsMo7l
 zH2gsOLS2FA7rQ7aM9fmk89xomvIAuX/VVtL1b4=
X-Google-Smtp-Source: APXvYqxx35msRJwJFzncZx/Qn0rrX3K1+YRYlLX5GGk8pBBABXjfJI1q8LiSfcgC2cSU3qRDnzBHHHafnSeTQ/+zoKg=
X-Received: by 2002:aa7:d94d:: with SMTP id l13mr7296961eds.328.1578775522271; 
 Sat, 11 Jan 2020 12:45:22 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-5-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578634957-54826-5-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Jan 2020 21:45:11 +0100
Message-ID: <CAFBinCCFUDst_-QtSuNioAa3ckt5GzTFDAhZWh3zu42VRByPpw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_124524_971812_7DA33ADF 
X-CRM114-Status: GOOD (  10.01  )
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

On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> -       devm_add_action_or_reset(dev,
> -                                (void(*)(void *))clk_disable_unprepare,
> -                                priv->clk);
> +       ret = clk_bulk_prepare_enable(priv->drvdata->num_clks,
> +                                     priv->drvdata->clks);
I don't see clk_bulk_disable_unprepare in dwc3_meson_g12a_remove()
please test that the clocks are all disabled (see
/sys/kernel/debug/clk/clk_summary for example) when unloading all USB
related kernel modules

> +
> +       if (!priv->drvdata->otg_switch_supported)
> +               goto setup_pm_runtime;
my brain doesn't like the goto in this place because this is not an
error condition. I was about to write that
usb_role_switch_unregister() is now skipped even though we're calling
usb_role_switch_register().

I want to hear Neil's opinion on this because I got confused while
reading the code again.
my proposal is to move all of this OTG related code from
dwc3_meson_g12a_probe() into a new function, for example called
dwc3_meson_g12a_otg_init()
then only call that function when OTG switching is supported


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
