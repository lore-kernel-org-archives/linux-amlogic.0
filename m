Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7005DEB7EAC
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za07y/oMauQx1kpBLr/iOi/731AuXBmehsPaS+HYSz0=; b=NfrM4fRUR+rZrm
	hMY7aZwjE2Tgvbhkur3CwgYszuTgsTKbPSVNXYbM2Ztalg870AGZhDQMTEbiGDcaUEJ/EK+9WmCMx
	LcDkXj2rzo2qOH5u0QeT9LTPV54if/nK0dNgyAtcmgsUJOoT4bDR67NhhyNOKj03g2VRvHiK6DfE8
	27Xvy7PRmuq1SiWY1YZNc/5gu+4mFep0LBuHR7P4yxbN+KNo3RGCU6UIJlWiAHrRyP8E2OoDQpfLx
	fbagN643cpscDaD9ysfmXx+lU0mAfPMSdPPhQiV1o8PDjmG9zZ2k3CT+duRK/j0I9ttWjbRWoWv0F
	7fi+Z8sn/VRbkLE0J+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8m-0000000Goj6-0M8Z;
	Wed, 04 Mar 2026 09:03:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8f-0000000GoXv-3TgZ
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SP9o631866
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=; b=O8DhNi6iiQ0wr6Qm
	XLgu0rlhFSuVWEQJkPbXZmZ9JD0AwZqTH8m46nANsRAK5ZixwpLI4VIEw8Za8BCw
	d4WiUqgPneaIhP+Ubju+TIK3gQ2rtr/xMZVAsMGU44w6cZ+kxjd4e/FlWaQiPO1H
	BR2NcuGvK08bm6aCDi8fbg9vt4ty/wRRgG3R3lMHBoVhwBQLmvzkLaw1B5gLozE9
	l58MB+oJBlSMflR1Uzzsa7vjJiRM7ipJrU/Bd9Wa0PWEfNFOuppvZiDZQZ43xps8
	qIS/mrDUT0yrBclJLPfzLA3bR++4OOCwfWGHZ+RjwPOufd0zashYK1qlwHOJ3UqD
	3ux1Vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtuccgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:03:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso814505985a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615008; x=1773219808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=RecZXlzIllnQeGRoK69lIloxcMUhREEYFKb2L6YWk04GXaU9XTleWgqqnj9GC0O9lD
         hZS6PLoeeiy0ik1Y4dnbxEPhhnZLITHJSEen2qj1BADjhxCUnFr4iBA/aPcr26D+01Qw
         kRDwL/nz6o1AvMNoxag+QkMOQKaU8vRnC6KI73DtCV/ZCk2z0uF6yLGa7BpjG2N0viRj
         CwxSDxGcTuuO1ktqitAYX9OnBOMUTDatl5MjlmpbCGevD6LWeprnrsNzzdlugndNNHh1
         mU31dx5KWCEGyxNeOtbYuB5bDcRMxpFq+7IcKkyJ/nY6mtxX88M+x599R+veoqi9nQCT
         JgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615008; x=1773219808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=NoIhze/16UauJPL/SjFsNLsjWqaRFKh+IuSHnyHdRJ2lpICtb5OvxL0MB2ka8OwP6U
         203hfpZU/8T2Tbt4ksJQ1acJb9r098303xsLQPBdcTE+V2rV0qIvJsrE2Oz61cC9PkA3
         ejiQT05AqQw4PKd4EvfJetz0adRkfEwDutn64ma3lhoA8OqlyluqNKKziRPgNF6Wcor+
         ZKNH+t9Xs6bfr9e7bvmE6Aumps1VfpSgYIhFZEKQKe6FYJmYk44Cge0y1B9mCaxMtvty
         psKt/xLmBXNxibcee6HA5WB3K7fIt0lp9nOC/W1pWnR5tQc1c+cldQh48tUPTYlUZL3f
         O9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLkYBljEfjFo3mb04oqXfN/3c5Dp7xsXNw5uM4S2KJGDizaKxXhD/uoEFIR9xYgEB0E7YueyGyYNDjmOSe@lists.infradead.org
X-Gm-Message-State: AOJu0YyXjzHkXpsc3wpksoBNWT+jBhN6TDaiEG3VL+SYHhT3ykTt+7Md
	6Syuheip+4l7Ukk4C5NQ7mxWe6r8kkpz07QODs5NUPYPzK2IwlPmzKyKeSvJNmw4m3xhWPkeEHX
	p9vFv2oPCEc3xkhJQnYg82aEPF6V6AEN7WTaJ+WgKoifjLrrccCls04YK9fSY/Y5HO67lP/2pYQ
	==
