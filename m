Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A54C04EB8
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 18:16:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C83F20834
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 18:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0Lm6/eJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lTmE76vM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C83F20834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RYhi8gqSw2bNSP9BrUirt3yfeQ0FfnZka7ZoVpSIWk=; b=m0Lm6/eJSCvnqY
	aY4tijEMNBfhgbQdo2DN/F96ZDTD0fycoETnmioUVUlJHNaqcILO5GhThLgCOA5L8kmwsADLU9u8a
	33ErugGoAk2UoYyBlJ8BsAiVC7m+XL87QCH8FKR/z3qWA6pqq3JKxwU2qJUDXbfhOnJnBGLbIT+8f
	zBJXFoLhJBUmFprueUMiNMmlyPk7bd7jI/zlQggNiGWtNeptE+3jF4wAauUivqAsweoLt61O3PQ++
	qy+tseB+7D+bHhpmQbny4pP6c3N33IF2VbRYFwndsUvVw4iZKxwqUmoUxayjF8wpb7q2uRX/1hpPG
	S5dUKWQCYEcuSLKbgZag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSnKe-00065F-C0; Fri, 30 Nov 2018 18:16:04 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSnKa-00064b-Mw
 for linux-amlogic@lists.infradead.org; Fri, 30 Nov 2018 18:16:02 +0000
Received: by mail-pl1-x642.google.com with SMTP id x21-v6so3183682pln.9
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Nov 2018 10:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=a3dE7u0/L8JmGeXT/U0F8DBfPvTii0uuME30CGQSW2o=;
 b=lTmE76vMfgurJ3Jz7exdoovIE9xFWCpPgZqXeK783x4Y226aoyknHl4IDkktYJ3dFN
 kC6jhRHOGSXl9TbApOtDPx3CRz+f3w6q30ksb1LJ2bCjKsUY1v3p/fiK1fBvGo7QZ3s6
 sio69fHVU7ncYE/6toxXr7X75kxYeuamk+VmChJP2vxeDJgfB/v1hEpb4x/5JMY2iBnw
 WtdkAH5eOQYvTQ/4cnlCcIT+f7FKygdxvUolMviUqAgTF93pA+jPHBH5yNmfldMrDV8d
 qKW4VPfu/23VcOQkSjiJBJwGbjGqiLUxVBxR+EACX2GsEItl12nH+BZAqOiOjzSn3lDB
 vRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=a3dE7u0/L8JmGeXT/U0F8DBfPvTii0uuME30CGQSW2o=;
 b=tBVFEkDmUguX4bDhCRqujwdp6fX/B0xMJAeA7VZvk2WO+dKtPDBOfE3IADQBZROjFH
 3l/tlmaiGNv96exVisfq9mQ27nX1ERK//VfssPcywnschy9MYyIB6A3lFVd48ASTI/Y2
 SY1UCwDcDU/CFsl7UAXr22SvUTEy1hR9mYoeEkWSgVViMBswQjzc0j31C1NjzE9ty5QY
 Cxk0adlJnTxWS+Zw+PoAmJ5gSOQ2SDop96BchhReGDGw9bPM7OLzDla2So9PUqho48dt
 ecBqJspwngWyySaOzJM/VFNJPM6mRr7Id8qmnQKUCsbpET1kCMjNtlc9iR51YSZajVU4
 PZ/w==
X-Gm-Message-State: AA+aEWakEEHIOyhgW4Aa1RRzd1xD+5scz63O1UDCl21SAvyAMN8ZP50Q
 0HHA/lEEN5KWD3m6h3o3nmukmA==
X-Google-Smtp-Source: AFSGD/U4yPYdPMbRb/cLMB1PPuqbJzbun9vT+a2YChTutjRR6LeVD88WYYVmnwBQcAaosWrpYXbthw==
X-Received: by 2002:a17:902:e18d:: with SMTP id
 cd13mr6684510plb.262.1543601749324; 
 Fri, 30 Nov 2018 10:15:49 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id q75sm9528730pfa.38.2018.11.30.10.15.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 30 Nov 2018 10:15:48 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to
 the HHI register area
In-Reply-To: <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
 <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com>
Date: Fri, 30 Nov 2018 10:15:48 -0800
Message-ID: <7hr2f25t4b.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_101600_883479_EB2D4D5B 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: sboyd@kernel.org, carlo@caione.org, mturquette@baylibre.com,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 28/10/2018 13:08, Martin Blumenstingl wrote:
>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
>> register region called "HHI". This register area contains more
>> functionality than just a clock controller:
>> - the clock controller
>> - some reset controller bits
>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
>> - HDMI controller
>> 
>> Allow access to this HHI register area as "system controller". Also
>> migrate the Meson8 and Meson8b clock controllers to this new node.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
>>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
>>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
>>  3 files changed, 23 insertions(+), 14 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
>> index 0d9faf1a51ea..ad903d1a2cb6 100644
>> --- a/arch/arm/boot/dts/meson.dtsi
>> +++ b/arch/arm/boot/dts/meson.dtsi
>
> [...]
>
>>  
>> +&hhi {
>> +	clkc: clock-controller {
>> +		compatible = "amlogic,meson8-clkc";
>> +		#clock-cells = <1>;
>> +		#reset-cells = <1>;
>> +	};
>> +};
>> +
>>  &hwrng {
>>  	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
>>  	clocks = <&clkc CLKID_RNG0>;
>> 
>
> Kevin,
>
> I didn't apply this one, but it can wait another cycle I think.

OK, I'll take that one through my dt branch.

I don't see any obvious dependency on the clock patches, so I can apply
it now and include it with my next round of PRs, so...

Queued for v4.21 (branch: v4.21/dt)

Thanks,

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
