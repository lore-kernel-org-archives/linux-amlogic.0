Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F899C36008
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Mar 2025 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=32b2EptF+Uey5HZR4/xoCVkd5ZLCnZoqBD0LCwFlG0U=; b=d7iDI8kmmQpJdw
	WgjfShyuDRzaAOToGO2jQ7nrXV6HfRFopDecwqABYNG4uf1P2fNxHoRQ46ZqoI1Gfz9JNhIkEVA5k
	j7tQC+wpOh1soascdEHdVX+olX3g/+QUu6HrjtvbW66q4v/6PRUZ5VJIFpQZ105+aYeLkx7Ese01A
	ny8uyA3mbs7/uRU3SkFzzq6D4CDgjHRWukGWKeVfwcYmxOxLKm3zKd/nzkdgL7RWH6TNTttoD+6Hv
	SCxu4FQvUjJGgk58QG6dsrd9BhXblPW3kmJmyU4vNa8nmCOD6BeL//beuvean61AEYiwiwr5tByF6
	3bFL78avWJvlKLeVeAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9z2-00000006sc7-3CqU;
	Tue, 25 Mar 2025 19:30:44 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9z0-00000006sbM-2ZFD
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Mar 2025 19:30:43 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5f89aa7a101so2905265eaf.2
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Mar 2025 12:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742931041; x=1743535841; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4W8NwGIv3g9q9bD90ERb4CwpLXg29q/gl0kZGMFw8mM=;
        b=lhRhAShmVXGu968pimtyc8hi9Xq3Jfg4uqrpf6O83dHri5dL8tzydRToaEqx1J5wVc
         XUHBWeUOmvQCMlFwTLw+smFWP/2grerJMx46Kd7inyAGQeGa3U2ApJArY2wUQOpA8YK9
         ELbuYOcjw/En7giyOwNZzTqYnH7mcdG6nCx3EtuvrrXIdinj+lVeklo9GA7mHc0yax5o
         94HzJNjgqkXLCgQRWF+RUfZXfR90/s1SgVVHwtrpqUkNuiSZ3Z2rFzyiKMggW+EV9Gy9
         xaD9visHplw1eVSOFJlRODjh5xmAb35amMwClZAfvsRmFGQQU8dNwrVZEQJce0f1+yr9
         YB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742931041; x=1743535841;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4W8NwGIv3g9q9bD90ERb4CwpLXg29q/gl0kZGMFw8mM=;
        b=pu1W9+p8tyKDm9iqlPQpiYMyl4TVePOvUqFCJEpyfvgjX6OUDE4LEylBEQGuEYtao8
         vqEVcPzro8p9xJS1FXEpzuMbv+MBP9oMc3bm7MXkCBne5HA8Kp7BmNO/NWpDoWhjuxgC
         PNGxxgKYvKJFWI2VKl7OJGQinU6nqe95XAtBjNRS0NH75JJwl6p82IkfouSALSYClvcH
         Q5VYyXx0KmhKsb2sCTBQv8vFyN8B4sm3bRFI7tsd4lxKJBWQcMUuHMrVrYNeMQtyDMke
         7jLMxy0ebOm46YawFbE4yKYB4o2619D3oswscwCCSDp9BAFuSYULhEgfmGeXmIEiFUuc
         TgYA==
X-Forwarded-Encrypted: i=1; AJvYcCXtymLxsHKRZvYMJfKLd0yKjKRhAZVwF3+yWpAahlgvhsP5vbCDJFqHKZbRbJgal6No91F50jVRZWM2stTt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6RTuOB8qFGo5Na5vlRGH/IKsaEDHhUw2gp1mhjo9cRYO+xBmQ
	aki8/Q0vqJc9kJGTEzPDNvPY9DTVB8DfriaJTu+Dxy9nwUTSBphT
