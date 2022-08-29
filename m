Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750A9ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 07:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWiiNsDXlvDnGCTCj6aofm41Ocd60qZCxDyVQe+OB6s=; b=ITTxgOr/JZcpER
	gxVpLOv6YtKFlxJvBOnpSAMbiqkG8O9OwpoiCmRBwlH1UZvRfwD2g08GPWvPSFls/+3zzpjvE9q0R
	KnFrvCrChn7Q7FdGxQZjsacnff10pqign1on1XlLqkVWM0Fe4DPZXh7/6P0CNT1iN8ttCezoNha/U
	ljP+EJvjPjfaTqj8QaXb6Q45ltrgMDNNumnpW1j6608OKm14iNPsJkf0mpMojjUeHaO/Ln10iXSRh
	ajhY6a0526XfdjHExjP3k9yr1BXgxOlEElSWtQ/zguP/f0hgrp4fJA+pYcflher/yiw67Jdaysr05
	QG8q7qAktCYEVppIBMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZPr-005l5X-6I; Mon, 29 Aug 2022 07:42:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZPn-005kzu-JG
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 07:42:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id m3-20020a05600c3b0300b003a5e0557150so5619622wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 00:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=Ord4hpx3Xd+i/UwyGaCf/vKkWqcTfQ/IC1j07fGcrjc=;
        b=pLmBdFIRDpgWHv7Lo3wLPl012iBHd7T+73AUNhvejNTCf4dcym6kgdYcnYPCSPWayy
         d+XipCcPP4cn8cAnJcI9Efs8GJmPVGnXTb9Iamu3ln7rQqxCeM8uLtr8lEcZ5A/Q2t6q
         p3J+CjGwZ1IGzAVEEmJDoPP05iDOqD9LEleyiimOBY5LSpDSZ3G9nD6q5L85vvqK/t6a
         Ubj/dshtG+r9KbPfrD+IX4bdkhAtE5UjL76+7mazkV9YeAxNiY4quhZQrX24h+fZeRC7
         O5yRxW9gy0CGdh/2gbBIlF734fjyCUs8XE+62DugwAdp/VCjIJVRyiwqu/abRwuEIBgy
         FfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=Ord4hpx3Xd+i/UwyGaCf/vKkWqcTfQ/IC1j07fGcrjc=;
        b=ckB5N1I+N1DnOKLkJ/Cc9p0HmFjC5ELC7PK28NC3EqfDhbl/nCHRpB+w1uHJMg2yY5
         Mts8ZXAMp7qEDADy5MiL7NnuL3NZ7Hr3oNlm0fsy2W1IF+mnnNh9QGDN/sCmR28iIj3c
         o0xjShtz++fmYDhdq8TbTscY5cYps09NOTUFPZeCBTH7nlTmr6VXdSbi8VD0lef++jNe
         L621YZVXs7fZ6s168rBm29lwLACL1kn2QToQ6gp54TDDxX6WWcuzyenSIBglF3nbD4vC
         SQCcdEH1AVCB5obzc4HSpZl1sgNsKTx2cp1DFVbRWG4bQZhoWgiH3LJgIOAVrAKhEFbV
         IwVg==
X-Gm-Message-State: ACgBeo26oXVX09U7w+cLcTvzcu6de14g+LLeqJ3BegE200M0SMsI3/HF
	ksXk/UrSGbIgKn5BTWuUVNY0ag==
X-Google-Smtp-Source: AA6agR6vOedkOEDaDT8D7fDwrbld9zNfqqhvSnpkpkYnYN1bjv7xc3q3VttNTvVWvYdBibwNeVjBcg==
X-Received: by 2002:a7b:c045:0:b0:3a5:ff4e:5528 with SMTP id u5-20020a7bc045000000b003a5ff4e5528mr6257372wmc.150.1661758951904;
        Mon, 29 Aug 2022 00:42:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6124:6b74:2847:d37b? ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
        by smtp.gmail.com with ESMTPSA id l26-20020a05600c1d1a00b003a62052053csm9768603wms.18.2022.08.29.00.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 00:42:31 -0700 (PDT)
Message-ID: <e970e07d-9bb8-707d-1dc6-09fae2abbfff@baylibre.com>
Date: Mon, 29 Aug 2022 09:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] mmc: meson-gx: add SDIO interrupt support
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
 <CAPDyKFokmJr7e8=gvsYbBbdxceG6kCa57vbYy1tUT_b+B=8P8Q@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAPDyKFokmJr7e8=gvsYbBbdxceG6kCa57vbYy1tUT_b+B=8P8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_004235_693313_5D9B65A2 
X-CRM114-Status: GOOD (  11.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Uffe, Heiner,

On 26/08/2022 11:16, Ulf Hansson wrote:
> On Thu, 25 Aug 2022 at 21:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> Add SDIO interrupt support. Successfully tested on a S905X4-based
>> system (V3 register layout) with a BRCM4334 SDIO wifi module
>> (brcmfmac driver).
>>
>> v2:
>> - use new SDIO interrupt API
>> v3:
>> - don't duplicate checking mmc->sdio_irq_pending
>>
>> Heiner Kallweit (2):
>>    mmc: meson: adjust and re-use constant IRQ_EN_MASK
>>    mmc: meson-gx: add SDIO interrupt support
>>
>>   drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++++++++--------
>>   1 file changed, 65 insertions(+), 19 deletions(-)
>>
> 
> Applied for next, thanks!

Thanks for applying, but I was off (like many of reviewers) and I would have like
this patchset to be tested on earlier SoCs aswell, or only enabled on S4 for now.

Neil

> 
> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
