Return-Path: <SRS0=ciOP=AK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E610C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0AA20780
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4EFo6n3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kY++gC7/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0AA20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuBbjoGhJ3u2k5ZVIOvEXQeX2bOUvACUewoYnWchtm8=; b=e4EFo6n3t5NceW0TMlEKuonWEJ
	iEGEYwW6AtQDUCt0VS1nDOIXsdABREjBl0jAIsZJquHrH+YW7YQJ4oUpFA5PA+DzfKxJLC4WPQi99
	nE1hNH2xCbQp74i23XNIx8rtUlNzVofKoJphI+IVWotAUGBkHz7xeVVnGIBbQZ+LboniNVrbZEFmA
	3tBp3iuiPne0SUHu4cPz8RuCFIHLIDJhPVfu9P1RDtzEZeS5Ua/989TRxpeX4lQWXLqYRfN4wzQZX
	qMSV6BclZllca7caiS+kCGaFBpCshR2x+Eo/FDUOOwsxnUxfXSBqfFvFCsu533M9bR1cNl0FdUS/c
	h+0sy7bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq34t-0006Rj-AM; Mon, 29 Jun 2020 23:20:43 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq34q-0006Qm-Oz
 for linux-amlogic@lists.infradead.org; Mon, 29 Jun 2020 23:20:41 +0000
Received: by mail-pl1-x643.google.com with SMTP id 35so7708512ple.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2020 16:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=4oysdzb7v6IjFtwys8EcTgUxYFXoq8Z+j+gWVwzv1dQ=;
 b=kY++gC7/oVtoEI3QWyNnXuXoEXxAEA2nTU3YlmgvY/0mf+SMZpD2fFQnAa4f+xvpK3
 6Rc7yfFh4ZaIdSv+Fk5yqUo51V/aIDEqOw9AKCw6TkIhCbcXMqo0LruxuuFOmfn1nKnU
 05Bs2EYZafI2+O/3itmbrK3qJAnoB6PwKPwPvBseg3b5vEa2pE/KP0CAH55y7Uc8mNsa
 2jbBI+8Y5FvY0uE3lAGLw1Q88cz+e8Fg4yd8WUDpgnMljs6qzpAj/um78EbpbMTbbjFG
 Lsz5Y8VAkYatWEY/Ypy4bNc2JhrI2ahqojPFsCJK44xUvdvY+/m/UaoGV1QV7FFR+Xdw
 V6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4oysdzb7v6IjFtwys8EcTgUxYFXoq8Z+j+gWVwzv1dQ=;
 b=OuzeFSwACYbwrj0DEohvKOIgZgJjdMimeVwljHqmoqDn8zVemi7XaaUbhDRaBcTmaJ
 649qLlfCs+Ca39nw2ubwllnd7Oe4ZSLJBQctngl5eFvhpa1eRtDTZ8pGq+PBLGe6mlii
 Fjic2fKqfahN7VCFkX79UgjjnMu2gLbKgqwbh9sZhguBOEtr2mm60bh0cHq/rtRN5D1i
 nRFNa3OEpYai0j7vtsvRxH/p70Xg4382DgqyWIkaObik3mj+O6jv8Bn97qV9yihL7BdM
 NfTHN0rXoBVsSbOgR2DlhD+JLoVgmqcrcSG5khxIgN40ggVutVxAdW46tBBKQvec3W2K
 gyDg==
X-Gm-Message-State: AOAM533klHdW8flqhVZ5vs2kJ5LKIThZUvJniVvcQvAlwF/RVRuhHiTU
 uHFi1jTv1r5Ll3ubTfGQKKrrDg==
X-Google-Smtp-Source: ABdhPJxQTf8wjO/mn2ucKqdyXqqCoF0Y4f+jAWeV0yB3xAAop7UcdKgo12tstmYn+/zmxK8nmZRSdQ==
X-Received: by 2002:a17:902:be06:: with SMTP id
 r6mr15673490pls.310.1593472838955; 
 Mon, 29 Jun 2020 16:20:38 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z11sm634202pfg.169.2020.06.29.16.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:20:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: amlogic: meson-gx-socinfo: Fix S905X3 and S905D3
 ID's
In-Reply-To: <8757c066-2590-ff24-ebcc-2a9508fd9968@baylibre.com>
References: <20200609081318.28023-1-christianshewitt@gmail.com>
 <8757c066-2590-ff24-ebcc-2a9508fd9968@baylibre.com>
Date: Mon, 29 Jun 2020 16:20:37 -0700
Message-ID: <7hv9j9jw6y.fsf@baylibre.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 09/06/2020 10:13, Christian Hewitt wrote:
>> Correct the SoC revision and package bits/mask values for S905D3/X3 to detect
>> a wider range of observed SoC IDs, and tweak sort order for A311D/S922X.
>> 
>> S905X3 05 0000 0101  (SEI610 initial devices)
>> S905X3 10 0001 0000  (ODROID-C4 and recent Android boxes)
>> S905X3 50 0101 0000  (SEI610 later revisions)
>> S905D3 04 0000 0100  (VIM3L devices in kernelci)
>> S905D3 b0 1011 0000  (VIM3L initial production)
>> 
>> Fixes commit c9cc9bec36d0 ("soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs")
>> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>  drivers/soc/amlogic/meson-gx-socinfo.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
>> index 01fc0d20a70d..6f54bd832c8b 100644
>> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
>> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
>> @@ -66,10 +66,12 @@ static const struct meson_gx_package_id {
>>  	{ "A113D", 0x25, 0x22, 0xff },
>>  	{ "S905D2", 0x28, 0x10, 0xf0 },
>>  	{ "S905X2", 0x28, 0x40, 0xf0 },
>> -	{ "S922X", 0x29, 0x40, 0xf0 },
>>  	{ "A311D", 0x29, 0x10, 0xf0 },
>> -	{ "S905X3", 0x2b, 0x5, 0xf },
>> -	{ "S905D3", 0x2b, 0xb0, 0xf0 },
>> +	{ "S922X", 0x29, 0x40, 0xf0 },
>> +	{ "S905D3", 0x2b, 0x4, 0xf5 },
>> +	{ "S905X3", 0x2b, 0x5, 0xf5 },
>> +	{ "S905X3", 0x2b, 0x10, 0x3f },
>> +	{ "S905D3", 0x2b, 0x30, 0x3f },
>>  	{ "A113L", 0x2c, 0x0, 0xf8 },
>>  };
>>  
>> 
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Queued as a fix for v5.8,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
