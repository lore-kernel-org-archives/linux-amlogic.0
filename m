Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90817C636D3
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 23:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ol/cEPpr5+p6M0+2ibeK23djQkbhe4ggQX8tRv5C37g=; b=e6pHBFsIK8AKEU
	aGuxqzyAGSz9HE94fU2mdfTX452e5SOKR05APzNENRz2IX8Y4iiVUzYo6xWNcPZlkJw7g0ecEUvjW
	lnFuKriCJBIbA+HvSSHg3CDioS5XA4aAoHq6+IU6OQx8GtUBXxCKTFmle9o+90UhalZTIxvEnIPhJ
	5zzQLW9iNuXz0dZjFplRsra8SlDipEBcMyrVM6peMD5dsGp7Ue25Sk8M6I+Ca/00RTL+JTtoUH+Qt
	ntSoiDIUqVyca1GxIfst9T5envX22sUF7tke3U4j0GtVGdEHsmdnUOUtkyi4AQzWAmsKbetp0sNie
	4It6yFaGpX/09ATcTLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRLpb-00Cbna-K8; Sun, 12 Feb 2023 23:32:27 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRLpR-00CbmC-CW; Sun, 12 Feb 2023 23:32:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id bt8so4931602edb.12;
        Sun, 12 Feb 2023 15:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVenlwMH7zPhCytzFEgHgQa0+XAKJpBrd43+0QBLARA=;
        b=Dwxmne8u7AwHO2RTEZtixq0CKD+kAKWqE9guxMYWCJM0MLRCpv3xiOUApFQfxvkDGV
         X+CD8dJG1nUbUfUbFnBDKIiTVkmrj3PLF6trv4GIXmCoWKrpeA0fjV/jBPs7xDrnhSAD
         5klMKuUi8AqlHHMLVuR4rNagtXDhTlIPOHrKC6ZqEY5owUFHd5px5RvQgSkXC6UkTHj+
         foDJls2Ll97v2e8RwapWekpBmiYvnfzR3gcFGnvQzcf8hVjLI6v2RO8TamlMbe1X+Kpu
         c7Uiw3/vJijz/WYQDokxIDpkWlEQ0hbp6MgCHv92vN7HXlYbibbrngoLNdFfwM/1UxwH
         yt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVenlwMH7zPhCytzFEgHgQa0+XAKJpBrd43+0QBLARA=;
        b=o2TSvg8fx/HcetoM/pwb4ZAMAyMJk4vU0mZcVnQ3bdQh+/XJIBFs9E6/eoFtSSOQ81
         u9JXkY5gJIkTRTQyjcm3liDcegT47N6e3obtQtUnfqLowpaJSUXb7AOBs4BF/Ix6+6X+
         cYQ/eDvjd6fL7lA87UXtD1SKdy0k3GqWoX39j7ZEbQU944HH5iCxY6foPImlCUuVmNmv
         RFOvbgS6L+RYxcZr5dF90SdMLwFkr0Jc3PWtRGScrmdg7BCy6RQrpO4qYOoOJgAwStiZ
         v/wZ65fw0oKMYrmSuck6XO/AsWkSOEBZVc0bUCsjtLkeeLGs9BEky5i/a+Tf7FaaC1Ii
         NCmw==
X-Gm-Message-State: AO0yUKV5W3YAE1qgwWsEspl/aNbcmiz7q4zvPTn1LiXKaLhUVEhtiU3T
	vE86GVavtXSa4n9w6gBP6NpoIBkezmg=
X-Google-Smtp-Source: AK7set/hraYgPFTvvdtr1Iza71ciF7HXQj2fByv09IC0lsg94o8OaOD4iQUkhu14r5RiC3iYIg0GVQ==
X-Received: by 2002:a50:ce06:0:b0:4ac:bda5:5f71 with SMTP id y6-20020a50ce06000000b004acbda55f71mr5713568edi.11.1676244734225;
        Sun, 12 Feb 2023 15:32:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:bdd2:4300:1932:303f:b63a:5a0e? (dynamic-2a01-0c23-bdd2-4300-1932-303f-b63a-5a0e.c23.pool.telefonica.de. [2a01:c23:bdd2:4300:1932:303f:b63a:5a0e])
        by smtp.googlemail.com with ESMTPSA id dk19-20020a0564021d9300b0049e09105705sm5717018edb.62.2023.02.12.15.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 15:32:13 -0800 (PST)
Message-ID: <200a29cb-5b7b-47dd-6bfd-a5855ec7be58@gmail.com>
Date: Mon, 13 Feb 2023 00:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] mmc: meson-gx: fix SDIO mode if cap_sdio_irq isn't set
Content-Language: en-US
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <9e296859-0363-ecc4-2d99-fd0239efceff@gmail.com>
 <Y+lqTSqKm4a/qTDN@geday>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <Y+lqTSqKm4a/qTDN@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_153217_491385_14C79EBC 
X-CRM114-Status: GOOD (  11.92  )
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

On 12.02.2023 23:38, Geraldo Nascimento wrote:
> On Sun, Feb 12, 2023 at 10:54:25PM +0100, Heiner Kallweit wrote:
>> Some SDIO WiFi modules stopped working after SDIO interrupt mode
>> was added if cap_sdio_irq isn't set in device tree. This patch was
>> confirmed to fix the issue.
> 
> Hi Heiner,
> 
> with this patch, with cap-sdio-irq set or unset in the DT, it doesn't
> matter, I get the following warning on dmesg:
> 
> meson-gx-mmc d0070000.mmc: unaligned sg offset 3148, disabling descriptor DMA for transfer
> 
> The offset number varies between reboots.
> 
> Is that to be expected?

It's a known issue that ath10k may pass buffers to meson-gx-mmc that don't meet
the meson alignment requirement. See here:
https://lore.kernel.org/linux-arm-kernel/CAFBinCCN88nfSnmPoFq4H_ROWFMbq=Kcpr1W6CpNs58XeHtV2w@mail.gmail.com/T/
This means there's nothing wrong with the SDIO IRQ fix.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
