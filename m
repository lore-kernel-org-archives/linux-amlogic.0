Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA60FC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 22:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6Zo7+YhZjhmmeeZEJ7kkHzR8mKny035NoqQ0r7fgcc=; b=IDjnnNblu01v5V
	mkmHVNSkvyiXAdnfM7VG8m4SP8cKwWU6JceEzVh/g2dpoipr1fBTq2KdHmBplbrL9qPXKKgdSYj0x
	xy1IwYKsmYjkZrB2QeIif3DXTEM89C1skKqH9ixRZQxSo1Xi+VnqQtKRo1n/9Y9ILJDsuh4uK9Ly5
	cjFIhAVEHZYgMzSfLp+pdxTv1BRYuIsSTHBRozV1LvUL2zc0fjrGQ5rnMbqN4Tc3nlcDbm73MTeNF
	SX2BsH5jb1+ssqk+IToq664f3c9dby/C5gLUgo0dyGBCzoD22sRFeszzo7mRZI//PNXE3cadic+gO
	LXZb6RBPVCBGNQTH28JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQybj-00AWOI-DR; Sat, 11 Feb 2023 22:44:35 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQybg-00AWNc-GQ
	for linux-amlogic@lists.infradead.org; Sat, 11 Feb 2023 22:44:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id qb15so21801157ejc.1
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Feb 2023 14:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RN8ini4kSIEIe6s16Cv31uI/YUZKNyoMfAWeJEuaPag=;
        b=krS7efJ8cu+uqnPLAJqTjondbZdr04WZYGqufwpqAXwwS9McrhLa6D8XX5gphmg2Yh
         cLA+sHRWnIYKesekRyFopg+fqXXPPg94EXiyG4ZfGU9Q2eGDGyLifY6La+9DDEvcpd9f
         trVQRCnRhoGNxzY8YuNxw6Sa3ckEPcCGditmpK9w4h24I38YNhIFo5HpJT/03aoSX3Tw
         nlVu2zQJcy0j8Me/tnP5bvCPiSZPTcxRD0k67uXRu+Zt9MlkcQBcXmsy3Inn1lI4rlOp
         K+RBep0UkgByOT+1pwWI2QNSmGxHGNe7m2e+kKt+BGOv91DfyDW6iigqUum9k0bhfP6B
         VK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RN8ini4kSIEIe6s16Cv31uI/YUZKNyoMfAWeJEuaPag=;
        b=5pWTPji8bw7Vpp2B0DEqAHjpMcandqx5piUcIRE0wb0MJ9k1G73cSKf7VUpEtdFp/m
         mtdu4qk0WWh9XxPPadcjg7GjX1gXMiZfoAaEZ6ma5YQVL97duM6tBrkMUxzOWsToGuiU
         qnzrBWF7uJMJjdWukfrcgwRHaJCuMiS5JA7R24Hl3za7MR5De9iMSYVs+nYysV3ZsE4E
         HD1RnevlkvdFddHAO7WVfZR8li+4PXMUEIvW6T00WQ2kLSAUk5e7h5eelk4MXQUKSRFO
         SP4eMfBfnIr5EGUP0ul5sRydBgeX35tnFJHCdLoXzF1vFSNXxghOu0aMQbhLtIgzvxJL
         agmg==
X-Gm-Message-State: AO0yUKXj0X0KBnS9nGyeAcOuvLcllDTJTgofJ7Gk2oPS6ey9Ax3fztR3
	V9cq/1X4I7wexjspuOCJ6Pvu6hJ9QOM=
X-Google-Smtp-Source: AK7set87kMIy22VuZxD4WN1wxnIC5j4Gh+mMI+dPUrSqbFGlZOyQseN435IStD+ZAJuaZTjrBBSNxw==
X-Received: by 2002:a17:907:720b:b0:8b0:26b6:3f2b with SMTP id dr11-20020a170907720b00b008b026b63f2bmr4350660ejc.53.1676155466623;
        Sat, 11 Feb 2023 14:44:26 -0800 (PST)
Received: from ?IPV6:2a01:c22:7bbd:ec00:9d3f:853a:b07a:4e8e? (dynamic-2a01-0c22-7bbd-ec00-9d3f-853a-b07a-4e8e.c22.pool.telefonica.de. [2a01:c22:7bbd:ec00:9d3f:853a:b07a:4e8e])
        by smtp.googlemail.com with ESMTPSA id v23-20020a509557000000b004acba0afaa3sm1264714eda.21.2023.02.11.14.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 14:44:26 -0800 (PST)
Message-ID: <bd2dc69d-f7b0-bc60-782f-34ac497d9507@gmail.com>
Date: Sat, 11 Feb 2023 23:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Regression caused by 066ecde6d826b443 ("mmc: meson-gx: add SDIO
 interrupt support")
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Linux Amlogic <linux-amlogic@lists.infradead.org>
References: <Y+fU96RVq4GwKaDH@geday>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <Y+fU96RVq4GwKaDH@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_144432_695441_72792A28 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11.02.2023 18:48, Geraldo Nascimento wrote:
> Hi Heiner and Ulf,
> 
> After updating to kernel 6.2.0-rc7 from 5.19.1 my H96 Pro+ TV Box
> (Amlogic S912) failed to provide wifi. The module in question is a
> QCA9377 SDIO driven by ath10k.
> 
> Reverting 066ecde6d826b443f492570e080cba3f2212280d
> ("mmc: meson-gx: add SDIO interrupt support")
> solves the problem and I have wifi again.
> 
> Thanks,
> Geraldo Nascimento

Supposedly this patch revealed an issue with incorrect interrupt
trigger types. A fix is currently in testing:
87ef638d6557 ("TEST: arm64: dts: amlogic: Make mmc host controller interrupts level-sensitive")


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
