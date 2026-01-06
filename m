Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50FBC47BC9
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q8mjlOBmvomVkJ3aJlIrwArRUsz6qGBwwBdZ5g34Qq4=; b=hbww8QTzvSsDiH
	wpmBGBunMVrctchVlmXr2sY4g+DwRVWhuzPRJTYOi2b4NgAmLuw9pvBbfftmgAgw7vVkPIe641toK
	7HmpljFJzO6QL0+sZSNvz77jOM6ap8AR0MNns8Qa4XbHephHN0F0mEKoaTtHUygJfCbp598awHW0a
	SmnDFvxAmxbbOui7MUTcl+D3B+4FOyU7lcRxY+y1pSf25r9Rnu96PDbbGy0AVVEBAy+Rf4z1rKN0x
	wEYv536PCq36KbGRYfmeWxwZca1WEYH8VJt+fpsWB7x+6Lw6JZdeET3gxuoGrCQl1jRzKfP7QAy0n
	qlhPnj78tm4KLGDVhaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2oM-0000000CdwJ-3NzB;
	Tue, 06 Jan 2026 08:53:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2oJ-0000000CdvB-2flT
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 08:53:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063PxXg3052660
	for <linux-amlogic@lists.infradead.org>; Tue, 6 Jan 2026 08:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwD
	shA9XlDU=; b=SXjLicC0Irkde822s/1KkHZ2zfXDNTJAWMzY7aDz6iVz4UDNNwF
	dKnEmyagBgUXPuLiNcnklbfwZCKsdIsC1KLrMY8D81r2UgTXIIPZIQoLI0ip0hXz
	BqlVL/aUbb10EtjPv8i78N04HwMwM3vRXogvKnj+/8EHz6Be4QmRFChy7lMQ5uSd
	I5qJcpk35el2nT/tMD88mOY94kx7xNiWrRXsj1THPrYBImvLzpG+6NmU4/1/ajM2
	h21yzNfSEuVmQpSNi1IQLhrRrJvrVrLX9FEBL3lMpd5uwe8glUkWhLFv6RrZ3ioK
	JE9L3Fhz5e4D098CQeuXnbx1z/ISt0IL3XQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9sdxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 08:53:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so188473585a.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 00:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767689582; x=1768294382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwDshA9XlDU=;
        b=YacREhlQxnqIIeCajj7zsbiEmxn2Ab09ZWuKHCTnf24pFJqOk9Wp/tt0no5wjgBijO
         oLSX1A0DWuKa0bodRNWzzmrZ8srzX6sVjKD+PS6awdRk+bvFSCbNorwpWSWOHdyDQiSY
         bGEk29Qq7yiEVS1iX35RsYOK65VF0KMPQX1pEyHBRxPycXLvMNwOPHH0x2NRI2uMGc8E
         FiwzJK1kyuwNqJI1y/+tadeav72IKkTqNtLaZUC98F0g9q1gy77v51SQ4bPIdjadgclL
         28BeNCjnn4Tu4oZmHKEJHKtPVCV9nN3I5f19edEIrqZsmB3zYrFmbgwZeaid2VRoUvTy
         RKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689582; x=1768294382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwDshA9XlDU=;
        b=XOav1nqr1ieCQSWus3omOVHmpnoL1Ko2UsMrZ8CaSUm9wNoSRATALeQRrhcAy9J9Ip
         /q+18cagkvjQ1A4AOLvfpqh09f4bXn8XOgaCcky9QRhZnWK3kQ0n0RrKFPwl7pqEOAYb
         R0kZOvxkJlnwkiy52Roa1uRrekZWsDMdmNEzCaNduaGr8zWDRvrpwz+qwyD7GwaeOvFN
         gdYp1ZhBL/drZl97fzfnaqL3jk0REXo3VhkhDAF+3+qxGQueqB/qX2hLjsUI+qK4iIN2
         MNM+QNCfUHi3FbewAuD6XMVj6uv+8mTraQX+qnU6BDNXvpH2SWtk3r91+QJdY6geck6e
         p2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUBQ55ckSXWYHOJIOnM4wru8mYmNKxOuLzAamiOT/SWY6b6aWI0HXSWo0NRyiKOMGq5wqqq9AdU5la7pWhp@lists.infradead.org
