Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0DAEB7EB1
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4hofAA+mpNk+YkFFvDaalfwcvC5O6TQCveO2y3yPRY=; b=cfgSG2xeN9TE7w
	G9S6pAsv6QKl73/DvqWwglHvtpOT2losouxtCqL+wbj+tcyzS2iYI5xhTns7wV9NbO4Y9wiv/C7XD
	Tada5oxY6yDu1O0WWk4eN+AbD0W1WYXRd/al4b7qoAbUmp5Kj7hqd+VuH3+py0yZn16KbjsJ9llSj
	CNJKG5A4BwRcdIktn3DVNfi3KyR260XjR+cu66ID0DzWUdgGsscWrHUwtKfI7piM7/tOuG0muT80h
	pwjyDHLbXY5rv/cJd6APsDlyA9s7n89di43UFEv5nC50LYTcOnjrZqxwUYQc3HWxIeWqqHBgmQxl0
	HjqAUNmS0cb10RpAkXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8E-0000000Go2t-3IFR;
	Wed, 04 Mar 2026 09:03:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8B-0000000Gnz8-2Gzr
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQLI2861140
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=; b=CazoV7ZGoy+xYvkW
	cCJg6ClwtEdshtyKOluMNv36otWlt5w1TDCYQ+bImxm/DRWwpCmu07h+Y1mvNmO5
	+hM1wnV+qfEXZ1/g73CCmJlHqgibwXu1PmqpDsTIELhobC5+9kE23b0dgz5e+yCr
	a3iAYAZah49tETdO1Y3PEYiwldEgVdLyrE/ibxq+kMbix3Mu4I2pDDdr75h27WJ5
	p54SIGKrE+7OwsTZhT3+SBBBSdxU3nYE5q6p+ztUB+1ipIxADEG0ZKZwF/a73jRD
	bVp7G5Dc0+YxpHnqgBCeO4s9X9JuWTXzfAPJcvSzFQqIzoei2Vhum+GBwB77CHca
	f7xWeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9k91e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:02:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so3722503085a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614978; x=1773219778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=;
        b=AzsNxCIgXg5rllKnyOMbROpBlaF5IQFGvSDul/UTvq4v1CzDWv91BNqvLLx+YNFsEI
         wKajysLHCHFleRag9uJT7Ay4+0EYTS/tr85wAMuG0yXHHbBNK+pW2Jhcarj9SOTO0R2C
         lISFl0i2qh4Ut/mA2i4SBQelN1SAbNj+zA8ZxcfLGE2qz74DPINXKaK27S51gvD9EP89
         dWjG1cezL3eei2K3czp648bU+/2iUShHCDzU/CVBcmKesXzz9s/OYGbenR5vR/h+Wzac
         G9CvhftgYioDqCElyWhtiQpHhMovYRISowfv3/lL8GA8elfAlUUByy3JyZ79FRfTI6X8
         9yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614978; x=1773219778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=;
        b=Yjl2RmnXqUfToTJmy0DLQtZ2sbMvSArNPgrUgRUlvHKqXOJ20oJ+NjWIwYcK0jFzyP
         bmAFqa9nqyXAj6gkzN6EOloLRFn3oHowpxtptzKI1qipsOPOzTCxCbKnlX77dhaNAtdm
         ftzqQNg6NjF4WPp1VOzyn6M4WzVOpr/2RJfrGhsI2CmnZKIyvnQDoUBgsM+VW1L4QrYK
         OrWCUmmgeHwdH+Cw8phvGA3d9jpD1SbXzmI9IlDVyoNn6o9wyA7cq8y1ejtMXNfVDDG8
         X8x8YMLRTmG2q95NJmyHWL2exCj5DGczofP1WqoCxm27p1hGn/dlPEIx3QDfoibH5LEs
         M97Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQJXe9imCL+o2qRF04Mw1JnBKGWi7SmAg/GgYir9VW0pZrvME5+6Kt+4XztlhPv5DnJ0mU1bvKE6Bdls44@lists.infradead.org
X-Gm-Message-State: AOJu0YyZgHASFKbEF+e8g4j2GB3QgUYN0uZCfc+ytR9mc3JTQdBPYp5K
	8dz4xiJLFbxUw/Dfy4dXvT/ghw0Dut/Q8/fK6y8ntQuraTCCUTLuUxiegiJw+UCiWxuoZPngO6M
	QzM3tqAG39AAJVGMKcDpR0JyGacu4ipbep50y+Xa3VIdN469G4oKgZ+d3k5s9B84Z9CEvLcEy1Q
	==
X-Gm-Gg: ATEYQzx1/2QRRxXJs2mQ4GZXsbQP9k67g/6REMGM/98fvHe+8+m4AH/Y+8llowzqKSC
	KGJk/2ICzSyguSW7PI8hA0h7dGO9PytZW+TOQooEebyVm3nuvk2aBFSO2sxiCDsOGI/dZF7Lw+T
	wQ0Jg8RLZHtgWHGNRExvslXbKd5T6E3M5mOpU1u/4596qDeBf92kT+PYTcZufysbvjwLQuxkqUR
	jU9ZUWF3+VKs79pqejOzdoabapCKJ1rPwoDnAprDj9Jkd1AiWuAh7PrOSQyoc6W7OrryN+RTR0C
	rfvpZX2V4lnY7dvI/lRxOWpfP60SVQCng255Em77++IIu1KHlwMWdNo66q9Ae9XPmV+Olw3iAzk
	6jSmYIiLY2jXKZdjdTYrmPaSnQhX377DCvL8vaCknS7StYIn2SU7N
