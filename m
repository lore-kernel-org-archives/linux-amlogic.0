Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B607C982D8
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgSYxiHfYqL5GvWAJA2a/Ggm0BmjhYAOs0iumJngXrY=; b=JkaAJKVHbUsNVY
	OC++XbzNF9m61lrzuMspidgku+b/kjz/6GWRJ+9/Eo6duWijlJllpE5pto6LmZ2mkIeXMzQ6FkbmC
	zGiSJC97pNBwja13Q38tD6hjp9JhwOcv6modh1TwwOtfALjNbLxV/lvO5/z4rq8POV6dteHSPZI4Z
	b35Uz2fPA/re0oBYdqJ9RpCzgFuIkIpbnstiCa+x9KGMUrBUYvs7Pw2iMJX5KvZzlL3PlnevClVLu
	ku4XBEzjFrwnSAyTTeMCbpq7deuKAYm13jrvl/ficQ/hk8a/KgPIbu8wqS9xORwlJ/fEHh8ZLF2hy
	3eOfF6CdUivtWGcSOyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J4S-000000001rK-3ntx;
	Sun, 20 Sep 2026 15:03:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J4Q-000000001pz-1rYG
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:03:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBosxk2289291
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=; b=Tc3H3MhjFhnblgJD
	SPNW+KTDOflRPaWcL2vLPAG7WqseeqmVAEBRj58+94rfWA1icLbM5/eDLWwI3vcX
	9swNh5fsoZC+3zlx5WDw7cIxzYqz8qoqpwAT6n0+1g1Ko3n0m+oYsJqEFnQTlUjY
	/Pd837l494hM/8LQecJxSwFZcVZWwz6Yg8YPdH6EWctRA+GQmpOM6TKm1iXSjokv
	lCvKpwfqTZfD3PtBhFWsNS6ANlRWxvrZZWwNB24DNR2SlEiVkKc9+HcbZs2XLznb
	ltoNsbnsIFVRysLBL9+qxrMR9s2vqkH6HbxOzxQYUA0x5QJof8KLgJ3x9crfOigq
	sXGFEQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnujp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:03:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78a5a291af3so2150750137.0
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916588; x=1790521388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
        b=VayY3QJSYU2AzIA8WUbQ0rqOvK1LmZvPagYn6DxIaIooFG3kY1dbCKjiN/rM7dQwxF
         FsG0p5qzClRC4EAo84Xh8zK5XGsudrcvmXSGBqV/2isCGgnKjncavl/Lf+XDt1C7LCUC
         0f+OmiVGFTpxs6jlFPa74WitUtHCFIeqMtn0zjYhzzRWSdhyUGdXvjghQWhaCymaNt4l
         y1JJgE69T8eHKcq3lyhP7KrdkcuELO8e/uXsYqTnWnQwJk4A5Sbeq21Nx7OQy36lubVA
         RWbicVZMfGD5exVLPBBhafBe0qMUs8qh7IIWmczPxBtv/WMFzmUg6EMgoe+7ZUJypjE0
         9XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916588; x=1790521388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
        b=Z8imtuDL6yG19Vi57lKwwVQ21FhQP6t+DyrmaKc2ekja70pIh4G8QJ3hM9tvQiu5LZ
         E+MxFGwJadVKp2L+Q9KLG2RCRx57L3/NcAix7rlALYigmrA8EiYiF96kO81/pA+dEr3M
         60qLAUy2YAz3UYg7lCBlFBsMlKZmsxSdX34BEAXL3xyvd/WvryFq9Ami3qwEcvbDLeZs
         c8b7x2PPyfl2E2EAfzWJTGlgSo8pZBu34n/iJsfno0yA0eGe2mrhm1X2AsCY6BgO1h7M
         ZVoxlxDo5X5MacahHqzpby+SQMpmGX+W7vcFDzMGa2FdVTMVVybo4PQMD2zKTctnUNfh
         J6NA==
X-Forwarded-Encrypted: i=1; AKwUvBw8FEFoG2oTRlf4tX3jVPmlm9zhtI6IBsBZKcLDNMxWGZI+KyTPtbXsG/AuCWWF7sKjLBT8ZlyFKQDoI6rQ@lists.infradead.org
X-Gm-Message-State: AFuF++lATn9HxgHFmvsTSge0+G2kgMUvu54Qfix6IGldOhFK4x0n1/Vw
	3tI//T4LNRplvdcNMHVGnOmCjcqjO71rrAZBo7xxXdpJOWl/uRWHzZtbHCJypm5VmHd9CWrw5wn
	LEveRWQLMkt8K3H6O01BquuJ5D1P3WSp9HAfSqPgQJovUbldWb3Q1HgfqIu1iZ3TzGdVYPxG7gA
	==
