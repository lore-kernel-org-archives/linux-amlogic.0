Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95747EB7EB6
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/TGR3TuudNaWoHkEbVkLHAeTKaJgQBwqiIKMjfQXfk=; b=drJdsKoz02vExV
	NKWBHI3PNvlc+8dp0Isj9lM+W7Aa+FLztssYWhYDXrIh6UAlt1uABYcrrA921DwnYvFNSRBNWGpDF
	2Ac24TmQptW+65Yv8NC0yS4Kdgdr/sGZNrcjn2SysmTErcdDH7+ZI4tjVC881KFB5EHQSEyHN/+5e
	BCgU2gzzKAyY+8ZGGQF1rRuH4MlWUl8DMk7uGgxpfjF/gGa5nqhODNF/hh7GE5Ga5i9XaPUcCy5BI
	n/0khwWeyqOSMv4fhJW/zkKSz45JjmqohMEAofuLsHBSR3p/YWCpbmX15g9YI+L5k/LOEJIMGKOvo
	gqdsZc3LimjSzrYafTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8V-0000000GoLm-14yh;
	Wed, 04 Mar 2026 09:03:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8S-0000000GoHg-3JOY
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=; b=hDXMwesnHqxowUv0gK9k4bBekE
	LWnsEBbZysmmD/eXIIkyoax54nPJKE7sKAPl9BDZDF2iqkSV2iS47eARvBGFmIJzMjpDU/bMRzRHR
	cUdvpdHqWAofGyhiE47CkNGQJUIp0jfLWC5JHpNdf2qMvQqpbnXgFnLMFwithxsPDbxs4xcpTn+cb
	PDSbJxwvdDMg3j4ZmwOsSb63VMljxdxE1xUURz0/BoPDBQ7iGisgIdFFrURZLVSlTUGjue3PTVSMu
	gnuQRlWMKNE1RQ1OWofmuZ90eptATOzM095acDF8YON5zdHms1Z1rEgUWW0ZWljFTdxhSHQbZlp5C
	T70EoTKQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8P-00000004C6H-2Sp8
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D6hi1203222
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=; b=D3YmsvRRJYmERCKJ
	Ber1vJrUaYB7CCxhj0HWv4yL2e/W8h0TGa1fDv+p8/E6wNljNQ5vRXeVyFAIS/6d
	8HApID8vFDm6JKOvETA8E3Ei7H97jllJBaFRrkIz4BCNr6UUZZ+5aFVMOlWorFQs
	3bg3lMFgfBd5etlzYjZDpFDqZLwDwvFl3lxRpJVbgVi/nGLtW9AiN2Jsv29aY0ft
	ufBP4NmQHKYv9gjNdVkJH1hx5YWxFJWMRj026Vfd2NGsyG4Me5S6Ck1Z4owihYKD
	2rBl7Jgo3b37LauA5BiYKhAsg8BsDF1ZUi4ENA7TBa0q8I3XZH276dCqTUQQZw6j
	ZqS1+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0jt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:03:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so3929937885a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614991; x=1773219791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=;
        b=OFf2bsdbUQvYXG6qf+lLP1BY4g4DEDigaWrxpl2z4cqyZqRERyfo3KINwFgph8Xu0u
         WAHR4ovPlcMZiFOsFAtJmXKGldygTceBirLhRJfpFczFa316cWuxk4u+E749kp2NOQW0
         7PTZh6Ir/jV49T4Bja84dgVvJ5pveMW+IAmg1KDl5OsiV3DMoqswCe4y+7TO5RjVKORR
         kx8GSonG4AWyVJkXuBlrKDiiRxWXxyvojyeHj0An1spITdEoQLf4EQez7mKknDSQofeV
         QacRqbQV8mXRGfYtTV58MWk3cHkjlWPll4rSfSlV2h5NGgbe5w2VVzUYX1OOxStqwi/0
         4/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614991; x=1773219791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=;
        b=kvcZ0U4GKc/zBNbiq46oUREFAkyTzU87goJJoSPCGhnK6N3SSfx5tY0BbsKeFbXBUq
         N6SwfKVzxcgiMGh+/DVi7FfWqji92VmY17YiEXhkBhCmqohfFbB/032A3HWAjv0qJg0k
         URPv6ZT9yUDihZplQ+mg3XYacS3VgV00Xgrd0MFzqLaxmUVasJymc5PePVReikUyX93m
         oSB5aK8zdTCAXhKwVx084HBo+liHzt0eJZe/m/sxhH3jczul7Uxs+kT/RMNOGFZ/anka
         JW8Ctx6l77/MoC+8QDrgYhCKMI3zlwL2amfEm4dgEUp3jbfJ6YHdtD1tmUaDwm6pUlp7
         2mEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuE8qDhJajKVvcTyc77RdpEl9rzrWU4Q2C9hc0XXtQct7WGY4XVoQeI/kLprHjYc2CLoE65BHlxUUW1MPf@lists.infradead.org
X-Gm-Message-State: AOJu0YzUInza4zTG/6zRB+p2ydo6NsznouRPj60FFwlyB5PE5a4oBEww
	Z/XqPQxxt/y50/c1KlTpS5SZ+YQKXUIfS0AOani7SINvxZxkLRBjkttgVp4CiKPl7Y9Wc3yZRCN
	tqczneZi91AziB5A7eY4rJNiih6i3ytHiTpncorBEhOrcGYuoPlnFZwdOhBF1ruqnOOtvddrEjg
	==
