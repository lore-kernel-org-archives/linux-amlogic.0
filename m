Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3C4EB7EAC
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwDMO0nhaAa51hUCiKvdWa/C2Xs0/1BqJvn+JaDNzrQ=; b=vLbVT9tm6v6AyV
	751b0zZ/P6zoRu8qN7op2Og3pmgCWRrrDal9k3hdAJbwZRL/ynvxF+QUHZC34yBczi+PNCdCVezwi
	+SDB162AFPMso/Ks9nv+LBpVmq3OhZ5GUR5xHIkhpRKIWWmz1IYmUX2KwUKP+7/RlE38qMMvL+Wjj
	rns+my2k2P37uHBCek3bxhb0r+Nn36aiz90y+aivYngEkOgo85oqjfxwdwwLyaFkMUjjHJ9HEaglh
	BOSqy9ierkJCoO7qw27rL0MNOuNnxN9VR3ptZRUNN69/vK9qkoqV6PI1CZZll8SO1LUp3ia/oe1EP
	YEIoOz/boYBk4DDGVFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8K-0000000Go8H-0i1E;
	Wed, 04 Mar 2026 09:03:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8G-0000000Go3X-07YX
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SVdC631907
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=; b=iUxvvGa6AHVsf1CE
	cIAp40KFRSxzaMK6tRo/Ot89r0FLdjshWY1bHp4UoR+oLQgLfgevmBmFzcrZzI+S
	MAYwCgG+1Kw6HklcYcmTPb9wnio6Mmmu+KNfOxWWI68ssxjEMOiht3K6oHazTm7d
	k59m+ycliFGezRAiNrZa5IQD9eNfQm1ux5umtdteTjH4P1BmPua270CY7X2LVHSz
	ducmX6SqIi+BprB0v5a7ITYi8Y+CLpwkBXlolQnD8pkrTK7mL8+KtWu1BOV5TSZh
	hxYUisIwzg/oCq9VRTY5RUf7H0eHiPu9dmGYvMaD78EeNmc+IFNqqelijKxcWMdf
	yxzJWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtuccem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:03:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-503342386a8so7045181cf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614982; x=1773219782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=;
        b=QPtVWeSz+ZAdqyb3FJoSt+ytv8XDGV5mYec3ks3EQ5l+yfoEpcuhjwEeLE6QDJoY5C
         6Fnh8L2738BdQ+jo7iOZ6utemT2mHCYW2MGkxT6NyX4mpbvIp4QZhiLNBc7toNNVTCYN
         5N1VJv6yacbXYMZ5MlzV41BjLP9YKLedre0vbbnJkd5OFTG9xZHM45ON1awQZkMrL7qK
         IxxyKUJ7+oXhNdZd4R8WqX9cvu9XelqI5NCRWn2WrCdhlV3TQm0FjT+HMiI/GjWTXEzm
         qRKcNx/FKUfOn7lW+bkwtIdDGwjQcH0urcefJd1fIq/mKnGg7VwYJwIkU27Vb9eybWVW
         tGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614982; x=1773219782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=;
        b=Kr8P7F/fyUuLxrbaMaWyUXQyoKhBxLMgAMhGFxEQ8p9MxBP5lXZ0VIzSA2Xz/cHseC
         RFZnGa3/2EpIDmTjXtEy4TiDpHBUTmpuU8V8AVB+pt9yYjsHZAVxZGuhu1snsjHQ/3Ih
         pDu0zgBaKmlkWYAJ9ApjEstGiKTlZ5mzYIq2x7W+kvc5lh7sJrlaXHzA2JNtR485IL97
         vbxnj1uLpIRJ/jBirJaKOiEoNhFBTtTksqi5gf4aUwFGIfQAnYKXeY3nAHI+yu/InvKS
         2fWk5S+3gJXiaQu+ZgPhBu2vTWtk3oerBtdlwEtHx9aTgdrOKgyLTx67yuCl5vBhktjw
         UEeA==
X-Forwarded-Encrypted: i=1; AJvYcCX4a3dNd3TT6eP6fbkknQEVjyOkhQSFI0UzqkBEInAlYnSiSfTuVq4MMDueK/SPPNh/h6CjdZPDIjsWItEb@lists.infradead.org
X-Gm-Message-State: AOJu0YzWX3sU2nbE9VlArROCxV9TyMSAhKpDY9u9Ihk1krF4oRvYaohY
	sxHZdSkwWchdRUa6V3zvtT4A8zgZeTI2k9GmBMjV+YNMFZjwp0c64sYa5r3bqH1Ov+gq3my3T3U
	rou4RjQrlggMoH3iHXbrGqfWoDab5FicElAkQOYK3ZTqADcdRrxrPNLcMtAL6MIedy6PDSR0OIA
	==
