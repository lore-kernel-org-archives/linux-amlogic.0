Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C62F588E5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZye0fx6YPdjH0kFvgAHvUxfnYoU0hcA/EeDnBwL2R8=; b=zYIZJQglAu17to
	+7d7Sh5/emQWyn0UlLcC7BlR2I9Kg5lRWts0DD/UTw/lW03fwTMPl8z5tXMcvFK/jT4kQsTJuCOLC
	wdc/eOes2DNh+4F3FDTGFocwDVepsxvA+g4mxoLq3rkQzRUpwUBomYFvKTUlvq5ri3buP7btYeDry
	cc7iHiv+gRkjsjNp/hXg1GT04ueOgvoprJ7Qj+lRfklelYGcKbD5eMAyrQiNMFAYD1PJTIILtTeJE
	+tTQ/F+Rtbpo/JX3U5QPPVsqdo5bgXyblVq+oGYI0/Oxop7+6OCjw8y/jHIYY74kc9IvbhffktVdz
	lFcC9812W6N8miy1YYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbT-00000007IIl-2XHR;
	Mon, 20 Apr 2026 15:32:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbK-00000007I7T-2Hpa
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 15:31:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBmbi53212120
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=FtpjgyQZHS7PWmHX
	SuFii37KrFCQGP1LI4OU4yqebryV5Sdp6N0joKTBHIOOB8hPymm+uyqRdH+Tm97r
	+EBhBi1g1DCY6m8agqOGgBCv/Qa7DME6E4+WpcWLasxMExe//m6f1R6+R3lkGCg5
	voui14+vXjyZQwGiTCfOXeX92zt6jC9TdC6bhjcKwkWNSLDdBPCSbRPKO3grnW61
	R3IWg//h+uFyX9BrgTFnNiTrs/ANd6XGcbhtb61siLp8IgbkBKxNqs86qDk6RhUW
	XaPVVErtMPx5PZpqCXWqAoIpuco5vY6w7caepoLq9Ivz37pNr02hqoEy1yzdef97
	yvJd7g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfj3w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 15:31:52 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4723af8974fso2470678b6e.3
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699112; x=1777303912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=LvYCSiS2OlT65yb4wLFdLxYIESHEOAZdzV1bigAHkqD7+hdV1udmtTVST4umEP3m/W
         M+/Zne9CGrQUHMyzVvZsItgIPKju7Rfod8H4JSaqi8IAcIL+Lnj6Uva3bmQkRFsAcG8B
         oJ9CGxZAKNLcTtn2QFuAw9x8UPoFQpx8uRUUxUnPAwhlTcH7RE4NoWhABV3CheUXU43H
         Pe4Q2sLKoN/SfHzXQKAOQ4Vt1fxHWtcORRYZWl3TbONruvwdsj/dQrq+Fcmy0NAJQKC1
         yknHkmI2aWqwzrfh6zEHp3ypzBGsWJPT/I50s9f0N1kjyfDXkE1gZwe3DDOak/KtbFc+
         JYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699112; x=1777303912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=oq+XL66lo9CKe4BCG0OVmQpXsFnyMklfUHOY2Ly5ld/mM96fuoMPpLCwIEZgVaOzx0
         fAdQqaswdJU5i42f5BkVlImNq5Y/pMccgHz6+Hp0eB0A/nI1v9vO+DuJPN6BYQFDwfAv
         eW5tLt1NBJM1R+V/aL+sNCgcJOL+KNfUDINXA+7xCjqW1Ri0RXvtRUFiaooh6hFm4L3D
         FPFFx5/0xoUrAZTgsfZYtzwzzSKjpo2lwulbiEvvKQWTsahnowfYIqojAUoRFkiPRvhM
         Bi3d56CGsKlBgYHEeii9eZgKKLbJzyJ9pkXEDP1janBWxnDK6atcIis9q/9ef2oyTzvB
         Kp+A==
X-Forwarded-Encrypted: i=1; AFNElJ+DuBbzMzvqmdEB2SUABQ2lI3jskitfGm2qztwHSu0z5oWnq2AidKj6rNc62K8ho5NL2x2uuIXDdAhjRIBI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhmer3jeX1l/hG+ZEc63dVW28BQoU1mSJEWlHoq3BjReQ8LFIR
	GIS/fNQGKR1w4gdgTsZ7kvSm9lK4de34lco2tOOmwdFPrwKial4b7pgb6MaC6n3sJE7Ozq3ds4B
	axiquL0okG6XOJyrLTi1rwy4w3TM3aTnjwcpKYlIHntH3yJezqVQqPiirBIKZ0pMjqb7QBQ6nVg
	==
