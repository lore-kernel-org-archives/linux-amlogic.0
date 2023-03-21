Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E751C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fqo5cz2TUmHuLMoH7M82se1elNTwt2aPGtg26dhgRU4=; b=jmVkgwjvpeTces1sMJxAOgEiG0
	JGoKbldSoAkiX+juLlWcguOzdnRvFYz867eON2QWD4tVM5l/qvRi34OkrIqGISw1+cS4fOT2WYOdu
	zYAWFwtrHdBIQ47+nIdIWVMsilN/Ezlbt4jifUYPfpT0EvhhRcUhXlmrB8HURCtS23KE4F47pKO3O
	GlQPP+T1oe8Zpj/HCLUIqwdHUuoPisK8p4PrT5Uk43hgqdDJZRH9m7zbURE6Hek9Ac53mAItVNP3r
	zvGaFwGLWkdXIbkP4pbLEFd2BWM9U0wcUlhY6weoRsroGxai1EtcTbdza2GddgTjKt2tDLyrakdLu
	ZjZMX8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peaR5-00CEWj-2Q;
	Tue, 21 Mar 2023 11:45:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peaR1-00CEVW-35
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 11:45:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so4403159wmq.3
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679399144;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CWaFMETeX/+TKLp3wWaAj/K4R6NJn/u3jzbD2kkaod8=;
        b=TDANZ5rpe7xVRSUP+k3oW4ktOf9YCtQFDmv1r49y9jkA5moQ2RkdRzliKDqmc01hsP
         c05U/OKuEQpxdNMo1kJGQv0B0Bn9Nct0pweh1+HjC9aDNhiNHkU5bOOz9mVTzdAYjR84
         lJYj0M6cHdT0I6PibG646pmbFi7O5yWhcSZ30FRBYrf5P4SxkFwbXLCX7SuRPQ7OZJeF
         GaxOjk92FennVyXNiUSYRCPFBD55IMbtk1cbeEhL/Xp2SV3pgBbbUHRG2ui44X42KWH9
         sXGFD5xyoVnzXknkxR5AS3C9Re9euop/6gMrgoR46ACc9wnNSGZ7+ztm0qo5B9vfFcOF
         rBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679399144;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWaFMETeX/+TKLp3wWaAj/K4R6NJn/u3jzbD2kkaod8=;
        b=GpPZ46vRCmHnJK9WAY9f8zm6NEGkFrzxLfjy2NnH4G/8nMHcnoanvXkkdB3JbdqdcJ
         Yr2DKEhapIPA6Pf2jX+HIDSllVQbXl+5foKNCI2dEdMfPBCxLknFF5Zs2M1mZSiTfDaf
         c6nLaL+XTxS26+8WvBrKRHr3qZCIdDq3TWIurSuOQaIN5dtG4Xf77ErbhTvt5cvMccPe
         88+ARazfnpj6OVIuZ5Q2E3jH46mVTjb7TIRofOG5GUpZkHgbWHaaNT2nV8C7ftF548H8
         6lXttateLr6GYnVeDg8EceX2JJzUl7rrJ9Hx6LX8C9eZ+pfPJ7fGo+O8uRmRmjXAf/y2
         I7CQ==
X-Gm-Message-State: AO0yUKXZz3D5Yz1CJ5lttHM/UcLFw+6Su/yURwUuBdHMPCZadHMJCUAJ
	itOEA9bQTzyVn2xNyeFj9dBOJQ==
X-Google-Smtp-Source: AK7set9DoeZ/JPDoJWMDBwfc9kGtDnReJItkVdQ0K1yGSehrtPPLWrN934gadK43lFJzYEPXt7CXKA==
X-Received: by 2002:a05:600c:24e:b0:3ed:4b2e:c27e with SMTP id 14-20020a05600c024e00b003ed4b2ec27emr2100114wmj.36.1679399143875;
        Tue, 21 Mar 2023 04:45:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c8ed:7915:30cc:f830? ([2a01:e0a:982:cbb0:c8ed:7915:30cc:f830])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003eda46d6792sm10913658wmq.32.2023.03.21.04.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 04:45:43 -0700 (PDT)
Message-ID: <40efc558-6fde-6250-3639-5e8f86c24315@linaro.org>
Date: Tue, 21 Mar 2023 12:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [Performance regression] BCM4359/9 on S905X2
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-wireless@vger.kernel.org,
 MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin
 <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@gmail.com>,
 Angus Ainslie <angus@akkea.ca>, Heiner Kallweit <hkallweit1@gmail.com>,
 Pierre-Hugues Husson <phh@phh.me>
References: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_044548_077736_ADE34F27 
X-CRM114-Status: GOOD (  16.60  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Marc,

On 21/03/2023 11:40, Marc Gonzalez wrote:
> Hello everyone,
> 
> I've been benchmarking an Amlogic S905X2 board.
> It provides a BCM4359/9 WiFi chip connected through SDIO.
> 
> There's a large performance gap between vendor kernel and mainline.
> (Downloading a 1GB file to /dev/null from a device inches away)
> 
> # curl -o /dev/null http://192.168.1.254:8095/fixed/1G
>    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
>                                   Dload  Upload   Total   Spent    Left  Speed
> 100 1024M  100 1024M    0     0  27.5M      0  0:00:37  0:00:37 --:--:-- 28.6M
> vs
> 100 1024M  100 1024M    0     0  11.0M      0  0:01:32  0:01:32 --:--:-- 11.0M
> 
> Line 1 = vendor kernel (4.9.180 amlogic android)
> Line 2 = mainline kernel (6.2.0-rc8)
> 
> Why is the vendor kernel 2.5 times faster?
> 
> (I'm using the same firmware files, but it seems the vendor kernel reads
> an additional configuration file that the mainline vendor seems to ignore.)

I think you shall look at https://lore.kernel.org/all/20190527124307.32075-1-narmstrong@baylibre.com/

In summary, for G12A & G12B SoCs (S905X/Y/D2, A311D, S922X) the SDIO controller cannot access
the DDR directly due to an HW design bug, but it can only use the 1.5KiB scratch buffer memory
at the end of the controller registers.

Amlogic did a mask fix on those SoCs to allow routing the SDCard controller to the SDIO pads,
and in their kernel fork they use the SDCard controller for both SDCard and SDIO busses by
switching the pads.

With this trick they managed to have allmost the same bandwidth but with some limitations
when some SDCard transaction occurs and probably some conformance issues since they affect
the SDCard & SDIO pads state when they are switched.

It was decided to only upstream the scratch buffer memory fix because it wasn't invasive
and used the already in-place scratch buffer mechanism. This works but has limitations
due to the very short buffer, and doesn't permit scatter gather.

Porting the Amlogic current solution is out-of-scope because shared controller for multiple
SD slots isn't implemented and not even planned do to some concerns on the I/O states.

Neil

> 
> Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
