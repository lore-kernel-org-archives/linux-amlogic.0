Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F2EB7EB7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOl0mXx5Be47iUoVkPzTWJATTtqWgu60a2oBB71u5Kk=; b=CAY2MHBWV6AEA6
	6o/Tr5ZNwpBO0ZThyT6UnxjUmp09SzlzY32PXz1OIR2HYZ6PMim51CXkqhkrADSYkYWKqtFEv1uJ/
	zBNek9mgH+MAqylK2Ec/CNuqRNvCY4UG3NCHx/A/zfLheu7szTZ3WkNN5Ffe+oP4aF7JwRAS+BC6V
	QVbjcspFnad+XoUGlv3oLWWH9P4nQAQC7UK+g/uO5GE7zPoGO+mySdbTGi8VcW5An6UCu5qYpH0BC
	ApjfkBOf/Hzyuue2n8u/Xbv/P3BhZ9U+AHnQV5Mvt559hKkZnQNcGk3w4U4V9pBEC05/P5fmgXg8X
	zzkY7TVO8x10ZOOCDQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8q-0000000Gopa-0tiv;
	Wed, 04 Mar 2026 09:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8o-0000000Gom6-2gqI
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=; b=b4iQ3P9wQogAS3dxTRf2oX+xMZ
	hS6Es2Le3cUmNtfds1zmggFx9HGiJ7tlCTY+XcJkGvodizK5rIUiurxvNAA2EiwJWRmLE5Ajnsots
	Su75YfD+ByDDrOVRBNRRfLwMo4IPnWR16CviH1AZRCSKV4gOFaVVkmcErDlsJpcoELOIYlM5y04Ht
	A9lPzq5k0w4OrisHd57x9rx4xONxNgjP4tBE9rpbtZ5n8kC3FB52IIzxl4HrwKtUlNoLakh2s3zOF
	Fyl7F6PBZjSQKWkS7Ef4ChnwgcmPIlNjBQGq+My36cPyVOs2HKdI7w/0eFwd78y9+H2z4DpDfYA/x
	IOaKoWgg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8k-00000004CHN-3T6p
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SRnI1677935
	for <linux-amlogic@lists.infradead.org>; Wed, 4 Mar 2026 09:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=; b=D1m8qnvk3E5LhfpN
	3QUokB1mBSULrq/CdIG1gvd6CO8eOlzfQSz6frcriPGOVobjPUD7eQqddi0kPWW7
	LbjMvyAguQ0HaBgVtyx93QHvRTCo2bPd84Y4+GvyvQVfYCJse9JhM47kgvuIjenM
	FRAskzPXpM5Dt3drsssUvDqk8KcXz32SAU6JRDHeTbjWrsEhzH1n7L2X9AM29pgR
	1LjrxlnR88mTD7Re2O2hVilruhiy4vGOGYZlcR7J7r78Ipw8TRrAZAlx5CsWP49Z
	8YRrd7Z+1qSFEpv6ae2lephx4GZIpjJNQnokM35jHDfMSE+AT04D4THaXNEr/JkR
	bTADHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73ha5g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 09:03:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so3927184585a.2
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 01:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615012; x=1773219812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=;
        b=DRt39Gnnm2SMWeiMoSSsEjdZ4+Mi73BbmOrxB5JT1rsMbKqqh7TITvhHNJ0RV4iGyY
         yL7HV64Kisi9DiRnqRCjuwbAUTjGr9d9GT3a2tg+PEtdXcqd1qX5pWpN7mpMQG0v0lZl
         PwgafhD/noANmzVQyTyBUm4kEyxPBmzkKHwGZtcTFOz9Soz/w3TXyrqRmeDk8nbeyw33
         el4KjhqtkhuCh3yFJZw0MoJrgt8Tte4uTmTnadRWxLTPCl3dGNsRdMh0aNc2/+lKfr/Z
         ztQ6L+XRdIGerVKHsZww4CNA2IQ/7DJMvVWsdQHEzlW5DYzZ9ZQlxlvt5sKpi0ufp4ds
         Wi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615012; x=1773219812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V4DdJrigh17FkqHoOs5hVpX7lVxAfGwxLPSOp0C/QmQ=;
        b=PRybtNVJQ1Hbb3VSiTyQujKlcdulKZfFhSda82VMKQGX5Fwiu7fVBlDNPwTn1g/yyI
         7U9X4ppJ0Yni7U0fpeuKI+eqRaJEuusCz7lXmkeUqLI0H0pAtBL6UI4LwuKUVFq7x363
         0i3JYD2UZJEw2Dzo4MhsXMe23Vu/vpMBVfpCxkkTm6+PIqFnKGWipct7HLl800n70vyC
         YPPi5xEwDbWFIUvSCsRe8+srQEhZ/L2h0yqiUI2jRTgT9VaF7iuTlZ0DgzpE/NPEeqN1
         dHsNWhyTAB+2emKB1h9BCtHO7b3WmXL6GDza2FkTkq4DmXxdPY2ldSAx9uLs/WzveF3m
         xSvg==
X-Forwarded-Encrypted: i=1; AJvYcCUrlPDNsss9pzBfKaaXIa2jUV9UpadpL6oXEAjBH6H1IIAlaIxJo65y5KL9kvZZXombX+ivYsgjMSPYM0Ri@lists.infradead.org
X-Gm-Message-State: AOJu0YzaPhH0Yc+qAvQaIMNUdWN7DkkhdlNzDLo2NNtteEKjf0VDf9Ii
	+g1B/SNjjpkBp/P2Z1kNjeWRycNPC2ssMWmhc3pz/N8xr+SX+7vS0SAn1lKFClvX5AgeG+uxcda
	RaVpA0w8M0Tx30ZE3lQRTMZNzf5/QUw+q9/rcZnF5UqcDS3rBPOlH/iK8zmdhLl8oU8465EOzcA
	==
