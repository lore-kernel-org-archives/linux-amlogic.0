Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB0FEA7197
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2026 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iq74OLBuqKRRAG8wup1OJDAsY2UA21c47pVlkKMMMzQ=; b=ME/w2fFeU+Btli
	R52P1Ng4Ev90fy2EqRjO1vlqHFcGICxjju/KvyMZcIKCCnO5hiImmi1mEcmAf4gekC0JSO7XJojna
	IvDpXcdOzhH9glxnwrIrGIBCijkTRGuUSTQKqQluiMzbCGwzDLKmvmNHE/YAEFvdD7g29SQMoQtbr
	YEKqfClZR9YytKGA9e+o29W4hmOi8CMB9/PfBvbpt4VLYDiesiMVEeQHMOBS8swcLsmj7wCcbPE9f
	+kVYf1kWlGsd1q9sM4xTKocpgiBOpny4yfftcyMsCgN16MRmY0ltlhT2djNLKvdRaVuyi0WhcZLEH
	oU0O1Oo9QWREN3BT42fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEWnK-00000005zAz-23Tl;
	Sun, 19 Apr 2026 18:22:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEWnG-00000005zA9-3oNq
	for linux-amlogic@lists.infradead.org;
	Sun, 19 Apr 2026 18:22:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JBgaN7966554
	for <linux-amlogic@lists.infradead.org>; Sun, 19 Apr 2026 18:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wxDS+E6AjtQ
	7nckN1UafhZkE9UqxJp4Wfu7o2Vgej8Q=; b=TXqzmNlLXDsR9aIx3b5BDLVYJ6g
	Cqc7dW4U//Xfbt4HvRlStD6bMHWTSVgePM9INkU/md330W6dK/s6hQc7vLrJolSs
	LJBHNl7s8tXl1nmR9VfVdKqkTwuRX8kWzPoSPRcCMnVQsambtJPfdZgqEQbrbKxk
	UDAlwAzKjREIld4e2RgZ8rtKj0wMbyEc6ClVuph/b5ykuzWqoHPPbqIo5pH+2K01
	BSU/pHT7V5FiVgZQqk+r0tlQVCFi3phUDaEPMjlLVwQHAfZAb+G0mlNbr/57cci4
	lWY0Aglyz1Iohoaa1NKYWPBDecugrazL/m3prF4DE5VN90CDY0WkU/BKPkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ujysn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 19 Apr 2026 18:22:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b220c72bbso62770821cf.1
        for <linux-amlogic@lists.infradead.org>; Sun, 19 Apr 2026 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622972; x=1777227772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxDS+E6AjtQ7nckN1UafhZkE9UqxJp4Wfu7o2Vgej8Q=;
        b=PPTwWLsonf0bhRz6ACz7bxwYvtzlwBRxvQ2jiVUMOtIS4Xtwmv1F20SlP3vlZALIHo
         4n+VKSg2GapCNNkrOs8UDQhwQ8l7gsNKaeFQmAb4msZRBXpT0naRmrf7xdHrZtxAWfMg
         ZpS89sLgjHueJxvAlMM5VSvd7tYmrNcUV4YcCUEr/B5ihboNg1RhjhHyBhBnBWukY0aE
         wewcn9hbYsKA6rxK+18rActbyYNjfiTFxetktYjUQ1j+Wv7FYGnXgYL4K9yF5YttQ3N0
         2IV2JsKKA7anMsCHfpmAfy1qbSwHJIgxDGOrOeGjH0KD26o5/RqfrHNHjykO8GWtTCex
         LzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622972; x=1777227772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxDS+E6AjtQ7nckN1UafhZkE9UqxJp4Wfu7o2Vgej8Q=;
        b=V68iDiFm0tp/Fp/KIfjGJQ93/HTO2BD0nsm0K9LWMCXUe62VjCD8o5JcI4N0RJQQDa
         PhoiDaO6lHTbvNK3upLb1ekV1qbH4YcN9h2b0GYxks/Xk1XTuBxQLWNAlea95R9qBMKS
         hHPc+V8fSGmVwWQGDWHi7tELijjXCs1c3FN51c2SWHTgn51ed/mPDrqnIruM/qISDSTi
         tq2P1Zt53TlUk/bm04B0x9aIFk73s1yU2v0WhXXpX4EJPVtGx/CoPAveJVoQM5BNx61y
         hK2SPZfDMj/cDAhxjTPqW0t3shID3+ivlDqeoI8qRegPJETOdaPrEBqEpw13JBOC3JQn
         /lSw==
