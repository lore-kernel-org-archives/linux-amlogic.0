Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9E8C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a9rUOtKf/CICxTffJI0lNMlp6UEpjS8RYP33j9CDcn8=; b=y2xnNObA+85aXo
	QUmciv72yLuYVNqU2jEGiJCE5PxE1+EekX+gJlDnrOlKu4aQANU3sGeR/+VsRYXHbebrMcSOqVwTU
	DNnc+2d9wtD00DPBGdQLy90GdpzlJWD36xe63eaaf5ojOlGAGdDIlW1hHOSEB5jqth94JIhVu03gL
	oxlUxxvWdxJPdL8h8vNi2mIsY0DpCDAnQehqnGMWOFT0fm0ZVL0s7L0VjkHJI6nadtDh8XD92EkE7
	0ewCfiSuVg93df3TnLCGz7P6IhZ6Ni1EXPCCE9lkGePy4A1bKsgoFQuBnzW6KpWtlzr0y8VYVOnPN
	9wJzxk3akSr7UlMCnL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uQu-00EVcL-0Z;
	Wed, 24 May 2023 19:46:04 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uQq-00EVbU-1K;
	Wed, 24 May 2023 19:46:01 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-513fd8cc029so2836926a12.3;
        Wed, 24 May 2023 12:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957556; x=1687549556;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJBMgKyzjGmRjIWUR1hzg57IJESWeFQzE9dVLEiDeng=;
        b=si0GiXYBLkwKIaZ19ww1BFocAeWGSAlmhQuNnkfhcCztBNDce4daYDHvJVoVzwqCz0
         CVKZREok/8pfiHAvlJb7oEOR9yLFqZbu2IEP5aAZ5D2skVd625L1lEM8BZqz6fTZ06rg
         okro+Y1lO/dt+R06w3gUywvYvIXUtxOQ5lqpa1dzHdpjMMhtWsYYqY8SAyXgobRq7y0d
         tDnLMTjE3vyTj4RWf34Dsb6owdWvDMKm0KDeCmwe+IaPBnqKlzi5FUuS8pLluapGdJ2C
         wtEPt1nMV4F4fnz6OtG4TyicHMlOnEb/1YWXUTlWgIOY3mYLY2Oa+jSaL6QT4I3qqbOt
         NHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957556; x=1687549556;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJBMgKyzjGmRjIWUR1hzg57IJESWeFQzE9dVLEiDeng=;
        b=fMyKpl9BX+LiJoxAMlS1M/kxYoG7wgMBNFJVStKA1p5MRDDnbq2jvYULPSFqAmhg+b
         e/rQG0MT5fTGG+ryop659/utA9JXcOmaVu6rY8/YbFQl26vEEx9pzMk7rKeif7dizRRR
         tOgqxkBopMNlRF0J6s6PhR+Tz0KkbmPjmxAaJz5a5/IbEJYEzzaIyHXS8OF/Gv1Qe9OP
         2Ci4K0CgNmKhnl9L3Ujj1KT1BxBHWOx1ZCYdID013d45Bzwxky/zeHzqyd96S3VXEJAp
         F7JLR7iNirbrO4iqKZAjgoXVgZ4eguYjbFD1/UjsNwJwVC8T44g7g1p0mDzvWLbMovSf
         VHoQ==
X-Gm-Message-State: AC+VfDwO2uF8pItOGuIbyhTfj/Ey6qSOXm5j30auTQq+dz4vq87fWdkT
	bdjnx7QILuWUgT/OKjNoKvYjfSTlnaY=
X-Google-Smtp-Source: ACHHUZ7oX/oqp2PFGuXWxjhOqnJ8ypydNeAzP+gQrCOTWEsB4a4ybcpktfvN6oAfVayKobEuOf+vOA==
X-Received: by 2002:aa7:d8d0:0:b0:50b:c4f0:c200 with SMTP id k16-20020aa7d8d0000000b0050bc4f0c200mr3066855eds.41.1684957556452;
        Wed, 24 May 2023 12:45:56 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id p20-20020aa7cc94000000b0050d56dffc93sm246444edt.12.2023.05.24.12.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:45:56 -0700 (PDT)
Message-ID: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
Date: Wed, 24 May 2023 21:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
 linux-pwm@vger.kernel.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v5 0/6] pwm: meson: make full use of common clock framework
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_124600_448903_EB19905C 
X-CRM114-Status: GOOD (  15.62  )
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
  frequency of ULONG_MAX. This ensures that the remaining low pulses
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

v5:
- add pending standalone patches 1-3 to the series
- remove ex-patch 3
- ex-patch 4 (now patch 6):
  - add clk_en_shift
  - use div_u64 when dividing by NSEC_PER_SEC
  - use div64_ul in meson_pwm_cnt_to_ns
  - remove check for __clk_is_enabled(channel->clk) from meson_pwm_get_state()
    because this is always true once the PWM is requested

Heiner Kallweit (6):
  pwm: meson: modify and simplify calculation in meson_pwm_get_state
  pwm: meson: fix handling of period/duty if greater than UINT_MAX
  pwm: meson: remove not needed check in meson_pwm_calc
  pwm: meson: switch to using struct clk_parent_data for mux parents
  pwm: meson: don't use hdmi/video clock as mux parent
  pwm: meson: make full use of common clock framework

 drivers/pwm/pwm-meson.c | 212 ++++++++++++++++++++--------------------
 1 file changed, 104 insertions(+), 108 deletions(-)

-- 
2.40.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