X-Gm-Gg: ATEYQzwTyv7paOjhe0V7uN97PfPkYblqiD92EGIc7c6yeEkVF1zK06aqHDX4zxQU6iN
	QQapKQK62cibkc2EyVwx8SSHGA3NTDXaFyN0+oJqlHdRSYL4z3zkVPRQN5ouWwm3BWyr4PbuLKp
	FIhHkUe1LXUojYLDI2UmCHcc4YdhEPV9h2w0+8WDzhlg6uX3wd8n0WL7nmQEegkiNCPxv5v9CaJ
	hEQ6UnuxxQ6ZbuTZFGctBK31UuwendA13oyEwRK0KaeX0SKxO0ABVaTpvdaKaYQvODen4CLeVhH
	YLQ5qv+8bpNNJ2XxIec1h3DetMWVQDcFW3Un9ad6WtfkG71/isxohBW1Bmbp23ev4zZ1Ltmu2zV
	vY4b31pq/vYIvVCdAC6qFGlMJpMCYtuOtuSv+KtYEt8+mhlZ1RK2e
X-Received: by 2002:a05:620a:d8a:b0:8cb:5393:20f8 with SMTP id af79cd13be357-8cd5aebfe1amr147315385a.2.1772615012029;
        Wed, 04 Mar 2026 01:03:32 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8cb:5393:20f8 with SMTP id af79cd13be357-8cd5aebfe1amr147309985a.2.1772615011499;
        Wed, 04 Mar 2026 01:03:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:31 +0100
Subject: [PATCH 10/14] watchdog: convert the Kconfig dependency on OF_GPIO
 to OF
MIME-Version: 1.0
Message-Id: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ThHFh3NlTGr3cmL2+FqY9w+FucoHGvdn5gmiPzKUOnw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UzSi5Qn3DgaD6FivvuKNsOUmi1EyHHFH7/+
 rwJ4ztzm+mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MwAKCRAFnS7L/zaE
 w2w4D/wLgntjU8j/CxmGWummrsoPSeGrn5cCG8PaCqyxiIKXvDtsH4EKd9slSZb07jfj5yDj1Uv
 Hd8iwoA0IAl6pyIMV8F6C/Le2nEX7Ag7qKCpG7EJ1SGQNamiw0jejArYX8VqkDPB4WQ41l93U7R
 /iOjI+luNjSk9ILZc2s4d1gffEwK0h4ReEorHioIZZJo1QR7SYlvfnspGsytExzS9DaE6BkalDm
 MZLZeaXNysxrzwAkbWhP6fqxo7ce8EhXQzu5U6cyfnjIoKwj4BhY9wQT1vlqcKYu7qwSVCLLwRv
 34dGqURaxeXWUTxumDYguIk0OCt95kbMkJZ7I4gEtIOnoIYXmoE0cXQi7q5eKTHEx1Pdv68JpLm
 xUME2wVPPXUFvYpnkGg9WctfBpmtH0SG0C2Cm9kjCIo++i/NcoGl6yF6nhXUikBqO/r6xnXxM1L
 4i/5PHvnF7c3MgEvaXLjzXmtMjDihQxuFpBA/rXFEgK+cDMLSostTYnJgZaWZWTIqz48EyeBDaE
 3oyY2BMrSsjPTPJvgwUHeksiIYVrTNq30Dy6zjt6d1hl4fWedFAUf3WqvY8s/nfm8xIYBlTZ6i0
 2iigsSnPenUOrcRGMY5Y9N9i6rZROJNbSrXdfQFtt3gUGgfoSeHrntObLfNOa/4G+sndGUQspVe
 1RAylqZe+NoE1Lg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: i4Osv15-xnik8nMT-GwdIoaXBzb1fmp8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXyd9vgC553e+5
 ykV+S0R5/pSbceCXHM6wa7eu1qV0AQd1ui1esxcQSM53zyBkwrz+X6Wh8ASy9LmvFXV+JBR8Q37
 +D1bwW3qqCbp6h98wgXLynLxaAaHqAqInJL2HoWIzOoGbjaYgjqPlfgg4Ju7q+yUFxVG2Uy2omf
 WfDXrAAhX+UR02VWNCfOLDZNqYOfG/5jJdUbG6HDFCsWxqGYhPL+QoirICeW1UfMF4BhqjJL9cK
 DVHP50K+2V4JG4lpuxIHn1RfHoKolQd1fjbvhghf+ElGvGnh8XVwfTaeQQSi1CVMTYElLbYxGou
 YKUJ7f1SvnqQCxlZHby+dnbdgoC+zoOPDrM40y/XP9RyXEmofdv85M/fESBQQaXrrpQjjR2y5BV
 6zQWKqYjCK9aN1gc/e1ZrsSd1fnHSl4OAU1OUVzEKghR9K9RWelk4r7+p6Wc0vQwtfGnIhnNM1F
 +AUxuwz8IfG9on7MkVQ==
X-Proofpoint-ORIG-GUID: i4Osv15-xnik8nMT-GwdIoaXBzb1fmp8
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a7f564 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QGo3Xwuj-Fjf7Q_gFxoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090335_216304_B3452B3F 
X-CRM114-Status: GOOD (  16.57  )
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
explicitly. We could simply remove the dependency but in order to avoid
a new symbol popping up for everyone in make config - just convert it to
requiring CONFIG_OF.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -250,7 +250,7 @@ config DA9062_WATCHDOG
 
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
-	depends on OF_GPIO
+	depends on OF
 	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for watchdog device

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