X-Forwarded-Encrypted: i=1; AFNElJ8qOcOfaD1O6WE7268EtEAdp1UL7MR1iKaT6m1P1MhAJBd1Iu25erYM3c927j6EL2wKZBTGt1fKvkD/iVWq@lists.infradead.org
X-Gm-Message-State: AOJu0YxXhkhx64YLPKoFOGoP0eySGakMWEZubL+m8WdC21WyiCHL2lSa
	qyk5EauPqPlRTgZCORlGQwFKY8aUZcZr7PPmXW3c3SLcJULqHuinDhB4bh58tAD/oJVy6HWtZ5S
	ge6eYrZa9BuJHQxVXJerdTvHoVh0j708WIn2eYnWcNbDuFEidXnntk2fSKdMTCwbYrtLz2JJmqg
	==
X-Gm-Gg: AeBDieuSwT0HknRnJrDApg9kY8jYiIAA2GJWL0hwSMj8kjE1sSYpFQFsDXpgZDKQ6Pf
	5Jv/fC6AFfCbR+BPGrYeXP04hzQEVy+zdSJCcRh9ODhID+JMLOXx+O1KzppgYqzO5m8wlwxc0Jc
	UQFxMoJOB/z88ErR7Rw6ATjgUxZMzh7ubvRH9YtCBdM+RBpGCboPmbr+VnANWZt9FNVxQoU+3FX
	vGvFNfvHHYqn6EmQdHVCdNz2o2sRNbVMhMzVtYbcOQgj1cvyrjuErdXtUwdRjnnh0AMkjEmGI9e
	iEMzYw8Z6+ojIYbw8aGT9vHLT09NtSKEtelUXUeanCbsg1fsPwXSqqpWI58y37f1zRzzgYurzHS
	lm1PM5LlakFWaAV5/Iw4oiCHezhleYQXZjATX9baiNxKGWhxAkD5Bl0TQdo3P
X-Received: by 2002:a05:622a:112:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-50e36940b98mr155537071cf.13.1776622972101;
        Sun, 19 Apr 2026 11:22:52 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-50e36940b98mr155536611cf.13.1776622971624;
        Sun, 19 Apr 2026 11:22:51 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:50 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
        openbmc@lists.ozlabs.org (moderated list:ARM/NUVOTON NPCM ARCHITECTURE),
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-amlogic@lists.infradead.org (open list:KHADAS MCU MFD DRIVER),
        llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Subject: [PATCH v1 10/14] thermal/of: Rename the devm_thermal_of_cooling_device_register() function
Date: Sun, 19 Apr 2026 20:21:54 +0200
Message-ID: <20260419182203.4083985-11-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfXyIBwNrQt63wj
 U/QZcEfwlkYVkpOu3hUhGS+93zO85/c7oCAuxkbxzl0kAxzIN6+U+g+DCybe6y1k2zm096M2A9H
 cPKWjn/kxQZuevP6mipntf+4NO1eK1erjQpikpeOHSApRBJ7tPeasA/JTraVjvoCLvLI8B0P3nR
 LPT2MU8vrKMiVoH3r6BEM3Cs4LvVyH0uq/VrsVCa5U1xLUN4yBlnWNRjzV/xOEZbSwDXzhCk4w1
 8780nk4K4ohcL6ehLIV9AOTHHG2CABWHXR4Myo+vQWMpSzQy1k75MQ9UooHjvYfiRNq2YVjLKc3
 s1MQX9bEetlG2goSZy+EGJoAO9nOckKSgviOcOS0Gvbv/3uzmYjMo8AWS5t2Uuk9Z2c40AK0yAk
 8XiMRrtCwg6m65YlQ+VvtkN9r9q2QDtkRKM6m1/lmmVT0mrSTSjhlyc5UV/3zwyWZQLpQZ9CNdz
 zHk+M3atTaWGcebEA/w==
X-Proofpoint-GUID: XCt4WT6JWCgVLJXq-VvqwuaybjaTIyuj
X-Proofpoint-ORIG-GUID: XCt4WT6JWCgVLJXq-VvqwuaybjaTIyuj
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e51d7c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=9QVJCMzFHTx7fD6CVgwA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_112255_079151_2C521933 
X-CRM114-Status: GOOD (  19.58  )
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