X-Gm-Gg: AeBDiesnNyvNAl2olFimhuUulUXTaHGNPmqp+bJBKOLv5/rIzGE8UZigBtF0nKmpxxM
	Eumere/WXU/B8Yh/vwYGMpzd+KRmKKreS7HzM+UR7YMBB3/TLElpaGGvkv4f8m/Of94R1d99z2/
	yEOXcsqysCRIsQ+FJwqysL0mpF9z/Wa/ISbt/wnN0A8zGlAIw0PXCxEbsy7I147s9mu8Q78qPyd
	Ra5mwq/Y345SSqwoNUgyICB1yUT8jz6GhnsGOOmREdZicRcAkvEcSoKx3vjpb2Qqao9jOh2I2WK
	89fAefZhr6+3CuJkozmDJEBUIYTRlcp4mcEj5Sc6gbmQ99w9Ukg7Z5uX/N5lIDuz12+oHeb30QD
	e/mTUK/LDHXtf9CnuCmhb0++RH3LHW+P69XMQAHgj9w5Rab+gR1TvacczWZQ5SA38+MbqTpiR2f
	FdLSm4cRny00XMMVZJvI72L3IzvywchOmZ4qM7DofZju87NQ==
X-Received: by 2002:a05:6808:2223:b0:467:16e4:d276 with SMTP id 5614622812f47-4799c818433mr7486834b6e.3.1776699112133;
        Mon, 20 Apr 2026 08:31:52 -0700 (PDT)
X-Received: by 2002:a05:6808:2223:b0:467:16e4:d276 with SMTP id 5614622812f47-4799c818433mr7486766b6e.3.1776699111336;
        Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:43 +0300
Subject: [PATCH v2 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260420-hpd-irq-events-v2-5-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbc08iYjB4Uag0ka8zVax5tTnA3IFY+usHE2
 EDoi9ciSAyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1Vt4B/wNiW+YWqmfm+8Rmhnz7THsToqY8cu5mLfFy7IsLit6vS2wLSP/yBCekylhcTV6irXUM8P
 42VEGhqz/Ymuv4uS+YoIB5ejPO9MLGk0vVkfMOIy2Hni+pR7i8owtJvna+wF3TP9/BgaM6gzw5r
 9VgXLqpTSqAWk6UDwvnI4WVZx69ueHd9x+giIKzmS2XWlnronU3X4nEw1nj6M8ixGQARP/0lGiH
 U2cXh7bRCqlzc3NP4rjYbyWpEnFGUWNk2KQ1MwH8MFIqVQjkH0ydOc585da12iuEC7ikpiCOx1D
 3or91Wxi6twREDMlpKWS8i9MNs8T8zzR635ByxjwU5RWoNn7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfXy+dwItfLk/j9
 w9HC6cKbqIdjAmGL6mYyl1ZazCHzG4e60GKH8ofm8AAU2bcxwy8PAymfO4dk0RWXSYiZsECG8OY
 EADyb8STTfLgxhTaoSM1jb/FmwNtsEiS0VzMdpaq3s9cAQS6Kq7L+NqphtTdLk9iAdnWqbCHsXw
 bmwRLIKttn1W4vA/vF4UrjIhfo1ZwSJfnn8xYpOvTboC7dalBXkQCRWlHd4GhRmJfNYdcvNaIyX
 5Y45s9lnJXWi97FDFBeGHSDoTJBg6QTqmCzopFYcZEXsTHc1mCxxyCWqT+tJAS+qNQEsJCnt8fD
 /Gg2AKr/qPVVxSFIz1XVPrqfKur2ehZqbRSwlWSFQsXzl6kKMt/lSa55yXMaBWIk0dwDHowyhYy
 94LlKdGUj5gGS7ltQhsePGuOJYbz2sjIEmJo4+t9D82mqxCv7G++1pMNVsgWFyHrYSKOxSEg6M0
 iWgOCZ9Ct4n11CRmJzg==
X-Proofpoint-ORIG-GUID: Sloph5YgKGGIdBkB6P5Wt-hJi_Mvrl5Z
X-Proofpoint-GUID: Sloph5YgKGGIdBkB6P5Wt-hJi_Mvrl5Z
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e646e8 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083154_696947_2D9B6430 
X-CRM114-Status: GOOD (  12.51  )
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

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
