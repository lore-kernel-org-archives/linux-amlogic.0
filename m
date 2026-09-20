Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631FEC982D8
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YX8Enzdeh9rVujr2XMfAzijVO/VCzlDkKKfaoIy9KVk=; b=sCSOSfsZWzLfg4
	atEjOPX4U9FEUpjiGrmgBg901zC0IY77MH49pfoerqve8x+tA3H3tZ5C43Hawq50q/BGD+z+XtGGK
	TODBDjI+HX8j6fqCVSgBi0wRTMXzsFvzI1NMxbllUBPa2I+M2Krtd/lHwp8cRH5XiwA5dCIn2KyWj
	IC13rbJdhu7utEBvJYkGUbnyrnGTazpfg/6S5XMS90x6pny/Z5ruRc+htQW7lEDyLUgKbH1niJb0T
	NMbNN+rk9dT8OWh2LeCLhM/Mtj7HsdpjTpkXAXPJM7CSiL/p97xHKfOc8zPNSPqfuxzCDjRaYWq+j
	tmrEOQrW1SwS5KsUinXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J3G-00000000189-29sa;
	Sun, 20 Sep 2026 15:01:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J31-000000000wM-1ONH
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:01:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo2Er2287725
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=; b=i1mNjvbuWlpROKjp
	tl2Av4keFL0peAw2HFTxnLXUiLxn8mKQvgtfq0/h+3+3d4Vk7pFERuCXG/uQ5BaR
	A7zU0GdXT3bwjEWGr1pcGqXLKYpRZ+GcdkH2MPABg+Rx0ZY7J4Wg1q0PDEcyC8EG
	JK1kh8QGfXlaJsP4r4grrDyDDt5iqDUKm5ocneMQEcB/aEZyHpkG9SIWRs0X0BrH
	jAIi7ZuegxB9XjW6DheaqyiS1zT2Hev2RCKzur0xNLPd5FimQ8vZMRhPvh3DpB7n
	DXuoQYT7n1P67fAEfwlpe/j53r763hxQ3wr0MOm28pLM3mTDCrg8qVf2qaCnDjmM
	m6IGpg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnujh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:01:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78a686d205cso1973692137.0
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916501; x=1790521301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=;
        b=WKphO+bN9t9AulAxLSNH36FlA4i3IRACHMoxVNZ3XH9fNRHCrD/js056Z1aDx2pfOV
         q4a4LL+PDWYdZNFySAvg3IQdt+Gzyllyc2u+vbbW38BSI4tI6w8yA2d7nO2ADL/gBz4Y
         dDIxAzxTzCwEHMjZngCyMmUCW6a+XAVmc2vJJ7Kiv2lCmkOwL95/x3Rhx40pAcJHTxwP
         GJTIJj35Hjm6Njp8cce4een+bT3gyBVQOrmoq11lq6RLeWban0yQfHTeSIRHA8WkvrpN
         KXEYxiMNQCc7Ex9g82257xHK4NmKVmUmJg5D8w+3YEjQU1Bn0E1KW9GmMtSyYzdmC/KP
         VlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916501; x=1790521301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=;
        b=ovYVSX/Lfq6Ybav6bKpydhdgRRVp/Rn3ty6k/0sjWevani4YKPJlg98X7XBvsbYms1
         nf3HBK1pGCVAe9Wf7uj0tLkTpojyMm9/aZ9td9/H7TnEz0TU+zYveASoRMGvWhmYw9DA
         3jjnh+J0VizRzxYjHrLgLH+7wXMYJzscznmYfQ/H3i0CWXEAlDDXO9donbTxsgTTiFdr
         m7uQcOJonpVgfW0/aAeQiimkDlSsrHGzHZhsWbgz9iky+AyOKBAOuCVKo5tHXbKxUya2
         Rnnqhwk6SdTxltQaM0SlSKMzfYa0n8eFlV0YSdcTCoijvWGsDMrH3udaanKvKJkKwvjp
         2wYA==
X-Forwarded-Encrypted: i=1; AKwUvBxC61enjcUMuCXw1V2pKx8tVs+SHXHsOvo0DaVRceVL+JdvOj2bex+YdcL3XIlO9b8Ljj5rHMZa65lNr7GS@lists.infradead.org
X-Gm-Message-State: AFuF++k4M8lndM4Y1BL1oIysBq8wtM8nZL8zQV8pj024QqgbZZL8p76n
	Kbpp089CNFb1Pg8CPiVdjzJCLkvjNfKMsw4EJKrJKBKs6wjup5ghzwaEkxYRb5XZD/iUJIheYRx
	K0bvIB0InUrYUaMqnAcPT8Tc/hMDiAxkIoW8VdC8DjkfXk65nfLf9Bn2Ka9qFLHvOCoHvC82FYA
	==
