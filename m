Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EB0C433E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:58:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEFB520767
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcMfAex9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzlC8dEC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEFB520767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=whI4MkRfuNtQrqIk+vM/TxJkYP2d/gR1qN1odjkqzmQ=; b=pcMfAex9G9V1Ix8gA+RwLa27y
	GwMi7CdS+oZMv81y39e5NK3zhAy3JU+HlIJVRpBXaYH1RjZ8vkSqJa7w2lyaqpiBLmSawS2uO6Bnd
	NR1O9fhgRG3ioCux/d+InYdWebuSZiv19jU30tDyIFbtbAGBeUCo/uhSb6QljxlrLwMykrh4z+ksG
	HMCcV32Xzw2A1vYIo7Oa3r++/y1pt4yjgCXk2UUKRm0SLAOh8SJ39cLAcXbV/X7ERXMugQoDqhmFf
	S42Rrjryiwj758LCAWdA8zwFBTbVMRkwLXu1UuAdnU4oEwS2tRO07/Ej2RsB/6igTWgqy/LTX+KGf
	bllpojb/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDYtx-0004Px-IB; Wed, 02 Sep 2020 19:58:37 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDYtu-0004P9-Sp; Wed, 02 Sep 2020 19:58:35 +0000
Received: by mail-pg1-x543.google.com with SMTP id e33so226232pgm.0;
 Wed, 02 Sep 2020 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=d+WdgVBE+L/woTERvR0p8b6tQx5/pd39kVl8oSrdHVs=;
 b=YzlC8dECJqJOjLLs2YKQmuohtpWmQk+W/RgohjefJ4o7Aum+uzfTLLoq87rr0RfFzv
 hagR5zptSSAwqVNl9ljQrexXAhAtNNF2a6xLEW2LvNF+ZZp7EylrMYCvb18IT8rEctE+
 wSYEtQ2D8AhKNC+aFBi9bS5yqBJ3DiQRLb1YdVxckFNTDylaqFy7zqk+FFvpmtMJufK+
 ScBJw2tfa27ngWimOxV0/umWO1Xr/UW1PtU8f7y5El6xmPtSnOsvyu7tjgbPNyGh02jV
 Ek02Bz9L9SLWH9rxyMfdX9PXr5LrW9LoxI+4GqJWH2fQV0CfhMQc2jO3JOFkk2ZVksqk
 ZPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d+WdgVBE+L/woTERvR0p8b6tQx5/pd39kVl8oSrdHVs=;
 b=Y4XSZNVVliugW0QUod7OXtVZhjpfxFzT1DiW312Tv06Jnffl2t05vzhn3lXQNARTK1
 zaD1ujWO8+zIGlCF1qQNeRpd1yaM+2/tHmo/bv9rJr3cBZjucZgRwbtLbFr1Eipn2wYJ
 PRw53KxgPEy0m3wJurnJED1zuh3VUyQ5mNm7mcQsvgdIdXxPjqUsZEl7cvp1BKv9XgpW
 Jd+bGRSeEkEvGTqOMNljE38Q5QwiQhjc7qW52ullnODmgk3NoPmblwPu81PEoo0YTFHi
 9NSI1YV33KBvZYbY4rRewSTZAYxjqQKxxMTT0ZxRc5No/v3vj1cBMjCHiEwohqFZM9ej
 8gJQ==
X-Gm-Message-State: AOAM5316RZfh9Sc5gmLmlumKHnPLS2eNDWprSoZ6s7AeOuhovArRUAre
 gZbEqyKufQJkXdCiPX4enAU=
X-Google-Smtp-Source: ABdhPJz3ZUmZlx9FkrlG3QEblvQfbKk0RI98pTqO+CIB7JBEZc5AFqQkvFssp7Rw0LROy2Nln0RVXw==
X-Received: by 2002:a63:4b63:: with SMTP id k35mr3244798pgl.235.1599076712745; 
 Wed, 02 Sep 2020 12:58:32 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id q2sm163845pgs.90.2020.09.02.12.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 12:58:31 -0700 (PDT)
Subject: Re: [RFT 06/11] mmc: sdhci-brcmstb: Simplify with optional clock and
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-7-krzk@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d98f6b67-c0d0-f701-af24-b01f61c4580d@gmail.com>
Date: Wed, 2 Sep 2020 12:58:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200902193658.20539-7-krzk@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_155834_940064_FBC447B6 
X-CRM114-Status: GOOD (  14.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 9/2/2020 12:36 PM, Krzysztof Kozlowski wrote:
> Only -ENOENT from devm_clk_get() means that clock is not present in
> device tree.  Other errors have their own meaning and should not be
> ignored.
> 
> Simplify getting the clock which is in fact optional and also use
> dev_err_probe() for handling deferred.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This is actually an open coded version of devm_clk_get_optional(), so 
this is fine:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