The cooling devices can be composed with a cooling device controller
and a set of cooling devices attached to it. Until now, the DT
bindings were described using a node for the cooling device controller
and child nodes for all the cooling devices.

Recently, a new set of cooling devices were proposed with the same
bindings. Those were rejected because DT maintainers do not want this
format anymore. In place, a cooling device will be created with an
id. Whatever its meaning, the thermal OF will bind a thermal zone and
a cooling device by checking the device node pointer + the id are
matching the cooling map with the cooling device.

Actually this approach is consistent with the thermal which are also
registered with a device and an id.

In order to do a distinction between the old binding with child nodes
and the incoming new binding, let's rename the registering function
with a self-explanatory name.

Rename the functions:
	devm_thermal_of_cooling_device_register() -> devm_thermal_of_child_cooling_device_register()

Used the command:

     	 find . -type f -name '*.[ch]' -exec \
	 sed -i 's/devm_thermal_of_cooling_device_register/\
	 devm_thermal_of_child_cooling_device_register/g' {} \;

Did not used clang-format-diff because it does not indent correctly
and checkpatch complained. Manually reindented to make checkpatch
happy

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/hwmon/amc6821.c                  |  2 +-
 drivers/hwmon/aspeed-pwm-tacho.c         |  5 +++--
 drivers/hwmon/emc2305.c                  |  6 +++---
 drivers/hwmon/gpio-fan.c                 |  6 ++++--
 drivers/hwmon/max6650.c                  |  6 +++---
 drivers/hwmon/npcm750-pwm-fan.c          |  6 ++++--
 drivers/hwmon/pwm-fan.c                  |  5 +++--
 drivers/hwmon/qnap-mcu-hwmon.c           |  6 +++---
 drivers/hwmon/tc654.c                    |  5 +++--
 drivers/memory/tegra/tegra210-emc-core.c |  4 ++--
 drivers/soc/qcom/qcom_aoss.c             |  2 +-
 drivers/thermal/khadas_mcu_fan.c         |  7 ++++---
 drivers/thermal/tegra/soctherm.c         |  6 +++---
 drivers/thermal/thermal_of.c             | 12 ++++++------
 include/linux/thermal.h                  | 16 ++++++++--------
 15 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index d5f864b360b0..8e5926b06070 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -1076,7 +1076,7 @@ static int amc6821_probe(struct i2c_client *client)
 				     "Failed to initialize hwmon\n");
 
 	if (IS_ENABLED(CONFIG_THERMAL) && fan_np && data->fan_cooling_levels)
