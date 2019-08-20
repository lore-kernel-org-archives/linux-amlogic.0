Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408CEC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 23:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12DE023405
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 23:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcFKof1t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p+vl6bqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12DE023405
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqA1lR5uzEbjbCx0hx/8u9jOz1OdoV+EREyJb2I3U50=; b=rcFKof1tMYd4To
	muGTcRzvfhD8bNmhhhCq5zJfDpDouALKeQ7ZLR1PMDTSlIN2sFgneqoctwZ7GqIG7zNXHlHMt/1uC
	RXiEH8SYcLTajDlPzJwL12Su1PiO4WzfxP9Lcl5Zyh6IhyvSYkVxJndrJDcn3/vLKs6NIMz9AiPpf
	OX0ALmmK1NY8/j8OzTjU3fn9hnsTEGxzCnUtE360sk44my85bWTE8eoaiESeBAxnJc5+1wGI+W1Dn
	wRjB3SI/sHQfMPWg1L1cp42bEbK8eQ93vYQYXBaJ7XI5be0XYWP79d9/r39NDdpzjsaN6o6Koho1H
	bnNVH3OBWCSsTs8hJ7PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0DDI-0002pM-F4; Tue, 20 Aug 2019 23:06:52 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0DDF-0002oM-Cu
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 23:06:51 +0000
Received: by mail-pf1-x444.google.com with SMTP id c81so76865pfc.11
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=3ZdYND6Wl1bRQZobvgDGilBtsFiFe5f8MwN/RoglplU=;
 b=p+vl6bqwnZBpeaHiyriodr3YU5vPNi6dgqkRp3GiaA9JczUyoLile77Dj2B+BZggDJ
 NzlvH7CyYBerZlpjYj15RbbWMyJGouIgFI2T2IMOh0Aye5krAxOLBcXbXZaO3fM5C0/h
 hUUGR5wuWOwGkH10sOSgrfyyEGNPU8PX1FsNAGfHSISAOMQM/dR20jKpSyidDWMVnYU3
 gEqghkvroFGIBsJ9s+b3i/1R0ZbvMjdA3YSrdWgQJh2pU3bdRUNrB6vTH/T6Y0N7Mt/d
 /stEefEeTo4i0TNewxUdzqaM15UhIX5rWx63ufnkwEr7MaZcPeaYBa9JWg+w9N+xuwMz
 VEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=3ZdYND6Wl1bRQZobvgDGilBtsFiFe5f8MwN/RoglplU=;
 b=QKQKqCHIhm7ApFRMTVWUru26nP1z0XCDI7U+J/mkjaFdVkKWNOpOpnSXi2XsQ3FaqQ
 +eWpQpTQk0JiuzGg9aTFHm8DGHZekHY3K7rznP6YH0LJq3M5USp6yuaiBWbJboShfDqM
 hup1ANaVOGZO/R22LvKxT083sMzMh+8Hjz4pWkOto7VHSPDb7d1/tHuzI4M501YULV3F
 XseOZ1yhSj3naZB3ET2wzuz5YGtpX8U7PEP7QcUf7sa05DHkW/Juj+aNovuWx3z4TVZo
 l8zoQAGbmlmdHStr50urs043MThCWy7v+b5UdtnOhCHghChAwVRoVV8EcTk5eJfDaDWB
 dz7w==
X-Gm-Message-State: APjAAAVbb/d3XNPjObcvsSDUW5J9mm4PZPBzGiCnrfexcKqt9pPvzOo9
 BMDjoPGisHVWnErK+4aCFE4AylgZbNqSRA==
X-Google-Smtp-Source: APXvYqxALtnddgGMFc2X2U+yCFu2yJS7dzJAjVYSdhFC5iity/GwPzH8lvuhFKcFPxyXSfOTqNZTzg==
X-Received: by 2002:a17:90b:8ca:: with SMTP id
 ds10mr2269923pjb.139.1566342408736; 
 Tue, 20 Aug 2019 16:06:48 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d18sm17691015pgi.40.2019.08.20.16.06.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 16:06:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: Add support for Amlogic SM1 SoC Family
In-Reply-To: <7h4l2bej1c.fsf@baylibre.com>
References: <20190820144052.18269-1-narmstrong@baylibre.com>
 <7h4l2bej1c.fsf@baylibre.com>
Date: Tue, 20 Aug 2019 16:06:45 -0700
Message-ID: <7ho90jbfne.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_160649_574750_49128D7D 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> The new Amlogic SM1 SoC Family is a derivative of the Amlogic G12A
>> SoC Family, with the following changes :
>> - Cortex-A55 cores instead of A53
>> - more power domains, including USB & PCIe
>> - a neural network co-processor (NNA)
>> - a CSI input and image processor
>> - some changes in the audio complex, thus not yet enabled
>> - new clocks, for NNA, CSI and a clock tree for each CPU Core
>>
>> This serie does not add support for NNA, CSI, Audio, USB, Display
>> or DVFS, it only aligns with the current G12A Support.
>>
>> With this serie, the SEI610 Board has supported :
>> - Default-boot CPU frequency
>> - Ethernet
>> - LEDs
>> - IR
>> - GPIO Buttons
>> - eMMC
>> - SDCard
>> - SDIO WiFi
>> - UART Bluetooth
>>
>> Audio (HDMI, Embedded HP, MIcs), USB, HDMI, IR Output, & RGB Led
>> would be supported in following patchsets.
>>
>> Dependencies:
>> - g12-common.dtsi from the DVFS patchset at [1]
>>
>> Changes from rfc at [2]:
>> - Removed Power domain patches & display/USB support, will resend separately
>> - Removed applied AO-CEC patches
>> - Fixed clk-measure IDs
>> - Collected reviewed-by tags
>>
>> [1] https://patchwork.kernel.org/cover/11025309/
>> [2] https://patchwork.kernel.org/cover/11025511/
>
> Series queued for v5.4...
>> Neil Armstrong (6):
>>   soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
>>   dt-bindings: soc: amlogic: clk-measure: Add SM1 compatible
>>   soc: amlogic: clk-measure: Add support for SM1
>
> ... these 3 in v5.4/drivers ...
>
>>   dt-bindings: arm: amlogic: add SM1 bindings
>>   dt-bindings: arm: amlogic: add SEI Robotics SEI610 bindings
>>   arm64: dts: add support for SM1 based SEI Robotics SEI610
>
> ... and these 3 in v5.4/dt64 with Rob's tag.

And I forgot to add that I boot-tested this on an SEI610 as well.

Tested-by: Kevin Hilman <khilman@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
