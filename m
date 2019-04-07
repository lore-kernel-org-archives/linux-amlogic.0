Return-Path: <SRS0=pUon=SJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC69C282DD
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 20:31:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E0120880
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 20:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYHo2BwU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBsTM69U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E0120880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pa0AN1evTpTBPE2+dYJ4zrp/ySBANp6hWW3DnN2mM5c=; b=eYHo2BwUd6rhYO
	RSycGiDPmwX7azG7fndVRnOAHZY2ODB3xitz+mPR1MXH6dWQtVV+paLyNgE4d/g04z8eoQ+yifF70
	DPuuxg7X9SJEo1Dnpd2oZdB/WhQAaofBNkz4yqi9JGI7fBGFwPNh4BWmFWxp/ibzMfDGijUgdRQQm
	j2mAGwniGuvyCVfvjoGZtn/frgK6H7tAYGLsbU7FZ9iPgUWjoD+Vy4Ow000Uk2K8uE4UQ96lnEoDq
	Yszz0LzRll3mO6zo3aWCdNCItv6Uq5QWDNXPb/4UCeokaQD61YP1r9X7Pd4fUYOH44KSvGkKFj5SK
	ToZ8RyeS1sYZn+5f7yMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDES8-0002ue-Td; Sun, 07 Apr 2019 20:31:44 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDES5-0002tr-DL; Sun, 07 Apr 2019 20:31:42 +0000
Received: by mail-pg1-x543.google.com with SMTP id i2so6055877pgj.11;
 Sun, 07 Apr 2019 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g1h639oe46Whxmb9PDY5ESJgkXBT6wt2D1BKCyfWRAE=;
 b=pBsTM69UZ6XwuWP/0do1oI4GRku8yqY/w4quOYqTFIbx1idPTeErD/Y9SheZJZh5r/
 WnYQrEDxnUJ2KHsSJyUviolwgs3ieXQn8wPgsTCdVgKocJFgX5mS8xlOULzGod2GyOtc
 iKEbKQJS6iFYoGesLxMgFKHMOfDTgiaNnmitCd8Ct3BxGKWypU5iofHQu74srCm8usG6
 gX7qAY3WV0lGy+AgYDBJVlkI+LpSrmKm2NB1BLINLkqc7Fxj6paKrPc3hNZ/+Q98q/kj
 zHNdJhWX+HB4GmV4MSnYouqk3hhszu9agBjRNZmJGSaYJsiS0Js+RraSLtIG1urUCNeV
 xjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g1h639oe46Whxmb9PDY5ESJgkXBT6wt2D1BKCyfWRAE=;
 b=IdsIjXGW15SA7ArrXc9gDhj2Y3JUo4b0wACt6gCnPVzTWVi1Mqmb2c11qhLd9tdx6e
 QrgSlW309vzaaGNRnxPEUKjhp6cF/QHkpdkOHBDH5JX4+ZVWqrt3YT0i9za1AGEaworF
 XRxgyovlFeaaTjCB/kkQUUPc/MXEMJxqQ962zxO4eAeZl2sQmEpRr+sFN8M3To+A7JSn
 GoqLnuKMLet1/YTHsuXXJAmn9fsor7ENYRsBaHE64Y1+AdgwF5BUyKjULXaSczif9ibk
 bHK4qONSbmtx2lQjzwwS4KQC72AicCXHuzKHUrS4Iktkc/wp+6pBLh/zRUIClktoTBPz
 NPgw==
X-Gm-Message-State: APjAAAUG8Gjen6Fsn3W1Js4lvuF4K82HgV3vRRJ7VUFctOhwF8LAlM6J
 xEH0bMGxidek4ExtPCFsEbi/uyvo
X-Google-Smtp-Source: APXvYqw5v1B1rHL9fMlbkyYvEPjDA9AQYyLkRn0gbzP4SrmVAWVB07EvlezH/mC9Z0Onl76kWuPG0w==
X-Received: by 2002:aa7:8c42:: with SMTP id e2mr25652550pfd.24.1554669099216; 
 Sun, 07 Apr 2019 13:31:39 -0700 (PDT)
Received: from [192.168.1.3] (ip68-101-123-102.oc.oc.cox.net. [68.101.123.102])
 by smtp.gmail.com with ESMTPSA id c22sm26764066pfn.136.2019.04.07.13.31.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Apr 2019 13:31:38 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 David Miller <davem@davemloft.net>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <53f5d96e-4594-7a32-792d-4837479da7f2@gmail.com>
Date: Sun, 7 Apr 2019 13:31:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_133141_478633_A6B7C7A7 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 4/7/2019 2:57 AM, Heiner Kallweit wrote:
> Recently genphy_read_abilities() has been added that dynamically detects
> clause 22 PHY abilities. I *think* this detection should work with all
> supported PHY's, at least for the ones with basic features sets, i.e.
> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
> features explicitly and rely on phylib feature detection.
> 
> I don't have access to most of these PHY's, therefore I'd appreciate
> regression testing.

The nice thing about the features is that we can right away tell which
PHY entries are Fast Ethernet/Gigabit etc... so if you remove that
assignment, we would need at least a standardized comment allowing us to
quickly grep for that information.
-- 
Florian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
