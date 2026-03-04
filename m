Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E685EB7EAC
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+1ExH6RleGCRHJAsYvvJNZfSjyABeDfMpuwnWu1cW8=; b=V3EJCJOvYFd1LL
	xYyvWbPRT+bWx7BXnUi7PPhyE5Xz6TPU+SyBdGtQyxrDg3IXpkLo9Hba4AL9l32C9jh7vu6ncNDFU
	C3z5G2/oniJxWtniq0MLJ+w1ilRew1Gbt71B0Shridcgl6IwSCKEaqk2DAJ2e1f0V9owD3i+QtVNf
	xo0Ec6ZuIr6VWwmwtIUh2XGa8Zzsx4qMe5XNzDKzNvmfL/6wIytH7N8TYm99liBZis6Cyzvi3rwor
	ZxOnkxUXYlbg3xZSlxDV4ARAt+jH96TVZqDs35SIKVEJevzBIVpwKC51MWHKK6SDLFNkq27g6ecST
	wCAjZJ8wlIMXcfriUetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi91-0000000Gp7Y-3M0L;
	Wed, 04 Mar 2026 09:03:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8w-0000000Goya-2aiW
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=Td+rSg93flEVcB91RvyoHRKscK
	F3EHl2fc/YrmFyS6kdZDSsHdAJkN+ogSlnDXi3pQPrvB5nD1QBrBCpVf8VP5XA6REwP8ouBiEcVtA
	SGYeJ0lkcQzH/D3YIMPhvHEveXxIFu2ZQD+RfOVm7ayPYSOH1EApjGqbscxaNCE0IL7p0kDL9urMz
	hylAoFgbQ83Uymhim3VyB8cKUOfPeumI3VzXAswRaLvgGHrlrPTHbiGUOe6+QTYyCG37Hu62dFm7E
	Z3qMPI6foCFDnEKah4hgzAwmv+fpCmmILaFeqQKRrbp8Y+KdVfULEHb3Fw0jdM/w7k9iM5x/iEpAy
	F1saDxCg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8t-0000000D185-0Hkd
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D6ht1203222
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=HUvkTtYIGHCF46cT
	vzFc6J6pDnXt8HmS67vhxuF7vL53WUanXgs0NbH+VI5EVRDnySVd8Y7UZWIL+2+X
	6esk1LCKZeg8BlKjca74TYxulLvKMKzwRHuf0pTLbqexTMJQjJb2tyrkS3HJkYa1
	OZagmawkFeI4w93zRbxy0aCpFx+H0vJhb+sqvrcP3K/oymnAd1Ce/IZ9qU+XxKgC
	0HknP2Oz/5e6O9DS9aizV3ROR4E1dvMIN2m/MqCqdGgBqiDPHCRy0j72cYIlQvkc
	NWZF3vdPFc2nAHBFbiJV/d6bP48ch+3E/q8AkJYdRYjJzqWtXUd5yQcEKq6u7sVU
	yGBMZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0jw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:03:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so4094886085a.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615020; x=1773219820; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=Z73JdDKE4nj0P6KJfMPiMXVrQjMDc5Xx33fdYYT1gekps0rGfFhAOZtEOHFEKUEaVG
         bDiOLhoTjEisDDEvA0cjblB29ewx/fsHWXy8gAMNfp90bXwsIgBzw6zTggcNxsGhdnPX
         VqIG4gXcD13joDJQBF0m7a5s1ZDsqzjZeKncUj5bBp4ibmppEsNgP7n/rKXXrfKthCpE
         bm9C1Zld/n+n29OaPjm9CT3ZTM6DuirYZy0MdhxYY2In+ZmbihvMlAlucPYoXxiXpSKS
         GOOB2Kq4o3D0afV0Jhu32thg2VDU/sBtwd+Yj1/KtObMFMFnbiD+U1Y2RMlwtD08v+Sv
         boTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615020; x=1773219820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=cdrzjBY7PUNVqlCDxlnd7Oqj5N8bHITCxFY15nYIL+Qvjlct0IgBNY+V/OOB2+m9bk
         m801avBFMww2gis/WGPnHbCFhD+AdfppimRfjnTmoik2vVdESfoJvP0wVJKAXPbJ6idL
         /mDnmUuDx5FlGfMKthgAiQw6fMgsMr+Y9hn83W/INtfAySEbytrHuhHo8X/z31AxFoCb
         49eiesB96HNCbmz+1vGY4+CnbRo2jPvxPfsmAiK7uLQuQfoyBVhWYfO6IRzw4qoFQgeU
         NTzzXDplsHtredMJ/miPNEhEHura/Sp3hIfmuW+GnY3cLsj7SFPni1EypNEYQvw7o98A
         ZGGA==
X-Forwarded-Encrypted: i=1; AJvYcCUBZV4MRDbxKiitJ9mnqKer0OPrpPBVx9m6gLBYOGSu+XzyeWJ8Jw9+uPWwsgUdx3hIf3ssPCS6zpF+f0yj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9CDPa1vI/q/1nfhT3iXVIxVt/ePr6J/pxrm5lYfAcpbqSUhKJ
	yTs1l4Z558hh327M9+vv5C7b5Nr4AS9K3a5RiX9P82xqnpmgnVris80yZTEvn/mfT3lLjjo/QXA
	R6NcfP1oZLpj6SO7JtDlMVj8zZ+F44zrptVL+gO9Usa/YHwAMIKRNeZYyG9ksDpjNgd1GcuQOWg
	==
