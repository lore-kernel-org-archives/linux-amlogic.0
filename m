Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410B1C0044D
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:49:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14FCC20679
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQFZCjqq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hJIahldB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14FCC20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MDSHoe0WSWKHqQjw3WReloIrH1prbuhxBQmVWQJVek=; b=XQFZCjqq6EVvtx
	nJySmX/2HPYeLbLXayXAvv+ValPOOkpupGx58BDK4aquxAmc4gBPmUMXIly8vGulmp3K4Tzaw4gbZ
	Rg31VL5FwXS6f5HzqgxzTHbkDxcxR8GPHXniKSITym0mfk3RtiOsiK4+q+zpAy5dwePAe0F6Xlr3S
	XsCWY/3q922sT2hwohbJVSLrXKVyLM9xRhscD3tdVqaPxxTh9DYS0a2viYHelRO0RlhYIJXROAjWt
	CZIC9+cJQB7NQsU26T4N5CIOih34X9dWwofJt3M+9M8aftUC5T5SUg4E2JPh5Ifcb4OuMNRHS1NdP
	3/CWt39c0Ki/MfD4fmZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDsvJ-0003cT-KM; Mon, 16 Mar 2020 16:49:05 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDsvG-0003bK-If
 for linux-amlogic@lists.infradead.org; Mon, 16 Mar 2020 16:49:04 +0000
Received: by mail-pj1-x1042.google.com with SMTP id d8so9007198pje.4
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2020 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=h0lz/JWrV5mBVYYmE31rxyRYjDlj4PusyG3VqpF4T6k=;
 b=hJIahldB3kwBLmF6WEX4+g8T/gEoJF2F/Zu1jmwyaJFvNiPSoqrfsVl+yWNPucXmIC
 r3NFvkbEXQl7516mNRO+UtEwwJyl5SVVupUXNEA61yHib90qcteXAJwwcWxRgyJgMVNJ
 pKlnibyS2ab8X3VmKFnKDEvW8CYKK8R91yqmg0TPW686zsVYvtQrJc7MvH6/PDOsErBO
 h3fiqhzxUa59KRwSz039ws3/pRdwN6iDO+xiNJffBT/cSCpP8hKzpLC2rmMDt+t7DX6C
 hnCktZvmX02Slz537BiZqERfy8gvfVw7Sa0lNT/vWhdvZtpB2pdyvjPoLxlfp9a4zZFn
 rXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=h0lz/JWrV5mBVYYmE31rxyRYjDlj4PusyG3VqpF4T6k=;
 b=LlWgcv5D9IrGu1SIzFmq1EWUsMFvQer9DBAdXw6mTlYL33zFQDwxlK0Zy0+2YyrFnT
 YWO5Fa/8RknwwB30lD/DmagUou9H+jWcgoNQmXKXJRWvAm1wN4a6+WrUttjuPbgw5Wau
 OF7KcmwQCVcxY83nMijxkF/+JT16s1oA/1Dw4Ve2MRLBvfnR4s+BPZRVTzaWwiycHPcf
 lB5XGchoR4XR2QJiljvoBASGthQ1q0JAkYyj4oatEUohdYAIp5VbLdQjUX8ux4oDjGjk
 G6qit85UIzN895UfyxhT2X5xx6sC95dcaSTPatbk+VupLvveRS05CxsBdl6JxhrFaDe/
 pKTg==
X-Gm-Message-State: ANhLgQ2YvTkMowZbnQMV4rxaQJOjNbJbwIUbSf+RAafA5Z2GPp27O78D
 IlODybOAGWm++mOXNIfrdh2yxFxNAmg=
X-Google-Smtp-Source: ADFU+vvHnb3P6+r+gPmJOlmhsfZRus2ot8Z7/8HVSaasGivs9AufsgyzegE0B/1zCvhyMqounZtaVQ==
X-Received: by 2002:a17:90a:a890:: with SMTP id
 h16mr447564pjq.55.1584377341627; 
 Mon, 16 Mar 2020 09:49:01 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
 by smtp.gmail.com with ESMTPSA id e24sm407119pfi.200.2020.03.16.09.49.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 09:49:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: meson-g12a-tanix-tx5max: add initial
 device tree
In-Reply-To: <1582991214-85209-3-git-send-email-christianshewitt@gmail.com>
References: <1582991214-85209-1-git-send-email-christianshewitt@gmail.com>
 <1582991214-85209-3-git-send-email-christianshewitt@gmail.com>
Date: Mon, 16 Mar 2020 09:49:00 -0700
Message-ID: <7hzhcgutxf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_094902_622836_8011289A 
X-CRM114-Status: UNSURE (   5.87  )
X-CRM114-Notice: Please train this message.
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> The Oranth Tanix TX5 Max is based on the Amlogic U200 reference design
> using the S905X2 chipset. Hardware specification:

Similiar with the other new boards being submitted.  Can you make a
U20[01] .dtsi to share between all these common designs?

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
