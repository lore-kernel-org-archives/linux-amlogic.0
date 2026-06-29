Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF9CC43638
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxcr1GIBcRhvsci2zwZpGttfSl+Ug0K3bo1C6ttupvo=; b=DB7Ea3N3bguC75
	YD2vozJgGH/A5Ieonj6qUxr31gtB3YnMszVx3Vg8TrjeehwAfCcGTzHvAFK3TQ7VjnQjCvrvUBnVl
	e1li9xSNTB9WQzdLqnw5JJR3gse/rvGbwud0UKkKkQFQMP/+DgU9ONab8tDXQRAXihP4o+gaSEWuM
	9YxF1UauZm9f/D1H/V3HeyaqQsjZioIzYZQLiwwNnT763NBZlyGyFgPY/JcjzKJvMz+AujDtHGVOm
	3RTk1avjbnk8GhCAUPERapoKGh9EGlFDSn6aWoCoTLtyRIabMmNy+nH+/L0l6G2fRxitighSCGWXT
	FQ88IXdFqCeJYXJ2wcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDIT-0000000EwlP-0BFi;
	Mon, 29 Jun 2026 14:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDIN-0000000EwfM-1rSJ
	for linux-amlogic@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=; b=kfiw41CIHG66uyO5klHx26GxkJ
	/5TFIaE4tTkYOOarcCEYJnC7HMVUeRckpKErxoajju7J4r4xtsylWb62IXc3XpwhXU4SYdVfCTnWf
	e4ce4YkvJ5tOmbX6Di3j/9tZw50i3qz+DEHd1m/GMAtxZPbAZeMwOGzMqKCy8xhOQqs1pCoXxPB+8
	yKdf8+qynXFL89zqT8KpFUZkJ8YJ0bcDMbn4MXhQnP6d2hPdgs8T3wRETJBfxCCoGdKmXjTFvloLV
	B2o8uFmCkmddK++YbzpvEvujddENGmYjGAYxnhpafc2f+2vMl8R/17ka+r4Uv9l4s7kz8ceHf2mWO
	1zDM4DGA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weDIJ-000000018Y7-3VQy
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:49:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATDLV2578972
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=; b=jXoJ0vdn3ImZ/UDX
	dWASKy1lxZU14FYk954F6jZtliytAvjPzt7xcSkI8uO9c/AtgD4aPEXhqhZJdlKZ
	LCbMMBqf3XMIjwgV2072Q+UveQzlawXiazHtcF33MfoHk9f4REBpFNH8VtM8bTGj
	0b+FbF0ex6FSB5I1PPvkdHDnHEarRDWX4gULsRPlOvZg4NEIsbSrTuh103ZgTxSw
	EyhhI1qF8Yt3vb1VoLOKsqdiCRpD3oaSCZTWhT9LgTmkyarlETsDrpytDw3gT/Kt
	TFKiLKo5cmpfiCUbaEiKtMSSUAnfdLvQmBQGS21/qhmcEoU6HPsS2nGJk6NFbTfJ
	yjZUeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hwh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 14:49:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5740so198815485a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744545; x=1783349345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=;
        b=QJyhz2KmjzBY8eM6yXN7g9glFQW5f2OC7llKHJzkZi1d0mG1nA2bmbMDam0NEPq07c
         nFsxvTkc8ufRCfE5sAMbxxd9mLk9EyvaW0yVUgSHoEMvxLQFh87Tvm99LSKryOKYPvW0
         O5/71uqauwuIW77Ec7gODKV2f2sIMDUmP2uLOzDrWzlfsU//DgW84cPEadKfv/JL1eHR
         tNQJE5QqvV1egwzfzAEufoObL2Kktylif1bWAdosqSqZPyj/uk7+jlPlvlMvnXddKolE
         /627OWPO+nIlgGZb7/ybhYrwNqHmREOVF+zFG6fsFeUqdHP9pAOeTLs52j9iLiZMJQHe
         oFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744545; x=1783349345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=;
        b=DAKpBLGvZvBib9orXk2Gj2m0CejGOqEROU/gvWh6sw5jvsr3CuE5gV1578VgTfD2h2
         Y7HaosXxGvZ+Xb8mefN6lguBzbfwWSsygXasFCwxKSZA41b9SZuwQeid8I5hL566KCUq
         xTXXjQNRPbW7zDIwX3PaTA6mJmURUWtF2QGd2uR4lNjRaN4kFGEHpJ1cNMjSmR6xZ1dE
         +JuTpcMlisFfRtltZ1ktBGrIER+VQs6purN/HDbiNipPdGN+TrFd7kyuichjBAqDianU
         W7xiaw0W6wCd80UZ80EL3ND1lNn6v5yXpq56bAAaPSIr0xAjvS2vrVoksIX7T+gM8lc/
         SlBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mmrORjH5BBzho2fAzmY28XpCv/34BwCvIONa69M1KPtltMbLJcrLwEYoy6BykTVIGnFuqu7w0oOoIHIV7@lists.infradead.org
