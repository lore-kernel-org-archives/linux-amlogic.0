Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1799C7619A
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Apr 2023 22:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2yeLtxbS7Ltlj89GvEowLU+BKdw9SNAUeNgf/7yMnIA=; b=QyWNo+v8Wynzxz
	oSa33vWlGCJDY/t1+L785bNSin9CublyK3oz70+AbujqubrdpIzWUP68p1bGUn48qflMmRFZRgupc
	+c+EIsPFjJmEgyVvG3F4YhK9pOBgBv07RTwRcVBFs9sQMraq9P+NVcyR3nqvmQ97XIonpvzDWy3Tc
	jV86aVWnmHNMeEAcMsju29DvyCOBZKnXROvV6ZVrxNFJewpkaSJZwCodaM4Nr4Xpe3g1zIM44wf40
	cT1wfODGHpL1Qy6Bz2AvKA1OnI/wcqioILj4qu3QLC76/0hWsVzwaEUqV3N4wGWfj5idOaJwEymf+
	ogAArowEZEV+OQbIP6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plHO0-00Ctr6-0l;
	Sat, 08 Apr 2023 22:50:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plHNv-00CtqV-15;
	Sat, 08 Apr 2023 22:50:16 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94771f05e20so237482366b.1;
        Sat, 08 Apr 2023 15:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680994211; x=1683586211;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgROFqHHrF+sHdSvsr6ZitI9bmKISd+icEs8t3mjLho=;
        b=gQ1FPxQLSoDt2Fg4pUNjPfNb5O6Zc5rkK3vwWPZln/FD7B0qZUoN4rNjgaX02hkYkR
         N/QnNPWxX3C5I8hLSgUfZm0nnEljoJkAwObftbjZuz14nI7FS/tZkykBU30ImA2O7UO0
         FTDaOiEn9Vnp2xjPkSEoe2cIrHEyXix/qfDXxBr2ez91O2GxqWoooFmvI7h8iWXx97bh
         L0nm2fS3gdFku/57aWUUVQK5rlXkP4mjg/jHcBeTbbUhYgFHsC629Vif12zuSRnuMAot
         ydQOnjZj1Ro3vje2KCXmzHNwmLbogVPsWIJlmQ8qOCc6aoab2uQ5/mMNE/jRNm44NJW6
         TKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680994211; x=1683586211;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgROFqHHrF+sHdSvsr6ZitI9bmKISd+icEs8t3mjLho=;
        b=kSYL9WPv//tokM0AMKk4zW0xm67hSW6nb+45IHGWEzseAfqOpeaN7KwyR0ssAF1a1h
         pdc8BvQcXGAk4RnB0ciO8ox+TSV0Ghd33gZAaJReJsIDT/5XGaD82fASCWzlcvIvkjIA
         eLYBWVzYcw540gF48kUT2KZzVCaqcJ9AWcTDiaU6ndIfSoYExpV/fLomIPGTJ3+U1oPP
         axflaNSp74cXRAjvjankwik61vCpZ2B41jxedGE+FIJjsw5v2pIn6vsszu1WPX9hj6db
         9rz4/XpDDpUio9lT6uEW+7AR0XzicA3nLjNda+2bAsdakpXwWFAO2qtPRZeLXfoTMkDj
         mHPg==
X-Gm-Message-State: AAQBX9fZEH3Tleuyj/NB5EpfUxfwrnpGnj3N0ITWicYGm6zc899Wd+CQ
	9RkIEv8DKLPOX7cq3IPSpYc=
X-Google-Smtp-Source: AKy350Z4S9+mVq2oQP+4xl2jZQEsurFq1RLGvU8tVfU6QJIIYh3e93XfNjIINDJTBzhYnij2GukRMA==
X-Received: by 2002:a05:6402:b09:b0:501:cde5:4cc9 with SMTP id bm9-20020a0564020b0900b00501cde54cc9mr5298550edb.39.1680994210766;
        Sat, 08 Apr 2023 15:50:10 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c57c:9500:b062:7c54:caa1:b5c1? (dynamic-2a01-0c23-c57c-9500-b062-7c54-caa1-b5c1.c23.pool.telefonica.de. [2a01:c23:c57c:9500:b062:7c54:caa1:b5c1])
        by smtp.googlemail.com with ESMTPSA id u6-20020a50d506000000b004c13fe8fabfsm3317332edi.84.2023.04.08.15.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 15:50:10 -0700 (PDT)
Message-ID: <e7a95baf-5f9d-be56-93dc-82ca83b69c7a@gmail.com>
Date: Sun, 9 Apr 2023 00:50:05 +0200
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
 linux-pwm@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] pwm: meson: fix axg ao mux parent order
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_155015_418262_8C300739 
X-CRM114-Status: UNSURE (   9.52  )
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

This fix is basically the same as 9bce02ef0dfa ("pwm: meson: Fix the
G12A AO clock parents order"). Vendor driver referenced there has
xtal as first parent also for axg ao. Mux parents for g12_ao_ab
are now the same as for axg ao, so we can remove the entry.

Fixes: bccaa3f917c9 ("pwm: meson: Add clock source configuration for Meson-AXG")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/pwm/pwm-meson.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index b5c746fab..2cafec827 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -381,7 +381,7 @@ static const struct meson_pwm_data pwm_axg_ee_data = {
 };
 
 static const char * const pwm_axg_ao_parent_names[] = {
-	"aoclk81", "xtal", "fclk_div4", "fclk_div5"
+	"xtal", "aoclk81", "fclk_div4", "fclk_div5"
 };
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
@@ -389,15 +389,6 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
 	.num_parents = ARRAY_SIZE(pwm_axg_ao_parent_names),
 };
 
-static const char * const pwm_g12a_ao_ab_parent_names[] = {
-	"xtal", "aoclk81", "fclk_div4", "fclk_div5"
-};
-
-static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
-	.parent_names = pwm_g12a_ao_ab_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_g12a_ao_ab_parent_names),
-};
-
 static const char * const pwm_g12a_ao_cd_parent_names[] = {
 	"xtal", "aoclk81",
 };
@@ -434,7 +425,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
-		.data = &pwm_g12a_ao_ab_data
+		.data = &pwm_axg_ao_data
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
