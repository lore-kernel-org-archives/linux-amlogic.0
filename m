Return-Path: <SRS0=xuy8=ZC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BC5C43331
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Nov 2019 00:30:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570D7206DF
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Nov 2019 00:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a6Ll1Bu9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NCxT1PtS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570D7206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiEf4w26eMau87HEkqEeGCjc4Ljavlo81zVstauSdIQ=; b=a6Ll1Bu9qaA7cH
	rtP2rmICNdcBNGvGQ9QfF5IW6gOp22lvf2Sq7DudT6R5b2pCkumunQDQ7FOr25Nui6PhAe/aqKI0G
	m//zJcal1YBzRORslQvPzWS2HB1/ZFZpyfFtX/CkwVjXfqDk5qIxz3CFU6IHMEFXEwARPaJ5bebMl
	L4fL0jcXf/enTLSz1GCCwLrehH0JQXCh0riOJDu8o8RYN/w/Su4Un82Cqg6MyZHHHD7dolASzQAsj
	31NH7uChVj3BIeJkvsCoOzqEfZOWHH+a7tTgfYMc6yGoIO7TsocTgZkLAvnKDNjf6kF5WwAk4Eugz
	+Yi7WdNN0STzBuPee1Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTb7u-0003xv-EB; Sun, 10 Nov 2019 00:30:46 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTb7l-0003qN-MQ
 for linux-amlogic@lists.infradead.org; Sun, 10 Nov 2019 00:30:39 +0000
Received: by mail-pg1-x541.google.com with SMTP id r18so6565360pgu.13
 for <linux-amlogic@lists.infradead.org>; Sat, 09 Nov 2019 16:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=QJ9M/1JvgfL9a3naUkuoeUKHp140e3y+7LN+oRlvvF0=;
 b=NCxT1PtSjVriRDY0McvWgqg1c96vuIp6GwyYFPzUd8SsWhDu6AwFt1cy+ZjLXPFvGF
 LhFFE+gwmzFecxdZ7WNuy7InOhsm6d1xROIkSmVm+R/UZHOYYc7nSCM4IoA5iXAfPatm
 I6bAdoT4eqFv5eCSyEzQQq9jCwzRNgp0LEGoIgQ9u1tfVLi6LtpyzphrogFujaLOJVAY
 OpDqbE7AQHo3fmg66SEF31pePDtgnfa8yQZZJK3WeV2qZX2nI++q4iPd7J0bGKA18H42
 6mx/bhK0qpDwTlrSoV9ISWG//olIHZOODsFZWsDrk43o7EN8QE9jfWMqBCkPc44h1l1/
 NRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=QJ9M/1JvgfL9a3naUkuoeUKHp140e3y+7LN+oRlvvF0=;
 b=RbQudUzDjQ3LN2j/Z/3GFB3YMLvrhH//wtqafRPd7sbs/Hlo28VlhuPWtptVN1INYT
 aIBI3PGGnjieAE21T5spjrU3EBhHxWk1+B1nDvbtqXMxNHIp1nd6cIrJK8pGXRJDocPK
 zomtT2MRkEh3pgM4oKGwqGTuOcXWz/fDHuWLcQ5mI25CUCaGzWSQ9odZ6YYEhmt+H/3d
 SG5NNbYNXHoNv2MHcmoVExggJjEIEdTz45Z/eeFFswKoN4teVVT5hpaTJXtjYlsayX7T
 f4qZn6Xb+2rnJiFymVelRD76Rzvmi3wReB/pYwfNjYgj/e3doWjBxMo8LpSYLbBahjW4
 YNbg==
X-Gm-Message-State: APjAAAX/BQNq5lViko/JGQa8aQYsPGxU8bFDHjCABg7ldaUWQJ3KU2QC
 6VVaa+MYZDSUUO26ObNB74mwVQ==
X-Google-Smtp-Source: APXvYqxu6JimPLetLyzs5b3fNNN+T5TOM3IxKtOOtZlw0hsFzmo99TMBKf40oTi9kAjJRpBteOx8Ug==
X-Received: by 2002:a17:90a:d792:: with SMTP id
 z18mr24756222pju.34.1573345835992; 
 Sat, 09 Nov 2019 16:30:35 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:7c60:912:1380:6df8])
 by smtp.gmail.com with ESMTPSA id 126sm3785679pgi.9.2019.11.09.16.30.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 09 Nov 2019 16:30:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 3/4] soc: amlogic: Add support for Secure power domains
 controller