X-Gm-Gg: AYBFou2aoXtpkVoy7L5DAqNESlp73BUNrEVQIxa+v3zHs2vmcf2FvbI9Sf+Y8wYzrvl
	GjdBp8/NzZO96wMrAp+ip5Uk/Jsw5agIYqpAzqpYUzAnqYR8Mgj0m9fy1INwXdqkhuFz4DKJqni
	5iwYyQByhKjmAu9UEr+xUB+KSlrT9nVMvp6RKoipIk8LG2JY68kv+ROmjWR+qG1ZnJf/0bN/APy
	lMoBQkOz4DyFkgh5g+SK6SNUBBD6JfYD9FGVcN7hJkuSOdZcOS+nJpLa8u1l3hMbgH2j++H2Cl+
	jIzuwK8b2qB/XfWofPo9mi4sFzrqqKKyAQLFnzckMVeekG4I7Broxb8rlS4iHv+OKPWDMW6ps82
	yzWLIA9bps+EGeaZk6vbZYid3Ap+R77wNdEJWrz06DlV/YVMIoRM6pyQZkoAzVcgzGawe95sfLz
	cFfImNgtEgG0hq
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7a55daa4aefmr3065644137.28.1789916534129;
        Sun, 20 Sep 2026 08:02:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7a55daa4aefmr3061758137.28.1789916509473;
        Sun, 20 Sep 2026 08:01:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:32 +0300
Subject: [PATCH v5 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260920-hpd-irq-events-v5-7-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y5prep+uK+TtAox//5HU+Am3tOMfG+jy1KYlpaBl7WM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9b6rx73FSI8L3M2/xHQ/9vYsClqvtqFDunnUQJ/PTexr
 Vv7aI1qJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmElTKwbD89sa9B+8KP2p6
 9qOlQ9erc85v7vgP/5qXta3VXDshTN3/Up7LDJtlL8+XKNV/nFwR31K7W5/D58kd6e+bZ24U8Jb
 /G8gmHewiJqL8jL2WrcxMS/Ti58O9Fx9eOvZPplTDuPleqNjUa5/TZJQEZBavPv7u8rZFan835h
 /JcWlYGCxxZsPZZd7B0s+tc1h1k7K3GWgw2Jy0vdfuc1v1WU2GiVlsj8TeLyc+1zUcza34H/tRP
 WV1X0m30rY5/Km1j/JT8r9yXFfKeHJNsP/illuvGRza3lV79FUZpr5cIl+oXZAv5rmqW7SdcWPD
 RKdOZ8X4PTNsYi4yZ3DdC+JJfxHRKpHnwxL5cnLz+sm7AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaff5ad cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXxYqSY0tgf+fL
 e6e2K6vm7kS3S46F5BjEaIzUcNN7/2O7I0A384d1S9LDAvTL3aoO/tlO+HfFYpAmtkMbDWE7Hsu
 kmc0ifNAMXaU5WmQwgLKRd3SbRLqfo8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXxASMd13DYsUZ
 xKF0reZGrW2mWROgtmbgaVDIPqQZHgNHay6I7zKR6Ea0wh8RpdKtDbdRULyYGqN6309yHA3p7UC
 /UJ+wZKU3hHyDjJMOoeHFfRVQSiLfD49vP5TBgoBp3NXlQFcC0G6KEI0urptAknU/Vlqyqk+g4Q
 V3+++NLah2S9apD/BH7CNw3cwweETyyhDhucVHEMMwbxUOsnVtZHnRBM2Qm0THBhdmszpjIcdBa
 0JL3dA3I2+bKiCYJgK55rSiO9zFo8LLA3aoagmPKGutHcOQhQRW1RQZwexiucq3NrXkyu/R0bcz
 wKDtstSDWSMSV1AqKeCgNx3FK8nd0Qmko2DaLKdtwYxb2/uY5x4dkkJ6wwrfFpeVgkO9nAt2Jr3
 D/H2qiqKHbKfx/quGbpyCToWYbJR44MIkKiizX1Cxb8xzrpjOY4SpiHmJMPnY3yF8zdrXFBgBpt
 TsVwbfQTIf3j61X8qEg==
X-Proofpoint-ORIG-GUID: fFi0yhf7W_75s9cryjg8JslqvF79OKVZ
X-Proofpoint-GUID: fFi0yhf7W_75s9cryjg8JslqvF79OKVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080310_637353_7FB013A9 
X-CRM114-Status: GOOD (  13.21  )
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..e903d4910e9c 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
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
