Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749FFC19F2A
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXaj69wuklyi6o3/gqwqy+2jAx4QOCqloMYW0//5dqQ=; b=uUEMhvVJnuqfIW
	t1FdO8l+AX+U6ljLLlDdstB/7FaVkGsLaI5G8z3x+62+EWbLW8QZoWIK9SJbytXE3GCCdfPw30DUd
	bRBzwqUSzTBOfehgnw+uLe6xMaA2DxhnB81cW63Q6rXDcaWeckEQObRqwey/FSDnDi2QmFuIQ+Ff+
	vHWUwzzc3vi9DPa1i/FET+6q+Yn6CdxQ0qBffMJL2Jgr2gHjaWDdouJEveBI5JPh3olsYpyOpqwF0
	0s03Eoa0lT929yugbezgz1zz63Uy0PapoIlaUtsi6a8BKdNfV5hAkZBjYDsHB/tP/NYqbu8z7opPz
	2e63v32bLgr0UHmk2quA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmHI-00CCSQ-Pi; Wed, 10 Aug 2022 14:01:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmHF-00CCOM-Sk
	for linux-amlogic@lists.infradead.org; Wed, 10 Aug 2022 14:01:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso502239wmh.5
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Aug 2022 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=dZA7yOywUXukdcu5pO+Io3zvJr55DJZjswrAfBadLys=;
        b=Yn8uEP++9IJloQ1BDCmMiI3k7Ee8qgEzlCEAYmHEDqta1P+Vib47gUxe6vH3H4XdOV
         OQkpMmnZbDPz5ZX+zt2N196uqkG5xcL5/Kx/Wb43oX4ErRJWdjMi0ew0lu/wjmc8Yjuy
         sFyHWISDMv2E9DqiHP1/J0w2EuhM24mGHNrb4Ifk62k07OzhsHShfSKkxVKjBCkYkmOC
         SfBZ5uckbvCi0a0mbgdNeZ2wy8YvQU/QtZtPC/PFahOvXfByRXvwnLyTDuPoMx64qAnG
         4mFLpCptRa301NI9CDIrmS097PGpKW57ag53WZk2Gx6MJ05SzA6QUFllmNpPRl9jQWFN
         gfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=dZA7yOywUXukdcu5pO+Io3zvJr55DJZjswrAfBadLys=;
        b=axEt24D7cFpTWlvcK2NO+k62JP7RV+n3tl2lSppmVuNwn7e8ib7BKZnf7TqKOIGUSp
         O0kM2fZbqDWFsOKeLZxHm29HWbX8p6JzvwOJMRCGI9jqKzMOQjGWmSb6b3ULa3gYxtgX
         0T3Z8d5QccDNPzL/rpzDUYIx7CGcWmdNSLFjRNTacSjnruNLxvHcpnKCeH7E0As0OTgj
         YOjlXsJJIR38fKu4g7CgwQkFTeIz3Km0cL6WKYvjUM60L+S3wKej0BKMehF4qkNeqILW
         89+412x+zxEzJ+9KolcYSNUKsyXda0e/6fpvI03uuA8cdlDoBSqauRfKDhgwzTsfLVV0
         lHpQ==
X-Gm-Message-State: ACgBeo3xjw6Fx4AFP6XNNtg5+sCCYg1SVcj/6xvBZrkCoaCQL+jD3oNY
	Ig+BYBDgeaZseeMRl/ggceUnOw==
X-Google-Smtp-Source: AA6agR7DzgEgT3CgQhryxKIY8bUl9vYO/MdJ9kGHKEoVxRh7PUHU+GxrH0F86bCtL7LF92AxXsWGgg==
X-Received: by 2002:a05:600c:1d1e:b0:3a5:4f8d:743f with SMTP id l30-20020a05600c1d1e00b003a54f8d743fmr2558911wms.121.1660140096061;
        Wed, 10 Aug 2022 07:01:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006? ([2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006])
        by smtp.gmail.com with ESMTPSA id az21-20020a05600c601500b003a31ca9dfb6sm3347611wmb.32.2022.08.10.07.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:01:35 -0700 (PDT)
Message-ID: <518f22f4-1582-924c-9eaa-28ebbe53a632@baylibre.com>
Date: Wed, 10 Aug 2022 16:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Da Xue <da@libre.computer>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
 <YvJ84qkuXdvVgXRm@sirena.org.uk>
 <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
 <YvOmnDJA+ov49chC@sirena.org.uk>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YvOmnDJA+ov49chC@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_070141_980395_194D5C73 
X-CRM114-Status: GOOD (  15.58  )
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

On 10/08/2022 14:37, Mark Brown wrote:
> On Wed, Aug 10, 2022 at 11:17:14AM +0200, Neil Armstrong wrote:
>> On 09/08/2022 17:27, Mark Brown wrote:
>>> On Tue, Aug 09, 2022 at 05:20:19PM +0200, Neil Armstrong wrote:
> 
>>> When you say the value set by the clock framework does that mean that
>>> the clock driver is adjusting hardware inside the SPI controller IP
>>> block which is then getting reset by the SPI driver without the SPI
>>> driver knowing about it?  That seems like a bad idea as you're finding
>>> here.
> 
>> The SPI driver is explicitely triggering a reset at the end of each message
>> to get back to a clean HW state, but it does reset the content of the "legacy"
>> registers containing the power of 2 divider value, the new registers configuring
>> the new clock divider path (only on newer SoCs) doesn't get cleared.
> 
> Sure, but that doesn't really address the concern - is this something
> that the clk driver programmed or is this the driver forgetting to
> restore a register that it programmed itself?  The commit message sounds
> like the former which is a much bigger problem.

It's what is programmed by the Clock Framework yes, it was designed as-is
so the Clock Framework takes the most accurate clock path but the reset case
wasn't taken in account.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
