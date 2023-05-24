Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A722C7EE2D
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KINdTPGwi5oTpkdBwE5gkKcbl/UDX/fkBXaKDYv2b2I=; b=ea8ys96kvd7hCI
	Rdw78OBvGQY+oZKkh6/hZdVzvAsBTy6e+s3unr8FvcL1/en6+xax9oUUx7sEk3UF+NHhi/zof1Tt7
	alY6RkbwBNSHgJtxGMRdfYj84n58CMxmj7nb14J9x1hRw8AzaMAbYNwYHpYwyF+f6oZdHoTa9fvBd
	zgGby5cjMNpjNYoFNghowoPShoWEPbVJsKW1qjbnqJYa8um4tE61ThobhuS7Q2SedfXA2beHnqauo
	Mheqzp/0zz37KskckDVEIJhqXADsz8NbuhqiB7N4CWgF3E+UF+etFQphb9yf7iQ1VL+AeWjnjB2op
	gZsw5z1I1X4k4Hq/ZGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXY-00EWNo-19;
	Wed, 24 May 2023 19:52:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXO-00EWD0-2q;
	Wed, 24 May 2023 19:52:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so2361400a12.3;
        Wed, 24 May 2023 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957964; x=1687549964;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hl1kkCphfbJI88idtjaX2xpMK1X0udpSgx92Bt3FmGI=;
        b=XNoJlpcaIjo8XTFbt/plZPj0Rp3IRj1FYeVMJSveLP/W5C8Myo3bcizGstTbcWXfva
         7MwcHv/LKRD70PvWvDmBdt4auDSF99I334KYCWZlobNth1bz8qpZb1eBmjyjoI9ffPa/
         kj//sYFuiFD0ioI0MgW+V0mhdrJeRxCu7V9YRBDLDsONF7A6P8lu1+dUzyAfDM6lBRLg
         x7hilR8AY8WRm7H+CJADO1oYQybpqKltouEPJDPQ2LC3deg5ijFw67H6jmJNT7V3Ot9v
         lS4yai9ToxDUB7njcUZ/VUp+6wVltSphAOn6n593H76BldvLxipsydVOckOuXDg77jfI
         0LHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957964; x=1687549964;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl1kkCphfbJI88idtjaX2xpMK1X0udpSgx92Bt3FmGI=;
        b=bmy7QPYHGDdUCgKNoBnFRByWuTlocNDp1sMiWuPoISoSJztvOESxSDlQXzJkV00iqm
         BjUFTliQRchT1oJ2Y94ToFbdxx5UPKxx8u6ospg0s8DWJ9uxhimrnetyz8yhL+TQne4+
         FLkWfysLWBIAe80qHuAw9v/rWFqliH3nqolV9zdSxpqnMsTw43ssZiZhZ19sr4n219uP
         Z8hLv8D6tPLcWDg0glhmK74olRZ20KytLoCysAAF0g2dLnqLBURCv8WL8GHKK6Ww4mRE
         A5GW0P4Cp3IG/BEJorruw/M1SmMOMYbJO3zs42cDuDDGE/d6Ix5IlCdH+HBv7uYe13Sw
         OgfQ==
X-Gm-Message-State: AC+VfDz+GRaAgeBpDcQiCBC6Rqy2f1Y595ranucB7BtHf/V0qdkdZ2fv
	+k4vOCQzl/ck4IUBS+WVJnQ=
X-Google-Smtp-Source: ACHHUZ7QEbGR8niAlZXQq9UvZeaSVO3i9pUfQXd4Kp36n2cr6kPDx+VAuUubCeIyrzEbJZrRbeH/tg==
X-Received: by 2002:a05:6402:1381:b0:504:8c1a:70db with SMTP id b1-20020a056402138100b005048c1a70dbmr2875364edv.32.1684957964006;
        Wed, 24 May 2023 12:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id r14-20020aa7cb8e000000b005027d31615dsm232772edt.62.2023.05.24.12.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:52:43 -0700 (PDT)
Message-ID: <db973d29-1b8d-85f8-5e81-88e200def596@gmail.com>
Date: Wed, 24 May 2023 21:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v5 5/6] pwm: meson: don't use hdmi/video clock as mux parent
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
X-CRM114-CacheID: sfid-20230524_125246_915274_7C0EDF5F 
X-CRM114-Status: GOOD (  11.85  )
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

The meson_vclk code from the display driver may change the rate of the
video clock. Therefore better don't use it as pwm mux parent.
After removing this clock from the parent list pwm_gxbb_data and
pwm_g12a_ee_data are the same as pwm_meson8b_data. So we can remove
them.

Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v4:
- improve commit message
---
 drivers/pwm/pwm-meson.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 1654fdbb0..48dcc44df 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -364,7 +364,7 @@ static const struct pwm_ops meson_pwm_ops = {
 };
 
 static const char * const pwm_meson8b_parent_names[] = {
-	"xtal", "vid_pll", "fclk_div4", "fclk_div3"
+	"xtal", NULL, "fclk_div4", "fclk_div3"
 };
 
 static const struct meson_pwm_data pwm_meson8b_data = {
@@ -372,15 +372,6 @@ static const struct meson_pwm_data pwm_meson8b_data = {
 	.num_parents = ARRAY_SIZE(pwm_meson8b_parent_names),
 };
 
-static const char * const pwm_gxbb_parent_names[] = {
-	"xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
-};
-
-static const struct meson_pwm_data pwm_gxbb_data = {
-	.parent_names = pwm_gxbb_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_gxbb_parent_names),
-};
-
 /*
  * Only the 2 first inputs of the GXBB AO PWMs are valid
  * The last 2 are grounded
@@ -430,15 +421,6 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
 };
 
-static const char * const pwm_g12a_ee_parent_names[] = {
-	"xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
-};
-
-static const struct meson_pwm_data pwm_g12a_ee_data = {
-	.parent_names = pwm_g12a_ee_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
-};
-
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -446,7 +428,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-gxbb-pwm",
-		.data = &pwm_gxbb_data
+		.data = &pwm_meson8b_data
 	},
 	{
 		.compatible = "amlogic,meson-gxbb-ao-pwm",
@@ -462,7 +444,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ee-pwm",
-		.data = &pwm_g12a_ee_data
+		.data = &pwm_meson8b_data
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
-- 
2.40.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
