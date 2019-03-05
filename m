Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FC8C43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F9E52082C
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P3g/Rfiy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kl3jlrGd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F9E52082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1jBTTbB3rywTIKI8JQlHHC2DbH+lteYJ1iTeV5U2XE=; b=P3g/RfiyjbkZ94
	gNz+sJGQOmPMXFuxtadsqqNV8XYfgkzqiazwsLavtMiQsUSBT4LUC1gtg1pxdn12wfL02gVWKdg1L
	iZiBrAI8u3tPCGaZ0YWJM0BN1o3bdFMkw32Lo9KGwZm8vjmaboFdRJzqRKhTwmmWfz+mWZkRD9Qge
	S9KGyzQtZFpVgjhqcK5Tk7wKaJSvmfwmwD7lJPN9I1fH0+hhJ7GnNgnFfQ1JZz+5E2yJGFGtfZp8p
	O7xp4uK50N9o79KHoFx7sR/zmeNymXAmnjsPODJ2ngLtvhj3ohRRGkZB6HAIs3s6V3D8c+v6aqpjy
	4Sf+GkCPLnctPRCCE9Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1HDL-0002hb-HM; Tue, 05 Mar 2019 21:03:03 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1HDH-0002gw-Ur; Tue, 05 Mar 2019 21:03:01 +0000
Received: by mail-ot1-x342.google.com with SMTP id n71so8687443ota.10;
 Tue, 05 Mar 2019 13:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EUWk/Ui9VaBHISE1nUlsCptcugL6TakwNnD+Y51zUfU=;
 b=kl3jlrGdjMZn7VHG24cpLmVXYj9Av653FMroKzrbgvYcRehDsk6vsQewAaQNG0ztMM
 VNu6XZLP54VCNEKz9xnuZl9OTdScBeXOSxevYiYzmfZKIuNsC6RXmR2SB2hYySHDAXV7
 MHRHlsteR1ebUzVz31bA1Y9xGWNmnfHuIBF9R/2S9JklHt2UdYiAzWjLrt9A3nHWYYCr
 jQiHkN4QJ/Qm485bpFEiLPztsOuIrPbyd2YKgsO+JfmB4w0KDVD37PZ5hWpthvS6c3hd
 U7hcKQd4kyhApC/ijyGT3vfN3REXKx+rwHuA4kI86yTi8ZY7HfQ7pog6MnZyMTheBmT/
 Xa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUWk/Ui9VaBHISE1nUlsCptcugL6TakwNnD+Y51zUfU=;
 b=GYv1q9WHQIXh7OhhhB6gX5gNtPzHwvpDoIl6+LqWsIvlgDkuEM6bR6U0AbQaSqw6oI
 y2MirYwLVO5m2LxXdn6fSOp5dcNK7y0++5KsNUHPq48BQ+RILX0syG3UQ/tAgGDSXhaD
 k+WZp69iKiocX3yhHBNDpBulXSlVD/M0lw5mQ9uoJR8ZtTs/0m1AFfy7M5agaW2cOvdE
 0tHkMuvqiDyrjzs8Rmo7hPT+OmJiAF9VyoMlI4RO7aW2cGwiHcqm6bgFjCLsG1hOSfDb
 B4RLCeaaSE0eATfhTHhIclu8nWWjI0Nr9YTIfMnUN6sx0EnvwQetuCuXrC0/iR3vtm4H
 ty+Q==
X-Gm-Message-State: APjAAAV4+3WJMKhGRxn0g8QOBaSF7pVqhkMYanyNF8A0gdryBaqkojSV
 KkiiVn7HT4x7lU2lPnez30FiKkCHxRt3KjT4FlU=
X-Google-Smtp-Source: APXvYqxdg/NeLXGofavhFOBicKYHoqTa6V0cb4Dhyoath7+pL7M+C7VOfjxGlcLQwMQQLE/yU7HU7/IcSSWJqmm563o=
X-Received: by 2002:a9d:5614:: with SMTP id e20mr2155595oti.348.1551819778869; 
 Tue, 05 Mar 2019 13:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20190304111217.882-1-narmstrong@baylibre.com>
 <20190304111217.882-3-narmstrong@baylibre.com>
In-Reply-To: <20190304111217.882-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 22:02:48 +0100
Message-ID: <CAFBinCCfEDBcaXt=FBJ8hNwpq1CQ=tuCyXpd6fxHqiEfTwt9Jw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: adc: meson-saradc: add support for Meson G12A
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_130259_991310_1479FBB1 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 4, 2019 at 12:12 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the SAR ADC driver for the Amlogic Meson-G12A SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

this new compatible string will be especially useful when we want to
add "buffer" support which was reworked in the IP block with G12A

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
