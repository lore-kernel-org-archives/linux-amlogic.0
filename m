Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80722C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 06:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E55261175
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 06:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E55261175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XYnvZ6VIdaU2sQEUWx+y7CvY9yGqTtrSl7MpX5PlNNo=; b=C550D6DTTUu0Q3c/4oRh+Y5olX
	cMS1A4jjqtJNHyLTKEuS7ksdDVN2FSphNM7cTE3mOFo7ANQG3RB5rCAsDGXLSRuMJhnUTaxHQTYZn
	I/WP1vCstYIpbRYYPa90HjlZPF6q7O2Qt4GgVGaubSpQWixmZ7AbuZWOeUWERsF/ZAD8KJHyiksGL
	rdHto5JS+U48bbMO2xeDBsqMzPthkBIZluILv06Ofc10GiDmlCn5hoS+EGyC2pqP2fE8P4mtWRi7H
	OO5Cpjly7rrHTNmGJfCABgRgK9COBuFICkTkZFB4GJ7vWA6Pg/trGzUjYz6Ygl2wP7glEpVwG5zCd
	f0I48Clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSZif-003kAi-4G; Tue, 21 Sep 2021 06:57:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSZia-003kAM-Ji
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 06:57:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w29so36108750wra.8
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 23:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qV+ROFBn0i0cqbgaFNlv9LS1DuOk/M7p3WB+fL8MzAM=;
 b=cDYuWK1E0g8drPq/r5a+xdTiw6lhbtHEoXjkrQXg5/E8p+LOuVbufukeE4N3XjqORS
 iHSjN6BSwq98k8o0AgM2QTkDV/DkijW72xVfTODilf81qqSScsB5DrKOhDRgHj1kzm2S
 ti+zevEBGKg/JagAwtFooI0rFyP/PC0F4wBNrvEqJo+mVq8xOcbSBH88f9rDalKYGdkV
 zvYSUHul27EcABokq//3gOTsc6imltGeNXcXzO37v4mTIGBUzPljHPm8vYXaODQql7wU
 xIyohIZda+CSWASQ4qEQvHuoaZeFr8geMAsysLFwx2basPC9CrCmPpYK3lqu9JQXvWzn
 1iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qV+ROFBn0i0cqbgaFNlv9LS1DuOk/M7p3WB+fL8MzAM=;
 b=lSRxImvzfq5GZEQpkqUsHGs33ZgznOT2lr00ltEJeVc7bjZdvunBDGOXsgrMQOkCbB
 gG4eYgrYSH/YzEaOZc/+Qt0mP1eWqoU5d+o/kegHhIuNpRBpRjjohg2LwzQ7J4V/+6l3
 aFghh8zf40H1cmEsItCfMlvNM+IqZYZjVrBYKZyCAyyf44gRP0bjU7f3OlZxDAvXfQBH
 kJ667oGkVD5Su6FYK7zynX8TKIKrZuZVzvj0tchcg5BZAZH47gkfvyTHVHkBHbNshyHZ
 4zhmjhgo93Nqhpk01nw3oSBjuW0/GrbwGG+GuZEiQWK8s0C5xSSyZonunZhvgb4kNXVS
 BthA==
X-Gm-Message-State: AOAM533HREbb+XP6JsDgNIE8oHCsncd9qXPrUZLM4KclU1RGRIViXmG0
 3MBca1CjBqtIMMav67geAf7XDBxHz7j01yLt
X-Google-Smtp-Source: ABdhPJw2aaidddX8Gmrs/4Hom5Y4nc1gN7E4kRV/x9LsnBirCy9geVFrA2hM/qxoZx7OmFqBxbKgiQ==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr2677416wmj.151.1632207446080; 
 Mon, 20 Sep 2021 23:57:26 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id v17sm17831912wrr.69.2021.09.20.23.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 23:57:25 -0700 (PDT)
Subject: Re: Regression, bisected: meson-dwmac8b never loads, no ethernet
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: arnd@arndb.de, bjorn.andersson@linaro.org,
 linux-amlogic@lists.infradead.org
References: <CAEsQvcsNLJYezYNpDNGJX49NhWgAqjAYAPDcbwrg3+0PmZdh+w@mail.gmail.com>
 <CAEsQvctayUAp4Cx=TaqjUu90VNZa1itqyfqMNzDrDGfr--aSQg@mail.gmail.com>
 <CAFBinCC+7sgtqr2rQPP3OX9v7yss3nm0eCjpx4qan5_BQJ1eHg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <274de82d-74f7-ad8b-2707-c424ecb6811f@baylibre.com>
Date: Tue, 21 Sep 2021 08:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCC+7sgtqr2rQPP3OX9v7yss3nm0eCjpx4qan5_BQJ1eHg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_235728_920130_85883F12 
X-CRM114-Status: GOOD (  18.88  )
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

Hi Geraldo,

Thanks for the report

On 21/09/2021 07:31, Martin Blumenstingl wrote:
> Hi Geraldo,
> 
> On Tue, Sep 21, 2021 at 4:09 AM Geraldo Nascimento
> <geraldogabriel@gmail.com> wrote:
>>
>> Sorry to add further noise to this, as there's still 6 release candidates to solve this regression, but the correct name of the driver is meson8b-dwmac.
>>
>> You see, git bisecting the kernel had my head spinning so much that I apparently switched the proper driver name.
>>
>> Speaking of which, I swear I ran git bisect every time telling it good when where's good and vice-versa. And was I left with a qcom general device tree commit that also merges qcom 5.14-rc3 into 5.15 because of a regression in USB apparently?
> Which board/SoC are you referring to?
> I can confirm that dwmac-meson8b still works fine on an Odroid-C1
> (Meson8b SoC) with 5.15-rc2
> Newer (arm64) SoCs additionally use an MDIO mux driver:
> - mdio-mux-mmioreg on GXL, GXM
> - mdio-mux-meson-g12a on G12A, G12B, SM1

Indeed it's an issue with mdio muxes, a similar issue had been reported by Marek at https://lore.kernel.org/all/0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com/
and it concerns commit cf4b94c8530d ("of: property: fw_devlink: Add support for "phy-handle" property")

It may be the same issue here.

Neil

> 
> 
> Best regards,
> Martin
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