X-Gm-Gg: ATEYQzywBbsFctmY3Z1KiE3wBKieBmd+8Qu640WVmIzjtCnI4c6U9XUNCkpfGx7lDmc
	XglIKk9C+IyRbWlUkTW1DBMvHhHfsliq70y7FLjdEsXeAJMnYtPXJTGXUljrv90b2YNQNNabFAc
	xAJltZrTnurijXGIR0nyIPFvMFeoqSn9MDEf8vDqfitDt8sWD0r0zF82gGKtneak8zr+NQsiUBv
	L88vJ6N7AA3jlu1oCykfrEVKPQYsN4hyPhpt7fGchwb21rnTZS4U9RMRaeUz2aNiuxx+V5pDnNX
	h659cZxP/m0x9ZbBsQvJCug8v/+wjBcU9MJ602iDah03w2J4zoOREcqWzgjDwZHW3mk774Euvxz
	JFCWGje3QoegL5UkfmGoffTiKrXC8tjDoGzQBR43DYexHbXJ1Txzr
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148863785a.38.1772615008136;
        Wed, 04 Mar 2026 01:03:28 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148858285a.38.1772615007620;
        Wed, 04 Mar 2026 01:03:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:30 +0100
Subject: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BZ0gBX6ApkbfQGAvIdrTK0HNC5TATefci/BtaAEAScU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Uz6yqxw+9I2xsnrbiXWkb1Q6qa6KwlYI8TK
 d9JejBIMTWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MwAKCRAFnS7L/zaE
 w/3aEACwVZCfqTwZVPWkHYhO8Qy3o0ruCZnb285a+Ylf7yiCsvgYQn0a+sJ2Arc7KxxU/aPIXGv
 0aCZMBstfCGSxehuCnwhBer6o8ip4bb7kyIIkx0dm62T4QqKQ5L5QA5G4ciTBJ8EuvjtnSMeGuJ
 95epXjl8sR026uh4KZEYZYxbOgIWvV2Ug4vquTWPnO7T7/frpn7ujJB7EUgTMG+EHBSM2FIE+0v
 HWjaX7Q/qKobdkdnrFIva7tNsWe8WCAiSmYSvQGlWmDU15f/4yihAn90zQLK14jwUIIvbqKCRxW
 bhf7+1haXr3TsZRioTZ5+sP9XAFSH7Urm6a1oEoHKB06fJnOPAEawTfp9MNx1DfqPO3gvgmONrV
 yrSwl3IpJ3ld2yUQuOFT9i2nmkedupRNvQtalNFEPOpJtbP0bakZqh+KnXuyhvNKScPwT4MVgHu
 Lr4cvrNkmt//CI9a0nV0Wx85nantYCCTBfgiWEr5WrWOVDtQIL0JTuP/KYxN6KWjgf2fXehFdib
 dWGeFHTIp/lY4HrTk+4tQ6oetpUDkdppOiusjNeG9zYX5WjnV48wsSXaXvsw9gkjpeLyJAf1lNV
 3dZw5ihRTGrkMUJYU/0S567LpMEIQZfQetG+3NuIzQOs4p3djYvv1xGRysT8SVHkZVcA3vjwKfu
 YphKNug3FwuWLkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: VwnTeiEjw33NMoCcJ6rAQqcyPQR7L-5m
X-Proofpoint-ORIG-GUID: VwnTeiEjw33NMoCcJ6rAQqcyPQR7L-5m
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7f560 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=DLk2I_icXWleI3Wn6BIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXyNXMlM3sVNv6
 waSGbhrJjxyD29uqGxUehPUkZ/wLlFspES0Qb3b44wcM0n/cXWm4GqE/o8AW9wyDdeNwbmjwI32
 Jbae0DkTcRJWnYCCo4+8wunrL9MoH3ulKI227E1C6DQQmxBIHTtMl+yn+mKtyNztGYtk6Z7wbix
 3dcF8Yc9xOMDXAKh7q96GmwVf1Zy64S8R5/vnmHRQPuHpNmDKW7U8YEiu1/NnZRqMqjxiBOfg0M
 LGap/wOZqb4Ll4ncmIX+ztYeWjKGOEfXbnKMITzlfh1dgn8w4Cd57zvInybF5aZWbjl5KAVFFyh
 RbIDCJ8dokx7AWjKWyUftD0iy4DtVmT0McF/dsRHLOWu/6c2W+2CxKBEqvCVSkd8PephYZZNriS
 PPv1LbXgiiVAF34k/PpRnplV4auihc9mVRsXCHda7z1cQhm9h6sknYHbIgvLpFrr2HKQwXyBqYJ
 OGx2e1/I76k+76B67og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010330_094387_AA00690E 
X-CRM114-Status: GOOD (  13.79  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/hwmon/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8f7ce66ae3a258ebd439ed97441bb087dc01c76c..fb77baeeba27b9ec51142040beccc953df0a1e3e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -775,7 +775,6 @@ config SENSORS_G762
 
 config SENSORS_GPIO_FAN
 	tristate "GPIO fan"
-	depends on OF_GPIO
 	depends on GPIOLIB || COMPILE_TEST
 	depends on THERMAL || THERMAL=n
 	help

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
