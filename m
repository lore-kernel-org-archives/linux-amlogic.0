Return-Path: <SRS0=sHZR=43=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C971C10DCE
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 20:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CC8222C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 20:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hsov+unW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4Uunirm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CC8222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vepl99XZovfsnQzc7Wc+MMj7IQfQW6bseJhRoBO9MRs=; b=Hsov+unWyu9qPi
	M282bxTGB3zOdQGwxC3OfHJ9r/5W4ntFuQywNOIDStDwarr3Kh5QvYfmhXwBPCyiLPEN8P6HHa9eL
	HDta3GlwmcJHWfmb7VHP3Y6TBgJkiVdgxOYUOdJBJGaj5akw+0tPZtfjp9xyYNMMhAwAaICeSg72J
	2i3PI4IxzoZyTLtVu+boHpJxQrSTmx010hdwnBS+/yGloI+o+MCXR68ImjQzosnF6wo+bwepeFvFu
	56SFs9/i+luVVprlp3K4YOaoX/drgHO8M2SoE3eiFg6SavfYP/nSfJZ/QavDHNxHoNII9zRxtkSs9
	JyPWPGH6iLyvsaQCT3iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBlcG-0002qX-BA; Tue, 10 Mar 2020 20:36:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBlcD-0002q7-1C; Tue, 10 Mar 2020 20:36:38 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2CE821655;
 Tue, 10 Mar 2020 20:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583872596;
 bh=80q8cLAn0I0Lzbeo0FJrYKcL3KHuS3DGcuWyJ0aBgME=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=i4UunirmA8sFpxondmTn0CtxHRXMgCDx/TCQihEuAhSncoBTvEZ3rTBnEJ8PRnfbf
 4GP+Fw/siotoCsUTgoozxxN9Ul9gRX1jUDu5yQbQSBjhhqHQymbbtcGHdVt49MNkLW
 9Xi4zcrwJV5eGKExKrqt0CB9V3r/0k5q0f+VAM+E=
Received: by mail-qt1-f170.google.com with SMTP id a4so10682336qto.12;
 Tue, 10 Mar 2020 13:36:35 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0RlkuP32cWKFE0UYlhEn2+lF0dgWe3GYG6kaSdVCM5Tgw0jP8E
 I9t+vETWvbWf6JSXoOb00gcI6lFXE6XE1U6hxg==
X-Google-Smtp-Source: ADFU+vthza7WzGVk3jxb2EAXI/vVqOfMorkJdWAJoS8UeuzYEm/qFXDx+S3FTj5+D46baV5V5BcpdxsGORVNgYG9gA0=
X-Received: by 2002:ac8:7c9b:: with SMTP id y27mr21006989qtv.300.1583872594984; 
 Tue, 10 Mar 2020 13:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
 <7hsgiqra5x.fsf@baylibre.com>
In-Reply-To: <7hsgiqra5x.fsf@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 10 Mar 2020 15:36:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJAxfL_Q3HYHk_8VeefdXnhYT7kcPe3F5Gzk1Vfj+xtww@mail.gmail.com>
Message-ID: <CAL_JsqJAxfL_Q3HYHk_8VeefdXnhYT7kcPe3F5Gzk1Vfj+xtww@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: power: Fix dt_binding_check error
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_133637_102296_6D33E5DF 
X-CRM114-Status: GOOD (  14.86  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 2, 2020 at 10:31 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Jianxin,
>
> Jianxin Pan <jianxin.pan@amlogic.com> writes:
>
> > Missing ';' in the end of secure-monitor example node.
> >
> > Fixes: 165b5fb294e8 ("dt-bindings: power: add Amlogic secure power domains bindings")
> > Reported-by: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> > ---
> >  Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> > index af32209..bc4e037 100644
> > --- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> > +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> > @@ -36,5 +36,5 @@ examples:
> >              compatible = "amlogic,meson-a1-pwrc";
> >              #power-domain-cells = <1>;
> >          };
> > -    }
> > +    };
>
> Thanks for the fix.  Queued for v5.7.
>
> @Arnd, @Olof: you can ignore this one.  I requested Jianxin to send to
> you thinking this was a fix for something you already queued, but it's
> not.  I'll handle it.

Someone has what needs fixing queued in linux-next, but this fix is
still not there. Somehow it seems like features show up in linux-next
faster than fixes for SoC tree...

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
