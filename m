Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33C2C77B6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/NOdLSoe0mI7LGowmypEqppu9tY50CX/kvtEGCWdK+o=; b=U+/rHHckbnfLQJ
	z+8MSTIACweyqLtQTjKSkJ9fYWF1GTjz9H862sx32ul6xU6ZL76kWttnPFppxx4g4CKEUBATMcoqN
	+UGjNKihCORxWsj+t+J6Qs/39BIDGEd6CaGpiEeYepjegNsoeEVJj1SIWXYGwwezsVeOYLsC/UGzX
	FWSm6LFvY8VUjwfWRBHepureyGvZv6Hf/mYZYpP1N60R+4GCsoc2lsC8MoxvARmOTU94eRt7UirEd
	MdLYIax4KsoxpqAB1GD6Al8esdYOsggT0zpKCUP+wutYeX3GeSQgyOl74BRe3YKkdOB88rzQFWGrI
	kvepbEGiq9NFgQm6AHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmfze-0049WS-0M;
	Wed, 12 Apr 2023 19:18:58 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmfza-0049VU-1b;
	Wed, 12 Apr 2023 19:18:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94771f05e20so435885766b.1;
        Wed, 12 Apr 2023 12:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681327128; x=1683919128;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHL+GbEo29m7+N9Hj3u8ApA5PF4c2FErCrr9m7viWrc=;
        b=XUDR4nB0r8hdQDueDtsXYXRwv47FYJ72enFG0KDr7q9k8WYFzxn0Dh1oxOX5Uj/hna
         l/cWQ7GPfyov3gbxO4JyE5fl7dpGuMrSKqlGFPP6sT59Yv3Cr3E2BdI+ISrODgioRlWK
         6MMiubj6KujBlUG6s5AQ7ln/QTpGuSBHPTOZ2xVD3d+8Tu4tt6CKDM66RjnE/BDuweip
         gK/fjdjIbHNc30j7dkQP1cOI+HZ9uTMVC7If42TSjJGjzfTbz4LuPBA7eoMUr0FQhibw
         UvDXexs26xcrOmwr1DEqB1syCbO/K7uOMRvEbWoNGb+OK0g8hGf2o7j0q5xZQ4WWMTpo
         ZAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681327128; x=1683919128;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHL+GbEo29m7+N9Hj3u8ApA5PF4c2FErCrr9m7viWrc=;
        b=Cc7iil8TmWHL5Bgk0lBTcMI91684KSi2OPAsftJ0vJ+OXDD7ZE2NPUedlhNDUb0HA1
         o8yVdT9Hie61ztdCEST49I2zbSMRDI72HN4VIa8LzHLNbHOz6b283757lG8AqrXJhSXo
         WGefZJjnYfv63OOJwzSRn+lm7h/dUU38GCGZv9uTf8D+FyjKtNlB8huOtnh3gCNdq76w
         FF4b1zqy4f00UIzx6/eADJfKqOr5+ywQvszC4rtvp8LNgF4mg5blb1tLDLeFWEeBsfOh
         7Ja29HByajgw5yYSziO325ef63wxVgCjnLHwECt5pqrOiTAGgd8NwPV2QPvK3jV5KTzB
         rrVA==
X-Gm-Message-State: AAQBX9f1GgP9vo/zxSDzvV42aJGu63Z04OjStE4xZrM1Btd+TI7ikhm1
	mNBg62fVnN5d+bdv1DbB4sA=
X-Google-Smtp-Source: AKy350YeUAb7t76TYhcHgvNYbchZjcQXwJZvGmf45PvpnT5B0CPhp8qcs3kbnzKThyBlwm+NB0PD5A==
X-Received: by 2002:a05:6402:1acf:b0:504:b592:ed06 with SMTP id ba15-20020a0564021acf00b00504b592ed06mr6669455edb.39.1681327128365;
        Wed, 12 Apr 2023 12:18:48 -0700 (PDT)
Received: from ?IPV6:2a02:3100:903d:3d00:b0e7:6bd7:f613:784b? (dynamic-2a02-3100-903d-3d00-b0e7-6bd7-f613-784b.310.pool.telefonica.de. [2a02:3100:903d:3d00:b0e7:6bd7:f613:784b])
        by smtp.googlemail.com with ESMTPSA id i11-20020a50870b000000b004bd6e3ed196sm7181974edb.86.2023.04.12.12.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 12:18:47 -0700 (PDT)
Message-ID: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
Date: Wed, 12 Apr 2023 21:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 0/4] pwm: meson: make full use of common clock framework
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_121854_536796_4A567464 
X-CRM114-Status: GOOD (  14.00  )
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

Newer versions of the PWM block use a core clock with external mux,
divider, and gate. These components either don't exist any longer in
the PWM block, or they are bypassed.
To minimize needed changes for supporting the new version, the internal
divider and gate should be handled by CCF too.

I didn't see a good way to split the patch, therefore it's somewhat
bigger. What it does:

- The internal mux is handled by CCF already. Register also internal
  divider and gate with CCF, so that we have one representation of the
  input clock: [mux] parent of [divider] parent of [gate]
  
- Now that CCF selects an appropriate mux parent, we don't need the
  DT-provided default parent any longer. Accordingly we can also omit
  setting the mux parent directly in the driver.
  
- Instead of manually handling the pre-div divider value, let CCF
  set the input clock. Targeted input clock frequency is
  0xffff * 1/period for best precision.
  
- For the "inverted pwm disabled" scenario target an input clock
  frequency of 1GHz. This ensures that the remaining low pulses
  have minimum length.

I don't have hw with the old PWM block, therefore I couldn't test this
patch. With the not yet included extension for the new PWM block
(channel->clock directly coming from get_clk(external_clk)) I didn't
notice any problem. My system uses PWM for the CPU voltage regulator
and for the SDIO 32kHz clock.

Note: The clock gate in the old PWM block is permanently disabled.
This seems to indicate that it's not used by the new PWM block.

Changes to RFT/RFC version:
- use parent_hws instead of parent_names for div/gate clock
- use devm_clk_hw_register where the struct clk * returned by
  devm_clk_register isn't needed

v2:
- add patch 1
- add patch 3
- switch to using clk_parent_data in all relevant places

v3:
- patch 1: move setting mux parent data out of the loop
- patch 4: add flag CLK_IGNORE_UNUSED

Heiner Kallweit (4):
  pwm: meson: switch to using struct clk_parent_data for mux parents
  pwm: meson: don't use hdmi/video clock as mux parent
  pwm: meson: change clk/pwm gate from mask to bit
  pwm: meson: make full use of common clock framework

 drivers/pwm/pwm-meson.c | 193 +++++++++++++++++++++-------------------
 1 file changed, 100 insertions(+), 93 deletions(-)

-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
