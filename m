Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01835C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 07:30:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D32072080A
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 07:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ND90Njh/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ROLugO0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D32072080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWGXu43KXFc+gVoam8T/Tkgdbcmk2fCkXE4lrtmwc6A=; b=ND90Njh/Ct5XaC5U3PpMOT80d2
	wnG6jjj2Oj3TFbFXAsKNwZFdQnBMYiW4dnbNS3nXsYv/nZu3IdelhlZDMySRFyFKmqIdRURm6B8B0
	IeZoUuRoudEMtfciV5DJktR34/jdUOWxFwgHojImv9o/V1JrUgaDoADXGVE4XJ5nnlavWY3mFFsV8
	af0NDlwQppPvCFGvImDlqtLD+OQpf1raM8EZGS5Qea3xWMENSiPBJh9al9bYAlSezZH0GaYxaj1Om
	/6gAPo227XbSUyw42CuJckLe5BP42aSdWddfjdguovv0qjQZpy5OUutiNxh5XPwaItUFoke+ikT2L
	2yd3/BLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM4eU-0007nG-No; Sat, 26 Sep 2020 07:29:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM4eS-0007mu-7h
 for linux-amlogic@lists.infradead.org; Sat, 26 Sep 2020 07:29:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id w2so1473988wmi.1
 for <linux-amlogic@lists.infradead.org>; Sat, 26 Sep 2020 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZBLmmuE+l/zNtFngUv7DFha5p9Utrz/d8NNq3of+3JE=;
 b=ROLugO0wxjYJaU6FFin/+ydVIoweRCsCKCAYg5T6uReCYtfM3AvCxke53CjpCC6IpU
 kZ2xe4f18tl+RxJ7v6Vyjo/KNscwdLr1xhlnAxNNMJqismv6+RFqHh2+py47gWNezld7
 poYm6RZDbDKBOXUzkjuaVDdDHxO2emBW6rL5rWuA9k7+zVYWPUlDlcNUDnMg+/nvZQeQ
 L2giJgLrOz2EQLwm15ZMNlxB+/qDgCDY/t4pJm5r8o71NtpUZpDETar7zI/scXfQ/tkK
 ZXmlTcNAgMBpJ5oNNnr7jvgIF/idi0gPGcEdq5d7jiQZDZ64UljgxxHwSoivlDOnLEdh
 Byhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZBLmmuE+l/zNtFngUv7DFha5p9Utrz/d8NNq3of+3JE=;
 b=itDOYb7jVTxZW1hYCbXaR0MXHJWCCCdWAjpfdBBmqWe5MbsIC1Cx6a/JNL2KSgpwgE
 9JbIBxhosKUg90XcXUfyzcaepBx0cW62U/S+0t+NCtSYSqjjRXv1508+YzcB9og3KxWF
 JI9awdZunDKQLTa57aqPcC+mc2Xw4mD18uE+f2AxFmCTVtJtj4Arv4LECpw0LeyKn2Hv
 jLywNV1L3xOo3X32p7fXCZRzi+uKj+EhFH3p6MHOjN2uD3BYgb/NgoQC9hCcdYKfl2mp
 zR2GUDg/pNxG36fBuxtuwNbkYj4KFrgOBHHEEWfzGmDxkTFjPN/Br792MJSyQXVjPMHP
 3hLQ==
X-Gm-Message-State: AOAM531gH0D8q9pIlwbIgK1Zg54pBdKgYsBXQ4NapOm2/eZxX/T+lBFM
 kW3eLwP4vL6Eo16w1I7XyRnrPmHwzBdFynRG
X-Google-Smtp-Source: ABdhPJwLaNxnkblAApbGKm7Fbh5Ri+lMRyhivoNpavZNk2EI6x3nNVaSzPZ7xlvY0K/cqTuI3yv84g==
X-Received: by 2002:a1c:2d85:: with SMTP id t127mr1417391wmt.22.1601105386750; 
 Sat, 26 Sep 2020 00:29:46 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:d847:fb35:79b0:d12f?
 ([2a01:e35:2ec0:82b0:d847:fb35:79b0:d12f])
 by smtp.gmail.com with ESMTPSA id y5sm1653053wmg.21.2020.09.26.00.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 00:29:46 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: add missing g12 rng clock
To: Scott K Logan <logans@cottsay.net>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org
References: <520a1a8ec7a958b3d918d89563ec7e93a4100a45.camel@cottsay.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <da902fd0-c859-5e31-2151-a59fda6000d1@baylibre.com>
Date: Sat, 26 Sep 2020 09:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <520a1a8ec7a958b3d918d89563ec7e93a4100a45.camel@cottsay.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_032948_390175_35802BFF 
X-CRM114-Status: GOOD (  18.27  )
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

On 25/09/2020 10:43, Scott K Logan wrote:
> This adds the missing perpheral clock for the RNG for Amlogic G12. As
> stated in amlogic,meson-rng.yaml, this isn't always necessary for the
> RNG to function, but is better to have in case the clock is disabled for
> some reason prior to loading.
> 
> Signed-off-by: Scott K Logan <logans@cottsay.net>
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 593a006f4b7b..6ec40af658ba 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -247,6 +247,8 @@ apb_efuse: bus@30000 {
>  				hwrng: rng@218 {
>  					compatible = "amlogic,meson-rng";
>  					reg = <0x0 0x218 0x0 0x4>;
> +					clocks = <&clkc CLKID_RNG0>;
> +					clock-names = "core";
>  				};
>  			};
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
