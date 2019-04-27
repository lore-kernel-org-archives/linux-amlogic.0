Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0F9C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:09:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4572077B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:09:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TIFqF2ca";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DvqO45eV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD4572077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SQgan+bG0Gjtfq8aZggPa233D/MPYjWRruiwo4Sk78=; b=TIFqF2cahgNEHj
	lf9jMS9RYxs9UbyfiW/nVDWnvyGxGyZBRgGRnYKicDNUmP3l3gtoVNgKFB6Eo7oUhCF6mG4GIyjl0
	NtqlL1wCNmreaRKFptUfx9Fe+gcu5Rs+veEnwm24wNXn3hHNH63SIe6PXrzLicX/VnQ1vWHiowz32
	KO9WpThdc0nRZQWUqLc+V/5BjttqkEdy+EDBJqGWMrZffxXQPkNXPzXbn9gs93LV6RFqufTsj3tyg
	yZbVghkI+qBQwE8aUHo4J5eD9dUBINgUhBW+Xsoj9KIvjS7Sdn4ZSE9uD87IK00RgNltXYQeXTlSF
	bpXc8NiF+lOjeBkJvxzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTdZ-0005jy-Qr; Sat, 27 Apr 2019 20:09:29 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTdX-0005jb-9R
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 20:09:28 +0000
Received: by mail-oi1-x243.google.com with SMTP id k9so2529495oig.9
 for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2019 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pHMz3rI79/njeGoNvnnMmMVDwBZ8a5Z9yd2P7n1PACg=;
 b=DvqO45eVQbl8Y73TLqa6O5+0+o3mHgTDKvR2x3Iwr9wLCJ14YwevFy65FiH6HhIF3f
 +5xX+2cWer4C9CZenWMzgHjGR3gDQ4BkcWphcK6xtMJzCcERPhGeMJp9EjnfKtwVfEBI
 UqXtzu+B6psyWnH2+oOXYZmxnm19gStvCs/y0deWVhhB7YC+dqSM2LGr7Nu6rgy0Q3qZ
 +I1la49F6qKZ2HjkK8RYTTauKxdn08/w9WdIAte+ORs9CMwe73H01oKnRcyW0ugW774Z
 rCPZ70c2AtAJtjtcr2wo6WIr5VjcHOVYEAe5Nla9e+OMX6piG5W+bZ4kYN4+A73ma0ym
 3Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHMz3rI79/njeGoNvnnMmMVDwBZ8a5Z9yd2P7n1PACg=;
 b=Wq7Zhsh8Iw9HVsC6ApsmGLBeXVE5xV1VYZLKEdlncaRkddk/M3AJJ0sZT231P4sJoH
 poYNT5NMTgTIGbd1XpbQvM9+x+V7e4l/AvswI5uiVjJt05fobWZQJyGfQIkLhsaZghJ2
 22BAUdPpuxcW8vIv25D1MyJyD7NiQ9g9y59JiLlokFfCH0JSN34Xlarg6NppI3ayEwTR
 GgIMJfhne2KbSl5NR7C+ftiPbNfRBT/ozC12AQwvlYHjs4V+N2KgZDWvx0kUb86jxwg0
 QbftlCSkVGY2ubsSoXLCu14R95oJiZyhfJT9e2lVGFs+IB5JeV3A43HnZjJdA+EkLcoB
 Ow2w==
X-Gm-Message-State: APjAAAVvIzikZ05JVuUCa5845FMheNR248xnBWb6ygZmG8UVgnqSeK3v
 yHRtAx/SQh4s3yNcm7BeGJ+OEzj4vXIxxShho2A=
X-Google-Smtp-Source: APXvYqzfmzyNX5EQjlFONRG3rDdocVivj9UxvNPZm/Ddo3brrImV3Mp//aQ2akfeA4VPpyUaP0LWrbT2w5Mp5flc7v4=
X-Received: by 2002:aca:b905:: with SMTP id j5mr11145937oif.15.1556395765620; 
 Sat, 27 Apr 2019 13:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <20190423090235.17244-7-jbrunet@baylibre.com>
In-Reply-To: <20190423090235.17244-7-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:09:14 +0200
Message-ID: <CAFBinCDJZ2B_1_DdTRN+P9ter7kOgUHegMT-7pVODwKp7mkTKw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] mmc: meson-gx: remove Rx phase tuning
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_130927_356952_655BB610 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 11:03 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> This remove all the code related to phase settings. Using the Rx phase
> for tuning has not been reliable. We had several issues over the past
> months, on both v2 and v3 mmc chips After discussing the issue matter
> with Amlogic, They suggested to set a phase shift of 180 between Core and
> Tx and use signal resampling for the tuning.
>
> Since we won't be playing with the phase anymore, let's remove all the
> clock code related to it and set the appropriate value on init.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
[Khadas VIM now shows the HS200 eMMC]
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


BEFORE (no patches from this series applied):
# dmesg | grep mmc1
(no output)

AFTER (all 7 patches from this series applied):
# dmesg | grep mmc1
[    2.945155] mmc1: new HS200 MMC card at address 0001
[    2.957737] mmcblk1: mmc1:0001 AWPD3R 14.6 GiB
[    2.966278] mmcblk1boot0: mmc1:0001 AWPD3R partition 1 4.00 MiB
[    2.976114] mmcblk1boot1: mmc1:0001 AWPD3R partition 2 4.00 MiB
[    2.986354] mmcblk1rpmb: mmc1:0001 AWPD3R partition 3 4.00 MiB,
chardev (241:0)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
