Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39327606A33E
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lfX7VV27;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P31PHVwR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dciuWjoS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Uxee68LaZMaGLCHcD4KzlUPRJfmiZay4qe+KOD5LUc=; b=lfX7VV27XfqvHt9UZR3SQDVsUe
	Cx9ZtaPxsvgEpMdY/2i5j59rFtOVCYjNzIpHGwop7G6hQkp7Ztbhi6UA5e1nymFrYeCgogT84HTtI
	sMYCLcreG8kCrFpYDCgXc5Pv60eoK6jNEWeDo448fmTuruGoCnd+H2ihL1YyoFV+iHUYksnASlySp
	S3BdyB2i9tmfRRQ/LLryM/b/TPPllYdFRzmr9/zt5YhhBEVx7cHlQTmoaUvdpJ7dC053lk4hgN6kM
	wVW4+6xjSfNxwlxeulz4W0GiwgDIUTzQZUTw/VnwQRI6Any5H6WO2gDsdqRNjGIhrCf55ggqtkOCV
	hbNamf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVD-0000000GOpT-1k9U;
	Fri, 23 Oct 2026 13:40:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFV9-0000000GOoZ-2z3s
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUh01948388
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=P31PHVwRYQccQJp1
	YfPvdd/Rx+B9YnicsQlLcEXxmsSxZ5n6IA8SKCfiUcq9orWx17kPS0yJvrS0lzLj
	2EX0QTOCKKkoayAYomTYY+fZ/9CtG/5WmfJrAF/KU1RomeuJy/K+fbQM99ABgj8s
	gtDvq4PdhITMMgp+uUG+t/kvtsmaW6jdPKzsziZwPf5IjHG6pdrLgT5yzY0UM/Gn
	CDgbXdTbS+gtI1bAuKbg3jZ1l5Gi9CD461QuXeR5I5SRQg9ebbFbTdxsS0l87zh6
	us3JRiSasCicKfsM3QHkARmdF8aivcn7xp4ugtbTDZQenRiZkLsuLXM6xXRdv6JL
	V7lUQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtuwun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so169671585a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762806; x=1793367606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=dciuWjoS9zEgpuTMSCkw8FS4g0apkgPRsZvMoU29nAOavVNTmQPMW9+0/N2JtDb6I3
         +74jX2GtHsagoS0jVcqOL8adEKHFPp4ev9wZ/CMbRcSJcsqj+jeKQHONtcWxWK4MzBlc
         KqIYo1zeYcAmagL5W6Zig1MAH9cZfAfj+j8PRlzfbWBghrOuEhGwp0yBOvhiBcE/3h4K
         lME866QTNqlbvQBUA1Tysa5dhYuilLK/TP0iVj44RRXPyT+B2qzrogIBiBZn+r2RyLZw
         bAStHV0fmMVWxMkJVe80iL34g/bh16rFkvwlfvXSUPDlW28Qmx1QgwJdALCeDoHfkXop
         BBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762806; x=1793367606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=pfPXWAHUmbUCuCp78g8ccve7EQ9f5HD8QucXupVWlBdxT5PCEJ1Hzsdsja7FtHWxlT
         VDyOTbZQqpB6PKe6ymA/UiAlSitpXogOLjvhHI8XGM+CO58tBL9dXiY0YPTIOrnBBDWl
         l664diY0iBrJXCtDBOIK1mrdHwVyAJOcpsm3OnlfYUgQf2ffrqn9syTI9rd6TutpMbqs
         wgOUD9gcdJBKtJlnBY9hVTqSfa/uCyHO91I4peT9Ig/qrJWWD81DrQDXl078DYOtVBfb
         doow/ZhZzYNAaMPFtLuxFxm+BnscqTUwOmyWa66ygHGpiBQZ3R3wfyYEIbLCRqxToG6q
         EhNA==
X-Forwarded-Encrypted: i=1; AKwUvBwu6ggRZdtljYYn+tWo/jUeyrUOHn9V261MhDSggIfqCtt3882s3QIInBsYYgV93upnU08VYU0YhDyAqF8p@lists.infradead.org
X-Gm-Message-State: AFq9FYJu191IOMyT3dSIV3eiIAaunqQgSvXV5e5zUMLiwhz2ha4Q/uij
	RWKNllKsL36ugP6UmJScjcWSuHx+FSZ+k/Ti3i/Am0GCysS16ZHaBEBn2sBrYvi6z2UB618a210
	ndsLCDAp6e56vQVQfCYPsTmgnD6h2Wr3mV4tf8DssNm8CjBnIMYUf9+yKUxsTDNQB+BVj+dcTIQ
	==