X-Gm-Gg: AYBFou3b1l2/Epc4X6R9/Qt7ge6w/PX1WV8ftAC6rQCm+ouxE1RF/0iXUspBKIz1VW1
	OY4+WmvB+6R0g8IDjMkQ9qV7bvtbs65DlrlYyb+gz5hPDhU4ig/iRrlq7Hec0VqG4zINP+e80JJ
	jXTqbdIN1KlZjwKnV0WjQkV0oaE+WxwiZLA3lvwJVI59YOxL7mkc9xl5ESSWA3HKW+eUP9Gg3bx
	dexWeZMWXvwtH0oKheRM4ky53TJ6hO9boa0WB6hKTcjB7xPGl4vJ8MJZmgsdYDTmwqdKzogz+/6
	o8EJ9M+Tzw/nYiOigQwcnuD4F8QnG85wey4LI8p2UKxflqX70hoqAFA3E4G9KbpURWRcdyyl1BC
	4hTLgo5m6nuPIE7cDWLpq6/j/S2lFYMY/jU9SCtQ0ChmmS8p+tyqm0m5S+BFxEUoeswGbMlncct
	r9gD3NqJuMq4lz
X-Received: by 2002:a05:6102:8027:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7a55c28ccbemr3816305137.15.1789916501327;
        Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
X-Received: by 2002:a05:6102:8027:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7a55c28ccbemr3816245137.15.1789916500850;
        Sun, 20 Sep 2026 08:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:29 +0300
Subject: [PATCH v5 4/8] drm/bridge: pass extra events to the HPD callback
MIME-Version: 1.0
Message-Id: <20260920-hpd-irq-events-v5-4-ff1de0090c72@oss.qualcomm.com>
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
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5637;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W8+dSW1VgSZF8q215iEdhBX5ykoFxgbgfDkuRRpiXGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHeWln0CRT8ndJl7DO8mpwH8QQf9pokn6b4
 h6oSogFWHuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1QdFB/0dCly5ef1TT2JBJq7MbiOMvtgxWTs7fwcZmOHeIrtXQCDrDLrdsdkK9cUFFX8uIU/kxxe
 PFQMDQFdm4FVA3BGIf2LVEWspNgrvGSJaYE9cWglW7QkdD9YjP2Bogl/6qY53ZUQ9B0lsvyH3Tx
 c4A75hrKrpk2+hRKKqziW8w3HwY2lJwSJDDf7C9FTfrZ3oSUw+HZPI7HXBB3qrTS87hbdJA+/e+
 eOCHYDy8ju9wCEgcMI174ZpLPOr0wDE3aV2qONKItsWfZvG3LxkV92cledQd8HWrN5vwke/Cjn/
 5SNKSrKGv4g1wOJWZzq8p51qwhA3fFhQ7fiKRb67FwKIq8f8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaff556 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=x0urvBsf9yKnxdYdiaoA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX2cZTx4t4IHRS
 /rTaEthm3IA0NLMIgKhKP46cJlPDq042gVC/YexI/a0InxLzrk9By9O6MSa9yQLjFpNBJvNWosp
 pI172PK5dQjDIoRGZs9HRFRlC7cGask=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3W47asSxaPlM
 949C8W4elebxOEBZJC37jgcxZkWlsMs28s+UWIeSTTk2mz+4PpIfs0V7v6xHW8jQQlwvsAPZWKn
 j5JujDWzZEUecqadDWBuUvNWe80T54fP/1f6fahXQph9uxBqvrMlgpcrRXIaob99HVEABA0vZ0c
 1RExR/EpJrjNKoG7vXJe3kJpOubSlpWbSGe0RNUdgUGW7G4TnC2/tDJfQV3iw00X97pkSe5YzNC
 XnoA5iLu9H0rL4sl81RqDN9VDJ9BWQH2CDNS4lK5Eus2lS5jXkmWYOIAS3jJhnsV5VDTTNVtaU+
 1dOKvTKc0dBTm0R30UEk0b7ghqtEaUj1nbouCoRCJ3PsdZfv9sKN5zl58ZQTnd2XwLyX2jOW7dx
 5Xa7gQMPhB3T1iGltS5WFkXjHxqLKZvyuulVRX4UthqON9BOmMkfJdtf1zCHDXt8B48FXQaj7Mx
 wB6dgcIEWG9amu9XLsA==
X-Proofpoint-ORIG-GUID: BzenQG9ntjzaSSeqlXZ77BcuWes0gAI9
X-Proofpoint-GUID: BzenQG9ntjzaSSeqlXZ77BcuWes0gAI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_080143_572599_DC965A90 
X-CRM114-Status: GOOD (  16.11  )
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

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 5 +++--
 include/drm/drm_bridge.h                       | 6 ++++--
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a51567d19550..f8aa2dd1cde7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -171,9 +171,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 58927e0d0191..34871e5b0328 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1549,7 +1549,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1625,7 +1626,7 @@ void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d64a0ab02c90..ed9f77a2597a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1158,7 +1158,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1467,7 +1468,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