X-Gm-Gg: ATEYQzy09ewJM3+c46y7s55hOj2tAxBoKe2bf1WXHCEqrKyJIvPbuIkv7+5MNNyWfjm
	O06AhjbCtYImFixSry73JReAknr5nIpmyDLsSXSupW9qvNt2lCqtuc/Vc4D0k8uW8U5rT7Vh22s
	v5sG5JZJfUezyO819J70rg2u3gmBKIMOL3rBBs75llQJAR/eE6jV9vb9mTfKcHfihzSioiNDhTu
	zU+ypjKtyV66xm9zA1QWfT9B15YCmGAQhaEXjcgtM+zSm0THV+Q1n4gm1xALvLrcHaf0+CKg02b
	xZsTPUymHfDVf/IK8ahBgjhOm5HywcTfsL1I5umHKhlZaAFiA6thKzn31EIh2lHRosD5bvyU1NO
	2+4qyv47Oj6ag0sKjtAwfP6FhhZNDmgL8K5rnCPKpTJCZex44raRp
X-Received: by 2002:a05:620a:3949:b0:8ca:3854:8110 with SMTP id af79cd13be357-8cd5afc0c38mr159219285a.72.1772615019768;
        Wed, 04 Mar 2026 01:03:39 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8ca:3854:8110 with SMTP id af79cd13be357-8cd5afc0c38mr159216885a.72.1772615019300;
        Wed, 04 Mar 2026 01:03:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:33 +0100
Subject: [PATCH 12/14] staging: media: max96712: drop unneeded dependency
 on OF_GPIO
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-12-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U0YPpmr6EkC/Xcj5u6S5E3hZ52MCZJ0xQCq
 e6KcvDJUhqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NAAKCRAFnS7L/zaE
 w6ghEACtFFABHdrYTiZk0+F+HrOgj/2q9yn3zJKW2IUhc5ip11gsNxaZvRGYVoD1y9TrvFt77ji
 PFlWiBoM2qd2vxnADhudDyeyhkhNYjJeDPoyAS5BMkPEjo34LXOvRTt2jdNLcS0Yggitruyx3rl
 tEMtfMKolvomXC1gG17ZNj7PMDSOq+VsU9spkQ5TnrTJBHuLzzCCb20Glo7TFGAKZmQ9F/s0b19
 CUq+HEdABlAp8r2rt5877/AjCvFT2Y5YZvCPq8kKs3IF/vYAOnCW5j2f5VAzI9q7Ryf3HLlcbK5
 UJCVo6O1bKbH/P8T/DiGfR6yISzdNn12TXv6iYwwd0f8GUzMVVWU4l/VSepOfpcMY0K3ztQqHyH
 OJbQaN9cutXu/UrO0GsSwbu1XiTOcjKwXvZUgFMQyIs9mLHmwogfAqtgtlcKK0dfWKBTFtMk0R5
 Ya4MZuCMDiHuGEpWbZafXSaoIsowZpMZLWWMyck9cGXExUWFEtZza+r21drHqGw0M2nsB+Rdfuu
 JCtHW3W8cUNbtFfx/qtGTP4U1lvK2greeMzLTCgxtApLXz2h0CYhpOv1ETFzQr5gf0Ef9O6klZ1
 ifje4A7FNyS1+Sgh1NX897ZJ1aNIEh1ABIBtSAc4rvOd/HV+rMhsfL+4AhwtauXWv2W4fdZB9GW
 TlHYCNXye0s/o2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX1W1ReR8O9x/W
 z6Qe36EwN2VpcxmgGbIrSvR8ftarSNFSnzenZERHgFB7l6i/OqUbK4wfkB+ywQ1tRrVi4DewDVg
 CVLLFHKpM672AC3FenMEyULry6ZYWlA0F1tW1ey0Et2Zjqbawjewhk2pwMhDo7V76XWNYdxVKk4
 G9NrefpD9f4MkLEOOag3pjU1JemgGkSLxduC7KY49B+UCxIkuHbtXXsdkIOkFh0sJG9ahU/3ufM
 GgTYHQ1GM0IagaB0l99A/e2inIqJy9pSNuWsf0xJq4FILTVejq0dUc3UFnW+6TOFK3+Xgu3SPdF
 zKZ03mXJware1EaxgqLqdr2miw3/Zz3SvOZzwL/pQ4GGentvMfIn27prlBOtRQkygB0y7GzQjwQ
 L2XnC30tJOPVaZubcD2eDwz4XjeSw6c0pk8LmzsIsBSTlKTOEJ17h1fNK7QYAA/AFQGNkkSuYc+
 CUgj3QPEJ0yL+Sp0qUQ==
X-Proofpoint-GUID: CtOIiH39JLLQbHaiaBLt3TeDTAqNJDt2
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f56c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lbdJfbWXG8Zdtkr9XfcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CtOIiH39JLLQbHaiaBLt3TeDTAqNJDt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090343_585461_DE759AEE 
X-CRM114-Status: GOOD (  14.45  )
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
 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd086cc3e5e95210503000d9e4d8738..93a2d583e90ddb2b797c5167a6d3373836e88126 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
