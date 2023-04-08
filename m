Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A7BC77B61
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Apr 2023 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3bZv+h7o2j/7c6GXRAwtCySM3fcb4d3jY49e1vLpHWI=; b=Ajso823Q0YVJn1
	IiFMRF3qhYr3FzFzLsL9DzzxpVE1Y3RA9kuKq1EHkDrikKKcrwgz+zCDgq3hVYlCHARtGcBECLgCU
	NJzUWo5z/tvZK79M/1zuyDsCONQWnGbPSocCbTufIL2aox9AomEvK5di2Ffy0sHsJkLrwUVDawOuB
	2bsBvIQRreetF5IhksJKTjDw+cOtI1pGZDTTQz8fNNJ52xgag58qg5ML+m1R0R45AESNtRgOBjEw5
	omgbnWYUSCS/AauXh3wtp+OCB3SkXinLIPHpRDayISbNzSo2mXYyvZ/5a0CDutmCyfvWJGvV0Ovpt
	14/zHJ3xeQWxBabQhLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plFMQ-00CnBp-0r;
	Sat, 08 Apr 2023 20:40:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plFML-00CnAq-2K;
	Sat, 08 Apr 2023 20:40:31 +0000
Received: by mail-ej1-x62f.google.com with SMTP id g18so15642771ejj.5;
        Sat, 08 Apr 2023 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680986426; x=1683578426;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEDP43uZ98Y6T0PfhiJg3EwYN9keHU4o+RIDWqYy1sY=;
        b=dVMeSt+eSPiLW2eWTieLU2UDRathj7J7VKUZU4Zb4BLvKjD3cxiLj8B3dkfGTkpoc0
         StpDByiKdTLPKWw8QMkkc9/xCpwHsW6PemR2bFATWz0cRAE0dCZ8bGVBGU6gXe4OdvH1
         7R0XahQqzCOKP+RHsWQQOZlQmB4eWhMHhY7VDStwPrtWA31/2u+nQ2DZ9lJ6kRrLlkMw
         BoX9rLXGiGPNuaP3jjP1q+TMODME4Dm+4lJVQzs8dCE+WjQoAyDPs9/it5T1y4EO4zgd
         dAdZe6EvRrtEYKQuT/pZbM5x/17QhqG1R4Z882lkHzBUrWXtCMpPQhZ07+kXqRf+PQl8
         uVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680986426; x=1683578426;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zEDP43uZ98Y6T0PfhiJg3EwYN9keHU4o+RIDWqYy1sY=;
        b=xFiyMPnyuVqu9U23Ac/I+uPOkz+1UG4Ldu9WkhmJ9/+eDtA42ZX2A93A85HDczBpyl
         dVU+F3OVJF/NrxLIpOAZwUSvnEdh8gNLz8mn3yvOwXjGLJR2vhCqkfIPEdkJLIEQW7oU
         Kn1BuCi19I11Es6/tY80+PuHInyk8zDakxdiP3BRgzl+/B+ls8S4jvY1X29TWsIM9oU/
         ZpD1y0Sc/VGuwTJBt7vYP2ReBDkCFSZIJCz0u3RpmZgbyIkbdbAgR0quBxpzuee4fBWd
         gLvOHf+lMvKuIhX9pUttQjKSPP2Ng/emjgEyow327micUg47B1mF9Sn5IEWUYuwDZ4bg
         2BDA==
X-Gm-Message-State: AAQBX9dwM2tT41YB6z/hs9vCkSc1sGWxxoh2FXRnaYz18DIemhA88Zlz
	WyUz/I8A8IwPPEFKCK4I3q4=
X-Google-Smtp-Source: AKy350ZguJX/6bteV4qadzSTJAFN/QUvO2I50S8r3GS2AfUOppRv++5T6PHEgXCiRYouTunLKwLM6g==
X-Received: by 2002:a17:906:39a:b0:93d:1c2b:bd23 with SMTP id b26-20020a170906039a00b0093d1c2bbd23mr3678653eja.39.1680986425466;
        Sat, 08 Apr 2023 13:40:25 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c57c:9500:b062:7c54:caa1:b5c1? (dynamic-2a01-0c23-c57c-9500-b062-7c54-caa1-b5c1.c23.pool.telefonica.de. [2a01:c23:c57c:9500:b062:7c54:caa1:b5c1])
        by smtp.googlemail.com with ESMTPSA id m8-20020a50d7c8000000b004fe924d16cfsm3229977edj.31.2023.04.08.13.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 13:40:25 -0700 (PDT)
Message-ID: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com>
Date: Sat, 8 Apr 2023 22:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
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
Subject: [PATCH 0/2] pwm: meson: make full use of common clock framework
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_134029_765290_384F12F6 
X-CRM114-Status: GOOD (  12.02  )
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

Heiner Kallweit (2):
  pwm: meson: make full use of common clock framework
  pwm: meson: omit video/hdmi clock as mux parent

 drivers/pwm/pwm-meson.c | 159 ++++++++++++++++++++--------------------
 1 file changed, 81 insertions(+), 78 deletions(-)

-- 
2.40.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
