Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23194C47E4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 21:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF7A21783
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 20:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJDsoUrI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="u0KoNwON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEF7A21783
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gloE/grKShjkJyE6ZTlzPcRpwKifZC+sa310JotYDHY=; b=hJDsoUrIYfvYnD
	DDgq3MS+nBLbWzvhKE+T2VA9aWTthpIyRCQ1kHCSM9pl/a/qjpCqqFbidzA9UZIHHwBYaNzu+D6rf
	Z6HhuWBObXQtRbQq9rH2ZkrSYzoxpdZTHl56kiTF9wICVlrd5jVmM50pCRFrj/+M9RaoCo8EQa2kv
	z+7wS2G3nzDHhQpKrM4xChjnK2IfOh0u+/Z38wt8IZtNh4GT+lkcVW2jxtrXZxCwhkseruAHe2ZKk
	NIctvOYTgl9O86kFQWI4b36th4TNy1yX6xTI2yfBseniDU0guanwLHz01T2gwlxOG/BaRXNy39ndL
	3uTk3Oped1GLCwivjTHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCVOo-0007QU-2K; Mon, 23 Sep 2019 20:57:34 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCVOl-0007Q6-7F; Mon, 23 Sep 2019 20:57:32 +0000
Received: by mail-ot1-x344.google.com with SMTP id c10so13396861otd.9;
 Mon, 23 Sep 2019 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6c25qQsTeIPE9y+3+ZT0AbIPmrbpxHVzGa7akuxeXBU=;
 b=u0KoNwONLVDAye4B3NjPMQ0GIaXgrAmo677MziXVwc764mY7LMwTeDRHZwk1Q47ozk
 y9L8n4cGn9k8n0tsNkAUhQMErMbFm9EVlmHMcECZGs8gxDCgpCUYXXcWKlJb01S/ontV
 iJ/MfYNg0kaVadJBS5nehHQRaIbVQ9M8psrma9m3cCoyAJDD65MKOGgDapVVVYZcEFf+
 pa7hj1X/GyknoHHerWjEMPqGG4pI0e3SXekz0FoaYWezcIq1bv6W/lE8D/d1dVLiSeOr
 HjGRf6zGSHd6AWwWrAUtCIMg3COMZSx1qBmi4mh/w88UqvaR+gdHxnOm/6B96OH9k6bl
 c0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6c25qQsTeIPE9y+3+ZT0AbIPmrbpxHVzGa7akuxeXBU=;
 b=JUK2pCGRwynyh2Zjn6liysZoOp1H2TqPeUnv3x5gi/DRnVNaBge8+9Fz1EDrFBZsdP
 VROHaLUnbjO8slSyFozfgYFx7+NxCJCeMS8HuvEdRlFhxUjiScEWWkLKxF934hXG+SGn
 SO1Pm0mFs3luYS/o/vincD/pXCbr3KaEd8XZyHLsmfjtwEStVlW2NSMZKTjxN8dOyy0/
 alpWCBukj4PHXSQgDzREmecIrjM0YsODA9W3Yis2W9Lk9Npamr59+a1R7jd59OtUbUNx
 IB7KrC2u6+xSQMomDarnhQ6caP/tTLms5Y2OlLNB62JVLD/WdJNz7qs7NwWEkJUFyf2f
 G67A==
X-Gm-Message-State: APjAAAXUrdM9WKd+eOyegO/HEpParIKdslvtQuqb4BQAujHEemGueW+L
 Uhje8Tm3gqsj27lxciLTlwA3c3cODUL1YNKp6zQ=
X-Google-Smtp-Source: APXvYqx9NdiDBVuyqZt9xSlPQAPNa3d0edQayrOgAnpbJnLWMpJMaNDfO9DISDG4XF7q6HeXFGHY3XzGml8EDUXbPgE=
X-Received: by 2002:a9d:7d17:: with SMTP id v23mr181560otn.81.1569272250579;
 Mon, 23 Sep 2019 13:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
 <20190921151223.768842-5-martin.blumenstingl@googlemail.com>
 <1jwodzs6ir.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jwodzs6ir.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 23 Sep 2019 22:57:19 +0200
Message-ID: <CAFBinCDrN2Rvu6ry+voB5itU6X+ezCzT=ZkQ6Qz8rz_+1kCLCg@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: meson: meson8b: don't register the XTAL clock
 when provided via OF
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_135731_266125_3546F866 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 23, 2019 at 11:31 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > The XTAL clock is an actual crystal on the PCB. Thus the meson8b clock
> > driver should not register the XTAL clock - instead it should be
> > provided via .dts and then passed to the clock controller.
> >
> > Skip the registration of the XTAL clock if a parent clock is provided
> > via OF. Fall back to registering the XTAL clock if this is not the case
> > to keep support for old .dtbs.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  drivers/clk/meson/meson8b.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> > index b785b67baf2b..15ec14fde2a0 100644
> > --- a/drivers/clk/meson/meson8b.c
> > +++ b/drivers/clk/meson/meson8b.c
> > @@ -3682,10 +3682,16 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
> >               meson8b_clk_regmaps[i]->map = map;
> >
> >       /*
> > -      * register all clks
> > -      * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
> > +      * always skip CLKID_UNUSED and also skip XTAL if the .dtb provides the
> > +      * XTAL clock as input.
> >        */
> > -     for (i = CLKID_XTAL; i < CLK_NR_CLKS; i++) {
> > +     if (of_clk_get_parent_count(np))
>
> If we are going for this, I'd prefer if could explicity check for the
> clock named "xtal" instead of just checking if DT has clocks.
OK, I'll wait a few days and then fix this in v2


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
