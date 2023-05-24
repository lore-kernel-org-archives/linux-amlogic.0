Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B44C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gg3ibm6tfsFbOyM9DpSV3Owq8j/BmWVsfaNJF5Hpe+0=; b=MxCJRqiY78BOua
	tP2MjE2xxoN3gG7LioWjdpe1v1Cr2HJ6aSXU6gL4YjZCMMT0E7qCP7z84Rap/TThoV7j6uyKOhTJB
	KFT3mOfgEfhGuAhBuPgmSKO4usBm0fjNR/O0jt6CU7rj6Hj98vikD1GjOK+BBerSjLgsCvnm6rXpC
	VZeeHUNby6xKF37KzcQV6FjkUvqbW/7bJr/Xsxf9KSYod6NH5I6BHaBV3BbDDCTjiNwH4VqnvVQRU
	x8vx4yjZEmNL67p8y3Zgl3nDkfQStxBOPBjSIf+LiVZs0UbgGyI0mEFli2iewD2OL+oZ8+1xZ8h3X
	VKOrlX6lTkbIezWnwmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXZ-00EWOh-1B;
	Wed, 24 May 2023 19:52:57 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXP-00EWCz-1p;
	Wed, 24 May 2023 19:52:48 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-510d92184faso2859684a12.1;
        Wed, 24 May 2023 12:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957963; x=1687549963;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3eG2syH0BhFk7l81W2r9jp4pFx0n58Jnrg59ebu1LHI=;
        b=c9xjDb20x9sv/xOAq5qD7rkWgjz4K3MhMe0d0o10cron/fCjhkbanF0ArSKeX54RC3
         hQTerh7+l8ePSNg16oIX7ibcLUedyB4vrDRz3H1E7qJS3oWXbZZCliBEU5xmOCNklSLA
         eLb0dFycCcsg/SfbqfhHC2Fqshhda3JwRuZASoOIaZ5GKF3HE0aEV1hgKwLiQHTNQpzu
         xHamvoUMqFVViyaaTzsQ62XC3z6Jg6108OC2jfSWYQNxixu/WgSzmkhwD6TO+N4fesJC
         121or4KTfn2fPU0ecGiCD9pAtuQhJDMnuR3vH5LYBWwdFNqyY8SIAbEz06T8elQ48W2a
         z+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957963; x=1687549963;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eG2syH0BhFk7l81W2r9jp4pFx0n58Jnrg59ebu1LHI=;
        b=Pgpv4NUOI4Wr11rx/E/fHlnX5XPUsTX1p4yvdLnb3QYDvHnj24D75tjM/ap6aKp3Wi
         t411GeXTWf3WS+Yu73wz1TmON5VU5+gXEO0G8YqGr65S1IGIJzi9sDR41oLIhsFkgbbI
         ziqvy44NWhKqCpQiydIKLNPd1VNX+E9FpfR2l9yLIaEM1h9N61Z83BabGpLx4AX38bdd
         44m0/0DLHQ4mUWVp4k+/mLpAH0KAmuF1GVt0+VV+kPRTtO/kKnphimv1flAGbxE9YgBK
         mGfiRhSRZSvjKhtQEBbLJ8bH4WqYL0gk60l7OAQQ4I2I1GQjwlcDbG+7wbyB7ox327/O
         sCQA==
X-Gm-Message-State: AC+VfDwmbXRFQvHYdRfbGfnbanlpWXHFVPKPRk/dA5qQ47H+Sd1RVNnc
	RaRcn4TV9/nQn/eoQPXtfWs=
X-Google-Smtp-Source: ACHHUZ5o4LbgBZPqSOoHI0mb/Xd2/MbyIzIlwOY6bt7Na5w8qSFaO2NGBSYPsfqGeLYhssYHMbq94Q==
X-Received: by 2002:aa7:dd10:0:b0:510:82b4:844d with SMTP id i16-20020aa7dd10000000b0051082b4844dmr2740318edv.2.1684957962851;
        Wed, 24 May 2023 12:52:42 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id o2-20020a056402038200b00506987c5c71sm233641edv.70.2023.05.24.12.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:52:42 -0700 (PDT)
Message-ID: <63e33220-0765-0e04-ef34-fea81e8fa347@gmail.com>
Date: Wed, 24 May 2023 21:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v5 4/6] pwm: meson: switch to using struct clk_parent_data for
 mux parents
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
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
References: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
In-Reply-To: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_125247_608897_644857EC 
X-CRM114-Status: GOOD (  12.12  )
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

We'll use struct clk_parent_data for mux/div/gate initialization in the
follow-up patches. As a first step switch the mux from using
parent_names to clk_parent_data.

Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- move setting mux parent data out of the loop
---
 drivers/pwm/pwm-meson.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index aad4a0ed3..1654fdbb0 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -61,6 +61,7 @@
 #define MISC_A_EN		BIT(0)
 
 #define MESON_NUM_PWMS		2
+#define MESON_MAX_MUX_PARENTS	4
 
 static struct meson_pwm_channel_data {
 	u8		reg_offset;
@@ -477,21 +478,27 @@ MODULE_DEVICE_TABLE(of, meson_pwm_matches);
 
 static int meson_pwm_init_channels(struct meson_pwm *meson)
 {
+	struct clk_parent_data mux_parent_data[MESON_MAX_MUX_PARENTS] = {};
 	struct device *dev = meson->chip.dev;
-	struct clk_init_data init;
 	unsigned int i;
 	char name[255];
 	int err;
 
+	for (i = 0; i < meson->data->num_parents; i++) {
+		mux_parent_data[i].index = -1;
+		mux_parent_data[i].name = meson->data->parent_names[i];
+	}
+
 	for (i = 0; i < meson->chip.npwm; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
+		struct clk_init_data init = {};
 
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
 
 		init.name = name;
 		init.ops = &clk_mux_ops;
 		init.flags = 0;
-		init.parent_names = meson->data->parent_names;
+		init.parent_data = mux_parent_data;
 		init.num_parents = meson->data->num_parents;
 
 		channel->mux.reg = meson->base + REG_MISC_AB;
-- 
2.40.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
