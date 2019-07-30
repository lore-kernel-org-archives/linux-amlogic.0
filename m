Return-Path: <SRS0=HPE/=V3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3598C0650F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A635A20665
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eBAGNxz4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DIxPinmn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A635A20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M9TY8mrv6JnqryDhF+p7HytlleQOMg0VY27UkwWZPH0=; b=eBAGNxz4XeREDNbgtca0u2H/t
	D/ln8vmiblf5CKZNVMoYExrsFeDlwnJ3nWWyZ1w0+TpswYx6r2FwYGG43Tl36+7lbJr4owkOIiD7N
	RNV1er5N/UmdCic1uCjHw+QTvKLPMiO5uv4Zxlb4f5gMMzErx6d8yS3SNMbQPM2bmld/dtdLL+waB
	7niIrHLz1sqjEVLKZNViuLlbrxrqTYGOm0H/MtAxvFZoiUmMJFB9vlVchIuJHgs6B2Y+mJ3Ayt7NJ
	38vCSy7+0f6Bgn+KjXd9RJ4q7AW5nSKbRyeKqJpsk+cav4ob3xIS1imWtolHIuET1w/AF7x8kMtR1
	WmH49zoDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsORj-0003ja-OB; Tue, 30 Jul 2019 09:29:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsORR-0003Wt-NV
 for linux-amlogic@lists.infradead.org; Tue, 30 Jul 2019 09:29:10 +0000
Received: by mail-wr1-x444.google.com with SMTP id f9so64934342wre.12
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2019 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UmQHozqmoGA+uJhmvpcriqzT5s1toP44XHjvDTiLyKs=;
 b=DIxPinmnjAMczFCQWHoJQzmDZAzd08ESNxxV8hlwQh4GOZNlXwdWnz2/RVJ4GI71qM
 Mx3d+B082zk3iVOm915XlYVI0Xi3Xow6TOUy5zVsnGex4tq+Ng3B2eOidnmt+UA2g0Vl
 2cC5yuUsY4akIbir0tgfir8xROfBbuxYQb2DUtYYYteu0/uMIGWwJrhHXRX+ucK2BxOe
 bIsKijGD/O5VVjp3SIOKBvxUzS1yO8QXb4zGjhFfD5rTypu05vRIVgspvL4Uw3eL3THf
 dH5NtsMVpO+bhM5khhwn8e4TzMH5vl0OtBZ8qkk5PCMz7UGk/RQBDTSkKeG6tGgAHiBj
 cqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UmQHozqmoGA+uJhmvpcriqzT5s1toP44XHjvDTiLyKs=;
 b=m0jQWxbkXvq7yvnlnUNEz4pmuvyz40HrTET72/Of+A/OrG9bIAsaNM+bioYZagXUK/
 3trg3DpKRK7QcgUTcuSLSR+bCqMLYkif7+BB6lRt+KhbFUBLs8/3SbQtSo0UbN7mQ7XE
 3OzQB+DmFaxeNn8IAqTkwvYewYDI60aapxGRKcu4coxa2gUrjYdwaJ+sTYaOKwytkSLj
 XCSDhlwDy/wf1os21QlaMVc0Is0gsZVmXH2H0bcYHNBYXYhNvoDygH8WFOIgjiY7ueqV
 7lW6N8VIjisz/mqIav9m2AtcJYHjP46rCZpR4zJHpRrYuRlMDrIPCOiKpu0g+FOuYRsH
 O/sg==
X-Gm-Message-State: APjAAAVq52fa+u9mg6Z7gXZdJ7Tp2BjlUaiVJfy9nmXj4gRQu8cUiss0
 bLI4Dahc2CZLQQlFWznd4J+TSA==
X-Google-Smtp-Source: APXvYqzObPqZtjGj+O64oCgvOTtRaaQliiCCg3j7iOoEJrUTUSi6lKuRd/cBNOAgtnVG9INnbmKUgA==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr89483972wrn.197.1564478947785; 
 Tue, 30 Jul 2019 02:29:07 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:f78c:d00:1570:f96d:dab8:76ae?
 ([2a00:23c4:f78c:d00:1570:f96d:dab8:76ae])
 by smtp.gmail.com with ESMTPSA id g131sm46129472wmf.37.2019.07.30.02.29.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 02:29:07 -0700 (PDT)
Subject: Re: [PATCH 1/5] nvmem: meson-efuse: Move data to a container struct
To: Jerome Brunet <jbrunet@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-2-ccaione@baylibre.com>
 <1jy30f28rr.fsf@starbuckisacylon.baylibre.com>
From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <5b6825f9-22dc-1656-b5f8-4f785103f827@baylibre.com>
Date: Tue, 30 Jul 2019 10:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1jy30f28rr.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_022909_759954_A214E46F 
X-CRM114-Status: GOOD (  14.67  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 30/07/2019 10:04, Jerome Brunet wrote:
> On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:

/cut
>> +struct meson_efuse {
>> +	struct nvmem_device *nvmem;
>> +	struct nvmem_config config;
>> +	struct clk *clk;
> 
> since this driver uses devm_add_action_or_reset, I don't think you need
> to keep the clk pointer around, unless you plan to do something with it
> later on ?

Good point about the clk pointer.

> It is kind of the same the other structure members, do we need to keep
> them around ? We could just let devm deal with it ?
> 
> If you have a plan, could you share it ?

No plan. In the PATCH 4/5 I was going to add struct meson_sm_firmware to 
the bundle and to me it's a bit more elegant to have all the auxiliary 
structs together in a single container.

For the sake of keeping the diff size low I'm going to rework this in V2.

--
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