X-Gm-Message-State: AOJu0YyP+kCNKEPjhpv3zJcir2xSY6l8fhIqPsyXLmOugfN8PK89DuPi
	KKRMXNmz0wQnklgO4drW/Xa6PTztau2zA+OabOUOs4u0KmxVoyOmuQNVtDgfMohq9Wk40fRyqvH
	tFVAm2/3Vdlm94Q8+MRdB/ERgB9Sp13hgWcVFFvDaUKqnT/qouJbLrwfs4Z8kjjtglxQv6CrqnA
	==
X-Gm-Gg: AY/fxX7RF46T8ZVaPQH6ZI6sPLyEPIBUTviQKFIyIIvQbpqSZkt+idpyMlfAn8EzYhO
	Xjyso/OnNy3zsfuaBC6IE3LGLLz8x2xDogB9uy9NGoCqktHSuE/9gDojXbetzt9O5mR/Hr0Lugw
	d+Tm7bgt/U7jt18cKHB+vsEbTKGruYfspDYLtKcChE9Peo2f+JMvJTr39gDcrzp0Hsfn7pBqbUD
	KTRA6KX3HeEW+05QawIBl6VsttxVoInBSgqzdQ3qlmoRMCVxmZYUNYqheCHb9yKD2mKi9Nuu7oX
	fdCOvCIQFJPR8cZAkMDP2ZwDqMl6SoVzwqY810xfwRj3L7wUvjK97UuMbKI4Yzu/hsnoRHt6D+Z
	Z/MX7pOYPOZtObcZzQxxzGWcMcaoGjVRMW2NozL8=
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26528241cf.68.1767689582034;
        Tue, 06 Jan 2026 00:53:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7E9Dd0gEbHGw/qwmI9Kg/hwl220mH23Q9cPSWqNcPBGofT1gZNovh8hqrkCtABFulpregOg==
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26528171cf.68.1767689581612;
        Tue, 06 Jan 2026 00:53:01 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7fb1486csm13152255e9.5.2026.01.06.00.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:53:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
Date: Tue,  6 Jan 2026 09:52:53 +0100
Message-ID: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: g3cnETaGpLFftY5S22Dq80zixrY7pJrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NCBTYWx0ZWRfX1CwWnRctM7L2
 V5Cog3heo/EtWJEQcsTgoJa8yvBz2sCxx24eriMuuMvsz0oyIYsTWFn35cUB3HG2L+HljPNUvJA
 76ja8W3KYKObGZWWAiHdGFGcqS7jGi0MGYXmSIXLHBcsxQEYYcmNDepsMaItTeZMqU4vF6nSRWk
 gQrspwQAvnpM5oe29sCZuCGYACFF8PXV32JrUS+RkZb3gPfEDi12t3rYv3gFAYw2D9LXxL+VS8e
 f0rdZIPWtnQvF+jlBAHNgwgFJMTYjeVfe4Yk91aFTvrih689btAA9z26OGv0XcUxyNX9pC5VdSE
 gW6FJ0CP4mJcd3mmucQgbjmdctDnJrq/fWgd8gc8GPDibutkj/56q0E4j3C/rdYRdlXzZ8Ax6fp
 1RqkdnLhJayPbJRKnCXgITvfwmTL52Q5UgXkRC9jMOm4luZ9aty1nVXmm8wPIHaPu/EguIid6lt
 OLXYgldg/MdmfQx/IiA==
X-Proofpoint-GUID: g3cnETaGpLFftY5S22Dq80zixrY7pJrc
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695ccd6e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=qfAtFR7Ekgvq_9IDEGwA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005303_801039_4073C246 
X-CRM114-Status: GOOD (  14.89  )
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

The GPIO controller is configured as non-sleeping but it uses generic
pinctrl helpers which use a mutex for synchronization. This will cause
lockdep splats when used together with shared GPIOs going through the
GPIO shared proxy driver.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Cc: stable@vger.kernel.org
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index d9e3a8d5932a..ded7b218e2ec 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -893,7 +893,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,
 	.get_direction		= aml_gpio_get_direction,
-	.can_sleep		= false,
+	.can_sleep		= true,
 };
 
 static void init_bank_register_bit(struct aml_pinctrl *info,
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
