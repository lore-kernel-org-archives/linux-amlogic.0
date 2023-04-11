Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BD2C76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QghfGkWsZChKTcZ4YsUo5Ar+2QMBobCywJtu+0nGQ8U=; b=v6Ns9tuCCGYVpq
	jok49rckZyBd3puvQuzxKj4W3zuUEs0+4NE+n1g+SmNCvc0XkI/DEPxGme8wuKJ/V94TbnjC3Oe/P
	cClqnxJHK2Ipb+SkhYf8rSK/GZbihLHL/RJtSJBibItewXZvF9bu2vIp3s9IDH78Nx86jBSJ+sy6w
	PdrVLdHO8oT9En6Z4a91IIrGkuP1OUbEbI4k20vG6ixVxN43d8YSMPsBaqiUrnPmvIoAu8Bf5k/aD
	hfi4ZclDI8VKPOABI0Qfqyrchby3K5HHayMvs8+UzGp/QyuSkgRu8ooC7ulRyZql9fEzmr+72jo1r
	Qi3e3gUdBGvTSg9Is1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJYV-000vhK-2q;
	Tue, 11 Apr 2023 19:21:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJYR-000vgn-3D;
	Tue, 11 Apr 2023 19:21:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e22so8555291wra.6;
        Tue, 11 Apr 2023 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681240880; x=1683832880;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WsD3ulAldrPfl4jq7HzDtaOpVHHFfOPvMBT4AIJDvI=;
        b=q/C67sxnz6klbc/YjWmAgCrDV+pCyZSUsDjbbYPcC2gjrlQddiAPKpqQO7dGM0jeuX
         LYUXQ7tfcVL/x2A3N4o92v0oWn937zYcqDt7jdzqBOF032FuB0Qcb7mgkbuY+H4aH5XQ
         dG85J8Cqf47Uo8U0fJxhAIp+Q4njGXRsY2zftUNklFIkZWXfv+QQ92iv1YbHQXOFRLKo
         JaREsPsF/KmU6UyURrb82rYNCvFYICOELosv3Z2D4cqUTZdfmDxPOf7iQugsVpxJkqYO
         rYNENj7nnuAmovASNSyFaL2mxZJV+UPk0b27asFTuVt5vMqYITLoGK/QPisaddcpM6YH
         uqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681240880; x=1683832880;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6WsD3ulAldrPfl4jq7HzDtaOpVHHFfOPvMBT4AIJDvI=;
        b=L/qxjHreZirFT0T+R2ocMoI6eWDqNzT/GNdwjN8x4u9gVgrvzdiHqKGhyJ/ShkiZ/w
         7bEGVXA/ZpUE0cEeQyrlJwPVeDQk3GiIPkg85+of05VbRGVtU2tMQoPi6k3MGQjC+2b/
         3Plkc8Qs6jSqkzDjzolPYFp+t5JdVVygza7TAbcybFhLs2i0Q7olnhbfkUTta32zVQGS
         OlcVuHbIF2yz3do1PRPyPK+qW5YG7Wnbyfa07IpzTYlKwt8Ay5MB4zOPVNJrpaP8d4so
         bSVnzYhK8vNWmNXpIC+1YBE0ydZYeFYZgLrNKe6tdgJzzvJ6jReqRNnLqSAg+8i0NKv1
         TtpQ==
X-Gm-Message-State: AAQBX9fmesV/OYuDX8oIyJ57g0/G34Am938wYf6ZjmaeU+XryguNg/dB
	x/7q/Vtl3Djg2YCiYI1DzX0=
X-Google-Smtp-Source: AKy350aNZsG65tT5LwNBQ3xRfgNbyGtgCVak19iUXnnhOUDj+Gj5w/NbPmbs3LiWJPjPl7MhCuBlBQ==
X-Received: by 2002:a05:6000:1a47:b0:2f1:dae:100c with SMTP id t7-20020a0560001a4700b002f10dae100cmr145987wry.5.1681240879859;
        Tue, 11 Apr 2023 12:21:19 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4bb:c200:90e3:4731:63e4:d333? (dynamic-2a01-0c23-c4bb-c200-90e3-4731-63e4-d333.c23.pool.telefonica.de. [2a01:c23:c4bb:c200:90e3:4731:63e4:d333])
        by smtp.googlemail.com with ESMTPSA id fm7-20020a05600c0c0700b003f063a709dbsm3886004wmb.2.2023.04.11.12.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 12:21:19 -0700 (PDT)
Message-ID: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
Date: Tue, 11 Apr 2023 21:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/4] pwm: meson: make full use of common clock framework
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
X-CRM114-CacheID: sfid-20230411_122124_053761_31F4A686 
X-CRM114-Status: GOOD (  13.25  )
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

Heiner Kallweit (4):
  pwm: meson: switch to using struct clk_parent_data for mux parents
  pwm: meson: don't use hdmi/video clock as mux parent
  pwm: meson: change clk/pwm gate from mask to bit
  pwm: meson: make full use of common clock framework

 drivers/pwm/pwm-meson.c | 194 +++++++++++++++++++++-------------------
 1 file changed, 101 insertions(+), 93 deletions(-)

-- 
2.40.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