X-Gm-Gg: ASbGncviowzDaq97GuPdpshvSiCkFMxwlKXc/l7mljoBPhNTx2bszylqhmPN+TRcAID
	B3l3rDudTVd30Z1dV+vwKazLFmiFS7bFXnVu4UwwY+sPCCrO1kxqD6SJRut6Ynx8SRrtlMxVgUg
	usrcT3+Xro900OWuHn6U6Hh7ScKbMtRC9XKmecBqDbFXRLxfDvim++HuWRtX8JYEpZYNsVsdWBh
	MZheiAzHK0+G/qCL0snUHoSniX1iU/pmahIZQ78LFAQYdsUovUb9M5/jmANLe/3i3Ua6Jeyssuj
	TxUxipG8LvzOjhwOI4LPMQsKHqx3WMFr/URYtUmVbXo5sQ==
X-Google-Smtp-Source: AGHT+IEwsieHitnF5P9+HL5fGRcvkWJOdtlW3j2FjuRo8vp7AE4y1CEzqZ9QMeBYn1I8NAM+YMV68Q==
X-Received: by 2002:a05:6871:8301:b0:29e:74a0:e03f with SMTP id 586e51a60fabf-2c7804c7e14mr11154768fac.24.1742931040920;
        Tue, 25 Mar 2025 12:30:40 -0700 (PDT)
Received: from debian ([200.92.175.161])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c77f0f6825sm2644934fac.43.2025.03.25.12.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 12:30:40 -0700 (PDT)
Date: Tue, 25 Mar 2025 13:30:44 -0600
From: Enrique Isidoro Vazquez Ramos <kike.correo99.f@gmail.com>
To: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@linaro.org,
	rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: amlogic: Rename Uptat to uptat to follow kernel
 coding style
Message-ID: <Z-MEZNMLUmj75uxN@debian.debian>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_123042_649102_EB0378A0 
X-CRM114-Status: UNSURE (   9.97  )
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

The variable Uptat uses CamelCase, which violates the kernel's coding
style that mandates snake_case for variable names. This is a purely
cosmetic change with no functional impact.

Compilation tested with:
- checkpatch.pl --strict passed (no new warnings/errors).

Signed-off-by: Enrique Isidoro Vazquez Ramos <kike.correo99.f@gmail.com>
---
 drivers/thermal/amlogic_thermal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 3c5f7dbddf2c..5448d772db12 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -7,10 +7,10 @@
  *
  * Register value to celsius temperature formulas:
  *	Read_Val	    m * U
- * U = ---------, Uptat = ---------
+ * U = ---------, uptat = ---------
  *	2^16		  1 + n * U
  *
- * Temperature = A * ( Uptat + u_efuse / 2^16 )- B
+ * Temperature = A * ( uptat + u_efuse / 2^16 )- B
  *
  *  A B m n : calibration parameters
  *  u_efuse : fused calibration value, it's a signed 16 bits value
@@ -112,7 +112,7 @@ static int amlogic_thermal_code_to_millicelsius(struct amlogic_thermal *pdata,
 	const struct amlogic_thermal_soc_calib_data *param =
 					pdata->data->calibration_parameters;
 	int temp;
-	s64 factor, Uptat, uefuse;
+	s64 factor, uptat, uefuse;
 
 	uefuse = pdata->trim_info & TSENSOR_TRIM_SIGN_MASK ?
 			     ~(pdata->trim_info & TSENSOR_TRIM_TEMP_MASK) + 1 :
@@ -121,12 +121,12 @@ static int amlogic_thermal_code_to_millicelsius(struct amlogic_thermal *pdata,
 	factor = param->n * temp_code;
 	factor = div_s64(factor, 100);
 
-	Uptat = temp_code * param->m;
-	Uptat = div_s64(Uptat, 100);
-	Uptat = Uptat * BIT(16);
-	Uptat = div_s64(Uptat, BIT(16) + factor);
+	uptat = temp_code * param->m;
+	uptat = div_s64(uptat, 100);
+	uptat = uptat * BIT(16);
+	uptat = div_s64(uptat, BIT(16) + factor);
 
-	temp = (Uptat + uefuse) * param->A;
+	temp = (uptat + uefuse) * param->A;
 	temp = div_s64(temp, BIT(16));
 	temp = (temp - param->B) * 100;
 
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
