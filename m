Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424F8C4708F
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 09:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39AB613F4
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 09:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A39AB613F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+2S/aabmIIa91j/B9WmmDPqHwlAB3xirgrcC8xz4TGQ=; b=FKz062O/VeXQVUNHoZbmdegWeo
	vElTrP2KpkHombi6OeESUYgmhstR777QthXA0DDwQe80oEflvOEJqB6KrPGMXuZNbju631u6R2c4S
	WCHXfe64nhzolZeJQ3MO4bHq7cGTUWbzHEXzqxt4UAXdNtTi3MlYDScL70xIMGPTXFySHQgga5FQ4
	SjJRUKEAFTS0bgKB6UicTiEMhMQERg1Yy0f2GlpEv7mKOr+5nOW1gbfUaHPDOvfH/JGMtKBSHqNS7
	VDmD6VRfWZTOn8aCCIC6iDvt0oIk1DPJkowtijOGZdvUac7/IV7XwY79pu7NiEM4huSK2LKn0QwZx
	YfANANLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6Mw-00ChiJ-39; Fri, 04 Jun 2021 09:43:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6Mm-00Chdz-8U
 for linux-amlogic@lists.infradead.org; Fri, 04 Jun 2021 09:43:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q5so8665001wrm.1
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Jun 2021 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K/1v6g0udvrZSDxAh/sWiC9TGRYFd7RSGLxMoHfmDZ4=;
 b=Ky76IkwDoptsX4+XCqf405H4RW5CROeTW89HLAJlgZturlc9/FUMQvhGmgBp/vDjO1
 BHumpBEpuBwMW4NQWaxbxu2kH7EBhJTYaZdgkKXNs7gXH6XuECyomGxlIr6bx3kPtDn6
 9SlB03+fvIEI4Fho1rGm+fksuC6/YDWs9+drof/C6fWH7CCn1mWZNF5waZfiOcqoqLbb
 3wMxdup6Unuokt0kU+yW7JLvydJZGZ1NrMEn4RpcEiKmp0478H3Fz0R83gVG4v2C9XtR
 b8jC4hF/YbP7+JkMeGPrfLFwR1s1xz+8tKpFOW8Th6Uqw0JW0MfS6mG0OyoM4+N8n+bL
 6XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=K/1v6g0udvrZSDxAh/sWiC9TGRYFd7RSGLxMoHfmDZ4=;
 b=d5YtJTZFfzeGWWV0yJPvHu+zJsDon93979Q2igeAoC/W+hmFF6rb4UtM0H48LOPIHW
 qB/zcMpeEwO8U3hONTvZ+IO/bUdXrVx1IiiQ5AlpKYb3MYAW/+E+CvcZPsbjMatjFhlh
 hfv/70oMS2NuFWLTtJ37peuMtbo0YC4OitysDudfK9juDAPUrGEeFbasBeUC3rETep4T
 w7F/y+1BVR1R3oQdZqkwsQV+oTplslAQC955tKY4tfGN0gDUddWp4GREYDhYETFDW/Xb
 sBcIRv+ir4E7sZnSVVdGkFVvVKsyE7haQyuVdf4ccHzf3bjWjuKHsmj1B2ZYyewJ7Iz2
 VcGQ==
X-Gm-Message-State: AOAM530e/J6bFNKqSsIRzbeOQnxWEN6yubJ5kgWJzm4S89q4A6D0rUEf
 6HyIKmbL/QIRuWplUzrvlZuLcQ==
X-Google-Smtp-Source: ABdhPJy7ahHw/N5+oUmV1PiBVP74IC1Ex3ShvSK+MK8vhFmSaSrzBC4NYDkrNxiO5YqaUP1vh4ziDg==
X-Received: by 2002:adf:a503:: with SMTP id i3mr2975724wrb.334.1622799825012; 
 Fri, 04 Jun 2021 02:43:45 -0700 (PDT)
Received: from [10.1.3.29] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v18sm6800749wrb.10.2021.06.04.02.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 02:43:44 -0700 (PDT)
Subject: Re: [PATCH 3/6] arm64: dts: meson-sm1-odroid-c4: fix hub_5v regulator
 gpio
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-4-narmstrong@baylibre.com>
 <CAFBinCB+SyCmxrjJLcuy=mLsChPZ9i_1TsaWkL3kuhPO1wGwWw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <802340ba-edd1-d148-4c6b-e2eae9c2a096@baylibre.com>
Date: Fri, 4 Jun 2021 11:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCB+SyCmxrjJLcuy=mLsChPZ9i_1TsaWkL3kuhPO1wGwWw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_024350_028914_413BE9CD 
X-CRM114-Status: GOOD (  15.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 03/06/2021 20:07, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Tue, Jun 1, 2021 at 11:01 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> As described in the Odroid-C4 schematics, the HUB_5V regulator is controlled
>> by GPIOH_8 and in Open Drain since this GPIO doesn't support Push-Pull.
>>
>> Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> my interpretation of page 32 of the schematics [0] is that GPIOH_8 manages VCC5V
> GPIOH_4 is connected as RST_N to the RESET# pad of the USB hub -> this
> seems to match the original regulator definition

You're right, but GPIOH_4 is already a GPIO HOG, so this regulator doesn't make any sense then,
and the GPIO for the VCC_5V regulator is missing, like in patch 5.

So I'll add:
+&vcc_5v {
+	gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+	enable-active-high;
+};

in odroid.dtsi instead in this patch.

Not sure what to do about the regulator-hub_5v.

Neil

> 
> 
> [0] https://wiki.odroid.com/_media/odroid-c4/odroid-c4_rev1.0.pdf
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
