Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5B2F433CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 23:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5n3jtbZu2yjS/HlXtiAxMBwKRoaOcFyxt28U9WIhI98=; b=VurRvDjENSfGb+
	lYUlivF/iv6HuC++vIwyqtl/6hisbFmXszHSox4Z+FIIa0rC3HleG2LBok9mfUxxoKv5n0SqP5XAg
	4lJ+37qXMfOEheQ9auX/F47CHiV7KOslVShMhY5gCm7QmoZ7DGGHZphfV9Ok8SnJuQvQBnrKE3vDP
	VUa2hbKDpOOFra/MEY36cmkLWLTzSAA2vorw+9ZHGaWqBzmEsfDhv2neBDtvWb/yNpXlWxbv3L+Pv
	G5sY1s+0hcrT6MRYzIZjR5NjBw8xlXxL9/1J/PKB01fueM5f60952bHNAOf+mWI3oxXco28HCdRf6
	CzocQd3GRfHxuqZQyQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9Zb-00000001jws-0b18;
	Wed, 15 Apr 2026 23:23:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZO-00000001jnf-2EO4
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FMMRP22600543
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=; b=dy+HDyD8rosMW30L
	FUNS2GM/lG+f/jTnHznm8IJHSBbRKc8RhizcSnMXCOajnDCwPJ/IKZK3lnQYIZiR
	5VKDEhgK4DHJVakIozsfYZg7KlcCwAMoGQOmkhSGBjTFSmCtWANSVh5S2uR937Qs
	H0E459ajMWPkg3SVX2V0hyqHbN+cuo+/M2f7gOfIlX9gb4gOjGTiTivjV/7Yp08h
	F8AQkM8ppWipV88ZV6NJ/dxUwcEez1dQlF9I1+cOieWmHaPGJZj2fhGu6Ty/ESU1
	0i2Ir6mBYMoWn4ekLksWwE/zbLXb7CbdULcLrzuFhEX1qItdysCZyXaSC8yRLZ6b
	MXl3cQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhd1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 23:22:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfdc479f68so861443485a.1
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295373; x=1776900173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=RfgV6A2eaaM1kw4C9XjCv3uMOzeFd4cPrrm50AbeL/6XqQfEFIzqMkN1PmNI7mE4gw
         tTOlkh3WUK6LfFLuV4dgwcyobxZTCS86bq6bQtX5qf0rb/x3WExCH5/HeETeEDZwVBtu
         0iBSQQnmUNhXLtVw+4+ZOFoe0mPOFPmXkhNMqTiwaMWuaL490Y6fEPpUltXE/N9rEb3c
         s3or8I1yNFAZyjv+Z9zBoXiapnDB8hghyf7AWfy87qSuwA+XDcJNVUYF/g3pP0Ox0ZeV
         oeONz7epKxPhLAEKKQ2SfCYyxBNPXHc1KluRKJQZMRSUUDkSxES+Vi5sojOKh3OU+Wet
         7CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295373; x=1776900173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=tDlhh1p4mGEqU+hsSVHn8351fdK9NIdL4M0FocJmxEXqbh5uEgjwV7/aFaHhMMiakE
         jz51/WgPu72Dt3AXZOeuz1OrnpgPSHCIxv+meRqsc6ahY3PcBz6B/3n2cv2AYRZmliBT
         AdCzvT0U9sT0wX4Ppke0mn0DTHtBxAQwpUAuTN609QI8R3g+pbbZ9cj0U4cFLCqLkOOD
         HkRVplabM6asmoRXtlairEDljXpHyotRA09vlYoziDMJmFGB3jE86OMRJaRgkfq9+s2K
         6Hrqwi5HeFCbXQJv9iICixNPguherlEUALWL+787oDLO+8Q/c5QF1KkZ8kTh9B6hFMQD
         jO/w==
X-Forwarded-Encrypted: i=1; AFNElJ+AwUXdGNnLJHMuB3xGybTlkSD6Rci6bRZOhSseNYXsYeGipt16BEJj4Pw6qu7hJyo/HrNzPTkibaox5bSg@lists.infradead.org
X-Gm-Message-State: AOJu0YzAcW72jUgAwg4FnlOqO0VRc7Bm3flr4EJPjzefiHMEiRs6I3dT
	sUIJ0b42ZMoJEbMJRcypwhH6a8yg78lMUeSIcynGDQNMwFUGyjCap8Ykmbn4S1Ywfch0xMspmee
	gjGLR4R920NyGl4IpzAiteAihOuiomulsqZ9AAyF85QC9+M4kFgK9JpxGWBQ306SasxRbIZZ8sA
	==
