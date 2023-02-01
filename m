Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1611EC636D4
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8QXXCtErm0dJzz3mWBXY4h08Ry3KqVZ+uRj5AaZgs74=; b=z1TpNqLO6aTHPn
	6wWCSCtrhPpolE3Va9Z7KwM2lF6bbBCEnWmvmEZvxBiO5N0umNIy/JHmNiKQnwge4axTMrXwQ1+oR
	79XV2WrHRy3IueTbCe2JJjIH8PWFnnbxEUmtC9gWIlZp0zafqmtvw5q+KGCFM2HvZ6z0yZcDhw5w1
	moSw/+KXftFX0tOhEEIuZ3IDZT5rT8b40/yimDwBtqCxv1YlzAgz9RuG/3n3BkbgcdDeKCP5s+nbI
	vqRffMYpIhqxyiMxHlxaNGYOPvjSSayj4kehGfPgT2oPqy0Qp1Sx3G1iJJHPZZBzBi1TKgDpwUonn
	1d8/48BIK3lRa+uOREHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJEx-00DRr0-C2; Wed, 01 Feb 2023 19:57:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJEu-00DRq9-Eq; Wed, 01 Feb 2023 19:57:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id v10so18866114edi.8;
        Wed, 01 Feb 2023 11:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbuyl7LvCUFmULBk+luDWMTsBcFBqdWcL+IpHpfcGe8=;
        b=YR2Tw7n7yEIg54prt0s3LcXFpSYSBWD38YayxwxASTIO/s4OiwgLtubxtMwcMpH8+S
         xMCpEUhiezRxTh1x0Std5TnmWm0nyqVE8zFpB5SpjfTnkvSIlTmqbHl9qn6js/hZZf3m
         p7ou6b7YW/fZKwVJBJCNLlxLFvcdBhxxtjifzN1Y6CqfKqqm7vo4vHRCcGIjgpHVhWfq
         WI/m0+NSuKdgrfq54Ue739oXqIPyzzfhS0XMZB7bwMuuVt2Esb/Xf8GtQ8ke+c4DfEMl
         dIFiV2w+0G+aIYVMpV753+GJvS6mUlGP1gMkeNz4InzHIztR6Rj/wLcyhEjupIU0u+1R
         Cllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbuyl7LvCUFmULBk+luDWMTsBcFBqdWcL+IpHpfcGe8=;
        b=3RPXJwMSQveC78SBT4exzzbfTn9zS95AZFGX/3WLoPadY0czB9COM8NpqwenWOz5uF
         TFhjFJ3TYnXeTuw17/wz0YWLXhMgGabyOtif0MNsnUlTYgnz16W4GZUf/YhRWvr4Mm9u
         d7/ocGHXSGXf6DkngNKONmy617DJg39q7n02fJRWe3euWuG5/B2rS2tUe2DSu253N+S2
         U5DfwlrJYYwQ3mBfOOLRpsDKYOzrz3Y9nvkxOsHzNuP+gJ7UtkspLoFZxyzUcED5LX9i
         275EGJQfYP45mRKWSbyQWK5BA8effgcg4FnK9WZFE5O35F9da/j8+jdRNomsk1NCpoYy
         Z3qQ==
X-Gm-Message-State: AO0yUKXKRAx926/w5daQi/RNFwdMjur8A07BjStgwectvUkPWPouk1mm
	rQnYEEoTyP4P/308NhAV8zY=
X-Google-Smtp-Source: AK7set+GI7HhysY3JX/WRp5iUFfCA+K5YmLjYE53kw7Js72+bUO9lFyXk/XUEc0wQuQNk34amxoXbQ==
X-Received: by 2002:a05:6402:292a:b0:4a2:471a:4d26 with SMTP id ee42-20020a056402292a00b004a2471a4d26mr3028603edb.10.1675281470074;
        Wed, 01 Feb 2023 11:57:50 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id m5-20020aa7c485000000b0049e19136c22sm10170677edq.95.2023.02.01.11.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 11:57:49 -0800 (PST)
Message-ID: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
Date: Wed, 1 Feb 2023 20:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/4] soc: amlogic: switch bindings to yaml and adjust some
 dtbs's
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_115752_527488_10ADADF4 
X-CRM114-Status: UNSURE (   9.56  )
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

Switch two Amlogic Meson bindings to yaml. As prerequisite adjust the
order of some compatibles first.

New versions of the bindings have been submitted as individual
patches in between. Put it into a series again.

Heiner Kallweit (4):
  arm: dts: meson: adjust order of some compatibles
  arm64: dts: meson: adjust order of some compatibles
  dt-bindings: pwm: Convert Amlogic Meson PWM binding
  dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO
    interrupt controller binding

 .../amlogic,meson-gpio-intc.txt               | 38 ----------
 .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 70 ++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-meson.txt     | 29 --------
 arch/arm/boot/dts/meson8b.dtsi                |  4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  4 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  4 +-
 7 files changed, 148 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt

-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