X-Received: by 2002:a05:620a:1916:b0:8ca:90de:43f1 with SMTP id af79cd13be357-8cd5afa5022mr134815285a.63.1772614978010;
        Wed, 04 Mar 2026 01:02:58 -0800 (PST)
X-Received: by 2002:a05:620a:1916:b0:8ca:90de:43f1 with SMTP id af79cd13be357-8cd5afa5022mr134812685a.63.1772614977445;
        Wed, 04 Mar 2026 01:02:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:23 +0100
Subject: [PATCH 02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-2-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=elGyJX6kiF5U80wwgrS1gevNlE86QtaFWMPcJZOJ110=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Ur8cTWvTe41Vx/7b1PfM0xlmUQmzL4DULT4
 JDfBXBxP0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1KwAKCRAFnS7L/zaE
 w42GEACAPu61giLCN8WXIPA8YMaONEdH0iiFGuhCO5j8uA/ORhhiYa+GLkJFndF7gMOXfafU7o4
 sirVD8YRozigYhUq7uBAdHBd7B4/UHJOoPc7fXh9Zcdvx2SBGB1fiBt4QSB3axS/EDKoemsR+UQ
 DLvKVYIrR5QDkaMp2T9jmHWOY350AaCOtp3sHiR8ke6oTE2Pph/QRt4IGpI0/9OlOC9UGymPYZZ
 V9kNxnN+fwIpnHOWzrzWWogSxgiXViZOY+jxSICkkONwpIlPDK0NYC2+O4jSSRaTm7Tv0jF62k1
 prRKMb6gBN68zMJuqEUcG03QgCBiL9kBoCwpov1N+tz7EKkW1pf7hMC8wl0UgBVQE4o9HbcxNgH
 396JJAILS2c2NHBecEEEU2Hn8f1T8BSYw9i8kSsFkxUYMI7Iak84y0653B8+sJvEJClhtjw94If
 nN7CQsXkWQmElJTx7ywvoyf2wcadUGYpRDmEVjuVyBbVncjyzmW3aufyFzI9c7MSXU/APSPVCez
 aSvQrHyatWzFekvX3TSoxwnCVj0kmaY0rprs4Uc35rBn/67tkAOSCfs++1/10zmdEAqcO5x2a0T
 IAY+hMnPhrd0yYLskrnfs1+9zhF3aFsR9q8dD9rEVUVw+i9FXKcvXpP4AD7SNLeDYqMggqvcGQk
 6RvbjgcEGizAygA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX6EySa6Pjxv7i
 V2yk2igiz3lh/eYGEM7Tbh9aCwZOEIBY/FmE/eiRqPXqeTGhI1qO3aI49zREOZ46SgupD5eVrJe
 fo5Q0XBRCWxiwVp4cca6+UbnGX92nXwnXZv4DFNWCU4xy7lL3mwwoVNS2khzgQ5QCnvDw6tN/3T
 I+KGTvNAWI82FhmyReBMy5LcU1Ig8KuFFTmlcpsuZG9/jg1EBW4gGe3BscCrOl99J5c6EUsKvZX
 fDlUbKVPuPvRAN0sGTAFZBFPm0A5KfJHSLqRnUWgUHR5Nc87y/yEYU959mmLgRJPixfVW+Nz1/U
 Ib1W4aRCx1f4WlDiqtron3uTRiCQ6xowZdoO5YvZ17keu3hLUukdfa5/bZXKssdhG9dHxJbj8Xi
 aHAQyRlIZaHcQSByoKnhAZaHdWmAUar5PfuVPUHjZPKh9bUj/xO/sEqFQTRKEPWVP4TnLvXn5IL
 AuG9vpRW/7uCghP8brA==
X-Proofpoint-ORIG-GUID: k-iB7Wid4Er5_Peb8zRoCne0yw1l4VF9
X-Proofpoint-GUID: k-iB7Wid4Er5_Peb8zRoCne0yw1l4VF9
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7f542 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Hmb-lenyu1CM-5GwpyMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010259_716768_BB4BE350 
X-CRM114-Status: GOOD (  13.74  )
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
 arch/arc/plat-axs10x/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kconfig
index b9652c69d1b90e506f82b3b8c5be373c51246671..40f2a74d404ad9759ab9d6764c2496159eea045a 100644
--- a/arch/arc/plat-axs10x/Kconfig
+++ b/arch/arc/plat-axs10x/Kconfig
@@ -7,7 +7,6 @@ menuconfig ARC_PLAT_AXS10X
 	bool "Synopsys ARC AXS10x Software Development Platforms"
 	select DW_APB_ICTL
 	select GPIO_DWAPB
-	select OF_GPIO
 	select HAVE_PCI
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
