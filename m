Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736EDC7619A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg156SE6a+g423dxM7twzzehnsrSdnyXesy25FaLauI=; b=AmZETTAEL7ryO5
	23SPV2Xzq6acEqlgC8aW4j+oRLW4jQRIxkLQFQ9212rcwJcsDISYpKS7NhYut6U/r7fnRvdTyrE9X
	grv0TODTpQZkam+KxO381p5OuJDVwS0lfGw60y2x/HMDEmXrgrRAi4fjC1gg9kFSd1sdzCoFqVVj9
	jUSIPdveDoxjzKt/Q3vyF0e7bojxfVC1tlPmZ2X+i2sHSCqIJfx8bAihfj23eFBMdPZ9Sw1eLsjbD
	3CltKtpzRix5x4TQN6JDxHjaGy8qbbosWvNKKr7PL6KxbZwsCWEbWpP4zhQGj7KvHWGSj3/5lTc98
	j4C7rn0tgUS7zpPX6fIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJdW-000wRI-0o;
	Tue, 11 Apr 2023 19:26:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJdS-000wPu-1w;
	Tue, 11 Apr 2023 19:26:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id v29so8671432wra.13;
        Tue, 11 Apr 2023 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681241192; x=1683833192;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxWZ3lc7cHgbqUIVxG2SqSCxtmOZkFcO8gtsNb4LbME=;
        b=kkHeH97+ArBF9/0zQysc+2G8LTCn28AvF+hDw4OwXHmtvpeaM4fTSo8zxfu95O/lCy
         dWrQE6QLdS+mnXvTlIy4dtXd9d3BWY9NxW5vnUxbjrKDhuna9QoiwfqbUQQU+nkNo3fo
         bJGFKe3cPzhtPR5YyNTQ41H9G/IuJZ1TNyDRRnT7DucdPVA+lsKBhzSjcrpfCLF056Q9
         oz3CzwUmV/FOxNc8bYKDx3XBF7EZvIvwRBCoYtnhFOOVEikmKIxpDs/l2TIfOks/dPkS
         Sqt+77if3p4ms5pO8SGVAPMm3sU0ixv1mLeOG3A8YCZLPLpGfbcO0+qZB0uChJV93aV7
         ytWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681241192; x=1683833192;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxWZ3lc7cHgbqUIVxG2SqSCxtmOZkFcO8gtsNb4LbME=;
        b=GDlRv37QMEs0BgygC4zQ3iwdqEmnPxns58aK5tm8oMoqxx1Kz1CS5Q6b332jPvki/y
         dclOXqyzx7u0pAfzrKREfnk2ANLP9+aJFS7dJcRi1n1BjQpEA7EGGtARjhAMbwOQmABz
         k+wrELfLB78IMBB2oc9ePgykEW3iBEZaQ30CzwduAA0FQQBBNJA/frhdOGyQCmSrwwIR
         bwnTbapCtFSUqZiVSKDd4Lt4c6m9WIvQ7mQu3G6cApgmVL1BsXvwYG2tfJEqtefAs/L0
         bTI4o3rQrZAnNSV0YYlWab7Ee9Ok3U4O4uuaELmzorNgJHgXpUOOTZGZIa92YzaPaafJ
         c72Q==
X-Gm-Message-State: AAQBX9cpONbdKh03enfOTdzeF1I/om9Zba0GY81QNG9I5JHdBoUDiP9O
	eP8Bic4e5wD5odFo9kI9Qq8=
X-Google-Smtp-Source: AKy350Y8UGQNTb1QdJvRPlNvRx/fVmbzC3WA4YTp6Q2H2MzZRPxG1pqPqaNj8p9w7JNf4wE3vQJh3Q==
X-Received: by 2002:adf:e4c1:0:b0:2f4:fcd:98d2 with SMTP id v1-20020adfe4c1000000b002f40fcd98d2mr585544wrm.31.1681241191637;
        Tue, 11 Apr 2023 12:26:31 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4bb:c200:90e3:4731:63e4:d333? (dynamic-2a01-0c23-c4bb-c200-90e3-4731-63e4-d333.c23.pool.telefonica.de. [2a01:c23:c4bb:c200:90e3:4731:63e4:d333])
        by smtp.googlemail.com with ESMTPSA id h7-20020a05600c314700b003f07ef4e3e0sm4158098wmo.0.2023.04.11.12.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 12:26:31 -0700 (PDT)
Message-ID: <2760498e-23a6-f787-bac2-0460566a995d@gmail.com>
Date: Tue, 11 Apr 2023 21:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 1/4] pwm: meson: switch to using struct clk_parent_data for
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
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
In-Reply-To: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_122634_643847_FEAF7AAE 
X-CRM114-Status: GOOD (  11.88  )
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
 drivers/pwm/pwm-meson.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 4e5605c9d..52a2104f0 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -61,6 +61,7 @@
 #define MISC_A_EN		BIT(0)
 
 #define MESON_NUM_PWMS		2
+#define MESON_MAX_MUX_PARENTS	4
 
 static struct meson_pwm_channel_data {
 	u8		reg_offset;
@@ -485,20 +486,27 @@ MODULE_DEVICE_TABLE(of, meson_pwm_matches);
 static int meson_pwm_init_channels(struct meson_pwm *meson)
 {
 	struct device *dev = meson->chip.dev;
-	struct clk_init_data init;
 	unsigned int i;
 	char name[255];
 	int err;
 
 	for (i = 0; i < meson->chip.npwm; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
+		struct clk_parent_data mux_parent_data[MESON_MAX_MUX_PARENTS] = {};
+		struct clk_init_data init = {};
+		int j;
 
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
 
+		for (j = 0; j < meson->data->num_parents; j++) {
+			mux_parent_data[j].index = -1;
+			mux_parent_data[j].name = meson->data->parent_names[j];
+		}
+
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
