Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3628EB7EB3
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5N+ORaujrprSXUBMtLdK0vomJf0i2Q6yGSzJxB4UOo=; b=HCVF0Os3NwCWeF
	7YgMxSbsMSxyYz2g8e9yhoGz4M4wHRqKialFuyIE41p3URAPUAtQwGlmYeGMlw0iIuYNhrn8qqVXQ
	8o+xJO6Eao/4thRGZGZj8g2/bzrIYDV7A3SVBQbdvBKVUZcV0DwkgWg1UpfCDhYmXHL5LkzLpPMx4
	MVW4DdLis+rTTdimDf4QPbT5HTvmqxN8HvVMSdkmgy9vVGu2DGYnu8Nf3/gN+XCmF3iH28HlbvqfX
	oocBhQ7ino2X3/QG5JxzH7QmUAwyR+reGMRR+ttAa6pkPQqeAp8595XQADOiFyAveKeE0btyv0rLo
	TgEajQUTUMG2urkiOgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi99-0000000GpJw-3gRC;
	Wed, 04 Mar 2026 09:03:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi93-0000000Gp8d-16G9
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=PSU0r2v7rR6BsOAUDVXitc8NIl
	W85j9rJVGWU1tgdiEhomjJkecDAfXwieH09FovSnayD/OXse+Knz+K12bsRyBCxRCqZtbW1SEZlV9
	uatewEF/BR5MOnqLb5JggBvbJAFI+35Yk3v8v1ilb80GL9erXNBNq6Mwe3wsDeVGQMuRPVtFdFGy+
	ABC8JJcPo4zmYrD+mQ0SupUVchxr30k1Izi7d3kd1pebjczyoVSFDzFJ60epkl8x29JBkeMNFqZjf
	dQZ3Lpnp6FthjXPeIKJFbrVapVDu1Xp0hrM8VJOvOd2ntxeG29H8taabNiIKTqMsw4n7FhTwyT5KH
	H3ant3Ug==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi90-0000000D1B3-0dAx
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SbWL1072553
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=LZ5ZeC1kqTnN1jFh
	vCca7TV1UKLuarWNNA4j74IoHQZeS4rJ8wyjWtEjFDwOeF5LL3i4PnB/RtNWZk9c
	WyhH4S9YFRvmPpc5DDWtNq0Lq7gVxrQuyl7jXzEbNBoJOvYqY4FEi2nhcWKRIYhc
	Zn0ZezifGODDAv6RguH2+n4lz6j6XJtVzi8WCuvy6g0/Rm2g1Za1QiGg18MnZsQt
	LxXLnZIpg4RalfuDBpF/CIraKi91ur9+sQIPVX3xDa9cuFhzDc9DYM+q8+wJzJlF
	TMjqx7cw9Gq5Cw3kk2q8+PQ+IyRTcHcTOFocmDDfXcv5qgLhgSrVLF0TRjDNjCBg
	YOz7wQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:03:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so3930076685a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615027; x=1773219827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=czylflvMYKIzL+VpdhdjFjZYZ8FZzHCCiXAzn1A3UI82zzzuR05vGMEC/pRxIxFmTL
         8N7FCFouVmaPc3pwe7h5m6SXwKc5NJ+SjgVf1vuPWYxcz3zuLmRVD0RaI363cC4VBSd9
         lvkCY+T5vpueVJZFljNcInh90yoyqGhFIwyELGBD2XIamr5efBpLevNQVAqvZ4pCA+e9
         hGgNlEF4hOG/AOP2QzHbyeY15gvK7zHmNa24xGz3B+PD6fjTJ4QGrY1LzNumKb76i1Zr
         yOXuV0sDhLFil3dy8ncrinnpfBj1qDxHq6ocpmkzjqygiZRXphspz7uo8J/mLeUiceL6
         idzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615027; x=1773219827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=XYBqZ8pWgGA5QTq3GN0p++QoAg4sSudg10isDYRDssYt1C6sUlrhBUgtlBLZAkIOb9
         1THkaqT67UETFmbfg8OGACWfHJBDgVx9PXorrXzel8h+w9GE+hzsuifGnIC8ztIdArgt
         J/tshrvlYA8yOlQxZmTl/Gmhe8gTmpcTIkhWkWRPoe/VCcIuPHWoIiOyfCa57CqEDPtf
         M6v2XIcTEiudYiplqNE/0KlFAjQhZnjVs60qGuLYVv2fsDg82YjTNIOfqjfUk3RGQ/6i
         VPzRrX55wJvgF6n/0MdhvhFs5t2HfZxzoUJ2zBALbIFxpnSgRdvRWa2Bcv3mzPOQuOgw
         zZNA==
X-Forwarded-Encrypted: i=1; AJvYcCUtZzjC1DjzZ9dzP1RqycgPSkkPgqB4f9o2RMcEPoqFMe9WMEbQ69QzBKwP7dEb1RU3Ctn6hKVdajm0EkuX@lists.infradead.org
X-Gm-Message-State: AOJu0YwVxd+bgzNJSWWMKwN/kI0qxNKj6yRFvqR/SBMXs5pFnmuW+Ihx
	jXeGneBz7S51t1P1AWIfWxJ4BRzLljurhu37Uib+3Cx7teeA9H+Vz79NO9ItzMxJclb0M3++G40
	rRK2ROUrlD95QZHUGC9vzhVQim4err8k6AVU0zAeJIcDk0exSjbdY+sQdWGuIdJoL2fa5kRjvCQ
	==
