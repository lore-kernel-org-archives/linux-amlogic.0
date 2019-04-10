Return-Path: <SRS0=xGFd=SM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56DAC10F11
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 19:31:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877A82070D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 19:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KVCIQSVo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpcWEXeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877A82070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9SsM0z8OXjYi8hXg5WP0uUtQuivctnhCuJaOPlk+10=; b=KVCIQSVolT2aRt
	Wx7OkFyL/M6vhSPiM3aHh/u7eeOgn/uK7rUKMj/F9FphgdmEu6eYhry30dZtzpRx7bD1KcjSHt5KB
	lg3yXWL+vvuCMvFckdzG9eP7ZM21O3nGVrMeEdo1/DswY/36CpxiMHd2GItNnhfuf/7VzynjLPO3r
	ptlgZMnCWiAWBFaSJrCyqvYL1FtGAsN+SQLrmHXIZ8BagTlNRs9KFSjxmkuX+6kj+y6qnCR2HYl0V
	ZxgHS1ME9dn+XXi4kSk3/ctnEo8sUiizIhls0Hr+VtiJNL5EYrE1Ww4Cqe9YpxDfR/QsN4WyJWkBN
	f5+g6eNxp+Eu5TYqi1tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEIwa-0007Sf-UH; Wed, 10 Apr 2019 19:31:36 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEIwX-0007Pm-U8; Wed, 10 Apr 2019 19:31:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so4326021wrp.2;
 Wed, 10 Apr 2019 12:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FD9AgKNR18+X4PUuPx4inEFPRV7yM/smMVLRjglizOo=;
 b=bpcWEXeh3w1GmulPOVtc/awBxMhzABfbBx1+jU4E666frhRErMOJHw3ePn3i6spR5G
 tzLo4TA5GuN0PJd1VVSJqLzSiQ93nW/pVG2YZTVDgtv8JRcQwyDIn8RHZf/LKn56mPAr
 0cau/9H3HvFf+EggjQgye88y0j1Q1UlhHiXi2k3SyE6b8uWjswzNPhclzNOJfa264vBt
 vIs9+Ln8k6+O/D4n7letF+0tYg1b4y6c8kEvLErtpA6YJ/FqJ8+RgBj8D6/PrHV0Gnsk
 RxesYQeH1pBhPU7nyQ5K+Ft/53qElcbEJgseKAkmy+ppcN5uKwT9V7wbQfUvdGkpID0L
 BeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FD9AgKNR18+X4PUuPx4inEFPRV7yM/smMVLRjglizOo=;
 b=tK1CYAqLTmBBI17hfSPYkUfKoCX6bMMCNwB6MUQzOdX9A/P/hDVqbzDeW0NgGzYknx
 wnfjfqJWVEMw1FqSk02Kd5OXhVDVOPMnuFCLufu6OFHmcZqftn2NNsoq3DkI3CdbDHxT
 dflhcmvQtOSH93KZpMVgGNarNB9e6jHzc9xRzVJZm4UjCvQYKgGC7DZe7PZH0Lsp4Fb/
 W1jAMGjVDW5OEAmIWHk5nu8t6CdORs9bctCTj5sskEWhB/NaWv424O+pn2AJnXY5Hjm5
 v2mUDGi2xko4i7rjvt3XZEcKwUx1QCCpk8Lz9H75PXomsm8KefDLgQmEcZKGIwJy8GjI
 wdHg==
X-Gm-Message-State: APjAAAVCipP5kQs+fIonK0xM8E8wt4aYXgjI0Xi4LNNOkqAmlgbtavhU
 +0h3PQbyc1Krws5fJDWliG7cNG9i
X-Google-Smtp-Source: APXvYqwoeyN9+UooelYtNhtA937+OzNXrHhn47ktOWQVlHOUDZ7RTrHA/o6PAC5h7Cy6L8wNyBTwmQ==
X-Received: by 2002:adf:fc0b:: with SMTP id i11mr10274286wrr.145.1554924690706; 
 Wed, 10 Apr 2019 12:31:30 -0700 (PDT)
Received: from ?IPv6:2003:ea:8bde:d800:c461:eb2c:a778:e64a?
 (p200300EA8BDED800C461EB2CA778E64A.dip0.t-ipconnect.de.
 [2003:ea:8bde:d800:c461:eb2c:a778:e64a])
 by smtp.googlemail.com with ESMTPSA id o1sm4220698wmh.47.2019.04.10.12.31.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Apr 2019 12:31:29 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
To: David Miller <davem@davemloft.net>, f.fainelli@gmail.com
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
 <20190409.135944.1516944884952068835.davem@davemloft.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <cbd952f0-117f-8418-e82f-5460dc0d99d0@gmail.com>
Date: Wed, 10 Apr 2019 21:31:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409.135944.1516944884952068835.davem@davemloft.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_123133_999007_FB93DDCD 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: andrew@lunn.ch, heiko@sntech.de, sbranden@broadcom.com,
 khilman@baylibre.com, richardcochran@gmail.com,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09.04.2019 22:59, David Miller wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> Date: Sun, 7 Apr 2019 11:57:13 +0200
> 
>> Recently genphy_read_abilities() has been added that dynamically detects
>> clause 22 PHY abilities. I *think* this detection should work with all
>> supported PHY's, at least for the ones with basic features sets, i.e.
>> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
>> features explicitly and rely on phylib feature detection.
>>
>> I don't have access to most of these PHY's, therefore I'd appreciate
>> regression testing.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> This appears to need to be done differently.
> 
> A question was asked as to why fast ethernet PHY identification from the
> source is important, well I'd say it's important for someone working on
> the PHY code to see how "all fast ethernet PHY drivers do or handle X"
> 
Then, what we could do: Change all occurrences of
.features = PHY_XXX_FEATURES
to
/* PHY_XXX_FEATURES */

Would this be an acceptable option?

> :-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
