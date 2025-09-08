Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD3DCAC587
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcHBlsQhJ14r4KglEnn2u8HaJRcpYNsUICPEN3c/V/s=; b=EMQY95x1OuKZPk
	a2BHXp3WivuEsvr7nPAHdrE+G9WOqEyQOPwbXjfKuMtLTwn2ScZwl92DlxEvfo0CnC3elMKTlSq3E
	1TzdgqIZQ/F3IYm4I6UrJP3Rdfv6V+3CiqVy86mkOu2BbSEqfV486frTTRzf4s+/xbbPs9ERJm6cW
	KuAIgsPeeVNduAiHHU5I/1a4aZp1WBQsDm1UDhLM9s+96T1x+GtzRKBBgdglausE+w3k1JgpdTEJv
	IR2C7pPAJaDJfb0/ZoHIOsR6fSGnuiDof7uT78v2JbS/7qfs46ot0hQI1tNvK1PZvHwOigPLAx296
	qmsEYmkqsjZOEWfb2xYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBm-00000004pC1-36RS;
	Tue, 09 Sep 2025 06:50:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviGd-000000027a2-3CRp
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Sep 2025 20:15:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45de2b517a3so17224045e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Sep 2025 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757362510; x=1757967310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjQ5+oMfNA1z8X7OxHRV6oMq0vnVY8/Ms0Vhwhb2pfo=;
        b=Qt1ykCOYomvr2R/kquBXMB6C6vFvmSU+/yhD1HhanMrcvWqTC+jdxMsP5EIW13Btti
         XdQWJcRJcxyVZCc3MHQCSJveWV89B3TJ4UBW6CNLXo3R6QOzDjF+PgCfYQwwKtZ0KEtD
         dQc+Qk6wRDi/s7Hrn+Xx+79+9VwWGDmq+HseEzKjn6+BNLJKsXA3yrNXaYWxxT/Gn/JX
         Ncn/c++ZluB2fzHnsfPZ3f/PxCUXTgGYiu8Mrn48+dkv4fgaScvsXRKX0HD46FdDuYwu
         Cf1kdm7m3EkWt77bRqJTqZkw7iB2qzMMn4HkG7WIImeO+8L098ApFyYq5q265ikC+wOK
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362510; x=1757967310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjQ5+oMfNA1z8X7OxHRV6oMq0vnVY8/Ms0Vhwhb2pfo=;
        b=wNb44qOQj731EqDcgtS8a5FKmxsp1kwxZLkfapIv9zQXregmnYDfgw7D0QbauGnhGc
         vP1+o7W6Rpfe9Py8F7whm/cRsOppG0JhBvTDqjdWXLnav9N/2isVObYqLxky9HoxgBDH
         CoIsB0hnPq7eTvSUj3YCuUDkNAbwgYXycwiMO374rY3+w4VZcAs2IHwZhs2mu8XpKtMR
         kF0T8Jjh/nwVM3vmDHqHsu2LztNUZ/bjSOKnNXsNXReLZdUP41SJHKIVZUJfhrdYFfgB
         Jkkz0p4fCQSaIfOpNzGHhmQsXUJF+NT2C9O7fIZXCrfqoCryvRlca5ozspR3hfBPqgAQ
         tyLg==
X-Forwarded-Encrypted: i=1; AJvYcCUk3jF/2VzcCYgA5Pv80Jvk+5pNLXLGzaQ1WVbkjasN63SwQbuEWdNmdYlrId3vI2L7sYJQDdKsbllUuKZv@lists.infradead.org
X-Gm-Message-State: AOJu0YyfYidR//tu3KEdAX9FRakkYMzpHA5zLsBjhDZG4ysQ6RbksvZ3
	E+HdJeZ+YyoriZE35+VW9d0lIEMSAhsJqok27Rw19TCDGYE4AAEtnARZTtwaXvPvlZI=
X-Gm-Gg: ASbGnctsLRIgy0+4f7EfJtJ9YM2pyl2pWbqz2v30MKlcXqDLrKmOXkZ1DtXLZXqzK+K
	5BrXNhCfQD9IFo7DlLarV97EAQvhTxfkj3U4wo5w2EIN/pYZFhNUOE5xXtxKPImQhnRPkouST33
	RuLpsUBnZmW4j/ZAqinGJCONQQ1hoSmy4Pc7cG7K2zTVRqtbXezr1yzvJOPs1IQsFgdAMHvIZGZ
	G3UiRkCVPH9QL0w2H0owlgTl7EBU4EiksBkdRz2GboH2u/kNVKHmzljF/vewxHOJX2jmekiBWSH
	iMklCbwgf5gaynm+gn1Su3cM9ilb+bILxC27BIt34jN2osoo7G8790MvN4QmGAjiP+aDvO5Ytpm
	9HdYYu8ebloX0S48BuUsFn2AXFw==
X-Google-Smtp-Source: AGHT+IEUXK+5uzEYEeWM2C4ugYvoTxY9jWpw3+DQwWpEwD7U8BI+a4nggbRKv+GtES+a6PSycdGhyA==
X-Received: by 2002:a5d:5f87:0:b0:3e2:804b:bfed with SMTP id ffacd0b85a97d-3e64c1c2183mr8374205f8f.42.1757362509754;
        Mon, 08 Sep 2025 13:15:09 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.66.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e411219ddfsm13631814f8f.57.2025.09.08.13.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 13:15:09 -0700 (PDT)
Message-ID: <29a776da-cd28-46e4-8b64-400f462d8670@baylibre.com>
Date: Mon, 8 Sep 2025 22:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability
 for SD card
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250907-fix-reboot-v1-1-7606fc91254e@baylibre.com>
 <1jecsi3ywb.fsf@starbuckisacylon.baylibre.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <1jecsi3ywb.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_131511_892517_7E9EF1D8 
X-CRM114-Status: GOOD (  15.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Thanks a lot for the review!

> The above should be enough.
> 
>>   	max-frequency = <100000000>;
>>   	disable-wp;
>>   
>>   	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
>>   
>>   	vmmc-supply = <&tflash_vdd>;
>> -	vqmmc-supply = <&tf_io>;
> 
> ... but do not remove that.
> 
> That way the description is complete and the kernel is able to verify
> the regulator is properly configured.

Thanks for the hint! I didn't thought about this while working on it, 
but I tried it today and it worked perfectly.

> It is also easier for a bootloader to alter DT to add the UHS modes back
> (it is safe to do so if booting from another device that SD, such as
> eMMC)

This sounds like a nice improvement as well.

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
