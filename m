Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7600F5A8D1
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 23:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZye0fx6YPdjH0kFvgAHvUxfnYoU0hcA/EeDnBwL2R8=; b=4OtwUAzQ8szyKp
	qqsHSakBG6XzffLOVWnCuTFH8jPaWiF4npc6Gs24fSuER50pwtRWs+EieD8Ebq6RuZchD+a2wP8wC
	nfScupI4bI+OBxj2UwnZY2bEkc5AZLD6mtMBfZDIjS4twPtomQgP6U7k4KLIuk5Y0EG1ug+eDuBfc
	uSW0M19nqNd59SEbwMqP3CIrjKDTIMRC6tCtWY12Vn39weG47O3bAUmPSgXiczHckcnBOotk4R7Pn
	y7HGgc/YW6xpP81/xIVfw0zamHcrcoYIISKRUwwO8BR03HJ+SnW2rHDmWcMUCpmqa8o2JGmyQ0gcE
	GJPQdLVyXgxWtn40xgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7u-00000007pAT-3aB7;
	Mon, 20 Apr 2026 23:34:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7r-00000007p7S-0qYz
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 23:34:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJ91Ai1598352
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=Y69pm4Srn2LCPBjb
	025nTlDFvxjYJhnQGKyOlfHgAiNYtlC/gI/4rGoJzuqRCqMfXlyKM9aTTIFzQ8W5
	sL93/7AMjo4ui/4+2xuW4VoPUYnyo5PjDQyNBUicPT4OoDdgwwgSVWz6xz68Dqe+
	uj9bmjCXEoOI0ldAscc6TGdPSPkjCAnQwmVMtrX5cCyhwXLTEWi5HR24+pZbj5Ez
	OBpAy1+412XNQ/NyPfZek05H29kw+9ojgzeaMvAIfJdzVJjXIoPbpYfiBSxpzbwH
	jqvKl2JGQvPpqMaANSus+/ll75z1TRGYCDHJggWZFK1K8wHFsE29pfVx2PSWDwII
	8S7TcQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnkmj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 23:33:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9a6a853bso8680331cf.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728037; x=1777332837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=OAs2u3qMvhnJHPrVbhlq80Oy5JoQKom6A9qn2TAMkfA24SJbdMfQpJ8YRIs+F8R2ko
         RqjAiNwbLccDxAdlcRV1iOuTgwpnbG7T7a106HcoL5g5h9DuHXGS1mvdu8wO4q6RZ/Mp
         FFD01MzHsdvasX6Jic/aJcH43qyeEmh/zx1dw2Poqp1WRVUGI+QBc5tK75lxsCditq6g
         NXANL4yh11LPb5w6ZKRKmL5U60OoitK2Wlv+35bGpElHseNQRXzIKbU6VzO1ENBvPT8d
         sD4EHmrIuw9xwUl3hP1b2OBRVtYFcP0TGottIXyApts3cES7Wiqah5Y2DcBkjzw2jvYL
         9nfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728037; x=1777332837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=TmA+ZMPJhUMZAVsZKbkbAHzGOxTnyOzUY5CtyRPW8z3BVZXJk4ObpQ5Xz+LQd5TPfr
         ETFjgKX5GVxp00PjylYH/F4FPaS/IhWt+az9Cy82ml88vbOHg9DQNW16aQX7IipXmfQ4
         oLK9hn0/liyM/SVnbLeSLBweccahnKW1KB00dh49cJ6JN0JwE2+7ORQoF659f5VfgrR2
         h5CGnbETgV2/HqFhff292t2eNfXxgJlh4Kh2sxyODvHqBN3TLpgnH25a0I9O6E+7Z6cv
         1P+CFaYojC+xXYvP7z+l3dK54/BdojyG4mqmVTElnPMKv8s1QvFyH4bHyCiQGgAiTCH1
         rhvA==
X-Forwarded-Encrypted: i=1; AFNElJ+hiJ2Wd4/IFIUWLkDa/Me/u1GuPPPV5Prd7leWfgbmerEmwxPS/285L8w7BhsiCbrIwevv7mzCJXRzThN6@lists.infradead.org
X-Gm-Message-State: AOJu0YwaTKaIxr6Titxeb7rvR/JbcY5mkAnSLYQntYVMAvxPlMdfDR4l
	SIF+1LXhZBVNSP4X0tXlyuTHvKO8zfyln+PIVL8ga1v03jNDGzFzt/s9D6v5Mn3vLX7iOcLFXEg
	U6guFYrpnXCwk69xrtvh+6E1S/fiNDpNRL+Ze3S2ZKpiBbnPS0EaLr5jASZowxKO7jZu2oK1Q/F
	8qfcJnfg==
