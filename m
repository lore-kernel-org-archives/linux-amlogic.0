Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588FEC07E96
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E6661483
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E6661483
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8JWDMkjOrpyg/m7BEDJ9lI7yIY6CeqG8sRz4B2f0/o=; b=qwX+208EHZyTXy
	zicuprP8rodi+z6Z3UlzevCnjkMzQd9BqI+RDzR3uEJIVNBzE0SZVcf8TF/ykUg09ZJnvTMnipUXk
	VjzPbBonFJiSVxVx6hS3FtFWztKWGD0fMm5jaj7jqluPN2amn/Z3FZDxIr6G/Sk9dp/ceY35pP00J
	EF86/vBrQ0AnRtr/+bCEmiEydQ0vt4oAf9Cik29DQYwRzJLVKoWadSQP2Aek4hl+gTN40jBceNsow
	TictcA7uZkuw/zMvXfG7BIzr7HGlaxj77ZLhLj2DeGshQxrwPcK5TAKwmIrc/oRh1GmOYzXO5BaBg
	tx24RlYcf/FEdELe4hrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Txn-00H3zS-M4; Thu, 08 Jul 2021 13:21:11 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1TxZ-00H3wo-FX
 for linux-amlogic@lists.infradead.org; Thu, 08 Jul 2021 13:20:59 +0000
Received: by mail-lf1-x134.google.com with SMTP id f13so15364049lfh.6
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Jul 2021 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=KE8NOJiJ0V+TtARi6NSHG/thecWx9xet0pqt8oRBjLs=;
 b=TktgSi9h1vOl9BnxmPyh+CZu0cJ5B9oe+agvxvU4Fq8zgoBfhYhuuP+zHnNnwKYmMx
 03rQceYgdIJKZBKtnZoGcGvpvpoGm20uXu0io0djHcgZr5Pr5BaOyv4oXv6Ya9TorfHC
 ohIPjwXYVd2vDd8SxXQFnFJ+lugFSxwupif6IiDSarP5ECB7uRr941UjLX8IDjqSCS14
 +f2ZTePeJRVYNSCFp/F1xnsO7P9yhrd1m3Zsetyu316Gv4JrdcSSpriryQ7s7QGogojE
 vxdv5Xp7Vs7MdPGNl8R3L9I0X/lN2XACe8jIYU5DNSRFjyN+UxtsZLwWF/tzCOlz/kY0
 3KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=KE8NOJiJ0V+TtARi6NSHG/thecWx9xet0pqt8oRBjLs=;
 b=ByswwAgoZ7uNJB2k4B8okXv7mFFC8lJUxYR603YJ3N59CAFo9YWkxA9Ezfcpcz1D2+
 S+7MG7vo87XVkNoslfRoBFgLlsLkg2XtXloAF+2/DXoVPuy2J3OeUYKNh+5bW5cJroJl
 fF4Bf4XIEBgoVXP6Ym1RIgokCx+UkVGxvGaY+njDFVOiYCXptYKHlS+mslL2RfgnZe8T
 ItM2Nfd9z+9baAHdDW9/48pIXKZbKnb+HJCPNgfjNMcgQyXVGpBeCVwwpq+IonZD1CkS
 SU7AXhB/bNmirgvNRvPe7rfolqmQX3zfXD60+kc8S7m2olDi1YQiHhnEdOp19uFXg26d
 qD8g==
X-Gm-Message-State: AOAM532K6yUNxdzJmyh144cRCU/ck0F1LJin/FdPm3K8UBwCkX1g6OSD
 cGRY3N1VvOOUYf3m7KfYpaDWtA==
X-Google-Smtp-Source: ABdhPJy/KBaddQl0NdAnrXytzOMs65zvpx8CPI3qr2KR+DTHRjxfTu9ToD3HyKMytUcBg9uNx85Xyw==
X-Received: by 2002:ac2:548a:: with SMTP id t10mr9720309lfk.247.1625750455529; 
 Thu, 08 Jul 2021 06:20:55 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id n6sm197799lfi.2.2021.07.08.06.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 06:20:55 -0700 (PDT)
Date: Thu, 8 Jul 2021 16:20:51 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 rockosov@gmail.com
Subject: Re: [PATCH v2 1/2] media: rc: meson-irblaster: document device tree
 bindings
Message-ID: <20210708162051.13953369@192.168.1.3>
In-Reply-To: <CAFBinCDgQHA1vmunNBdER0BfiKt8XYZ+-VBs3c21+S3bYP7GZQ@mail.gmail.com>
References: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
 <20210707141323.20757-2-viktor.prutyanov@phystech.edu>
 <CAFBinCDgQHA1vmunNBdER0BfiKt8XYZ+-VBs3c21+S3bYP7GZQ@mail.gmail.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_062057_554038_2C955570 
X-CRM114-Status: GOOD (  20.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Thu, 8 Jul 2021 15:09:30 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Viktor,
> 
> On Wed, Jul 7, 2021 at 4:13 PM Viktor Prutyanov
> <viktor.prutyanov@phystech.edu> wrote:
> >
> > This patch adds binding documentation for the IR transmitter
> > available in Amlogic Meson SoCs.
> >
> > Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> > ---
> >  changes in v2:
> >    - compatible = "amlogic,meson-g12a-irblaster" added
> >    - clocks, clock-names and mod-clock updated  
> thanks for updating this patch with my feedback!
> 
> [...]
> > +  mod-clock:
> > +    maxItems: 1  
> in the change-log for this patch you mentioned that mod-clock is
> updated as well I think that mod-clock (as a whole property) should
> only be added if it's an external input to the IR blaster IP block

There are 2 clocks connected to blaster module, and mod-clock is just a
selector between them. Meson IR blaster driver should choose one of the
modulation clocks. If not through a property, then how to do it? 

> 
> 
> Best regards,
> Martin

Best regards,
Viktor

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
