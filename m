Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646C9C77B73
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 07:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxJ/C2+uDRAF7PQYmH2VkuwlGbP+m39aBTuJq7uymyk=; b=0S1bNsYTjsc/4q
	4/h1MB/+J5MgoKJziNcchLzQYXPvrpnPqOkPhtoZNoZ17l55JqJTv1u0kzSMna7SnTWK4Ywu4q/uu
	S5DonNWyBmQfxY+vMKuPcopDnMITqiOATs5WGhe1/NEILj6+ef+woe69P3Zwg3CsRMuRtuXEZ1Tq9
	CEPfqZ2JcnF9IDjvrlr2DT06YxMh4ZHc/5qXDIOx66o4k1glIFdKS7V+KE/RkyA3aPzfZqFnY0fo1
	sbYEL9yNTbMJQe8aLbkVpXGGaE4SLVccLcyNNog7ImXA6KBTrv85J7OEgBpJq6KaDkRPyXX5wNoBt
	y+THLf8loNFAC0Xtkd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqwi-005Cgq-03;
	Thu, 13 Apr 2023 07:00:40 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpvQ-0056Cw-00;
	Thu, 13 Apr 2023 05:55:17 +0000
Received: by mail-ej1-f54.google.com with SMTP id qb20so34127223ejc.6;
        Wed, 12 Apr 2023 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681365313; x=1683957313;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3BFhesCPS3MCnxkJTTepkOi3pLCS6u2CIR+Btp0g80=;
        b=UY1rGz/BxN4bs6SUt0X6f+sigDkjYzLekFTOwQmYblqNMFcf9ywTlWupAQazCJS4ht
         0+EtcEkOO9cediAWSGfBau1cKYrst7Zfn9K3F8LIYjtXC+zNVCRFTBQzSac95VEfC0iP
         vN1XYHUXy3lK/TzKktKRrJhw5+4G9PNcDEeslUJCoTSwaw219tTF7I+zApa1Rsb68q3T
         +qqSXyXIffq0AGUTRbV0QIGutvLK4SxQ6eA9EMRYvwru2LsfVQysf7QnerHyCO+f6grG
         d/8Cx+rdkI618nK9z8GA9/atucNil8vh2BqbKkErV9EVYgy3rWEvnode9+KLPIVWiCa9
         f2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681365313; x=1683957313;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3BFhesCPS3MCnxkJTTepkOi3pLCS6u2CIR+Btp0g80=;
        b=dEzxzD8AOnUmm3cbPUFOwYI5oVcm1VxnDq331mko8GsyT9lxZilfw4POo/GKpEmb6V
         YmQJ1kDSOcqM4gfe6ZHDSHHFpTeWDT9tC/cVTgXce0AhX/wXb8AonZEkvJwVqi1Zy+yR
         x+f2vQyFnGzApARyo1A9tQ0AkIUXI8pwsoH/2OiTdFv/hu3c3oWV4pRI+mKR6O+Cdi6B
         TMQ8S6UYE8XH9xJZoWV6RoCCmAjOTzIEFMawfPHM29FG1kE9nG3BF+k4YkbUMTUfBj70
         7RJYrpBFYnxjwlwVXqbibILorsOroZeHhsG7s4MsmQzrhx6CETZJIxrMTxlTk2yU0vmP
         ZC4g==
X-Gm-Message-State: AAQBX9cHNNsK7s9VGz6iIbSQFlwDZC2varAEAhl1AK5n2qvdVKvilsqQ
	iaRah7gVvNEcNrVlWRE33yo=
X-Google-Smtp-Source: AKy350YB9J4NKZVFJvWGgzYx30ujMRBfsZBaEiEi9bzs9Lr6CZJEwMHR8dREQTlb2E3m79eP8vwAlg==
X-Received: by 2002:a17:906:398e:b0:94a:97dd:aed9 with SMTP id h14-20020a170906398e00b0094a97ddaed9mr1823241eje.70.1681365312669;
        Wed, 12 Apr 2023 22:55:12 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8? (dynamic-2a01-0c22-738e-4400-9dd0-adc5-d6d8-61d8.c22.pool.telefonica.de. [2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8])
        by smtp.googlemail.com with ESMTPSA id i3-20020a1709061e4300b0092b8c1f41ebsm423589ejj.24.2023.04.12.22.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 22:55:12 -0700 (PDT)
Message-ID: <2727eab9-28bf-214e-c98d-f119eda20496@gmail.com>
Date: Thu, 13 Apr 2023 07:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH v4 1/4] pwm: meson: switch to using struct clk_parent_data for
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
 linux-pwm@vger.kernel.org
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
In-Reply-To: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_225516_036780_A4EF6263 
X-CRM114-Status: GOOD (  11.60  )
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
index 4e5605c9d..6a66d5d58 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -61,6 +61,7 @@
 #define MISC_A_EN		BIT(0)
 
 #define MESON_NUM_PWMS		2
+#define MESON_MAX_MUX_PARENTS	4
 
 static struct meson_pwm_channel_data {
 	u8		reg_offset;
@@ -484,21 +485,27 @@ MODULE_DEVICE_TABLE(of, meson_pwm_matches);
 
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
2.40.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
