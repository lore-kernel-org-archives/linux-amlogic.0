Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595DBC982DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KPbsIQI67bKa5p1RvNTQnxhuMlC3ov1qYyq/ERxvm4=; b=GcPv6isixIsNFb
	uVIEqx23NooKUuhEMfNjnpNnWJDRy32qLWKyp6A4KNEdsSRgy0aid+Xtvm3Oqr504gnxLp94uVTxe
	lfmwknt47wWGJFpaxCY5E3j+vkLx/boBvJBZW9qIe21M5WgeYvYznmnB6HPP0HaCw7WkxZ2a9obxQ
	BaMlzUVgRfzQ6OtdAow+nZh8GW2H3QoSoI7+MLS2ZZ6R/oMoGDPYzkukgIOK+R5iMuus/ctlM1uUg
	pME3wBDvzTb1kDyVod5LqQywdgwGnHvtCEeY9TMWq29umwHEv7XJbn2Nlv9SjKphBLDhaQaio4beZ
	eGuLkZF29MM4G8+VsS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J2x-000000000uF-26sl;
	Sun, 20 Sep 2026 15:01:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J2v-000000000tA-3DrG
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnn0t1761015
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SknP0ek61nWxcALGWerlRGpQ+hsm6XCBNnS1Dt62yI8=; b=VRBBz23x/lhTLFHq
	vbgWnynOvIuNGZfKl60nmBA/CnhuqEgT1wDLlE/pqvtl1N5tyZwRdSw1YmxX2UOC
	VrlnWiiVFbnfLfbji0ASw2xVlZlB60g1ZjUCbdrWfUdf+MbR+mSO171p57OQv0cP
	5VL4aZSAMNaIH93DLVFl6Th6V6XyNJgztZYWHEECcZUM/ZxFs/48KsWYp6Bcy1Tl
	qB0ysSK1O1QIin1qYKSA1u95cBe7RjXBRoh1FajDvkvTIyOyHvxp3/ngoa3kqhpH
	wgGIUF7WtadnN6vdCDRXxwxm2/Ju5YAV3j6+5xg86otCMPEhi9FmG7hl8zcqaRrX
	41EkPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5ek4m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530f968ccb3so35905521cf.2
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916496; x=1790521296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SknP0ek61nWxcALGWerlRGpQ+hsm6XCBNnS1Dt62yI8=;
        b=N4GKgroXt/K8tHGQHLQBmFRc8VLJxgMYJeVhR8vBu/ZKKSN44eyKV0HPaKbI2BD2wE
         hLO1hEPnCCINymSg7oHq+9cCyoPrgGYRljcnxFVWfkQhjsRUxbicpkjNb+5AfgqKp9Dm
         6UpXyju1ZuUUSP1HRNjyzhqccBIp9atTWvclz4QG0xYL01pOzILro2yrWLOJs+1SPYaL
         a+GnTaXX9A2HPQAOWcKRC5Xjd/rHze1juRHrSqXkToWBQlSX+PLNqe1mZj1LwpCgfldd
         NixjkP43Kv90FOi8E8ibXGtF2JMkVucVB2TEUJVm62or7m30je5FetdtYzDUsQ7M9ZpI
         6ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916496; x=1790521296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SknP0ek61nWxcALGWerlRGpQ+hsm6XCBNnS1Dt62yI8=;
        b=TQLsGtsnf/Y8ZGcZltO+K6roOJbTThFalnORbFuNTtmoqSUXxV7ysC8JdFEw131NS8
         BruXMqyjgJzqFrhlFnIU19i4XLuQFLkPF8zg6+Mm/0HTnT8V741KyGUc6bcfj9YsFDEl
         wc3B7pwSVogq2N7mNgYzPKEI1Iytxyf3bwVHOUHf6pWdnRbPyo5218mJ3rzze8L52eYB
         coB4NooZi4LAmNEv+yTkxE9Au+C6b9v5lOCLc+bDcjbXissszC+P86NdIVoZOuPZU4if
         PMOqJ5OsXzIAoJ89X0OceTq8ZWNCOlzKFrFi+618Sm5aWd0iOusTcQPSKqQ69JRCqBR5
         RjRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp1Pg2/FtsAEeFoja/mUui1cVQzpA9hdX1QNqhZM6LuDVVS6tjeV9BGp6i9GASVgRTDWx5SFURaqQGG9nI@lists.infradead.org
X-Gm-Message-State: AFuF++mPy9Ancf8Yh9dKc8kiG+wOuZtOHDJ76+SxoMown3awCMyhjY68
	D/SyXj3w4a7wO4D/LuQ4y4pj+EyzswxlatXqAqULfcD7FVW0qkrbpsClYINbMzFnJc2mFcaVLtN
	PW9LhESKafGth00y7BAJVTRq7Uj6eB7d3rmyxdnNHS/Wkse45LiBFCv627aY7Ti7/g7aq6aSu0Q
	==
