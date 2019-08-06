Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61488C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 08:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34AF5206A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 08:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQxwhiNL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+m5UExv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34AF5206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=phPOUu5Gf8vRLIhvvrUFPit9C+eMhF9bCw2w0u+JQkE=; b=sQxwhiNLsNUxAqRlzAT4TbGRY
	sT5pgoI9TQnh6Tlb6en3rvSgu5QH9qajT9zx6YsR5hX5CgbifHZj02fOAKAFnTyAVRD91hfm97nHr
	TfET1VYBmG+h9fUqDu3CO8xAdmr5XkjodekOAxOd6mHTH6Mg5Wg4h7vqLVFztNW7jse9FRoB99D70
	s9uChaxuaOOD5J036voLPPJz7/2VzTTNX5Y2OalFfKcdXWTXLtvyfNjwaYXRcwXuQStr9JN5fNSpg
	Ev+25glGdhky1c9lbDqwsQ4Lr59c7ifZ/YHPT4Hyu0TOLFSYPHB+f1rM0ugQ9FFi7eK2NOHxsRDPW
	cVHxKcBvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huumS-0001Z5-E2; Tue, 06 Aug 2019 08:25:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huumQ-0001YW-2B
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 08:25:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id a15so77248603wmj.5
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e0Gkgck1Aj/JyMBL/DHI4HjqwY2jjps7Dj7PaylKjl4=;
 b=C+m5UExv1CLnNHUBzP0qDiHXGCt7r6FUO7gLxM8L+ovk6fspDimTFSn3ypylAA5NLn
 /XrjtuQktAhoqPMMPm0vey/6MzjIFy31yC+e6MXl4O0E2ga5WBOgrf2y/Q2PcyDe1M0v
 g1uGB22YG7sN7Bg2eFBFGgidjfZT5lyIWRPB3EG1ZoHUHUEH4KEF83qH6Iqvi2LvBMiU
 XepIKra7DJZZc8qsdN4jJMtg6i+PQGzzWEEBLOtN8GpoRubPoJvIuv1WeoR/DAXEmOCG
 bHHty2a6e3j0nrRKm0vMjf55hzZT1Uf+TBgj1+8lTZU10ptSLW+Cx4o5OBlVjqxWGsPb
 IzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e0Gkgck1Aj/JyMBL/DHI4HjqwY2jjps7Dj7PaylKjl4=;
 b=qTA6gqagco1mW+ski4Hvtn79C4MyBZaLSp9ubqQN0TsYJzaG56G+fgF7NU9FXM31gr
 4A8NBRujHCjXoNrBP3mmuiBphj4dp9dWVM4Z6hGQDH53RauP6Xgh5f4NJGf4tQu41HmD
 3CphPwbBVxg/vDDHFnaV7J4c9dOcclEQVD2Uk1b1/1ZGv75PFwBPpLnR7EnzJDNIAObY
 REnafQILlXywDJOdGTB3boZeZ55wiCDtyFspuXNZXV3lsah11nGLCykdERfwMxPfleA3
 +3hm0z3r5GyqhQCaorFKz406HM6DsCiFEStJpueqjN3ShsiNMWdnBYx3Akkmxl7Ky787
 imKA==
X-Gm-Message-State: APjAAAV1NVq+meUbwElFN94685pNz7AXDRMNDUAhch+lwHnXXYnbroq9
 KSzAUqfIyGFDwBL3mMHXbL1qET9eXSc=
X-Google-Smtp-Source: APXvYqwPj+fveR4n29sCPaWg0zpl+3hL2IDWGiQDPBv6JliRWfgpQmQuSZ1OgfJKQfn7jY1pRriV6g==
X-Received: by 2002:a1c:cb0a:: with SMTP id b10mr3242533wmg.41.1565079912619; 
 Tue, 06 Aug 2019 01:25:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 f192sm88903896wmg.30.2019.08.06.01.25.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 01:25:11 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] Rework secure-monitor driver
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <7hftmfguug.fsf@baylibre.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <12d38512-605c-3544-a525-2c3599559391@linaro.org>
Date: Tue, 6 Aug 2019 09:25:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7hftmfguug.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_012514_115952_8D3DD499 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On 05/08/2019 22:34, Kevin Hilman wrote:
> Srinivas,
> 
> Carlo Caione <ccaione@baylibre.com> writes:
> 
>> The secure-monitor driver is currently in really bad shape, not my
>> proudest piece of code (thanks Jerome for pointing that out ;). I tried
>> to rework it a bit to make it a bit more tolerable.
>>
>> I needed to change a bit the APIs and consequently adapt the only user
>> we have, that is the nvmem/efuses driver. To not break bisectability I
>> added one single commit to change both the drivers.
> 
> With your ack on the nvmem bindings and nvmem part of patch 4/4, I can
> take the series take the rest of this series through my tree for Amlogic
> SoCs.
Sounds good for me!

I have Acked the driver changes, bindings need ack from DT guys.

Thanks,
srini
> 
> Kevin
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
