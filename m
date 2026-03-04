Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0F2EB7EAC
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IBtzVLYenmfyvOGFV68JG2LioCwxV9EWJfQP30oNDw=; b=UMjvmXpXC/iACD
	FhmTNynoYcMAQqnZXzZdycIFjmJSQSVbVrb/FEzaOsMsBNm0LoIrcKIrfp/Cm0LAOQvtqIvsztn8y
	tBoVVz1RDr4F/WcyXToB3KDT01LqnZj7WYEhAK2nscUQ7aELozIxTnWmvUaS68ILzSosSfNYZGRok
	/fughglSQJmdSWePkmTBFtp8x+ypzSovoSJ0AdDxCB8CsMr3pH1vwhlt9cODgZhaFj0GLfIXXb43h
	knvu+6jIuGv2Yg2BE3PBe4rdPyQtT//PKbX84AieN+Nf8Ew02RVHIV0wVuGLfiLnAimKsUXV+BxmL
	9PRnxKHWXBRWMzeC1Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi94-0000000GpBU-1ETL;
	Wed, 04 Mar 2026 09:03:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi90-0000000Gp42-0hrn
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=kTgEkErho2OWAVn7O/+dFSg4VW
	dKvwGsSemMJMafShALuxARdiU5OKEfpWiaA2eA96BrCOX7P55HQlOrap+o3EDkN3/UUixa1Rod4S5
	i9kytob6HoFiPm0AHUqDOZv6/RFXMm9zPZQ9Ik2xpZ3O9N3tWgm3grx8LkqhkwikA1Fon1+btu2Wb
	4T9MmrY1bHIvbwqGk3Yd7XsxRqcvlJR6RxZncvGjv0A+juA5ESetWWDUxthZe/LrdlmNGKUpu+a9L
	5GTLOlL9yWElrPbFICIhF84haB73K4Yi4EX/9D2taBFDnlk4gVNeHNABHMoOKR6npD9PuZmQutHFF
	n5mY90ew==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8w-0000000D19w-3uZn
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246DIfJ1203570
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=QdZMEtFgACYOjWMI
	zjzVX6lMjeoh+r78CfuICfgv9KDzAQZTu6KfE+KrrT1ykTKi7e4CYCdfTNGINBoM
	QSExrDbqbBxmj3tBQiPFvxeuzRRQSDl+poZtc2GiB5rhgljz5+G24pLOrvcwewxU
	pYsqrxoXUJFClpuhe2E8leDDjPsdFRzIZJSgAfp9Ghgra0RJdTjdn9Jsnder13bR
	HbQ1qDprRZGko0coyeip/5xZo65evvgkr2rEJRBwt0V1xVKnMomV3AVasglwv1r7
	GtRyf+P4zvLDaw/qGQ04UOc/WK0I/6QmoIDXKz8etkL7/Xm9J9qSM5rH4oRpuXmh
	DZdOXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0jwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:03:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so4094901185a.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615023; x=1773219823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=fiKbYcUpHJKplwRCpIU8uIi9AUJlKB+4ewE4jpaEy9FINuHtToX5TrvXS2/l1nGwoh
         t9pSKd4EkBqznF+BNpoDJiQtaQNJ7IfEYTwp25rFikt3KzXr8EExpCqOmABaY6hr9Y5G
         1f1iqaXKEBaS3rJNa9FlbDIrFI940bK0Gfq42Z/prEFV+7/2uFoaSzA/vlNafILflefa
         2cncbO1BS2MdHfXSkEkIjRMXbePgURYt0VtpXZ1EMHBsCDIMm4XtV6fFpHXdjgPv+hVJ
         I3j9A3uzav7mEarEsdTDsYWZEwTOgkxRJTQDsj1thcWskxViWKcT39Y6FPv36RRIhVm1
         Wgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615023; x=1773219823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=t/GF8SsQmmB+igUDbv3OxAuSRmWytOoKj7n+aYsKkx3M3S6wiwCjNRlfRR8JRvRpOw
         fgkPSjDxFYY7X9+s+zH2KHtPTcz7RJr/xw2EcrU4fYpgmkgUs0VTEv5A1+UIBO74r6kE
         fWYAFb0LR37M4nv5jnTWLNyIRQsyC5gsRLK8MgJOX831B5MiikvbCPFMKJibJ1+NPjSC
         sXB+qQjQl4xb671WnsverlJePRrk6OW+fHqnJ8lxaOeFS5cE50frYXdwolsctMVUD4ne
         T9RQ+28BpqhMoN4JbYuE5kizYykzGHmQYyddvF/ofR3TcsIpZ1rXPNs8RrXpTEkq5as+
         J8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVItgI2yKaWSMVpYgUloqA22LbqN2zFbMLl25yT30BLnU3aX9MnOZxSSL3GHDDupbAn476PptcWdBXRBrOF@lists.infradead.org
