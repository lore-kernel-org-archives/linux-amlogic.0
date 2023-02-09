Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0919C636D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IeB1cbj72vr47Ls31hehQqZ3AmIk97TFyTauh+DK5VA=; b=pMPer94SWdVx2M
	eu1boCLMbMlW7ZB0ohQetOxYrdvEioAGlpDQn1eZyiaS8nkwO9K1n73Hm8SO6bE1ABh+ygZLfZujP
	F6wqm7qWpO+5+7ezdnwvem2wrNx0r5cGxO3k5IxvDbT6kJomu6PgG9mZInpapX32pWtvuSkLl9xVJ
	/7tDgVMEcnpxDSONE+cmGeV4R1OSY0r8ToIq4Yc8BJATS9d4U5L+SEXLUVdjxv+aLWfq/3PZYBOks
	+68K94l7xOeaQJ7yRQv4zuZ53JbdOFBBp5F5LYGwOBHxJOER9WwTYGYTMkt1Ncl9PqXsDBnuzXzA6
	+ckxgKHIcKsyiyV2EAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDEd-00379h-RM; Thu, 09 Feb 2023 20:09:35 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDEa-00377X-SB; Thu, 09 Feb 2023 20:09:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id r2so2991992wrv.7;
        Thu, 09 Feb 2023 12:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivRUe9zls1JZIzyc5R+BpzslXzUdcr2xi24o8k2S5k4=;
        b=OEBKzLwTS6oBpGKL+HM53KbzdkGPWvgNA/DiOObQt16SJE5OzQ9YzoXgvGzxQU9hkM
         S57BdE24DNEKZUGFoZrZwo534r/oleDBMFqa9udB+7WCj618EOCM8yXY00pjovh8EglC
         YHSFNMV7CL7ryIaKPTFB7WYfU7ao+LbYX8MmGu+1zktH94O8ELhDkFyh566u4ILcdW7y
         wfgX5igA89Znq4BxTZN3NuuzIg39cgmHXujlkjOUxxvgiUdgEzGRfrifkBggGxTxOxev
         UfB9b1luvLkfjM70xSgClJyZQplphsWxWIK7m9HvHyea0lrJOm6F6XX3pKiLCcZDGLR+
         ZOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ivRUe9zls1JZIzyc5R+BpzslXzUdcr2xi24o8k2S5k4=;
        b=q5qr2+y01xPW8f46l326HYuE8q77+fxdiVCsUcfqIUrQ9brt1q1Jx/r2SxNZmLetI9
         x8uGDB3WGF66m2L2mrSox0aEUBTFM8zylPYw2salb5kCXPhRJGEJAlkuFA52rEnvDQJe
         4Dc2BsJ+fcAc3olcZIZdetqhv922rOHJXGEGkPTK4wEPiGh96JUlkzMPF+/WlsfW9VZb
         hVQv9i+6wfNjmC3DroLb7HWUVKu+j3X1MFOciPImSDbpPfyfenx37eML6HAnW4Nj96wN
         Wk6MuCeqrnO9BYZjQqMqbX5XKftytDYUHxsey84UU3KvGNOE3Fo7Rpde5PFN33sLVlL3
         Y7nQ==
X-Gm-Message-State: AO0yUKWauwz9kv3gyoEZ6Etaf5jPpj57chsi+y5JPghx+vOrnlssjVEE
	TxU8OihwNCTciCmER7VOm44=
X-Google-Smtp-Source: AK7set87nmOwJrTeYysHyQMijn98Hi07IKrg5T4D3ytrT20sGWygUYA78XeJO8D1Id/wuzK6KBxcow==
X-Received: by 2002:a05:6000:12cb:b0:2c3:ea6a:74d3 with SMTP id l11-20020a05600012cb00b002c3ea6a74d3mr11934914wrx.23.1675973366919;
        Thu, 09 Feb 2023 12:09:26 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4df:e300:c146:1250:ead2:43ad? (dynamic-2a01-0c23-c4df-e300-c146-1250-ead2-43ad.c23.pool.telefonica.de. [2a01:c23:c4df:e300:c146:1250:ead2:43ad])
        by smtp.googlemail.com with ESMTPSA id d14-20020adff2ce000000b002bc7fcf08ddsm1939537wrp.103.2023.02.09.12.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 12:09:26 -0800 (PST)
Message-ID: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
Date: Thu, 9 Feb 2023 21:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Nan Li <nan.li@amlogic.com>,
 Vyacheslav Bocharov <adeep@lexina.in>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] arm64: dts: amlogic: Make mmc host controller interrupts
 level-sensitive
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_120932_959605_987B0E06 
X-CRM114-Status: UNSURE (   7.72  )
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

The usage of edge-triggered interrupts lead to lost interrupts under load,
see [0]. This was confirmed to be fixed by using level-triggered
interrupts.
The report was about SDIO. However, as the host controller is the same
for SD and MMC, apply the change to all mmc controller instances.

[0] https://www.spinics.net/lists/linux-mmc/msg73991.html

This series replaces the prior "TEST"-annotated patch.

Heiner Kallweit (3):
  arm64: dts: meson-axg: Make mmc host controller interrupts
    level-sensitive
  arm64: dts: meson-g12-common: Make mmc host controller interrupts
    level-sensitive
  arm64: dts: meson-gx: Make mmc host controller interrupts
    level-sensitive

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