X-Gm-Gg: AeBDieupQoO4DU3bKwcd/Gl30zbSsuQOad1YeMBzkLtVeUbmoBjXcGiLhcWDAIIdzvN
	KRDNcTf95BbXSxqe6LTA4QaZHWXT91ZkQOEfXc80k/0BXCTZ2ExiBXmZfrX+0ocs7dPRjJBtpgf
	UksNXOfM6uJD7DR5P1dgzWRRnfgrKiRsgthU1h+59w5LC36S1qlDu0tfSEzHGafiNnR7+C93GDq
	oUFuV1sQDC2eGxsUBBaj2CWX+AVx9tsU1rAJwl/jUwy9l29PiMZXOcTJIczqoASk2dFKotYUqXx
	0esAp6CouL9JvmC9mVg/q1TqgJOmz6YAJx/OsdFo47p6aN32QMRqWiHLykUanjTCrm+xnofX4KB
	W3BgJRfR4CAEIPqPHD+2M9fcZFEo8hThRjsv9MSlKghbpz+YhgDK00vzl0kPGhl3Zmfqkmo6tRW
	+A9gSjPwxMQt9kCW+czM6UThlXUrUvOsCmCp9dq3hVEdf5aQ==
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr201698461cf.25.1776728037438;
        Mon, 20 Apr 2026 16:33:57 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr201698051cf.25.1776728036949;
        Mon, 20 Apr 2026 16:33:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:35 +0300
Subject: [PATCH v3 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260421-hpd-irq-events-v3-5-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNYm08F+v71xJY6cvWWJprHmt/2yaesAWq3
 fglBTG+jpeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1XkBB/0WgdqQ1mhHWgsx/7ld0lJj3i66+rbrFpJxidzADlKQPAxm48ED3/gjv79sb4e5wUwCCXA
 /gz6xF/8U0cGItse/+TQFlWdhxMszRjOOrDo8nOwrVTlmspph9v61iJ9K0Xf8OeIOcC7VsdrVVO
 OEJloUwiJIFWdfUu2QyAunkDTkyXzO3iDTVXVcHGiezrOQ5QhoBxoVdYWSRommd9qAfZifIZNfP
 zGytUeE3Nn3tPlgtHIYsjG51CCx1FtdhO4CDkFl6XbOCBym2qudhC9uSPOYMJRJ9fC9dH7pkgyB
 ex0y3TB3oJTq5/Kwh0Q3aj02bHOTscIcHIECopeUpmsZOzeS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: I-eK1AN2pHaGsHBU0TTUOi48nIbM2kbm
X-Proofpoint-GUID: I-eK1AN2pHaGsHBU0TTUOi48nIbM2kbm
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e6b7e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX01hZK2Z9TO8A
 pmDaZsE69kOZM/2rUBmreZhvleoqZFXok4qV/o9yFaaV9buBb77FvevQQTw/Pjdnp0dWDneQ3xX
 z1RS1muSAvtE6UrWakJJYvQ0yG8Sfe8VNVIn2wXfVVfCQi0/8DcbZngAuMMbFIw7ZlptiVOsXUR
 0PMzylv5HklY/ZFVDzS0hYbplpBnM3ssHZj3mFZL6BuQMsA4ngSV9iUUPo7kbekHFrKSsbnbu13
 6LweB8aa8bdp9uvtUaLEBLur4Ck0uuKzVFQUDzcyK5p/0un4N+hwVGz1hfUwuP0EVGTZ5sFETKN
 /v0cbUbpsP3x7hK+bJOzHeqdkGSeutASNommkwpYnxP/WNQ+J4TfH8FL5mdf6f6eAyiSYYGUmTc
 C2sOcBwhbx89SmMq3CWmXIuFaipF7HpWScI+ohiGnP21Ez4iu+hVDCivGTkLjIXnTklZxQ1QaUI
 IUJeF1BCcnJayPrSTaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_163359_252028_1C54C72C 
X-CRM114-Status: GOOD (  12.18  )
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
