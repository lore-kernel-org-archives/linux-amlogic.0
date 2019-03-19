Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2661FC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 20:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1EC213F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 20:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nR/8VHUZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iCW/eZ1T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1EC213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXh8oRgWD7z+KDG6RrsXR+soODCUdtTl0hzAIi6yy84=; b=nR/8VHUZEowiGd
	d4Ot57qnkRflH20ZiGQFwgZxCkET7nMfLoh0rm5aOW2cUip3FxyDlLwjmc8qmvA8q9+Soyfsxuqc6
	UFTOZu7FvROI6VrFJrVr40POSQikhaLm2p+9bzlANt6vSfduwaBqznkIHqi8Rm89w7XALlehFZcXu
	LB7bngzluFL9NTA++/0vtGsrS898H8x8yZ6cKUwOgJQFTPtTepc0NxxbsVFQdLSFKUo0NO9TwtRWs
	AnblSZaB4h0IeZ0R5CHNYYIm0fjh8/DfQeXpeu8QNvSggKgrk/2RDWfpOAwSvA+Tpb10EQLE1YmQd
	dKyWQhCshbv+GDnVdRxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6LGc-0000kG-LN; Tue, 19 Mar 2019 20:23:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6LGT-0000al-5G
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 20:23:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id f8so3206679wmh.0
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 13:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=88tPsrPMPqYB1In/fB+lVmebSE2nvbar1boY4w5+Hlc=;
 b=iCW/eZ1TXoz+fs6IB2WRL76stZeBllse/i6gcshGW8qof0/MQkQc6V7f/TOq8q7f1N
 HUp8H5hpglp/B9foo+cp6S2bL4B8I2s7kg3uON5+Ybf1WEE+4QbHzHYWtfdQCV96a3GK
 15zimJoDWhbB0sKN2e/Ws0pbBqEYTSBqvaybQAk4wG7nrHiFnrxi+xIboI+DPHffPKb2
 23SVnn6F81Bnw81FWzk9o0k7KC7yTrjFycfbPJEzi+Z001SzVozUi9Q8Cb62dXGC80rn
 plBZUMfm35FGzcAx6RNKeTw/BjN3PEz2uGlEGmCUQbF3j0YynYOIy4mVA1IlyIDCUzim
 aA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=88tPsrPMPqYB1In/fB+lVmebSE2nvbar1boY4w5+Hlc=;
 b=Ciz5RFaufNknibOhNh4ohLpFeKnGuDc2CJ+6xMT0IVFr/gm8J5vPNX6bsllhlYJJVu
 AmxDYTZ9iMYnwqddJLm/oM7Kea5ETjRpLW19TVKmuqkRFE3HiYn5qvW/9DHhazHxSmTA
 1EhNkfDPXrrUfDza+8ftNTeY3bloRe+mDmqtzQzTAgCI3MGUHMi9CmfvQ6iW/Q0L+/XZ
 Zk+5e8Ri5iy1ycfy5HhIok+sUBShcmcBwkxYRL8EWxXwraaFMD0F5ooAHv/5BI+ITast
 oz8TwHmEgdpbC7pjzUE6WuwVM48yGvyUrZo121YYfYwDmX8AAj3MR34JQ+eSk4JGgN/o
 kErA==
X-Gm-Message-State: APjAAAWn8lm8hFlJ7xmdXXkiEe5MNFX6AQpn0ngvq6sSqddKrypsV1WZ
 ADFS/KBNKkOaa5Ru95e3Iz8dGg==
X-Google-Smtp-Source: APXvYqyDODcxE4r1LgrUTFdsXWtJSDhNiOpe68EnE6DM+moXTyuPj8WolhJH3lwHDZNqNHuaybmERQ==
X-Received: by 2002:a1c:4105:: with SMTP id o5mr3864934wma.35.1553026991274;
 Tue, 19 Mar 2019 13:23:11 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id v6sm63803wme.24.2019.03.19.13.23.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 13:23:10 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] clk: meson: g12a: Add CPU Clock support
To: Jerome Brunet <jbrunet@baylibre.com>
References: <20190304131129.7762-1-narmstrong@baylibre.com>
 <e9e5644385fb0ac45faceec5ba005dc20ab65989.camel@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <cd33907c-9b58-3e62-c490-35c184746367@baylibre.com>
Date: Tue, 19 Mar 2019 21:23:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <e9e5644385fb0ac45faceec5ba005dc20ab65989.camel@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_132313_199045_B85CE695 
X-CRM114-Status: GOOD (  17.63  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/03/2019 10:39, Jerome Brunet wrote:
> On Mon, 2019-03-04 at 14:11 +0100, Neil Armstrong wrote:
>> This patchset adds support for the clock tree feeding the 4xCortex A53
>> cpu cluster.
>>
>> This patchet does not handle clock changing, this will be added in a
>> secondary patchset.
>>
>> The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
>> use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
>> muxes.
>>
>> The CPU clock must be switched to a safe clock while changing the clocks
>> before the non-glitch muxes. Proper support will be added later.
>>
>> In this patchset, clocks are set read-only.
>>
>> Changes since v1:
>> - moved to clk_regmap_gate_ro_ops for R/O gates
>> - added comments with datasheet field names
>> - moved pribate bindings changes to driver patch
>> - removed invalid PCIE IDs
>>
>> Neil Armstrong (2):
>>   clk: meson-g12a: add cpu clock bindings
>>   clk: meson: g12a: add cpu clocks
>>
>>  drivers/clk/meson/g12a.c              | 350 ++++++++++++++++++++++++++
>>  drivers/clk/meson/g12a.h              |  22 +-
>>  include/dt-bindings/clock/g12a-clkc.h |   1 +
>>  3 files changed, 372 insertions(+), 1 deletion(-)
>>
> 
> With the small naming comment on patch 2
> 
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 

I fixed the naming while applying on next/headers for patch 1, next/drivers for patch 2

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
