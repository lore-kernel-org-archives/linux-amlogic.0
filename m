Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FA6C432C2
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 10:57:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27EA207E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 10:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K7wSVSO+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIBa6S8N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D27EA207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02+O8x7Fv5DWlI1EjNRgjZx0fIbuEjkjFnPpZit6qCQ=; b=K7wSVSO+Xkex2g
	CNXEilc7EKf7+ufSwFBspDyEECcLclWtNDkkcetQc1gOaYWqMn4sDNvJe+p2lT9Zm3VEV8lftGTux
	MuCN4nZS2n5INFAVSU3MkC1tP29lqMUO9aG/Kj5wVc6YemqihnhuSw75eUlBvmj5q7hn+KoLu9hUl
	t86uWgnQ7adfJ9saBhCsVEqn2Fj6i3n+XYcMzgD0iNyQHsTERKFcfC7FUTKLIFj4ngrwE1C50zAUt
	xamePb5KTzOlJIGBBonqidKLv18Gfd++SQD3QPILQOWSYrUDpn1PdjnkbBBgTvUfjvsaZJjD4Xzt1
	QN09/9ZanFew+gC096jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDRS8-0004nD-DN; Thu, 26 Sep 2019 10:56:52 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDROj-0007fB-HJ; Thu, 26 Sep 2019 10:53:23 +0000
Received: by mail-io1-xd44.google.com with SMTP id c25so5206553iot.12;
 Thu, 26 Sep 2019 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=07TZjLhLzFQD/d/peiuV+KiApqHJ0vC82cYd9ZCGW3I=;
 b=lIBa6S8No25wVSZ5OCudotLs3QnSkUDyAEFTtWdhBSUVnDRrlkXvLDgFtxtXdNmehK
 dAzU29e+4ePHpmLtLt0IwEaGXkMIyzPU7A698T3pNHzZAWSSYgjwoFL6rsjhY2DJIKDM
 PRVDHjGrpJNvmdprSqaC12xs6qQvoWFnLKRKXm9vdPWLiS9Q4Cx7yWE5EOpecBzXzi+n
 CpkVfEMgEu3JFob6ios7fRsgDRzLhMDxBPgs6Vf+/vqD5gh9mmpetrt0ZXZNKv4Mo9b0
 SvPrUE3Eowl0FKu+rabY1pbjGQ/uGk4fU+zZLVjV4/c+fCaLpzeXzXbliXzUp+7Bh5h3
 eLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=07TZjLhLzFQD/d/peiuV+KiApqHJ0vC82cYd9ZCGW3I=;
 b=mukhzqdqtik85FpUrKTHcwdJZUMQe2lHVcT0OsNyZ/MmNuoKNVGRnnxfimVfQlQsrc
 pf5SLzKsvwEFbSmBVgniaJOWvxzEALyqYdU6WmqNwQZyvtV/RKd3RHGsmhGmzUSp6ovp
 iduN4v17taOa0hwi8RN7oJsG9dHGtbWhku/RXZkv2T2fva5oUsTRR0lR8ede8L8xB9bY
 KXhfqRTUxGhG9aj+wkTJHI8t5S0HxyiQQ4QHpMMuXpXIGb5obT3riwnZTPI8waS8fNdR
 0RVGONvSwE2BPq5feMK1iMezZChYExxGNHzG0kjdQvO5as+H/7bG7R/HAFCf9iozt1ge
 w2GQ==
X-Gm-Message-State: APjAAAVGRm7QuXjk/bev9xqMGl6XxxkxOMJ+tcZ8O6uy+dzBoq3Rb0R8
 g4Zz5Co9mWb781U95XdnG/4/3FlOsqpwki5HXpE=
X-Google-Smtp-Source: APXvYqxN48IwDqdlkhPJvWfp5fy13UB08I+go8HDZg/Y1UhOHe3uy98kP5lBC01mtdXruP+pH7sTAHjdETKxcLhv7is=
X-Received: by 2002:a6b:fe11:: with SMTP id x17mr2916340ioh.6.1569495200143;
 Thu, 26 Sep 2019 03:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190902054935.4899-1-linux.amoon@gmail.com>
 <7ha7asuj6q.fsf@baylibre.com>
In-Reply-To: <7ha7asuj6q.fsf@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Sep 2019 16:23:08 +0530
Message-ID: <CANAwSgSvPmtzCzbaLC6LOfov9e32V9koUhF=5VAaKO87EHKw8A@mail.gmail.com>
Subject: Re: [PATCHv4-next 0/3] Odroid c2 usb fixs rebase on linux-next
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_035321_610537_AA041631 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Thu, 26 Sep 2019 at 03:34, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Some time ago I had tired to enable usb bus 1 for Odroid C2/C1
> > but it's look like some more work is needed to u-boot and
> > usb_phy driver to initialize this port.
> >
> > Below patches tries to address the issue regarding usb bus 2 (4 port)
> > while disable the usb bus 1 on this board.
> >
> > Previous patch
> > [0] https://lkml.org/lkml/2019/1/29/325
> >
> > Re send below series based re based on linux-next-20190830.
> > For review and testing.
> >
> > [1] https://patchwork.kernel.org/cover/11113091/
> >
> > Small changes from previous series.
> > Fix the commit message for patch 1
>
> Queued for v5.5.
>
> I fixed up the typo in patch 2/3 when applying as suggested by Martin.
>
> Kevin

Thanks,

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
