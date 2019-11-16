Return-Path: <SRS0=CFuo=ZI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D398C432C3
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Nov 2019 16:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D0D02168B
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Nov 2019 16:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qbVsfOpF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GLn3GsW7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D0D02168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1+HKoJQey3bIpl2g/ltsiZBN0Zar4/mZldrhapX/OQ=; b=qbVsfOpFw7sUkG
	UdFvnXfj/eLnrVdUypiAycVb2GZuPwk4EIS+eYV1bdEIHz1CJ0d4Bm2e9GwHK6favYqS6ezd4WYPa
	ypwXO+3iZZUWgnNOYJsTLiGIu7HfIZmblVHfd0/NpslGaxFBZiqmTSBJ/doBN7MD399UUgEhULQWr
	XsYZB0d1vqNfhP6x3TPkpexyel6gkfyFXKQGoHU+6X+dbdr9LNVncbS5MzqGHYpa3xnLYUkJe5NfB
	AqJv/uhrzemB1lN3a7IYCwZeYZqmB4c7INESXMwzuNQVZFBzrnT/3rpEIi44Z0dHq87qmzhSWwkba
	xuocui79873KhfsOiOZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iW1Jz-0004UY-85; Sat, 16 Nov 2019 16:53:15 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iW1Jv-0004UB-Lt; Sat, 16 Nov 2019 16:53:12 +0000
Received: by mail-ot1-x341.google.com with SMTP id f10so10790613oto.3;
 Sat, 16 Nov 2019 08:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dXtgv3ZMrjgjBz6CgZ0b7bfGQQBi49c5X2XfW8BjbXo=;
 b=GLn3GsW7yvmiMlfIvPSmzKDcm8Dak0w44KiKMBRGYSGWBtgg5dKTJymRmFkiX8frmA
 3bkBPEJh1gkg7bbnf14KpFLh0xrvmbpXSIo3s1/sEZcJC/N+CbPQQqjTc10PQrcqfDFP
 H+r8b1gOapO/TBc1PyTCCgeBvUqjpucbKhyDAEK6jQtSRu2bq8IagIljzdU9yEURzOsO
 fQJRJN7Hboj7dQlWSyzq7QuhQyfOq3cuYvLubz/npiq0PSMkv9dZWCADeSTZZluvDo1r
 L7I5/pQb1HuaiF0YVWms/u/mpupXtiXDuomxnAKqaQODAGv2q2Hu3w1X4dUJoYGug5eN
 ccgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dXtgv3ZMrjgjBz6CgZ0b7bfGQQBi49c5X2XfW8BjbXo=;
 b=uObW1huIojo/lvukjOECkkCIqsUlNnQJs1RkhFxcLr0tPF1PZnd7yhKfwuN4++sWZ8
 NkQxCHkRwePjwt75Dm/pcVLYd5Q8dSIf7MQ0Lf3VGLSQAwChrsn8aHfd57xdZCxguelG
 8NL8/mIOU8KejJsUCYEsH1EMEV9ICjljmp9oAkGwtcMo3MZNgItS/l6FIiNL7gJnztKo
 MLE1W4Jn8UIpDMkwOYVKgUQhdhOzn4FkdVz80DEGBP7oIdQozwZ5eMTlU+m+fe9K/QqW
 Vp8q8eyRzVWG9fnl4M2GOEl75Es6HTQkb6z2f7UxxJo/b7U56UFp+oBXV0FRNKoRFx9/
 7G+Q==
X-Gm-Message-State: APjAAAXbDxXEetTNrKnR8Swc9PACpt6DX0kkBLrnni0MDtyJgrgQ4KXI
 xwzleZzYr9vd/Z+q0lsfWKXgVxdxc6S8lQ1bXAhRc5lU
X-Google-Smtp-Source: APXvYqyR3PXcNr8vt06aopgYnCoIGBtZvup0dKIFbYvImWezEBBB/Ap2vPG0iVW+wEBCjmsSZPgydmiLNy0Tr2Xh38Y=
X-Received: by 2002:a9d:5e1a:: with SMTP id d26mr14584710oti.96.1573923190609; 
 Sat, 16 Nov 2019 08:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
 <20191027162328.1177402-3-martin.blumenstingl@googlemail.com>
 <20191108221652.32FA2206C3@mail.kernel.org>
 <1jd0dxf1uz.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBnUs0JdHT3TS+1++NMHtgbMvoT7RYRCnB0eNgs4L-2CA@mail.gmail.com>
In-Reply-To: <CAFBinCBnUs0JdHT3TS+1++NMHtgbMvoT7RYRCnB0eNgs4L-2CA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Nov 2019 17:52:59 +0100
Message-ID: <CAFBinCCQS_8w0x_dDqwjw2sUv1tHwQYjPBxTbH4f8mOetTCj+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: meson: add a driver for the Meson8/8b/8m2 DDR
 clock controller
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191116_085311_738337_6ED7D7B0 
X-CRM114-Status: GOOD (  12.84  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Tue, Nov 12, 2019 at 9:52 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Jerome,
>
> On Tue, Nov 12, 2019 at 6:20 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> >
> > >> +static const struct of_device_id meson8_ddr_clkc_match_table[] = {
> > >> +       { .compatible = "amlogic,meson8-ddr-clkc" },
> > >> +       { .compatible = "amlogic,meson8b-ddr-clkc" },
> > >> +       { /* sentinel */ },
> > >
> > > Super nitpick, drop the comma above so that nothing can follow this.
> >
> > I don't think it is worth reposting the series Martin.
> > If it is ok with you, I'll just apply it with Stephen comments
> I am more than happy with this.
> just to confirm, you would address all three comments from Stephen:
> - including clk-provider.h
> - use devm_platform_ioremap_resource
> - trailing comma after the sentinel
I'll have to re-send this series anyway, so I'll fix these myself.
still thank you for the offer :)

I think it's better to move patch #3 from this series to the "XTAL
from OF" series, which means I have to re-send


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