X-Gm-Gg: AYBFou1AWLod3Tdprm8NdevQoj8dr0XQSkMN7cngfvNKc1+hr8LJmU6xBV6+qkP0jiT
	yon08a/1DpCCNBBilaGFItNRWtQNwUM9OzfZyoc91VYLhlPypsTHuaRc4m/0eHsDIs69pAon5QT
	2NnDNvatdTyvdCSSGul3IAkZxm6ePERm7dUYVZwvE0bvd6tMNrpK6Vnr6fkOeLC8IiIGw3scYNW
	oJGeh71d2oryeBhKYMq0bLWvZ2fqF3QHq73acVlH8+LkEdSSSIyfOLLcPMxcold7o/Qg0LbePIx
	3hd0tIak0xMjfBPzwekrIrmmjD0ZDDZFYyMXveWtw8VtseDBdxQL/yp2ohjjlteimU6CBINrb6t
	PpJbIkCwrfmwmunCc+Y7AMEXy4A3axZaQFrYDFAYtpMEDpoVvqnp3xatmWsoVOHww1wzO8cCg9P
	GRq2jXP8Dhpc9p
X-Received: by 2002:a05:620a:2853:b0:93e:7ddb:7b99 with SMTP id af79cd13be357-93f6f58a84dmr402122585a.3.1792762806016;
        Fri, 23 Oct 2026 06:40:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93e:7ddb:7b99 with SMTP id af79cd13be357-93f6f58a84dmr402118285a.3.1792762805414;
        Fri, 23 Oct 2026 06:40:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:41 +0300
Subject: [PATCH v7 1/9] drm/connector: report out-of-band IRQ_HPD events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-hpd-irq-events-v7-1-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=saKTuWGNmEwpJovWRzupqEzCaC/rm4ThXYLAzUmpGxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OlyhiT0RO9IWSdSg1DRyrcjCs61eY4Y2GSK
 lHqYSLDYzuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpQAKCRCLPIo+Aiko
 1VLdCAClXvDTBPnhRvI1lJ9bpuggop2DWVbS3MG8bSQOkxNuUpinFzUppZ/zhOAVB0niRaRzdj0
 kOfrG054ct0eGQkog9cVyySdnKEtOt4tMQCUeclGNKSMvgKfftnQFDWAGyfvGAuarqnNP4i6Dmh
 36AHtDqAGYMzPNu2DQm+1kkW+bFNcd7dWD3AasJ0mDTSm47YteRkuZpUm29T7M2YT7jDpWmanTg
 aOCAvJrs+vvkDxhwqVbVFwWOaoAziNZL/3tNIKn8vu+i7+sc0qaDOEvE6QqIvCrhC28yLbOuQsP
 RAjC+3uqQk0VB2Aaw3AmiYEuh9yU3Z5jWhBBeEKh3zOXFVVe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb63b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IejCAnqV6A546-KFDggA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 53iQVB0E9FCMOWQY21gRBza-Vhn0Vz1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX55xfi1RS2B4P
 gmCpxciA2fN3UALd1F05HfzvwaiHV90l7GIIbwaMLi3DD7GRO7cFrrrArt7mdHdmpRrZro+vsP2
 9iwkztCiX3KZK5EKKCxiAMcnmXA5GzDqF3TGjd4qXQRg7LJFY8hEdV6Bk/KkfjI6g+yv0lerke8
 SChXI8u3GRZlkPLMPja7592MWputIBfCYDPbvLNrMzjtRIeg/bvfnyfpjD8t8b5TH1SfJE6e+9+
 2u4OsN0GZXNUtPpSdN5nzdrorWFDw+UOw+IcwIUhRMOif0kzmQTlC+T+FDYkJ9sGQis7zrCpvNs
 SzlmXxpIVBwopPw/eDHfhkAcQnPq8dhwDKilotlrxTbFWWCeSMClsNMMqHVbPynyFlWrP2QadVk
 62Js8RG6h8FO5zh4L3pH+dvo2MzFwilFHpjP/M+kHmFihKp3g3U623h7PAELrCIgTRUjOBVmfbO
 z+YD9RSNrzDbZppp6Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXxNE5JBr0XTwa
 4rS3KHIcnaEezjcCNS/fCX2UmgoQwZg0/OmGSdiNHZwannbhqo7GSk1td2N8EHkbMN759RZozLL
 5LmOcdfoMb6uP8Afo3eknDsA6ZwqHBU=
X-Proofpoint-ORIG-GUID: 53iQVB0E9FCMOWQY21gRBza-Vhn0Vz1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064007_758048_D515A8AF 
X-CRM114-Status: GOOD (  22.01  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 drivers/usb/typec/altmodes/displayport.c | 25 ++++++++++++++++---------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..e3c8181df6bd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3821,20 +3821,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
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
 
@@ -3847,7 +3851,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 /**
  * drm_connector_get_color_format - Return connector color format of @conn_state
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd887ab..2106074417d6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    hpd ? connector_status_connected :
+						  connector_status_disconnected,
+					    (hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+							       DRM_CONNECTOR_NO_EXTRA_STATUS);
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
+					    connector_status_connected,
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
+							    connector_status_disconnected,
+							    DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -844,8 +850,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_disconnected,
+					    DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..4f65c97a89ae 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -92,6 +92,22 @@ enum drm_connector_status {
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
@@ -2848,8 +2864,9 @@ drm_connector_hdmi_scrambler_supported(const struct drm_connector *connector)
 		connector->hdmi.funcs->supported_hdmi_ver >= HDMI_VERSION_2_0;
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