X-Gm-Message-State: AOJu0YxCLl4JaFN1XvrfXJp/KEjJHHycQwHWdM3f6nQpbdZZKJNKfVsk
	yy4aPHH1gSVHshYAffaDX2eAd63q+FIk/vCvydUC0bTqstVENrWRXezQXKs27c0sPaTELcIh6bQ
	JdXQ0+lrd+OsbmjQvXoQOEeMEk+uvJM1XPRp/HbRhGO+lIhxKm8FyN65H27AtSWtnGVzKf6Vb7w
	==
X-Gm-Gg: AfdE7cn/1jpSwwsygQWypO0HY0/JQUPwMepm+YBmSAAmLkcB0t3gAz44G8uyTT1aTbg
	4OS7HcHXhZvP/k1ScycBCAu7PcKcedUj1RoW8J36Qdh42YuUaL2WL+evTy7JsXpTOW0n46UcifU
	bSiVKGWr5m5CtzM3qax+zkb/WQDHGtIMhdnE/in5kD7V5er1gPxc+Lt/t8ky2e3OgiMriCmdAi4
	8Z1eVFm+V8lLIPELjtjDa82ObdiwpN/DkvSl+k/Baybg5GcoB/hSFYkzPKYHaBHa9xkiSOa1czm
	fC8icj3uCJQXYy64/5TyYYi0THiofjEtOOK30+SeDXJGPrSDklHfTlm3AvFCdPqZq/j8MFLQZ8k
	C00mjotVf31uUPGeZiSzlHXSEdwdIBdM7pLnpuPyC4knywZzBoW+4g+dle0J76gq+NRlnKahpWg
	==
X-Received: by 2002:a05:620a:f10:b0:912:bd42:b46d with SMTP id af79cd13be357-9293c11cab3mr2618701385a.25.1782744544718;
        Mon, 29 Jun 2026 07:49:04 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:912:bd42:b46d with SMTP id af79cd13be357-9293c11cab3mr2618693885a.25.1782744544168;
        Mon, 29 Jun 2026 07:49:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:49:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:07 +0800
Subject: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
MIME-Version: 1.0
Message-Id: <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=1355;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=P6ysjma33fFr4Jhf+LAK0Y2tGO90pVRAbJrTPxrwqaw=;
 b=taMUim1RCi3Tovwyu/g7YUOegrysAK68tpUeSQ5Cm5voOFpIRC7PaoYhfsOcPSnmVuUPZOtog
 FPGK/+EymzKAfEqmi8WrHew0KXfVt4LhxvzjsyxTNcY6DSQa90FNREx
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX1LJOlHemBgGR
 h3cv5GYddrstDSjJlXa/+pce5VX5FRYEpS0CAzUVrZCVyYaVgq+JWeTss1A3h7l3T6PZ8Y5UISL
 y8FfygTH0S2shWd4HHhOiC8aLM9iFMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX5ZNf3Je4b+Qm
 xwLuJ0tGD3uaOSC1WVNhRqvpnWVIn6IfOlM2XU/Bvty4vqwB1WhCLi/heHeB/O9BAHCFBVjeERz
 2OTtQMhl59YUEv0Nhn5rqmXtSFCJEA7L2jH6+9/5bT7KLHIHg+vM/sYSnGOGcfkHX6H5ueaXWXK
 z8QodvWOdqXwY7OUDCTmQTq6EKLkQHuczUCrk34ZGe6yNGFDvBXDu38wR8j1rXMMEMrz9Ph3zL7
 0OxOQ4sCMv9TENfyKhtigIvUqPR/lpvEbWh38PXbU273DyNm0L1CluwEyTApJBnhKNfW2y67bS5
 Ebtn351G4bE02VFGWDhCqP5kaZltwxA/cS7ho+0+b+YjPNDL7FQg6jEPclDQABX5ItJOJh4ZmLG
 BJ5jg3DG8T6ki0yLu7G3btehiKN7IflLMqlGXNHDakcgBbJbnTNYe3SteVxBq5mi3hT1sm6OoRK
 jK3O0OmmtxACXjZ8Xzg==
X-Proofpoint-ORIG-GUID: Qx1ePVn6FDj2ev0aVcAwQ7g0KpjBtxQw
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4285e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hI2I0KHUTEcuU6pApIIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Qx1ePVn6FDj2ev0aVcAwQ7g0KpjBtxQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_154908_326479_FBE4416B 
X-CRM114-Status: GOOD (  13.65  )
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

When MST becomes active, the initial HPD plug notification updates the
SST connector state to connected.

However, the subsequent SST connector detect path reports disconnected
while MST is enabled. This connected -> disconnected transition is then
observed by the polling logic and may result in an unnecessary hotplug
event.

Set the SST connector state to disconnected immediately after MST is
initialized so that the detect path does not introduce a transient
state change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4ee391cc7165..f8ca60d6d714 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
 		msm_dp_display_mst_init(dp);
 
-	if (dp->msm_dp_display.mst_active)
+	if (dp->msm_dp_display.mst_active) {
+		connector->status = connector_status_disconnected;
 		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+	}
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
