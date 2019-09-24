Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE0EC432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 14:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23242064A
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 14:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AqQfcasV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zBxpjFaP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E23242064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DxZZy/KJrYxOIS9qx9euDS76FJ3fgoQdzfF5vLHHSs=; b=AqQfcasVP1pOGQ
	XAmKsJql77StMlSQd4hpUZvoK4wGQOV+kaKOtgP6ejtSWCxFdERY0CsD03KIICQaCh7e00BHdL/9z
	AHQujlZqeMvKUeRCIA10a/KpGYum6OnmH5iXuQTa3lMhQLUDjxOBVMOiW48z005cJRYbXGdDVZdmY
	p3Nh0gx8puRaOdu3f0RdBwQjR0cGnLGOgMj3pRPExrfZoaafETtOu4NVD6X7gTNlmq3YBuehQvWD5
	2++vUQ6z05R5mRlsIQEzjzDPld9ya8GzpcpeYL06cDpCyClUoRd977gAU4o21zVLLO435+Y6z15J5
	dZIDPDNlhvEBYl11ZzTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iClWT-0001g4-RJ; Tue, 24 Sep 2019 14:10:33 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iClWQ-0001ex-Ra
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 14:10:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id i1so2137808wro.4
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CD8NXjWHXI1PHdT+Yt5q2iCIoHrQv0Ncx4K7iwz1VKY=;
 b=zBxpjFaP7l2EinUCWp0CpW2Sg1KTXXAkWldWE1wejALSHl3jp0sFDuHfH9Gi2HC2Au
 kzQ8eNjBepwuBE+WbnhNaJeaA2YgNuzXB5kwhQzzLXinKPvQCT716XwpcJ0OQwEW4Q1k
 mYBZVNfAVOI9FS3MUBcZFqmEz8BMf5scqsMrQSYS7a0Jda+62JkKZCi45L2ODbr/7ITr
 EoZCg4hKA2dNdppOt/WLSZcVso9BHBuKo+dAoQSrK79NYYuSijPjb9/ZAnfpmak9bhlW
 Khimacswau6lOgHXL5Nurct25X6UOV0+d8wHpX6mo9I/A7DTGUsuFceEWn1DJa/iOWon
 b9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CD8NXjWHXI1PHdT+Yt5q2iCIoHrQv0Ncx4K7iwz1VKY=;
 b=sowo4ymlJ2AIPcuM3iZ/8P51S49WIQiL51iq3MZhLAwGY67clptNXTefKV2TscS+aV
 yMayC0HobWctOjkS29GwANiypqcAKYaotN644ELsVjdrdV5EL4ct8fcxI+74UKg5vVOs
 QNlzQTvig5hYki6HMhFL5b8I3OR2mwNYZwP8kDrWpOZV+E8/v6ZuztdKSs1K2idX1px/
 /LcxFhwua0oxAuoVSyMgL8WVUsVxUD8n7eO7ekajFRI7zvMtCyHUSe1iG5RM3kRnm5b1
 0L0gIV8fCb5QqpcPgAFaTnDmzUHqJmU77+w6MKuthDDDw0uD4+N2wBGRhPwTO3M/ZZ2D
 YRJQ==
X-Gm-Message-State: APjAAAWVd8iiwYzRpTxmsZQI6r6+r2tahQ+ehxBfWjM86259SpP5ZiRk
 QX/yYTtyxKBJYiDCkRGndWh+Mg==
X-Google-Smtp-Source: APXvYqyxcFFWxlfEByHp+UI2Ozbsm+7ZlCpzeuoY03TS06zxKMIrzCq38xzQB0qK8eF54jJ/spcLAg==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr2442564wrn.234.1569334227683; 
 Tue, 24 Sep 2019 07:10:27 -0700 (PDT)
Received: from localhost (uluru.liltaz.com. [163.172.81.188])
 by smtp.gmail.com with ESMTPSA id f83sm61195wmf.43.2019.09.24.07.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 07:10:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH 2/3] clk: let init callback return an error code
In-Reply-To: <ME2PR01MB4738B127557AE20F6315AA7FE5840@ME2PR01MB4738.ausprd01.prod.outlook.com>
References: <20190924123954.31561-1-jbrunet@baylibre.com>
 <20190924123954.31561-3-jbrunet@baylibre.com>
 <ME2PR01MB4738B127557AE20F6315AA7FE5840@ME2PR01MB4738.ausprd01.prod.outlook.com>
Date: Tue, 24 Sep 2019 16:10:25 +0200
Message-ID: <1jv9thlr8u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_071030_946403_F9C03BD0 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Tero Kristo <t-kristo@ti.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 24 Sep 2019 at 13:38, Ankur Tyagi <Ankur.Tyagi@gallagher.com> wrote:

> Hi,
>
> I am no expert here but just looked at the patch and found few
> discrepancy that I have mentioned inline.
>

[...]

>
> Aren't all functions returning 0 always?
>

Yes, on purpose. This patch is an API conversion to let the init()
callback of the clock ops return an error code or 0.

The patch is not meant to change anything in the prior behavior of the
clock drivers which is why every exit path return 0 with this change.

IOW, yes there are all returning 0 for now, but it will eventually
change.


>>   *
>>   * @debug_init:Set up type-specific debugfs entries for this clock.  This
>>   *is called once, after the debugfs directory entry for this
>> @@ -243,7 +247,7 @@ struct clk_ops {
>>    struct clk_duty *duty);
>>  int(*set_duty_cycle)(struct clk_hw *hw,
>>    struct clk_duty *duty);
>> -void(*init)(struct clk_hw *hw);
>> +int(*init)(struct clk_hw *hw);
>>  void(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
>>  };
>>
>> --
>> 2.21.0
>
> ________________________________
>  This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
> ________________________________

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
