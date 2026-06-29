Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901AFC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kumh4FFUa9u9OO51ueM9zQEEnBt++p3NeoP1WUrJGk0=; b=WTVv6IkctcNBYO
	powYPERqd/AiX9rocnt3tzwD0zBiy9utTHVZN4lTauG+40wZ+XQsNWXAbGCuo+IhzRH3pyH50sMpA
	NajG6f5KMu3Q3mCttErDeDwlSBl6QVH7CFrkJ/lxK58WAgreS7SA//Oi9tLzDirQyj5YYxncr2OF4
	DlEoZnv5BN02yk67hazvRHHPtggFsZZYAD9hNhQB9HCRrNK9oDMfiWCxUDxCAcl+v9saQvUvamI9c
	bwZOVnJTIxvB2qwSvfDvUy4eBl5QZ35HEWJs+ALaW/m0pGuYn+NPs/3G9GaWPgdSJ7+1k9+bbCf5O
	uzxaCXCPa3Q10cTzgviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDIL-0000000Ewdg-24Nd;
	Mon, 29 Jun 2026 14:49:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDII-0000000EwaI-3bzT
	for linux-amlogic@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=; b=XpM9pyuzBTP5Tk0qlKee8NSYBH
	zRsywrboVVHPBMZQWsgjEqp9nyOSP/B4w6MJmClI3546vyKlX6xAzX2qjF53MQF24JYEnZ14esy2B
	fzo5OFOOzPsouiKXr9dptT8vabdIZ0xa07uh20xs7Krgez8jCir9Q5kKSo4QQTLmU57qQpyZpgIAM
	iUE+WfVh1d+G9t+j//ZHyqghEQV15oFthupxxsdd2IvmqWoz1U/PwKM+1b/0g6TiWtv1ZCauZuOkl
	FOpQwoovt4uIy0fMp7tewpS9jDCsG3VsnSevYAmkADrVGrzzMHC6mvDWXnUbBZC26H5OIG5eRBj+f
	520tMzkQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weDID-000000018UX-3NSE
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:49:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT7Bl2604444
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=; b=H6uAJrPmvSmWcB34
	usS88T/Q0eKB2k3PInmaPfU+i976qDNDwSNegVEB/60KEP5HjppOioy6UcEkSYhb
	f+/FvJAmwJILDWyIo4ZnkAAT9SaFqV4um6CB8Gmccpbh169rzoVUKy/9OFZTVR0P
	uDBzEsbvQuFwrt5bW0ccq7TCCIuj6uFyDS26wKop6NhSZzIB/b0sfi8xPeZkj7Ya
	MTZDsq7ZH+Ml+w84VwNKdB3CcmLbwnPJeBLmTaG4qX3RSMSbxlkkPxuZCvFuIoXZ
	Y9TkuMtsO1YV7rO+OVTN8aexMO0hfC0kj35n6g4lWbeSY+YeaeSaaFUsDaGG/ikR
	4xFdlQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq89c7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:48:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so562244385a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744535; x=1783349335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=;
        b=HZzKN/wsTJ4EMqShsNehCxCmZk3R1INxcBs3SWz6HwN8KuSlPnHDS4TmuoHgmZcP2+
         qblalJq0izY1ENgdo4ZNIAQeiEuAd1s5kQUcSfxZx/XkEiFcm/0gYc2qhG1j5TrKGgIm
         y3grL6V7WsEDHDB+qDgH89iCOwx7uqNOQVZJQ0z2U+1L7AUTLabOh0Gp1xjMOLeSe3ZY
         fDX5Al9V4kIwG+XXWw/gmPqOqp0Qw3kSX9YtoBv9YqaTLT3KcBqTLqy8yrERVz+3xJJF
         WQUtFz3a3jUki2PKvGk2/R4dSD1hmNvRxSjhrBFK/8QMgjYx6IFlUQXAm4VPfXB7Btdh
         RgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744535; x=1783349335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=;
        b=PMQNA7QfQ6SD6yTbqztgsfnEcOxw9hXbu0jKCzIGjMd/WW5WmLYtQRiEOpjqmW9xHJ
         ReubT8fxr3XL1apXxmCegW+zehvc/denfj6BClcRpRkOQ8ARnO6GjGt1OaJ1INo9U25e
         wUVOtNEXJvyWbTcuhTTfV9vttc4WPNVFuhWJtf4eNd5pp134oBFua6RMcLBa8aVsHU/3
         MN7QG8g5DW4gIpkdIiTc4tAu2/6ZjKNC7BRFLHW3RCnNQ0WtrReNpSLMXX2rNwTw4IAF
         0b7DYBGOgTh5OXxTALjBeSusAqpkJcAaT08ftuPT153QyELTvs7Pl9jY3H0/rI3VA1dK
         VgDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vsVneFaWTbNgooTWStvN9FlL7jH11r0EJ/AqE/xumkPQkSG6WCx+EjrXd3FkGJPKPZfBtkE66mBViXSTR@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDvnKx97EKpkhYNh15uNfmt69aqbnmUqsn4yBlhBhh1QadGQu
	wW8hZWJoeJiI95VpPUBPeTDQFX74XVPqvwxtR/su/NErzHaQcQFRviFdVLUqUuYuxqE63RjuKq0
	0vQt73BHjue4NILzyHK14CgQKGC2yA6lteg77e5Bu6qKpBXM+37q24Ka0Pj/iEpB/KZv6dIu4PQ
	==