X-Gm-Gg: ATEYQzwCTnI8nv8lhBoDaoupol0r5Yyk8YwA8ZQ7iow1v3dL1/+fqst4TgLKRXi2Ute
	JMCGqQkIqapS5Q216hxwZWmugPEZJolFMGTooe9ORtP79T6UTlBkAu4sPjG1bYPmjM80eJwKWF1
	2MH2QaYJEu/7Dot3/jcEbVYMhDupipNR9zDtTXCO9UhJblnmowVSPcUDK5X1bC7BGi/Z85+9W+e
	P0iiIv5WWvJXr+u+w/nfxH6Flw5a/ZuvLdqUHii38j7lJqT5PEGziqaQLQTN7rekZ4Td/o5W6QZ
	yg5r09nKGrIPiJOv63PnhZvQ7GljJw4lxu3RG+YMHxl//YePygDBjzToJDzMPpAYwa157wsKkQj
	h8h+xlBsVc5rk5b5Nz/hAojxcJLWfty+r0oze6lwGw1BtvSqUl673
X-Received: by 2002:a05:620a:2556:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cd5afac027mr137831785a.67.1772614990747;
        Wed, 04 Mar 2026 01:03:10 -0800 (PST)
X-Received: by 2002:a05:620a:2556:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cd5afac027mr137827585a.67.1772614990300;
        Wed, 04 Mar 2026 01:03:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:26 +0100
Subject: [PATCH 05/14] regulator: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-5-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PtPN45Tp6Ia7+N4Tukr0HxNpokkC0paUCqcZanVagK8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Uu+2aQcMQSqVOqNgCut0t832TSfkkbw1j6R
 7W5/bLJkgSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LgAKCRAFnS7L/zaE
 w67uEACvJxSq4g8szPu73sGCAqP37wmvt9beKk/jsRxx5m44qR3EiDbwd68jXBA77Dib7kUNBYS
 0F+pzXOFqNgMYbxl8MYu2FfZ89VtwWnJvWTklsjrxfkTyBiMbaDpiMci5p/Ca/7FKzj66snZfT5
 Bs5h98gRyoJlKIC0yhh+HGcCsKaG+uSPf+moAaZLIl//HuCqTMbapKqpJVQbss1r3/EtmXPQ7yb
 gt414Gc3mJb8IFtZhO2retB6beVtnH3OFmgTYXV8uYo7XfEObejOJScfKNCsI0mxXwtW21PSg1B
 HQzEWFmLV4eRlm1O7ON4sv6HUlmZhRgq2G7I/fF4zV3n3/DGOKMeShWLgRr+i3r5V90Px6k5ZKi
 MForZCflbkS9MoozMkRB/ZgO6ZVGSkU6fYIyWNsp/NbSomEoBrkzwxkkE1Bt6iA5qDlyLui1sJQ
 Pj/0JVHFTS4ucYiTjc2ofCFYjUNZMOYnFst4YARZ6+imwg4qXdjbtpZnAzcNi0+GVH3+zgL1Pm2
 zGZ9WLaNbVkPiCLrNcoTmOO5msz+KmtnD+MSprvKhYJFr2o8dRIwq09sgeG77cZUl6wHLQZjn8u
 g8l1Cv8pxFNm7CDr/DeYJ2Rp3SuwN9pLohd33mIVSEJmw8Y14XfYsop8gHmHkFGbofajDzN84iU
 yluMQdaewamYX5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX8OFSlTaYeMHp
 fEDC6QS0nYHDJwRf2TeY0fteF5PhtbewlIkfCPwFyty4omj0nln73QXFTqN1wiaPFUFzJxnc1a5
 hAHeDfuEmxoRGWMzdIeqGE9PXvKjxuQKQYqAn9kw2Dx4Ci9TUDs/ze+4ArfwQQc4+mc9S2Kxozq
 KegRLQMbtVe/eY4cozChX8S7hMe5LFS68JA2neEcNom2db9cR29hmWNl7fbR3z4Vpve8eNqgQIm
 Mmi7xZeB7JsqAqoab2Wb/ZqXbsxpY2nOtgFNX2YAdxgsTwA25mb7vKTTW5VE1j8jy8bLi5L1PUf
 yRgZ3Kc0Y1iprJJkJRoXzswA9CIIV2emC2TJ5QzlLl/qWkpNoAmABBgwCkTr62k8lqwTf2wuFKt
 4yXD0bkhEc49fzKe2XgbLincX2dLkRnV9IjemEqTAGCwqicGAYn6+GUFHEw/A8o2p7a5v2DAASP
 L+nfDKQpe0h2kOKR+vA==
X-Proofpoint-GUID: fpvXaQHwPZv13JOCLrGEN6Drg8VLEI-U
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f54f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6oIPHyQYDuokVZevvhYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fpvXaQHwPZv13JOCLrGEN6Drg8VLEI-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090313_981086_AA72E8FD 
X-CRM114-Status: GOOD (  14.91  )
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
 drivers/regulator/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d10b6f9243d51574a9ac662b93d4678cd7d94a4f..10e64e3ffb1f5f60e0b62b16ab513f002a42fa1f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1232,7 +1232,6 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on I2C
-	depends on OF_GPIO
 	select REGMAP_I2C
 	help
 	  This driver supports ATTINY regulator on the Raspberry Pi 7-inch
@@ -1332,7 +1331,6 @@ config REGULATOR_RT5133
 	depends on I2C && GPIOLIB && OF
 	select REGMAP
 	select CRC8
-	select OF_GPIO
 	help
 	  This driver adds support for RT5133 PMIC regulators.
 	  RT5133 is an integrated chip. It includes 8 LDOs and 3 GPOs that

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