-		return PTR_ERR_OR_ZERO(devm_thermal_of_cooling_device_register(dev,
+		return PTR_ERR_OR_ZERO(devm_thermal_of_child_cooling_device_register(dev,
 			fan_np, client->name, data, &amc6821_cooling_ops));
 
 	return 0;
diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index aa159bf158a3..1c5945d4ba37 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -841,8 +841,9 @@ static int aspeed_create_pwm_cooling(struct device *dev,
 	}
 	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%pOFn%d", child, pwm_port);
 
-	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
-					cdev->name, cdev, &aspeed_pwm_cool_ops);
+	cdev->tcdev = devm_thermal_of_child_cooling_device_register(dev, child,
+								    cdev->name, cdev,
+								    &aspeed_pwm_cool_ops);
 	if (IS_ERR(cdev->tcdev))
 		return PTR_ERR(cdev->tcdev);
 
diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..2505e9fac499 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -309,9 +309,9 @@ static int emc2305_set_single_tz(struct device *dev, struct device_node *fan_nod
 	pwm = data->pwm_min[cdev_idx];
 
 	data->cdev_data[cdev_idx].cdev =
-		devm_thermal_of_cooling_device_register(dev, fan_node,
-							emc2305_fan_name[idx], data,
-							&emc2305_cooling_ops);
+		devm_thermal_of_child_cooling_device_register(dev, fan_node,
+							      emc2305_fan_name[idx], data,
+							      &emc2305_cooling_ops);
 
 	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
 		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index a8892ced1e54..084828e1e281 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -592,8 +592,10 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	}
 
 	/* Optional cooling device register for Device tree platforms */
-	fan_data->cdev = devm_thermal_of_cooling_device_register(dev, np,
-				"gpio-fan", fan_data, &gpio_fan_cool_ops);
+	fan_data->cdev = devm_thermal_of_child_cooling_device_register(dev, np,
+								       "gpio-fan",
+								       fan_data,
+								       &gpio_fan_cool_ops);
 
 	dev_info(dev, "GPIO fan initialized\n");
 
diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 9649c6611d5f..a50b1b0f1f48 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -793,9 +793,9 @@ static int max6650_probe(struct i2c_client *client)
 		return err;
 
 	if (IS_ENABLED(CONFIG_THERMAL)) {
-		cooling_dev = devm_thermal_of_cooling_device_register(dev,
-						dev->of_node, client->name,
-						data, &max6650_cooling_ops);
+		cooling_dev = devm_thermal_of_child_cooling_device_register(dev, dev->of_node,
+									    client->name, data,
+									    &max6650_cooling_ops);
 		if (IS_ERR(cooling_dev)) {
 			dev_warn(dev, "thermal cooling device register failed: %ld\n",
 				 PTR_ERR(cooling_dev));
diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index c8f5e695fb6d..aea0b8659f5f 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -857,8 +857,10 @@ static int npcm7xx_create_pwm_cooling(struct device *dev,
 	snprintf(cdev->name, THERMAL_NAME_LENGTH, "%pOFn%d", child,
 		 pwm_port);
 
-	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
-				cdev->name, cdev, &npcm7xx_pwm_cool_ops);
+	cdev->tcdev = devm_thermal_of_child_cooling_device_register(dev, child,
+								    cdev->name,
+								    cdev,
+								    &npcm7xx_pwm_cool_ops);
 	if (IS_ERR(cdev->tcdev))
 		return PTR_ERR(cdev->tcdev);
 
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 37269db2de84..e6a567d58579 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -685,8 +685,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
 	if (IS_ENABLED(CONFIG_THERMAL)) {
-		cdev = devm_thermal_of_cooling_device_register(dev,
-			dev->of_node, "pwm-fan", ctx, &pwm_fan_cooling_ops);
+		cdev = devm_thermal_of_child_cooling_device_register(dev, dev->of_node,
+								     "pwm-fan", ctx,
+								     &pwm_fan_cooling_ops);
 		if (IS_ERR(cdev)) {
 			ret = PTR_ERR(cdev);
 			dev_err(dev,
diff --git a/drivers/hwmon/qnap-mcu-hwmon.c b/drivers/hwmon/qnap-mcu-hwmon.c
index e86e64c4d391..c1c1e9d6f340 100644
--- a/drivers/hwmon/qnap-mcu-hwmon.c
+++ b/drivers/hwmon/qnap-mcu-hwmon.c
@@ -337,9 +337,9 @@ static int qnap_mcu_hwmon_probe(struct platform_device *pdev)
 	 * levels and only succeed with either no or correct cooling levels.
 	 */
 	if (IS_ENABLED(CONFIG_THERMAL) && hwm->fan_cooling_levels) {
-		cdev = devm_thermal_of_cooling_device_register(dev,
-					to_of_node(hwm->fan_node), "qnap-mcu-hwmon",
-					hwm, &qnap_mcu_hwmon_cooling_ops);
+		cdev = devm_thermal_of_child_cooling_device_register(dev, to_of_node(hwm->fan_node),
+								     "qnap-mcu-hwmon", hwm,
+								     &qnap_mcu_hwmon_cooling_ops);
 		if (IS_ERR(cdev))
 			return dev_err_probe(dev, PTR_ERR(cdev),
 				"Failed to register qnap-mcu-hwmon as cooling device\n");
diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index 39fe5836f237..ba18b442b81e 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -541,8 +541,9 @@ static int tc654_probe(struct i2c_client *client)
 	if (IS_ENABLED(CONFIG_THERMAL)) {
 		struct thermal_cooling_device *cdev;
 
-		cdev = devm_thermal_of_cooling_device_register(dev, dev->of_node, client->name,
-							       hwmon_dev, &tc654_fan_cool_ops);
+		cdev = devm_thermal_of_child_cooling_device_register(dev, dev->of_node,
+								     client->name, hwmon_dev,
+								     &tc654_fan_cool_ops);
 		return PTR_ERR_OR_ZERO(cdev);
 	}
 
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index e96ca4157d48..065ae8bc2830 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1966,8 +1966,8 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 
 	tegra210_emc_debugfs_init(emc);
 
-	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
-						     &tegra210_emc_cd_ops);
+	cd = devm_thermal_of_child_cooling_device_register(emc->dev, np, "emc", emc,
+							   &tegra210_emc_cd_ops);
 	if (IS_ERR(cd)) {
 		err = PTR_ERR(cd);
 		dev_err(emc->dev, "failed to register cooling device: %d\n",
diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index a543ab9bee6c..742f571200fa 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -381,7 +381,7 @@ static int qmp_cooling_device_add(struct qmp *qmp,
 	qmp_cdev->qmp = qmp;
 	qmp_cdev->state = !qmp_cdev_max_state;
 	qmp_cdev->name = cdev_name;
-	qmp_cdev->cdev = devm_thermal_of_cooling_device_register
+	qmp_cdev->cdev = devm_thermal_of_child_cooling_device_register
 				(qmp->dev, node,
 				cdev_name,
 				qmp_cdev, &qmp_cooling_device_ops);
diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313bea4..21b3d0a71bd0 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -90,9 +90,10 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 	ctx->mcu = mcu;
 	platform_set_drvdata(pdev, ctx);
 
-	cdev = devm_thermal_of_cooling_device_register(dev->parent,
-			dev->parent->of_node, "khadas-mcu-fan", ctx,
-			&khadas_mcu_fan_cooling_ops);
+	cdev = devm_thermal_of_child_cooling_device_register(dev->parent,
+							     dev->parent->of_node,
+							     "khadas-mcu-fan", ctx,
+							     &khadas_mcu_fan_cooling_ops);
 	if (IS_ERR(cdev)) {
 		ret = PTR_ERR(cdev);
 		dev_err(dev, "Failed to register khadas-mcu-fan as cooling device: %d\n",
diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 9d3eb3be2db0..9911f3ec0f40 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1700,9 +1700,9 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 			stc->init = true;
 		} else {
 
-			tcd = devm_thermal_of_cooling_device_register(dev, np_stcc,
-								      (char *)name, ts,
-								      &throt_cooling_ops);
+			tcd = devm_thermal_of_child_cooling_device_register(dev, np_stcc,
+									    (char *)name, ts,
+									    &throt_cooling_ops);
 			if (IS_ERR_OR_NULL(tcd)) {
 				dev_err(dev,
 					"throttle-cfg: %s: failed to register cooling device\n",
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 3d2fb8f37b9c..ba5093f612d0 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -550,7 +550,7 @@ static void thermal_cooling_device_release(struct device *dev, void *res)
 }
 
 /**
- * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
+ * devm_thermal_of_child_cooling_device_register() - register an OF thermal cooling
  *					       device
  * @dev:	a valid struct device pointer of a sensor device.
  * @np:		a pointer to a device tree node.
@@ -567,10 +567,10 @@ static void thermal_cooling_device_release(struct device *dev, void *res)
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-					struct device_node *np,
-					const char *type, void *devdata,
-					const struct thermal_cooling_device_ops *ops)
+devm_thermal_of_child_cooling_device_register(struct device *dev,
+					      struct device_node *np,
+					      const char *type, void *devdata,
+					      const struct thermal_cooling_device_ops *ops)
 {
 	struct thermal_cooling_device **ptr, *tcd;
 
@@ -590,4 +590,4 @@ devm_thermal_of_cooling_device_register(struct device *dev,
 
 	return tcd;
 }
-EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
+EXPORT_SYMBOL_GPL(devm_thermal_of_child_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index a8e870ca2e27..6535353ae83c 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -206,10 +206,10 @@ thermal_of_cooling_device_register(struct device_node *np,
 				   const struct thermal_cooling_device_ops *ops);
 
 struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-					struct device_node *np,
-					const char *type, void *devdata,
-					const struct thermal_cooling_device_ops *ops);
+devm_thermal_of_child_cooling_device_register(struct device *dev,
+					      struct device_node *np,
+					      const char *type, void *devdata,
+					      const struct thermal_cooling_device_ops *ops);
 #else
 
 static inline
@@ -233,10 +233,10 @@ thermal_of_cooling_device_register(struct device_node *np,
 }
 
 static inline struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-					struct device_node *np,
-					const char *type, void *devdata,
-					const struct thermal_cooling_device_ops *ops)
+devm_thermal_of_child_cooling_device_register(struct device *dev,
+					      struct device_node *np,
+					      const char *type, void *devdata,
+					      const struct thermal_cooling_device_ops *ops)
 {
 	return ERR_PTR(-ENODEV);
 }
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
