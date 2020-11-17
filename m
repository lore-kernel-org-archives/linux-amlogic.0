Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC911C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 09:14:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A3B2417E
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 09:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C3iebIop";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="igklpoAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03A3B2417E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J8X7eROAQqgn6aRJQBAgGXGxoyqhxI2yrifF6JEli6s=; b=C3iebIopjTT59Bgppci0BTNe6
	LDCeAjzpliHBiNigdVuREsmKMHZI8kJ1ef6v8VABSu0qsNb7uzxHhHtbCGMfWC1HN6kyJVEiFX/MQ
	6A2VjjFIPriOgFw2OEHhrmB+BwsLXMtaXyNu45i/dWNBfsKsLRSR4H7riDnjf0vNtKbl5ysT2+rdA
	W3M7m6zSH0SeGpYovgWYOML84l7vlLiPOjL0O3tSL4X4z4B21eqvEKUFcGQJR9/32g+7dtwgdmhl7
	b37L4+wuvsKUCEFM5Oubgrl8l5ryF8x3DJKRNzND0tXXL1HAhMMhGkzkB6RM6ttyk52jJVvyt/2R0
	ilVBsgCUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kex3q-0006v3-Bs; Tue, 17 Nov 2020 09:14:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kex3n-0006ug-P0
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 09:14:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id r17so22415156wrw.1
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 01:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OR30Ri59Ax7IpNJY8Gv39vgzGLTXJgPp4Uy2vKvkYFc=;
 b=igklpoADzxrfYaKjM1Xzrl/jf85gx3y8/wrQJOxcjxSojDSr6dSuPGnqkUBOYWsj1B
 rSwsm8PeQqB8/+IxJeAgZEcZl/uNa+R227MDPS4buybyWxk+iJCahEiIMH4rPRsIEl6V
 V74st9bagynVU8PbpM09agbKKMJyTfkkWS6QG/jGrpu1+eHs9C/w7L4jVD5e8xTag0o8
 blLXh9wAfdV2k637jP/4AYLLSBJ068+i6gyqZCEoPGx1EUs/N88KuO6BfjZF+q4kYFku
 lJcrZWBb16K0hjXXFxx3t81YDdP3lvaHbp81r1DSdhu5vXfQhXbVxgs2tPnib9efXwdi
 AXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OR30Ri59Ax7IpNJY8Gv39vgzGLTXJgPp4Uy2vKvkYFc=;
 b=c7DpliyzNsH21ijLgMJ3fmoLnI6a75tnHLqD2gGqyRmDK6Y+mxZoau3thFHISEvDwX
 6FPlG1q0LealLsB8A6oGtWWjnkTVLjOHV2HzyNrGCRwtLnml4C2/ILuEEkfzWfuIrgKq
 sd4TDCSbiHRgxveRbvv/q6nJYzgpTVVTJ7ajw3siHkrqKMRq+GMPfXE8sZfmAlcPaX1W
 vQGedD2Bsk3LZnSR/p3REHl4nEoZE0cSoISj4Ccu5xE0OhUtNlqq3CQeVNkasYUtgeng
 UwTrMiTXlTp6ATj0qczIP4jiwhEooIHeiBJwyhvIPT+Nanc2IQ+6b34IuUtLDCML+MT6
 lXFQ==
X-Gm-Message-State: AOAM531oenI7ske868aXhS7ZBdDPSf+61cnEoE871VicTLo52canHTID
 PsRR8qrUC8ait969LOgvQjTqmw==
X-Google-Smtp-Source: ABdhPJwUOdjKDl9430Lx6lmJNchpAdC2x/s14wJ3qQ4YyvTROcQ7NihVTDZjeiONwjI2nXYp3pjQxA==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr24421181wrv.306.1605604436755; 
 Tue, 17 Nov 2020 01:13:56 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:b09f:f7de:c7af:258b?
 ([2001:861:3a84:7260:b09f:f7de:c7af:258b])
 by smtp.gmail.com with ESMTPSA id a18sm2484557wme.18.2020.11.17.01.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 01:13:56 -0800 (PST)
Subject: Re: [PATCH 3/3] phy: amlogic: meson8b-usb2: fix shared reset control
 use
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
 <20201113000508.14702-4-aouledameur@baylibre.com>
 <CAFBinCA6_Cei5QdiVRTX14S5QFoyDgAOhFUXtnx5uiAxuTRs9A@mail.gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <b7989575-e7f0-a4c4-9f00-7500b432571e@baylibre.com>
Date: Tue, 17 Nov 2020 10:13:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCA6_Cei5QdiVRTX14S5QFoyDgAOhFUXtnx5uiAxuTRs9A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_041359_847468_9FB4B0DD 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

Thank you for the review !

On 14/11/2020 20:11, Martin Blumenstingl wrote:

> Hi Amjad,
>
> On Fri, Nov 13, 2020 at 1:07 AM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
> [...]
>>          ret = clk_prepare_enable(priv->clk_usb);
>>          if (ret) {
>>                  dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
>> +               reset_control_rearm(priv->reset);
> this should come after reset_control_rearm so we're cleaning up in
> reverse order of initializing things
> (in this case it probably makes no difference since
> reset_control_rearm is not touching any registers, but I'd still have
> it in the correct order to not confuse future developers)

Agreed, it works in this current order since the two lines do not
interfere with each other, but it is cleaner to do it in the reverse
order of initialization. Will fix it in next change.

>>                  clk_disable_unprepare(priv->clk_usb_general);
>>                  return ret;
>>          }
>> @@ -197,6 +199,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>>                          regmap_read(priv->regmap, REG_ADP_BC, &reg);
>>                          if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
>>                                  dev_warn(&phy->dev, "USB ID detect failed!\n");
>> +                               reset_control_rearm(priv->reset);
> same here, reset_control_rearm should be after clk_disable_unprepare

Ditto, will fix it in next change.

>
>>                                  clk_disable_unprepare(priv->clk_usb);
>>                                  clk_disable_unprepare(priv->clk_usb_general);
>>                                  return -EINVAL;
>> @@ -216,6 +219,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
>>                                     REG_DBG_UART_SET_IDDQ,
>>                                     REG_DBG_UART_SET_IDDQ);
>>
>> +       reset_control_rearm(priv->reset);
> same here, reset_control_rearm should be after clk_disable_unprepare

Ditto, will fix it in next change.

>
>>          clk_disable_unprepare(priv->clk_usb);
>>          clk_disable_unprepare(priv->clk_usb_general);
>
> Best regards,
> Martin
>

Sincerely,
Amjad


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
