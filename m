Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65466C7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSwKxRiHIea/lMNUV58KzHJTZHItHL+S1AUZuss1sVA=; b=s8ttQ1pVs908w2
	sgIvi4kPVFZN/xwA8SumhkbiBOrhKinqLGZLEWO1lQ3GnT3bjYMZMGFB4UaUDSybnrq+Li/kqR/BE
	T5rvwcPce3G5OpkT+dFJuKh2xzAT3Ddf3RCRGgmcfu9PJCrPhtph8MRsY0XpDv9ioznUf4A93kv9O
	iX9iLVeJ0Nf5EElG27ElFIHGpnu6iDaXIx2pFunFjBwcEVQyMVWah8TphoMegnOWY8MAMmFBJlJ1F
	c767cEe2TULT/halYkAVqyhFrdS3k/Trja6DIwBdku/JE4slLolYAriJyiCdxUgyYddEy5Gj/iZJE
	sNRSLizZU1+gISaINxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmg4D-004A69-1Z;
	Wed, 12 Apr 2023 19:23:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmg49-004A4C-03;
	Wed, 12 Apr 2023 19:23:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id ud9so31351323ejc.7;
        Wed, 12 Apr 2023 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681327413; x=1683919413;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ruCafjyH/3zlOeY8HIt23X9tT9LTYcm24amx/aCjHg=;
        b=NInJHmo5GJ6LGF0P5Ez+b8s/XEnq2XPkad46wmzQwZ6PTlPpTzifRfDv5RUShBT8vR
         +ZCpzsFt+zmm3gY4xPr67LIaxTRan2Cw0w/+boQKu0m25t7oJgVQ8TpTvNt+YbE431J9
         nzMvyXURMKrxVgoBETjFiiDSxQUhWo+kiJpFbx//d9ZXZ05lmOT1mDbRNUpun5jncRla
         VoUa8vewPb19Qsc/mukFUat+KzJHJ558lSjQLhdbhKf6CxrWPp05kQKKjRi9HXWnHwr9
         AwbJGiRGJ6+HkIt/cCa/Cs7eM6PdrW7iqQnxxhIdsfToplUf4S8d7vyx0HFYmXsZMZpS
         en0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681327413; x=1683919413;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ruCafjyH/3zlOeY8HIt23X9tT9LTYcm24amx/aCjHg=;
        b=hln+tTjngMyinpe9ANd3DumoNdgD8boBHm+EASNEgHbHk6xAtCMEUWelCXdaNV4UtL
         7dStCGQJ0WjuEdSQ/Yl/mECyQ3AMOUIECs5T2W5CGJ+Hrc0aQckR3I5KstP5v8OD1GKb
         PVmgRUL5t9qQ9AT32NF11wh0XAB0HntKr0N5w39Kzbx050g+w0R633m3zSPhJ4sDYN3r
         Unfh54DiiifpdDtjP61KzzHMfX/93/mLd5xIylWHgYG7IEke1cR37bM69LemP6SdadEA
         ufWvvruOlUxDSohxIDIaxuTeMybhhNo1a/TkXLcouvtD8dcdA9MctI/xBxpEFgv0hDtk
         SDrw==
X-Gm-Message-State: AAQBX9fNh3mo3A4IuXtD0wEnropQqBiNi7MXHokdbCpis0D1lPCxG4aG
	y/kfXcfLrr/OBy3svDt3ZcI=
X-Google-Smtp-Source: AKy350ZaNzltKbVwQY5y4mdYzMETZFU620vKj2YBlg94g4V/1DYLl3tl/r9TkM4CqIyvyd5EOY4aXQ==
X-Received: by 2002:a17:906:c78a:b0:947:eafc:a738 with SMTP id cw10-20020a170906c78a00b00947eafca738mr7066559ejb.60.1681327412903;
        Wed, 12 Apr 2023 12:23:32 -0700 (PDT)
Received: from ?IPV6:2a02:3100:903d:3d00:b0e7:6bd7:f613:784b? (dynamic-2a02-3100-903d-3d00-b0e7-6bd7-f613-784b.310.pool.telefonica.de. [2a02:3100:903d:3d00:b0e7:6bd7:f613:784b])
        by smtp.googlemail.com with ESMTPSA id f17-20020a170906739100b0094e5679dd2csm1134210ejl.165.2023.04.12.12.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 12:23:32 -0700 (PDT)
Message-ID: <8a7c067d-b121-3bd0-b587-f53861b52bd5@gmail.com>
Date: Wed, 12 Apr 2023 21:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH v3 1/4] pwm: meson: switch to using struct clk_parent_data for
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
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
In-Reply-To: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_122337_055830_CD9A92F4 
X-CRM114-Status: GOOD (  12.49  )
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