X-Gm-Message-State: AOJu0YxWVcBGqelXm+bIBQEmOi78JtcnVy6+BTfAzH/sSiIpHX3RnK2Y
	3KGeZGGAWKIR5rm0EfbRFqkI9JBXzD+JBaZMPcM/477OMCGWnhJzkqxlNkGx/ww19E0W4wANnuq
	WRVDr+gMBouL8MCFVeCChtgSo8HfHduLBzim4DYktOf2cN0Nw6fAKaBvOoTbzkE+vuTxFsAaBog
	==
X-Gm-Gg: ATEYQzx40ELAYNYXbBkrD+jZAmFSIG6cF0KuIkPR08wWm1UM55kLWkUIAm8wt4zXI9A
	5ETlubxKoGeBl8yRUlAiTqH6H1+0bcZiHWopV3a1QNE7+Gj0tggbM7ePOUxm9RuMWDYHPWKKCSQ
	AeQf6DDR9w+NX89pUja6QMJ8kR25d1zX8ZYdffX3EvYHTs6nkKuKMlFXJGCgg4fX3UHVN8vronm
	NvpBGU80/smDC6ZjC5yjJxNgt307wCq8ArO/K26iJjXceOr/Jxwdi1bwCrWgZwaTtSO2bxL5rCH
	EJWS0/TK3WmADi3tD87i7c/b6gBFdk3HPE9yjeO4kt8cHHh5xPARmskJfnveYb6/aU/ejtf1WQ+
	9M4p5x4ADoJUApaRNpwJI+L9DhpZf3u/TC9VdmEOcuU1WgfFO9u5R
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr153999185a.2.1772615023271;
        Wed, 04 Mar 2026 01:03:43 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr153993585a.2.1772615022782;
        Wed, 04 Mar 2026 01:03:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:34 +0100
Subject: [PATCH 13/14] power: reset: drop unneeded dependencies on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-13-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U1CAGsVjzpABaYhlFKngSKy+KmCDgU4eXzu
 q57RqMlO2iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NQAKCRAFnS7L/zaE
 w3DqD/9PZaqFjzHPxlhtWo0GqKJVg102IgVfZj/tA1PX7Uxh4/ynWD06yEWrPqhz1HEI9+x2S13
 yT8h28khnaaDI7C4bitx1j6T6cBtXKG5ufSmOkJr7wT1tYcNZd/3B3la5kezelJHlO4WaYK2N6S
 7tgOp3PI+fHBk6JB3126BC2M2XslfGsNRD5RVx++QUGo2DzuXzmWeTr6TgOh0epi9Tq927CSyVo
 JhBLXzNP1AYZKgvUllA84Q2jiw1dqzcC+GXtZtEkFNtYaMJ+N7dcg+kCtF+lk1u4LhMyL5kosoE
 TIXVNq8/9DX5lElAy6BopXJ1esiI4bGjbih1MVq8q+b8OF3DjymUIjNn4q0Ycouumh/Sd24yOqC
 spOSRP4SpSQtdcEhskbiHKywGf6nSVFFAdQcTy0T9Ptf0tuBZSQqh74Myp3webWzBqORNxSdsMa
 a+XpmTJFYPLXAkrQ5UcoRhH2RJbwlcgxuHWQkuG+L3abK3YeuiNH1Wrv1zw4gUPM6/deV9ktxKG
 ju1I9zXk9Rt4mziW0BQZvu6PB5hSJYPW0c1cnhIkG92TA/65fHEvvVcxqAiYNrb87i+QKO2c7Ke
 jbLnEh8hA0NpgmS98XZAw6b1RSS/T/rS7ehewAVW243xTprAfg7qz8uO5ohQq9Lb+3RaXVhAzkq
 TicUPD4/aipoB2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX3POqy0ACAZnU
 jW8rhKimYEL7a/K0qtCsJYlVPUm+3FPNqpO7uGcojkQtdnkNhsczqbDjn+lma1kxteF2sV2alOc
 WxK6WhK/xq6aMzyRoZCcYrfslEZncebkZe0W9lH3feGMTUtFZdsnzcdTaVLYOMP+d1p0+3LLP6J
 bUyIIVPiDfCGjlO9voqMuH9IlnUgnyt3eFzbj0yR0EoU3/ezzJ7RvJ4zF58PAZZBVIv5DAZ1euu
 Na0RrskL2W8HrIoOtGvE2QumUUeM6cWdPzSkKAlr96hlPhXRL4rUjxTzTE1fjZUsytj2Ef/fAmB
 GhitdmEdqkizR537KPge6vWzHSZykanXm8Npp9wjsCtaDR+5Wp+dSkqHd+A+c6A1zQSsOCr3pVE
 7nHDYhFAlZ9x1NZy9EhKc8gqaRBFTWqDfYcVrnlj8MdvXyue79XWJ6U7Uptt51w1FVepm0g0qZT
 LZCYzINmY0AXTLa/IOA==
X-Proofpoint-GUID: Mrp9sXsQMbwlEiuC1FAR-SzOBZtXxpLK
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f570 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Mrp9sXsQMbwlEiuC1FAR-SzOBZtXxpLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090347_296034_C0D2241A 
X-CRM114-Status: GOOD (  15.34  )
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
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
