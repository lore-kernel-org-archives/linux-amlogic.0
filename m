Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEEBC4707B
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Jan 2024 22:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8L+Wv5lR/o1pL+z/lHA22VTebtFTkepJWGAiz0ulik=; b=G3IAJWBGOojrW1
	RAtwCXsrvNcZO4Ig/1q/SqlonAMyBvkDHAXhgxPS57LIpjkw1CpKuQ1Xq76dX440C4u2w0EgQ/QYd
	pXoY0NTFP9YNDa/WMiKMawRsoWlzWKcGtEkoVILao88XfvpJAdYKxtw6guHr1IaEsqe22XbYVtWZr
	28Vy7JmOTXL7GPd/FMoGLzRko7zoxEr6VTF3PNgmFmN3PqU/NhkxZdZMJ7erabNSPn+o8Lv0Nr22P
	0rHaQdbWGb0gsKUhnz/VtQVV96URuSVRe5x3oWLZqjy7+8zgoTYCtsfEXbBT2qHsSKQoKt7daCscS
	UXtAAtnrXZDh+sGacQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOmmO-005qt3-1O;
	Sat, 13 Jan 2024 22:47:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOmmM-005qrv-0J
	for linux-amlogic@lists.infradead.org;
	Sat, 13 Jan 2024 22:47:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5542a7f1f3cso9094472a12.2
        for <linux-amlogic@lists.infradead.org>; Sat, 13 Jan 2024 14:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1705186018; x=1705790818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JNMD09d2RI31XsyGdLgYlrGA0nsMzH49soHDGceK5A=;
        b=LiEAEkJrXfjETKrcXKn2UbwjCnuK7afY6eeDnO0gw5RJ1KuWirGZB58MoCnuqoHaqr
         UdTpJootIVoSgEX0stoD5HdhsLBZy/kxLJ3xKVCNWsc294f2Ns9xpuM8OWPCeTCHS0Sd
         T6TYy54iBHIwjz5GF0mvqudyO4lXzWmc4JDsHT08bF2U2euQjByY8R+GUgk1uQn8i4LY
         PvTU2Q/Ioz7NpA/jAYPMFOX9ajo7WUmzX2ky2tGIcQS8OdsrN9nFMDNSLs60WhVsfjOc
         7bBkTb5v6EO+DrNIXXfA5sYbiAcu6Z0Nw631376lXf+vJB9zG4vzZJNUrXsx85jBtzUq
         BuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705186018; x=1705790818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JNMD09d2RI31XsyGdLgYlrGA0nsMzH49soHDGceK5A=;
        b=S48OxP5W5P8NkGzxkGQ0oJphIEo+TWdQbcGK5hJlW1XxlGGttIpAi2fIi6CyrCMoW3
         PVEG8062wfvRCYZ/kk8u03rpgw+OY2wWCt7KJWNZdwcR3Xx8arxAwgyrFZ0ncd7Ltm7H
         UTPBjTIKcJPDXzp4RA6eN/TPN77L0Xi+UKCenvvN4HrfvO2/MUGtEzHf1y3bxNqZ8vqa
         bLvQ5clfdHG3x9t0yEXEyvhbXyqClFCChemcq4hCl/2lPlpWDjunJw80/lKhfFTlKUVD
         IDS9EBV5heMYidjNee2bAsPzIk8kD83eQ8B7hmIvUcft3ATdjDU53jW6gfyt5iofhQEF
         HD7Q==
X-Gm-Message-State: AOJu0YxMFYuCWhiaqootXz7mkfiu5Wq/JC3DWvYR4AfOyvEpQPhWVhRl
	3zXo/JIg+dzogVH/M0h969g=
X-Google-Smtp-Source: AGHT+IH57+jQicl/nrMvgqRkc+mYqfkhCajogy2AYQezBOw34978xaHVIC68tHaYJzDWugdeqFxkPg==
X-Received: by 2002:a17:907:908c:b0:a28:e2d7:b41d with SMTP id ge12-20020a170907908c00b00a28e2d7b41dmr1266919ejb.0.1705186018417;
        Sat, 13 Jan 2024 14:46:58 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-6fe7-c700-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:6fe7:c700::e63])
        by smtp.googlemail.com with ESMTPSA id g18-20020a170906595200b00a2d4e658132sm755409ejr.42.2024.01.13.14.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 14:46:57 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v2 2/3] regulator: pwm-regulator: Calculate the output voltage for disabled PWMs
Date: Sat, 13 Jan 2024 23:46:27 +0100
Message-ID: <20240113224628.377993-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
References: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_144702_134332_487BAA39 
X-CRM114-Status: GOOD (  12.01  )
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

If a PWM output is disabled then it's voltage has to be calculated
based on a zero duty cycle (for normal polarity) or duty cycle being
equal to the PWM period (for inverted polarity). Add support for this
to pwm_regulator_get_voltage().

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes from v1 -> v2:
- update pstate.duty_cycle to catch out-of-range values with the new
  check from the first patch in this series


 drivers/regulator/pwm-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 226ca4c62673..d27b9a7a30c9 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -157,6 +157,13 @@ static int pwm_regulator_get_voltage(struct regulator_dev *rdev)
 
 	pwm_get_state(drvdata->pwm, &pstate);
 
+	if (!pstate.enabled) {
+		if (pstate.polarity == PWM_POLARITY_INVERSED)
+			pstate.duty_cycle = pstate.period;
+		else
+			pstate.duty_cycle = 0;
+	}
+
 	voltage = pwm_get_relative_duty_cycle(&pstate, duty_unit);
 	if (voltage < min(max_uV_duty, min_uV_duty) ||
 	    voltage > max(max_uV_duty, min_uV_duty))
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
