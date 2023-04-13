Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187ECC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 05:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q/heJGCIXhRVzJHzJcyY6lrBoash08diXf7eAExPvPM=; b=QmLaB6CG6tDRD6
	omRF0NtDnu2R07uru9iifaSShBjRVbWXZvxQ5pU5VrOmuj3gdGeZENc29peIebu3a8fjYMHf17yta
	Awso5F1L4eZHNdTRJ767aXiOrSV0CvnDje9V9eoR/O83K9MbwojIgnOWb/OldCV6GKyu6vGE1s3CO
	AAsyV9XOHhPxWPHBkNNOlB+uuiA1Z0oTy2Rlk/qRNdgvuAQIEKzZiXozDEB6xVRJLBv4TWX1oSmPo
	CPzUtDOPj77oEhfg6ejQefyNaF2HFIzjXbFvKnbeHFBu+sSRapP5Yod6YAf4PSffEzlaXb4v/vh+H
	72Oi1QP3IAtYHwEqU1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpoZ-0055Ya-2M;
	Thu, 13 Apr 2023 05:48:11 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpoW-0055Xb-08;
	Thu, 13 Apr 2023 05:48:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id xd13so610863ejb.4;
        Wed, 12 Apr 2023 22:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681364885; x=1683956885;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loG6/nNlZHds9iDZ/llqwsKTKK0tTKbPN/EvQ2kHqi8=;
        b=rZNKWEG+lBr67Y7w6dmDQo9WQ4ViFJd8IliYGaXFTnRwCVhFBEOPGoNBjUCjE6LNhm
         AvFWYIoX+BTMXe4xHmIVOg/mGVc7gLagkQFG8F7GUHHIPKMWJTCNGgwp2PaGILAfAL44
         8hzIEyi4KQWv919RIpUwNzmt4dSdXdZC6b0Hn2SyGfeUBqmhueWkX9drFvelayS3Jqpz
         p8TE2Kd4IkcLmrYe3HSQ+Jii9aaB6/cGPRVgRUUHeEcGHHB8oOuX0oWwE1BXdvLC07HY
         l+j2DrFS0fiDvEueAordmAdK+/1/kqML09zHZhDSJIEYmZL81WPrwlW+DuLdKJ5fd8SU
         Xt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681364885; x=1683956885;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loG6/nNlZHds9iDZ/llqwsKTKK0tTKbPN/EvQ2kHqi8=;
        b=iCcYHLWAWJyw1gHpLcBAqoAN91Yk7RkmeOq7fY/wR22Oh369X0OWn+3KocsyViggy0
         9HNAwKD/bGn2Ug19AOeUwxqxYTrRpKiOaspbYhrpzvKPRAa/3YQEqT2bjyLkmvu2c6kz
         Ti5AtFP3ZjA1NWULktkicRyecXoRBrv2f+yC8I8Qf0kPJW9BHE7rghHfE8vEr9VnbkTO
         R17NHYhGdG+PXywnq+dLmBxaS+bHyarpEbq71z0Q5sAphdQxLEwzxd2kQiOY0E+Gc+UX
         2TDKP7nU5SS8Y3sAjrLTgr1tXaH2EXGkxmHP6IfastKNOaZcS2IdO2kfY7k3JJC4rsYs
         LzMA==
X-Gm-Message-State: AAQBX9dAckUULqkLgE9FN0yT6Jkxd3UEKAQNWB/CON34O9peLGrr7iVo
	M8kMGPs/zSXQ8jCWE6NCWzQ=
X-Google-Smtp-Source: AKy350aJMK6ch3QmrVjXCt4gPQEI8VdaDXF4Sa0VlTOe1fwE4sekT0JzPwqqE3LqHXkVJ/3SC+XYYA==
X-Received: by 2002:a17:906:3c16:b0:933:be1:8f4f with SMTP id h22-20020a1709063c1600b009330be18f4fmr1343030ejg.9.1681364885412;
        Wed, 12 Apr 2023 22:48:05 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8? (dynamic-2a01-0c22-738e-4400-9dd0-adc5-d6d8-61d8.c22.pool.telefonica.de. [2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8])
        by smtp.googlemail.com with ESMTPSA id dc14-20020a170906c7ce00b0093237bd4bc3sm398805ejb.116.2023.04.12.22.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 22:48:04 -0700 (PDT)
Message-ID: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
Date: Thu, 13 Apr 2023 07:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v4 0/4] pwm: meson: make full use of common clock framework
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_224808_098746_6B05722B 
X-CRM114-Status: GOOD (  13.31  )
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

v4:
- patch 2: improve commit message
- patch 4: remove variable tmp in meson_pwm_get_state
- patch 4: don't use deprecated function devm_clk_register

Heiner Kallweit (4):
  pwm: meson: switch to using struct clk_parent_data for mux parents
  pwm: meson: don't use hdmi/video clock as mux parent
  pwm: meson: change clk/pwm gate from mask to bit
  pwm: meson: make full use of common clock framework

 drivers/pwm/pwm-meson.c | 201 +++++++++++++++++++++-------------------
 1 file changed, 107 insertions(+), 94 deletions(-)

-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
