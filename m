Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F28C38A2D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Oct 2022 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH4nvVfzDJs4aB0jlN0NnXZU/awgAeJJvVR7l2PM7lo=; b=2tIqVsdq7s8VzkaC1ESWXDFP2k
	ii5OKcM6K/12CVjZPopAoTa+cf7lv2VU+B5IE5p5c2wMK4T68OLNAHzsfRH3qFFRig0LeuvboREWG
	9JwyWvAlghAzV59t7ZQelDJrKtR6XgFlDjP/OGL/GWFuXKTxauSg9XHz7gw3O3Kb1wOWbZhF0zoBb
	dZMRuySQfp1WrVvTwRlzVryqfLKg+MBCCH+xLIP4G9oqw2g1x7aUfH+Ms3U0WgqMl/TcOuVG/MOdo
	iHVeXHjhe/idrEyDGSHdMQd3DBZuSi5QcCmCgNMFSPpPb8gcXZjzKD1l1d5EfeX8lUllsMteBo/+x
	EWfovx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onfq6-009GsT-Rv; Wed, 26 Oct 2022 12:48:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onfpN-009GZG-Ob
	for linux-amlogic@lists.infradead.org; Wed, 26 Oct 2022 12:48:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a14so23347855wru.5
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Oct 2022 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sE+Z+aKLJBtR9+dUAYPrvxdETqNrnLtSJWEUx86MZUY=;
        b=LgFZ+HsJWkjGEKA11bTVdRFztvzXwO9fKzUQAqIlxHUGul209ZoEGwdHDD1HUDsubN
         mxURJ6DB6lufQtk/JQuM4mQkBkRLVSihiMssJVyBnADDKCR8VS2mqsDJFRl8yO+n+SFa
         4ruiHOfTIYKd3p3YbDfB3sj38wIoG4URoTTBTdoD8iWbwpMkR//mHaqIDzGG2Y0pbaEP
         CpdOBioxo0xDqR3VzspalN+DtOlnFzeIKzXsznYgdmBfSFf+TaAPX9vuPCPGnhVJofQj
         BO0iqSH7FTp1lZsWOh290I3LKbKc2GnRkGH+lAb7iNTToqdAOOrL3Nu/jOy6axNEXX2I
         BXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sE+Z+aKLJBtR9+dUAYPrvxdETqNrnLtSJWEUx86MZUY=;
        b=Fz6UYlSkPutNrzsHj5VHDaGLztOZ8dRjdgWbYRjCbWRZYobiC5coY7dPNmSH3aWoj1
         GlzYovjBk+IoQi2qEYGLwepBPDPtrpanY9fzVoPFA5uyDHVky/Ha8bHvTPTKtQqcj9et
         78Db3XgjngJhfcuZXubN9zZQLjQyIdPx4NyzNvogOSYMe3TrBMDpDhYj2GqYgppm5pR6
         XHgckj0G/TOt8YasfIHpHLvm6XnSSZdcaHxWLxoFhSyEjf5Wd+Vv+jqTrVuZJ1cLWBFt
         N45kkWZgC6wFkEDt1LW/gtUi9QbMevUfRMi7/Q+MCuL54D8pwcTMkNqM3aTKOpyBcjCQ
         LfhQ==
X-Gm-Message-State: ACrzQf357b1NAWMmaoysqHsRFt0Wtq/UiPuAG2Xib2OoSDmnNZwJvEfA
	cYzkAy66gQFM3fDy8GBJavUDJw==
X-Google-Smtp-Source: AMsMyM6G0WR4Rb+GNc4kV+pKzodpC/zISi+uYoMUyMA4pSMIWBEbJUwfnw3+ujlVLTZAFzYSTCzM2A==
X-Received: by 2002:adf:e94b:0:b0:236:64a5:4038 with SMTP id m11-20020adfe94b000000b0023664a54038mr14561473wrn.321.1666788488542;
        Wed, 26 Oct 2022 05:48:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce41:a140:b67e:6c4b? ([2a01:e0a:982:cbb0:ce41:a140:b67e:6c4b])
        by smtp.gmail.com with ESMTPSA id n2-20020adfe342000000b0023691d62cffsm62991wrj.70.2022.10.26.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 05:48:08 -0700 (PDT)
Message-ID: <7fb8e635-ef61-0773-eadc-7a5723740df6@linaro.org>
Date: Wed, 26 Oct 2022 14:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] spi: meson-spicc: move wait completion in driver to take
 bursts delay in account
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org
References: <20221026-spicc-burst-delay-v1-0-1be5ffb7051a@linaro.org>
 <Y1kql/WwAX+ZV8us@sirena.org.uk>
Organization: Linaro Developer Services
In-Reply-To: <Y1kql/WwAX+ZV8us@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_054813_855953_11E2A630 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,


On 26/10/2022 14:39, Mark Brown wrote:
> On Wed, Oct 26, 2022 at 09:58:28AM +0200, Neil Armstrong wrote:
> 
>> -		spi_finalize_current_transfer(spicc->master);
>> +		complete(&spicc->done);
> 
> No, you need to call spi_finalize_current_transfer() - you need to block
> inside the transfer function if you want to open code this stuff.

It's the case, I added a wait_for_completion_timeout() + return 0 in meson_spicc_transfer_one.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