In-Reply-To: <1572868028-73076-4-git-send-email-jianxin.pan@amlogic.com>
References: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
 <1572868028-73076-4-git-send-email-jianxin.pan@amlogic.com>
Date: Sat, 09 Nov 2019 21:09:31 +0100
Message-ID: <7hmud4stfo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191109_163037_729047_D8620769 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> Add support for the Amlogic Secure Power controller. In A1/C1 series, power
> control registers are in secure domain, and should be accessed by smc.
>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>

This driver is looking pretty good.  A few more minor comments below.

[...]

> +static bool pwrc_secure_is_off(struct meson_secure_pwrc_domain *pwrc_domain)
> +{
> +	int sts = 1;

What does 'sts' mean?  status?  or something else?  Please use a more
descriptive name.

> +	if (meson_sm_call(pwrc_domain->pwrc->fw, SM_PWRC_GET, &sts,
> +			  pwrc_domain->index, 0, 0, 0, 0) < 0)
> +		pr_err("failed to get power domain status\n");

Does any bit in this register mean the power domain is off?  I think it
would be better (and more future proof) if you checked the specific bit
(or mask)

> +	return !!sts;

and then:

    return sts & bitmask;
    
> +}
> +
> +static int meson_secure_pwrc_off(struct generic_pm_domain *domain)
> +{
> +	int sts = 0;

Like above, what does sts mean?

> +	struct meson_secure_pwrc_domain *pwrc_domain =
> +		container_of(domain, struct meson_secure_pwrc_domain, base);
> +
> +	if (meson_sm_call(pwrc_domain->pwrc->fw, SM_PWRC_SET, NULL,
> +			  pwrc_domain->index, PWRC_OFF, 0, 0, 0) < 0) {
> +		pr_err("failed to set power domain off\n");
> +		sts = -EINVAL;
> +	}
> +
> +	return sts;

It looks to me like sts is only used as a return code, so maybe call it
ret for clarity?  or rename it to something more descriptive.

> +}
> +
> +static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
> +{
> +	int sts = 0;
> +	struct meson_secure_pwrc_domain *pwrc_domain =
> +		container_of(domain, struct meson_secure_pwrc_domain, base);
> +
> +	if (meson_sm_call(pwrc_domain->pwrc->fw, SM_PWRC_SET, NULL,
> +			  pwrc_domain->index, PWRC_ON, 0, 0, 0) < 0) {
> +		pr_err("failed to set power domain on\n");
> +		sts = -EINVAL;
> +	}
> +
> +	return sts;

same comment as above.

> +}
> +
> +#define SEC_PD(__name, __flag)			\
> +[PWRC_##__name##_ID] =				\
> +{						\
> +	.name = #__name,			\
> +	.index = PWRC_##__name##_ID,		\
> +	.is_off = pwrc_secure_is_off,	\
> +	.flags = __flag,			\
> +}
> +
> +static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
> +	SEC_PD(DSPA,	0),
> +	SEC_PD(DSPB,	0),
> +	/* UART should keep working in ATF after suspend and before resume */
> +	SEC_PD(UART,	GENPD_FLAG_ALWAYS_ON),
> +	/* DMC is for DDR PHY ana/dig and DMC, and should be always on */
> +	SEC_PD(DMC,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(I2C,	0),
> +	SEC_PD(PSRAM,	0),
> +	SEC_PD(ACODEC,	0),
> +	SEC_PD(AUDIO,	0),
> +	SEC_PD(OTP,	0),
> +	SEC_PD(DMA,	0),
> +	SEC_PD(SD_EMMC,	0),
> +	SEC_PD(RAMA,	0),
> +	/* SRAMB is used as AFT runtime memory, and should be always on */

AFT?  I assume you mean ATF?

> +	SEC_PD(RAMB,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(IR,	0),
> +	SEC_PD(SPICC,	0),
> +	SEC_PD(SPIFC,	0),
> +	SEC_PD(USB,	0),
> +	/* NIC is for NIC400, and should be always on */

Why?

> +	SEC_PD(NIC,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(PDMIN,	0),
> +	SEC_PD(RSA,	0),
> +};

[...]

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
