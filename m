Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71088606A335
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 05:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+KUxwQt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GOsJiRzL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4ksT7lQ7Qs+D1KS33WQ0UnU3vwFEcjikCvYnhlZ+0ZU=; b=Q+KUxwQtO8PoT+bHZL4MF0XNgk
	xOPrDFLLRHVjkfW/4da/Z/bZaJFFb4xw+SLmQH77paEi0R7cDyGynOHJKGAMLHoB912EMIYdtyjBw
	zzqTbF4smSRNoxHS10fZfcMKm2dULaJO6srGuu2r0O4reZJzkJki3un9O8b1r3IQ6GZ0TJkbrXp0E
	Q+KYdIRBB4sHOTiIGmE86scw80uibyfCRIOfMoFjWbiu+WyHpUwTzZ8lNeLGrK6ZR3us4p8Zr/0HB
	U4+FR8KXivND0FVGr9CLgHQKyJL98fLQl4mRsUt7y0+KGiK4Jy64bv+8WHk9DZFO8d9/pU/o5H+zw
	QAtJnDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRl4-0000000C6Qc-2EcK;
	Thu, 26 Nov 2026 05:10:58 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRl2-0000000C6Pw-00ob
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 05:10:57 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5005864c88.0
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 21:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795669854; x=1796274654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=GOsJiRzL5iR1NYehTt5b7eNaerlrSVR0RWxbJfXveF/xEWQEyjEfWE73Xumd2Xs6l5
         AqM0mrvPLH7EcPaVYVz5XKDiI+UJEHYce/NvZlYxBr3EW2GKa9CNl2Y+bbd5C9pAYWnc
         RizkThp/ZFWTSTs0HfHer6BRxI0zL2xVscAb6KGpZxSrkEhmUsYMg6ToDpzJbc2UkaK4
         eZzlbL0lrxHUVvi5prWSaiAthbspVVZaCpbm2qz7d8gWEAhM+RTnc0w1Wnu0bO0r7mMV
         anaySD93hCDBbXYM4GOToqToRep1e2nPGduizPJKbbQNRcqBai7dRXdk+oUKIbhxoDhi
         QMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669854; x=1796274654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=Qpf+a1OcR4uD1g85Gfkg87l05FpWQV2NhFpd19zH4D81qFeVWT1sH2XLgeoCnELOmZ
         p8Im5ke20Mf/fPWfcxDJhee35qy8KS3yKOL6dzQ9dfYucG82VqYotd5KPnusMEAOF4SU
         VlJ+VmOVAJfEsz+p2WoXT3tAKZwM4eEHZCYhC7jR91YroFjsT5P5eQ3luJO1GW2u5K2X
         V1H69BQK5FwUqsx0iIgjeVojUlqLKilHC+hhgXa5AS2mG0171LKfJNsmoyttPyL3ylKw
         1CKtDHp5yn+HTa2pTxw5N1kRzAULxRggUDvCVubWXpvcl84Ahmv0QFkQKIycCJPozCmd
         DQng==
X-Forwarded-Encrypted: i=1; AL+hErFkBZe/2arMFBjYtyu0JLVoOa1NHcL0Xe86SxJtdtpGMbDRtlMTIhmkJK9490mfqVew7jJ6WXvR6uTrEENa@lists.infradead.org
X-Gm-Message-State: APuU4Z+/kersytO7jnQ8qwXpLZQcbwIi0nXdP08IdIj7MT5E5hjFlE9q
	svrr8UyQOiLjOkYw1mt2ziqrzWJz3ve5kcFiTIaPeHviGub9pbF4U6c6yv9/8aBMAE0=
X-Gm-Gg: AZFdTZedNgxzxX+oAHo7YZNwDVRo00FikST/24vBcwDtaFjsPT7e2aLZpScfq+q3X91
	diS6BlFO4uF9y7ZP4vILX70DuvT4pRuo3ECzdXxEn43VbvCznH8iIIaHs4p/npPe+AeJhe4aRA/
	mOZTjtiXrWbtl8QELEwNTJ+sNHaF56Visfp51jAXOn3/CQR5UG0wAqKvxFienLRVOJNJuTEYhTF
	jOJVgfgAgNz7bp+BXV1YXeAgLJ6qnFJWJNczGnJhRM6ZaosRcpw8LoBMJr8LEIZR09b2zn38klU
	j6DExNBjmhev3lSF+OsAaOQqbkfZWGs8EaghgH9YONJTUeV+Aa3UPI29g5QCmLuKY6c6+Im13CB
	mcIq+syzjMksX5WPuSn4h86M8Y0EveIr+bX8e64ts6QeqzDh9FKTQcdzdm7F4EyfbYs/qzGS2Un
	IeCCWOo0TsZufXlOtLCgRYsYF1yupEECX+w/NYroEa/OtK6MRWY9eR4ZNSvtbjpTPKlp2o7A0Hj
	YsyEEs9CIt61U0dwPZ/WttJbBgapSdAnwqPgz2lIB3DGnde6UI65FZ8SoN0LSujOusXGNkGaf7Q
	r6lcoAWaXXJr+FGXozDE2SznBBp8kA==
X-Received: by 2002:a05:7022:3f07:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b5567b5685mr22918571c88.3.1795669853936;
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm38643650c88.11.2026.11.25.21.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Date: Thu, 26 Nov 2026 10:40:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
References: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_211056_118165_0E455A88 
X-CRM114-Status: GOOD (  10.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>, neil.armstrong@linaro.org, conor+dt@kernel.org, christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, bmasney+clk@redhat.com, robh@kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23-11-26, 20:23, Chuan Liu wrote:
> I have already completed the support on A9, but cpufreq-dt currently only
> supports the single-clock case, for example:
> dt_cpufreq_early_init()
>   ->dev_pm_opp_init_cpufreq_table()
>     ->dev_pm_opp_find_freq_ceil()
>       ->_find_key_ceil()
>         ->assert_single_clk()
> 
> set_target()
>   ->dev_pm_opp_set_rate()
>     ->_find_freq_ceil()
>       ->assert_single_clk()
> 
> Both of the interfaces above are limited to "single_clk", so SoCs that need
> to adjust the DSU clock in coordination with the CPU clock (such as SM1, S7,
> A9, etc. mentioned above) cannot directly work on top of cpufreq-dt.

Have you tried something like this ?

drivers/ufs/core/ufshcd.c:int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,

Finding the right OPP should be done based on the primary clock only (right ?),
but configuring multiple clocks is possible via the OPP core.

-- 
viresh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