X-Gm-Gg: ATEYQzxLVaDe4vXnWKhIxLZd55I9H4YIJb4iPeOymu/cR6IEp2poYnOdik3ZZBxLpbj
	bGo7sljOM5+boKat2tlTvH//F1kb6y0KWAoWW0AzPJB9a2dd2WOWxJQzQUWBdRVzryTONWdkek+
	jf5yRTeUJr9TPaz5YY09zgp/aWyYw2Eu0TVW78Drhofg9JbkkwlOQTOhkxQx18V8OvnNr34NasF
	FV+JXscS5kpAT9TtYaMTIKln+Ipr27IF6tJQvK/GFieaHg33NzQbl8XQaLVms6/pSH+XgAWaRiY
	8bvMrA5D5Ap6K3rh2VHqiUOCJGl8rbSGnrsGFlNMSMauzCXoLaehaHUgHtTJnxSE15eyN0BPUcX
	ytwkkEzLI7ZB6j/JHYqiNbf0Y5bs4nH3T/LLNNg5jgvHLMmfa+q60
X-Received: by 2002:a05:620a:199c:b0:8c9:fac8:c256 with SMTP id af79cd13be357-8cd5afcc900mr147424885a.77.1772614982510;
        Wed, 04 Mar 2026 01:03:02 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c9:fac8:c256 with SMTP id af79cd13be357-8cd5afcc900mr147419085a.77.1772614982041;
        Wed, 04 Mar 2026 01:03:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:24 +0100
Subject: [PATCH 03/14] powerpc: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-3-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=25/jbEOYGOkc8yufidh5ln2EbH1f7N7ePyjlT7NMpnI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UsS6j20gNdLUQ+uz+/FXiej3C67iz8F70QU
 ojaj9vQK0mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LAAKCRAFnS7L/zaE
 ww6REACusP6I8XHqjA+3Yae7NeDqnzXpc6CQ+RTZzkcMq6aAfUEFS6xnlAen19ugyDgZQXHMarL
 2otsWD2rzmrQb2HB224/i2HmhrzTdbDRtBcATi1drYJWZXJq8Tc0tiILUbI8u+PUscTUJo6hOqo
 LLNyADlnO6/+12tJR0Kqga/FIARCLH72kRa+lJ1ioUe6rOG9rJjhYXcRbw6pZs5hNB9ccVw1gJg
 ok+/f5EYeeaHxbcGOMdXBmfgCELp6K4Z4GXyJ7+kWaJsxpvsG68R8kFZf/sUqZ6bysAp9KoUwES
 vstNFoLcRpgQGqBTPhi1BiKUEIAyfSWeh1Sts9nhRiXhe8GMSiRexRJ7xdDe+5eNhsNZ9iiBB+y
 9A3PzpJxACN6XNe3ieW4gmP9KV9xqdeOkCJOI41SgiYsrsjVvwXpx/RIzZTINJ3VOp6NYNRhqZZ
 5i/EvVw6gA7ozjKWgwOJeoa7c4FA6O5eGpg16Of9PXIHsU+p22FJhpa1uJxjQPCRoNW407R+LlN
 BwA/WM+f6L/iejzY7jy6mKzM0GzafixchYkMgywGkJzyPW4BXrvxclKdjdkMWqydECbBSpDUGdh
 7kP659V3emuNeEifz+/sDkqbSwB5RFmpXCadYNNP/SCDu5RVP6K2Z4UIdcTMXSlT6UB4HYSuush
 EJBC5HRypdQ+c/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: XzAEQJlubWz2Mv96-HDK9e3AYLVckSEa
X-Proofpoint-ORIG-GUID: XzAEQJlubWz2Mv96-HDK9e3AYLVckSEa
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7f547 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=CZix5RWMGGMvBx25UzsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX4ijqIzzxsE6F
 WxrUF+tUU3s+laGAXqLb09AxhnVtIZhYgWvqqjhGHFXlwklIiCbQPov6Ykhuw5FrdyE1lsPz3iJ
 o0QJvduaDV8JihG8z1985sST1P1tkSzCk5vA0NBt57iYnGhpNN1P/GAclq/lUU23doW+CNA7IMZ
 ir6vDqfAJPhoVzsLUia5ylZTZKINtZxg68VxgPjwJAcvD7bdSJ6FHuTmlGIx2HUeV/qihIH7pQ7
 XCvh3wK8ni8KXUAq1ngcvNZ7amAdsJvZTJVxOaxjSftaglNxCar/uKyuvaZAeeQg6QViyIsAhEx
 6nqaEgYcM9UtCWG870x2fpDkg9lHK4pdAYGtyfSbpDfuO+4gBWtDO2wJDzn7utIDclB6575fG8W
 9AZd2gcyorYJRXRR1GU/VkKBmonTSZ5get3yHOcZ3BsCr3aY5nZdFVi0mQIx0L+E4cCp3xUe3tb
 t8VLNgk9YFz7L+q6CsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010304_183556_123EA0A3 
X-CRM114-Status: GOOD (  14.00  )
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

OF_GPIO is automatically enabled on all OF systems. There's no need to
select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/85xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 604c1b4b6d45c11dc3149ee8b9adabe593882c8e..6805c19ac8a915dae1bd24b13010a56cf1948ad4 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -217,7 +217,6 @@ config GE_IMP3A
 config SGY_CTS1000
 	tristate "Servergy CTS-1000 support"
 	select GPIOLIB
-	select OF_GPIO
 	depends on CORENET_GENERIC
 	help
 	  Enable this to support functionality in Servergy's CTS-1000 systems.

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