X-Gm-Gg: AeBDieuFRjhxjLVLRkdnPb0LZ0yBjuCH6DCcdNevfL3c9jKuNMEUNYMyIjcXonknUVv
	7HqTL7nG2jvFbc8Cab1VcaEJjBnmsZahF4jcYuQ32VSNhGcJzz7bV68IWmyy6vg0yCTReszsFVL
	tv0JIQ1CW1cznTUqrALv86prwcxuftnUBtuf5jEhBzrFJBSquX33FYWujgYqgC7/lsI775KO+ii
	GKXyrTHnay9ffbKSG0ijviM6Rm1dlhrg2BzYYf7+D3l+V1Le4SU7miH5KINhvdMTQlA9Ly5TcI9
	+JzSaIqHdfWpl3MfBP/WRrDIgl3VuprlAphtvCMXEZygZcAO1szMuWy4GOtLJH7Z2D4HlfclfMu
	KSQaH0chG+vIK5DiKCqt2awpyVVJdlfPqEPoEEbiAJoCtiLjcU0rgD8+TlE6Tpzjklc3n4sYdh8
	3XvAhj2gLhl6R3xpdWjd3hKit+PW6xg21eIUH/Rh/d9bfBjA==
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362529311cf.20.1776295372928;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362528991cf.20.1776295372491;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:36 +0300
Subject: [PATCH 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260416-hpd-irq-events-v1-5-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DMjriJDCdMjopTDai5VHPDfHuDEfFaw+9gvGTyDPhTQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25RIprvup1/Ku4C5KowC01NBQ8O5kpPwx4h
 eobWONDt92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1QO1B/0SHnYn7panRBTo1IS+8Cr8do8q3/z8CG8T6fTAgUXlq7xy/zOnHoCF42M0ieXTyV7YQ/z
 cQnWdqx+Erjt/bwe0xRuejxplCDVdRnwoqJWlkTQa3RRpVC3Pv1J3HETUgH9dQxAe2InJ5RdKbp
 I2lxInSBYOdMD30sbJs2NfKL+tcRKO3hy5lap1+JKBCjWzIKj4juaEgZcxleBs1mdIhAWgzZGUD
 nLFhYljjrwhvhv6dvi+IXD9E5I1faQmchJFUq7tjgSod3CPzjUL4byQJIpqrpRZRYM4mlUzY81g
 41iEJM/GZIAKEMqXIyPiU2UPMeuXPR6g4go3iwvPkEoI4Fmr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OwBvMQcer44ivV7hXhxcXJ1j5h3ao2FO
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e01dcd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5qjnEABnMYrc5H2CFY0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OwBvMQcer44ivV7hXhxcXJ1j5h3ao2FO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX8J8KjE5uVkkO
 WjAWZ4kn+Vr66TjXo6WFE28Co7qNifCwmgp5CDLlS0FGgeCHCR090/87R2y0B2a8O12ZNMgCZR0
 HPcdD5OztejRJ3c6OYImwOas/O21e/9Ce+ouX+3/Q6AQOk4PB/01/kUDHkxtviLymPPmBUN/sli
 nqZlS1I6SxFBb9fYWRuf+lC2S6fwXTj3yy8EmynlES7S8dWNbOr9Ys0we2OkosZw7922/OuYnLK
 dSX8WqynyTmFJNRdksaIb4tIV7jkvPIaCeXkjPlzlfenU70w8hE+XDSHDyjNVOruXbd7eBxeuLx
 yUF9SNH3dmsdCH9TpWn4VQCoO13OGEqhoq4LJuFxQLsHz22Eakl6MBCcNoEyRdNdfoucL12OPM/
 wDwjK9up/DAUiamFS8yo2bRHmEasb+skpjZG9huPAAj85L/frQSAITUVOHDrz3HHycyERLzSaNi
 o8w3vq+gnZWkcNd11xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162255_219990_14A37713 
X-CRM114-Status: GOOD (  12.12  )
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
 drivers/soc/qcom/pmic_glink_altmode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..618dce748316 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,9 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_with_irq(&alt_port->bridge->dev,
+						   conn_status,
+						   alt_port->hpd_irq);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
