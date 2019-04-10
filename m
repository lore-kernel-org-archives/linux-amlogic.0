Return-Path: <SRS0=xGFd=SM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E732C10F11
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 19:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D56420830
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 19:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uM/mZZmV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhiL0/Ho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D56420830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaKcFmX6d2cm0zvlYtP2qVzMt1V1iS1BJ7BPbhLMi9g=; b=uM/mZZmVBe3cx5
	gdLVSJcJaDp1UCP3J0khvraXxi2gNCmbC8mivFPGto3O5SFavrCo7p6wnHW55rjP09+WU429cOc12
	HIsorO6njHma9nO6haDRi3XnUZV6VxVJBqUAHIA/7z6Zv2wrYfXZdRB6my/qarbxf3Np0Vq0VLNZN
	OzaJnA0WP16BOXIyCYPoOSJhalVeYyZq3Gyzl0Be4dCjkEKlAbdzIyPeuWqu9cWM1qnHi2g0eozSP
	Vz+ntY/X4/kJvefNTCZBVF5evydzyLE/GO31a25tMMEcJ8jY65rElt9oeajXGj54OfE5uRoyfYMoi
	yfxvUc38a/4iTd9VWHSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEIyC-0007ul-BO; Wed, 10 Apr 2019 19:33:16 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEIy8-0007ta-VD; Wed, 10 Apr 2019 19:33:14 +0000
Received: by mail-pl1-x642.google.com with SMTP id f36so2027005plb.5;
 Wed, 10 Apr 2019 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GT2gRA4MzYxWOrqzojBIst/vIQ8swDOOdNYKpAcpvHw=;
 b=bhiL0/Ho0mh+kC2gTN82K5AzZoH7cbyUTywjXC8hifCx3f9q88NtiSyoXqK/LXEVen
 BXFrXkAGF6qXm5GR3OI3Xq97LsscmB3qm2IHqJEfTTwqf6tydHYDDctwuk232oiEnjeL
 HabYcI7NtqTgmthadmOxw8NntFBjKIG3VBXnwiyJoUBX7hfCuJEnf2Ot4bnSzoQN1UpU
 ZTuQvM7JgZwr2MGfcNrfLlMxp+/tKV6pVw8Xt2IFf60ZjHda4o63KwBAt6FuF41O5MqS
 ciLO/B5KBImxA8f/0QofiY0RmtF2lAdG6jgTv/+t+yBsPp602h8E7qLopZZFIFQK7iIy
 atuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GT2gRA4MzYxWOrqzojBIst/vIQ8swDOOdNYKpAcpvHw=;
 b=ipQYKUSVvq4q72V4J+8C19eTV6FOuViSvxMzFjPZfgqLGGRPgtQEAoBA8Poj6hHsuw
 bC69j5kwdl7yR6/lRzpKdrDHRthrAtxBGdiLFczXSuIJn7lPZO03HbgUDHylmIVdCEBF
 2XvttF8Q5drNAExVERL/xc5IIYizGRwVQ/D1yGaRyAMI0o3C+AyLuTMEEjiDaHeTeiir
 LWBM/As0nuF7y50AL/nxpQnlXCFmrZfgY+JPEJCIhJEq3ZmnqllYneMJm3+ORQfwDgrT
 iApxfw40wmgLmz4MD7n5cC0LDLwhe8hY/1iXPUsH8dxUJlG3u4dttVDmUNIjFfJsPFmw
 nCCQ==
X-Gm-Message-State: APjAAAWr9+xtIQC/d0pz27ys+UuMymXGX3C+fVEQubHsX5u8PIWvHi0z
 RRNVhJ0rkx+MeHK3tAdm1uTGKxcc
X-Google-Smtp-Source: APXvYqw3WkkVESgWnkiy0uF3IAjZQwvZFqDetD3nzCz/3Wv6nDTUpRPRy027cfQw1e56cXXV0knOHg==
X-Received: by 2002:a17:902:2ec1:: with SMTP id
 r59mr46093811plb.171.1554924791294; 
 Wed, 10 Apr 2019 12:33:11 -0700 (PDT)
Received: from [10.69.78.41] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id l2sm38646277pgl.2.2019.04.10.12.33.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Apr 2019 12:33:10 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
To: Heiner Kallweit <hkallweit1@gmail.com>, David Miller
 <davem@davemloft.net>, f.fainelli@gmail.com
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
 <20190409.135944.1516944884952068835.davem@davemloft.net>
 <cbd952f0-117f-8418-e82f-5460dc0d99d0@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <239c0f2c-3be3-bcd4-9b76-7cbde75bc0ef@gmail.com>
Date: Wed, 10 Apr 2019 12:33:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cbd952f0-117f-8418-e82f-5460dc0d99d0@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_123313_000599_78307194 
X-CRM114-Status: GOOD (  12.07  )
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



On 4/10/2019 12:31 PM, Heiner Kallweit wrote:
> On 09.04.2019 22:59, David Miller wrote:
>> From: Heiner Kallweit <hkallweit1@gmail.com>
>> Date: Sun, 7 Apr 2019 11:57:13 +0200
>>
>>> Recently genphy_read_abilities() has been added that dynamically detects
>>> clause 22 PHY abilities. I *think* this detection should work with all
>>> supported PHY's, at least for the ones with basic features sets, i.e.
>>> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
>>> features explicitly and rely on phylib feature detection.
>>>
>>> I don't have access to most of these PHY's, therefore I'd appreciate
>>> regression testing.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>
>> This appears to need to be done differently.
>>
>> A question was asked as to why fast ethernet PHY identification from the
>> source is important, well I'd say it's important for someone working on
>> the PHY code to see how "all fast ethernet PHY drivers do or handle X"
>>
> Then, what we could do: Change all occurrences of
> .features = PHY_XXX_FEATURES
> to
> /* PHY_XXX_FEATURES */
> 
> Would this be an acceptable option?

Yes absolutely, I was not thinking about anything more complicated than
that, should have made it more obvious in my replies. Thanks!
-- 
Florian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