X-Gm-Gg: AYBFou18N9DT/W9Lv3VJkboVLbZF5l61MBDjf0RCReUfMfUPbYxpP0JhuBjoFwmoJbf
	KTRpL5cW+J3+cY/d2quE2c5Ekb+ReazRxPQPRbWalt7B1144gwI/eNz6ULYlfB+bUJnOI6sVr38
	7QZXitGmScAa3BKxe6LU8fD6IKJbUZBwD260/z30avE2sF2Lu0FOuLPzTCCUeMIKHGxfwlrmyA5
	I/ia2QhCW89IbTR278ShBZ6z49MArhmU0DRpKjDhGoAkg1SXjp9D0ioOSgz7PjLDg1356z2Z8B6
	dtpbC84AxkZiTF3o9r9kCfx8Zarh3r6hGh+i3Q+hBEGDwgUVgifcu8D7uPE3QxseKD8zNB/WdBx
	if7vkQSf2JNY8Btgq/QarJI3x9WuiGIgmYjRHPgX9etdlYEYv4jz+6LQ4vDvJEHeDl6hv6TSbDQ
	6UYYMiXUCm+Io8
X-Received: by 2002:a05:622a:4d4d:b0:532:9f22:3072 with SMTP id d75a77b69052e-532b732a721mr69391301cf.48.1789916495993;
        Sun, 20 Sep 2026 08:01:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4d:b0:532:9f22:3072 with SMTP id d75a77b69052e-532b732a721mr69390801cf.48.1789916495488;
        Sun, 20 Sep 2026 08:01:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:26 +0300
Subject: [PATCH v5 1/8] drm/connector: report out-of-band IRQ_HPD events
MIME-Version: 1.0
Message-Id: <20260920-hpd-irq-events-v5-1-ff1de0090c72@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6882;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WQsv8QazF+E5QQ9hUw9l40V69yXFmn0I2Nu5uJ04hXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VH7SDFu/E9XO4Ljq+GFlzDqUHCr1Atofft3
 XNL0tySY9CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1WqsCACd+ETHhlHes6LYxN908aTCxnlg8YPDwcAKEl6ccZM/R905V27dwX3LkSnwi67C8bbG7yo
 6Sz7dGScskcTUID4khs3iJVPJclCXA3GP+P+f27/HhozuwQqbrSXhI7oFP147QdJkrW9314X3oh
 qHB2c3dQ51Lrcop2wOnPS7CthWnRqjR7xh0bJNP/golUD+FZ+zOxyPkMApKfehCTNn/6l3kaT6G
 RK04ujgV9DXHYgfhNXajrWrhFopVdRQDqiucqCGGNR4NgzjVQCay+H1Ok0jqJ05MpyCj36wIEcS
 pnjwTo+kxGzrCrgMZ9G3mrP+FF+AhQ+7pS4JAuhkR6+dgHjh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0wjE2qNfTVFw44fzANLx1yPZJNlqfNFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX1C6tf6wCQsI1
 6OE3fl6sUx836483pPubN/L0rp6XNQ5r1/T6l0/ZbWtuBVTsRarTuszUxlBJNLjcnatgGLv9rkq
 e7CrQnPg3gHQ4LPhSO6pXLRTPDCvT4b4872UmM+FvUdN+lLUSb6dOIZ9xZORq5sNO2bMwpQzgsY
 7nXYwyT7J3Q3qHjL+hPLVLbu0sQNr0gozO1lF62+RYCb92UULxMU0FfGJdEbF2j76YxZMA6DUlD
 30Ey8yIaCkVgkmzunK2JrgW/+lRDOrQeqwzSw+l0hB896Ojw/yP+QPNJrpykVxCFt5pmc5CumFl
 1QIU3BiFQ8bynqIHVcwLhu0Twe07ysyts9UsgvmKwYSQHDznNYK5a3noduf7Z1a8/B+aUFmmMYf
 uMsLAO3O1fvB+4b7QiADC8xMtcIZgR430117zU87kldjfMIrqs9TAoS0DLi77VKteqX83fVd98S
 JTO8aYzyNVe4M7DyUxA==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aaff551 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=m8VRbRV2F-575zZTFkcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX72Yo5GgXF0LN
 kFCizu9WmklhctlsRAfgg7RxwCjtUsmRdyC3BYZT7qtzGyBYCWlkT9TAo/YLy3LVoH0DHBBNc2q
 swHMnTtvo2nvx+upiTf1WZYlYt01Y9E=
X-Proofpoint-ORIG-GUID: 0wjE2qNfTVFw44fzANLx1yPZJNlqfNFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080137_821874_4DF125C3 
X-CRM114-Status: GOOD (  21.85  )
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

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are reported through the bits in the AltMode VDOs.

Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
and extend its interface to report IRQ events to the DisplayPort Sink
drivers.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
 drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++--------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..5d4945ea1e95 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3672,20 +3672,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 }
 
 /**
- * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @event: additional event reported by the sink without changing the HPD state
+ * (or in addition to such a change).
  *
- * On some hardware a hotplug event notification may come from outside the display
- * driver / device. An example of this is some USB Type-C setups where the hardware
- * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
- * status bit to the GPU's DP HPD pin.
+ * In some cases when DisplayPort signals are being routed through the USB
+ * Type-C port the hotplug event notifications come from outside of the display
+ * driver / device. In this case hardware muxes the DisplayPort data and
+ * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
+ * pin.
  *
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector;
 
@@ -3698,7 +3702,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 /**
  * drm_connector_get_color_format - Return connector color format of @conn_state
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd887ab..344a13c2a296 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
+		drm_connector_dp_oob_status(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+								   DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -211,8 +213,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -396,8 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+								connector_status_disconnected,
+								DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -844,8 +850,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_disconnected,
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c61345e6fb08..906aaefca7e1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -91,6 +91,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_dp_event - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_dp_event {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2703,8 +2719,9 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
 enum drm_connector_color_format
 drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