X-Gm-Gg: AfdE7cnHCxRDzLvE8bydOySrFeiVJNcHYqRBqP+W7W5WNuVESxvbj2o1ky3ErSz49e1
	C4ILTMmWk+eJbo4Mk2tWgbOoE5cFdvczZbHzRWhtIuX7MRIimx1PBK03KT49tklSeKZU46/LojH
	Wk4m364bXERZAmu7XhoGjcf0U2pwQqfaNEGrO1mjWOrR0cMOAv0Mq1KcnjvOeYvBM1rvTecpZKS
	5E6uT27meTkSyuDyR5kRzPxFUB4Ug0fmIY3uMf/r3rI2hZgByMXU6oXoZEATWQ7+h/Kn9gAzhUd
	TvBar+Em5ZL+tQXMZSuc3Xd0IBQQxq2yCi6gQ/3uV/tXFm6AlSFdQVp5dXt7yBBr0BPDaBvEshz
	g5coVZkAbegI3ruPpkykRaNXsYd+Hn81yZoNV4mJhS8vY56mGd1dFHHRbdqHwI3jUT1VeVD9l6w
	==
X-Received: by 2002:a05:620a:454b:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e5a5c673bmr275401385a.73.1782744535307;
        Mon, 29 Jun 2026 07:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e5a5c673bmr275397685a.73.1782744534816;
        Mon, 29 Jun 2026 07:48:54 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:06 +0800
Subject: [PATCH 4/5] drm/msm/dp: report IRQ_HPD as an IRQ-only notification
MIME-Version: 1.0
Message-Id: <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=3483;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TY/Ycd0Pv0UYVXHobfUENPm0aoX/GRTId1HfFoGzN1Y=;
 b=AweWrHKC11A5BUtjWFtmRQjNIxUkW7uePMZ5PMNnbD77GSRS7TqPFahMkouslMZ1c+wEOjpym
 c2STxLMOEvRCcfMVC2RaEefZcMBHE71VDmHjWjqIJ+WHqFr7aOTLrQH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: i1qYRWL0J3JoJd3thRtiFfdPva98zFze
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX5TheCuxU0B7n
 kriQ9o3/b25awo6eo3PRqYXtDfsKANCt7IVeOXW0CWglebPzUw7EFIkXuLe1fr7e9LZNJeJqtMr
 OglGAygbI6WlYN/4UaV4rsN1s+Taa5Q=
X-Proofpoint-ORIG-GUID: i1qYRWL0J3JoJd3thRtiFfdPva98zFze
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a4285d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MqOh_s_JX8DWAqdrIDMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXyGqssSe+OlKa
 33Ok9J5qxoJI/5ua5BDDg9WHq/eicPYSQdBEldCirJHfPSmu49ZGbiKf2Wp5YnxHwIBbykAJ4QK
 OTL2NpiHPJkXa2ICjbbacLVTl58iMTJIUI5BHa/oOe+lvvAdb6n+eUrwCG+uzKb/F94Ls50a2sz
 QN3TqPH+x4qlmtio4IANNKkDKKmbxXV0qxbEaeNE/2D05n9nTk8YRWU/yGd1cL1LFmg7ALggv0X
 rciGcFG0iacNEM4ExtI2MheZSwwp3PueLvPolY9/k6uqGxGcgWLHSo4LqztQewhzey3YU9cTAb8
 AE0mJa3+IoyGv8eK42GZEX24eyJpb1aQpKYhqjuIcDWk7Upw9Z0B48WAjbzuEm8ifVEiUo6iYCa
 Delkoq0MFWFxhIFM1ZYj6jJZ/Dz53O4a3Kr/W1n0Aq89wi1D9mtf3MVOgXiggEVwz35GeGfBMSa
 UTRCRIkVGkkqYckTifA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_154902_345733_C83FBDC8 
X-CRM114-Status: GOOD (  15.04  )
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

MST reuses the SST connector bridge to propagate HPD IRQ events through
the bridge chain.

For IRQ_HPD notifications there is no connector state transition to
report. Use connector_status_unknown together with
DRM_CONNECTOR_DP_IRQ_HPD so that the bridge connector framework treats
them as IRQ-only notifications and forwards them without modifying
connector state.

The DP driver handles IRQ_HPD events based on
DRM_CONNECTOR_DP_IRQ_HPD rather than connector status transitions.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c   | 22 +++++++++-------------
 drivers/soc/qcom/pmic_glink_altmode.c | 14 +++++++++-----
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc93b566fbca..4ee391cc7165 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1119,14 +1119,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-		if (dp->msm_dp_display.mst_active)
-			msm_dp_irq_hpd_handle(dp);
-		else
-			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-					      connector_status_connected);
-	}
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
+					    connector_status_unknown,
+					    DRM_CONNECTOR_DP_IRQ_HPD);
 
 	ret = IRQ_HANDLED;
 
@@ -1781,11 +1777,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
-	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
-		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
-			msm_dp_irq_hpd_handle(dp);
-		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD ||
+	    hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
+		msm_dp_irq_hpd_handle(dp);
+	} else if (status == connector_status_connected) {
+		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
 		} else {
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 946eb20b8f83..28ab8cbb5ef9 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,11 +373,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
-						conn_status,
-						alt_port->hpd_irq ?
-						DRM_CONNECTOR_DP_IRQ_HPD :
-						DRM_CONNECTOR_NO_EXTRA_STATUS);
+		if (alt_port->hpd_irq) {
+			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+							connector_status_unknown,
+							DRM_CONNECTOR_DP_IRQ_HPD);
+		} else {
+			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+							conn_status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
+		}
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