X-Gm-Gg: ATEYQzwFtholxui7wN2meEheLDEsLnVJYblgokfU5NSWCKntu9KYsnMOef8wgEhs+QM
	EwhMSqLryQo5es1FUKzfZcjoPCgV6RLzuX0hQs45JV/fwJguvrlaV0Ww9eFnxPmPdVL6bdr9sxu
	IlYQzTpeVfB4QVG56THJVAHWedbfG3E+G8rPW0sZ9mYt6tE44gHy7+LcZeKSMPygWHBIgE9ZKHS
	jG4R9wDOJ/hf+MruAy5BZPSJMehSV+BCg4lNRWm32mtXPOhSSB4Qm4Zvl+SFuZNHzJPFsCIrwL4
	w2wNM9jLhX8sYwdSWehMO4yvgC6bKAoVn2p54w6W+7xEnFaYMG8WhGPf6Oo2zAiagt1yihxy5H6
	f6imR25U7LEvfCctWyzidMd24i1Gqw81Hh6sw9ffXKctgRTW/n9UN
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152244285a.41.1772615027078;
        Wed, 04 Mar 2026 01:03:47 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152238485a.41.1772615026584;
        Wed, 04 Mar 2026 01:03:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:35 +0100
Subject: [PATCH 14/14] media: i2c: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-14-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MCUltpFZ7WmEs+Zx30xfCDFOTCP7ddjGHJyyrYpihXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U2S+uVTRDUZjbW42G7Pde+e98yExCfHmKSl
 HuuGodjDTOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NgAKCRAFnS7L/zaE
 w04sD/4l9ifYSWVyk+wcaQpjTACkURD2eCeWi7XG5/uxKcFxPRjOjYbnVCNmKnRiNYQHTnOdZAD
 RHEPNL9Tmn5V/K3zGBvodWKK7DoWQJZcGQLrC8VNmiFODSfkjheHHtNx6K9SzWyk4fsz/3U9/Do
 uRHRJZ7f7yJAP3QJaZ9QxWkzuAC8If42NLay9hfVcfo+kS0TOu1NNRM+6gXMA5Y/pP4FlXYs8DC
 IsZC4Qjx9Hx0bhbmMqrIpAUFk9OaN3t+oV92DLq/zFIvuNHMy0/L8N/wiyzmLbnZcfTpsf6+Qgp
 4P2FgxgqxO9yyi+cm3IA9XfiOCzuJOPteySq4NcdBekIwuXhYMeYRNqInw0HjhWFwbiAeFthwO3
 DOQAqM86R5V0bfFnCvwu7MoqjY1SjVWit3ZOt/iTOhJSvBydJJ8pgS8/ULEYw/m0sZuvYNvGOV6
 lYD11td3ysN/HbFMLVs6zX9Rr75VDl7CdXbXSc4aQbBdsN1WHf0tu+5dKq1slodk3V/ZxT2jL86
 Ns5Z37xaPgZ8pZRZw86cfDDtlRD4+3qaW4Zkd8uc9TQlPBg2iVpIMvoZdChHXBocSpd4F921tHV
 NqGZ8FhAn8Awi3Dn3ouTs3qouRo73WZp98ukYqMVfXEjl4gbfeCP/mjH85au2MmJuJ/7PUDuHTk
 DzYrk83TwNVNPsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vJTF5faxjaHqhpqOTJ629zYmQGWK4ppE
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f574 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXxQa99oO91Rvq
 EkL1MTaYk4uCz7RbtnmvILWyZw3bYV718HgNWgBUk7JiPIU3PFbAwBcXOn5UgNdJYLYUlawnPI/
 PZ3tSeBlRVoTBYXw+HxrRGGJfiR6TTLzg1iJnm3jhs4YOJsPknrEnVnHz4YFiNoQaZoGkH2esEy
 m1eOgH5PMBKuK1apkKBdUheZkkhsdXGacjbPh8Die+NWmCg3UcWZ0o28NlE8dE6I92XWfzdnbZw
 K8Ysi1+U0x+3w2UE9E7pu8x3+O893bCaCRamxU5lafZMEQwMHnQZ0KSBWKpWzAmEBQvucelzMOi
 ul3pyoZSyn3Oqtro8qcOdzD2QmInCOBb90Gl8IB72Vn/qy2i8+IXzDDvNOVD2ARMZRJyWDSNdZb
 JTecuwHfGPMIoq4FIXFBbds30lO/dT5vgESb/5QaoIVMk1uBpTBx/zBWHQK2G7QKG8/1ZYc8NkX
 8Q0oaSUeTa4cYLYzW+Q==
X-Proofpoint-GUID: vJTF5faxjaHqhpqOTJ629zYmQGWK4ppE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090350_501555_AD060C95 
X-CRM114-Status: GOOD (  14.84  )
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
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/media/i2c/Kconfig | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87ab350060567f578960c0e98940d6d..40b6fa3fe38b8d64d029d385f1acd1de4480aa69 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -237,7 +237,7 @@ config VIDEO_IMX319
 
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -248,7 +248,7 @@ config VIDEO_IMX334
 
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -268,7 +268,7 @@ config VIDEO_IMX355
 
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -278,7 +278,7 @@ config VIDEO_IMX412
 
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -689,7 +689,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
@@ -1244,7 +1244,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1282,7 +1281,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
