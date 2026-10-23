Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F460A6F4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FlzeNCni;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Z2s2725v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JMALdV9k;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ns24hJ51
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jjjRpw2uRUMrim5VWn/01h1dT0pNTB+apEtQkH1loLQ=; b=FlzeNCnia+Pk4RHziGc91I8ciF
	LLvSi+h/e7vy8tjZMsWKZIFtbW2/0kC30r+87+gtR6ePY0zfLd4QXFYn8B43sEzA8EcID9oHU1U7m
	4xhmXpsB8iJA+qUJQ16M+BkqElEF2QH8tBqQzwV+QNNbkqasWSzMxgNOxvy/ffcva5Tg/+nW8pkjU
	spaDTfbMsMaAl6a5bdg+4JtnTegpfcuCpFZlcT6EfC6KtRDwgLd0O0m4Wt3RzY+EBX21y7G4T0rEU
	jNbk1THxYlkiVyY+Gk6F2UYSDEU9jVe5LPdkBSRYguTZHRqgt+1k/mn7pkCrGx/rf9Q7ERi2dIeZY
	Dl4co8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVn-0000000GPK1-0uvC;
	Fri, 23 Oct 2026 13:40:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVa-0000000GP76-2LG4
	for linux-amlogic@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=Z2s2725vq/spGHyFMLE90Or379
	8cZvH/8hvcvQdEJ6ipecHPjxG4V8mEBaQV0/zlRVszUPYsSjq9vepVgoknmciq2f3InDM9zovF5KZ
	/sQgqlmjGCWLGD2Fp8TVUFa4GguL+H0gSPi2w9NOI6MvZHdJRHDgonDSCY7BRAF+BHcshIFie1yPt
	2HZjXDwvswg1QJBrD7Y7XF73uHaPxw2Q7TgG3wJmtfcGFlLxw6BhRSN+tjfHt5YJjl2uSW3sfS0ly
	tYcglLhXEUe8XJVmKJpmw8DlMkVAW7fktuROk8yp/8kWksjpy5W0Bp4m/n9qwhBS4dvq1rmqYPdF3
	2phtza4g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVV-00000009j03-3a5m
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZIh2509093
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=JMALdV9kc5ziw6Cr
	v1pelBRZuf+CmVaSaSKPbKYKN3oIzBylbQWTrGwg4c6O7Btl7djYMrK445UQYTy8
	YL8i7y6GVlg9i6OJgnIbUcV5GpW8nk5xNMMJIxq3JFXp4QzxmixsAMFQ9XVgbGwE
	WlPUBU+4XFDTstZZfa2D1njrVN08/PT2xRiptPLYfExvXjYMlD8au5WQJYy2kK9d
	IgkdRsLdxT1bs/0fyG+b+ziovRwYKI0a90SWVjPHSiUHmLEHVRn74eDKdjkxbDF8
	DY/ESO5q6pUgLSn5VcOmzHxhhRYmAGKMj3kMXri2DmIw610MR6TEGJ1XCITpgt9t
	i0NecA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbamc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so206395685a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762827; x=1793367627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=Ns24hJ51seyEDeti/krwH4tqmtH022DptbvL8mUEXS+vEjNQ8+/QQGaPwnsL+LaeYd
         q/Zj4PHMclUHjkkYds7c5YBJpi5q1LJLfDLkT6u+klmH4XCr6I3TCHjhaTUK8dsbm/cH
         CZH10QB8hmQ2b2nRBf9iDOnt560Jzz6tCGQGmnHjLxoQHUKlUEtxEsTxQhiIJw5ZbVHN
         djQPZ4fFEtkPgc8Bh1RMB0lqxVMvbLkL/lMuqx8oYFesxOKkoVT8buJU9gkFUwZYQNXi
         +zT0d6u5PxjhOSuVtTnZNa8g7U1MWV+Jc6qWcwAMgaAZBarFKTqaCZgdDJgqAmEpbH3X
         W7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762827; x=1793367627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=gtVkTUXeUKqLzShp0Wb108fSe9GeF4YrMTPl5hb7fLFiIhTYJxdxywTH/IUaMEyFOx
         MyDyWrQvInzzoS4/4HmBF/+FHmxq6ZFJ8HcuRtnMVG4g0ZZOMr79LfJd2/YGUG+qbXJ0
         eBAX1/HCP+US/jq4Zy++IJkCA/KyaBSUmjbe4ES5TtHa1clHYX6g42VIc4PyUSwHTCiI
         wCOpTi/VzzoAabd9kvBQmPKDhIfU+xUJpema+cs9Eokj1uiSS11H4tlmRR5mwp1qzpoi
         qB1rRaaxykhjdO6oPyQyNLbeAiJzISw58ZYjfrUt+3yyujOnrjZfAiLDI2HKq/jNxQlc
         ADow==
X-Forwarded-Encrypted: i=1; AKwUvBxqYifTcGMUnGu1rm4UdP7+uBLxzh50gO1MObm8BsoJm0uRv4HA1BnHiUCNpexhJ01VsbwHxiaylPs9Sx29@lists.infradead.org
X-Gm-Message-State: AFq9FYIl2MmmwsU+YjMPmf/pKlnQvXYOhYJE1WB5ll0hNamevBTV8F7M
	tFo7lSqzWI2/Mf4XfZoUxxhN+YZH1b7TQdnEU6jERZapQK7ZxMeZ1uHR19JoXNmOnLoDsV65OVY
	r4pQZwmxjOd9rJZsCJzOY+awesGllFQCpGSeKNVJPOsEPpN7BJ1VE8envlMDOkD8VBK2KhTpnnA
	==
X-Gm-Gg: AYBFou1rGAXJUCFODI0AA8K4MH6mp3r9xhaBCPFO5aiKv6LNC3TEDGH1ZfbWk/wL7V2
	iGAenPaZ4dVWmFbMBFDG+wH4szABIZ1TNHQ+6e/xCHpEWThk4eD7o24w+DsrUntD1jTF8I8rlCh
	G5wFUetK0mWhRhVGRIVkoQXv3nuRNN3mqhqH+wMvoVSJexUDFlHvz/iUeEqWF9FRrdUmctGd2h+
	HqNXaQwqSLYKXyctRjcDnerNx2Rpxmukc6ZxiVKND3D8fiJ2x+G2Sr87urueiUj4kv7C1mSrz/z
	hXrEURjq0rKS0qUh8C5OWpaLADjQfglIXfXoRiBboRD6LhKuxVFxZ/pZVJ0vgvI5dhOFbJ9aBRQ
	qWyx5CJiFioxXI6FuTM1/VBCppcOSsTT3lUE9xCm8HICPMg9jijPLHU/LSSGylQzAF5r0MkBwxB
	CoIKqbzHJSvKUo
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id af79cd13be357-93f6f656ccemr406095685a.13.1792762826782;
        Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id af79cd13be357-93f6f656ccemr406089485a.13.1792762826136;
        Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:46 +0300
Subject: [PATCH v7 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OqJOhixgIg9VA7IzyAGhBk6OzyCFXXMBbpS
 bq6XeHn7UCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqgAKCRCLPIo+Aiko
 1aCEB/wJ8fNt4uH886JgFUulIe0+m2ySGRzn3AiPyxGkRwEFYwZVhXVPrSSDHoMW3xC8CJGxMA6
 akzlQzOCMNnGmyfRVQv9VC3GYfTRdB5YcrzCxwLohO/6nK3VVONFWTC3xq0BuFYq2X9EtQkr4Cf
 ZULvB5WBskmMM3/ZGAShDmPFWGG7/klJ1gV4ogm6oGdvEmwJym12Q7UbD0MQ0GXc+xhOFWKF6yS
 62bTAq0+FVAk84ja4eSe2YqJ+Sa2fVijVHzaIBWlSehdvaxYUFhCXhPzO2rsODtqnDYQujolgve
 S/I0avJ4Q91feNdGGesDsgv2uP3Y0LhYqJ3peVj6mP/fqS4p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX7UPpCnVb3vqo
 WESnzW2boPRXmwFTUrvkTtkke0QiMXZKkAAJBJVcyRjPwOlYBHslCXguJxYYmEQOzWikpCwuzKz
 sEa4bExXqyo1hjQSh6LPDYP9EEU/Yp9brSwueMg0hqYm57MYKr5UTtofLFgZWMx6jlBl89B5SMu
 DqdOO+P+hRpStUcvVQQD+z4nNzSZo+JFH5gFKjed75CK17jY7ajnfxTrpAEWc7XoGUoAuaPi0T1
 TjAvGMWWZZcXR0Ib3qKwnJsW7apwLpf2r+l4BqjTJje8nCvoH6Ro1CKuzXBZobAnmFo8TvA8sYv
 bzf//r0IFsOej1RScEIAMBEWUaS1NmR8xzoaHrcB99B9Q1JXClcOCfYJ/aij9O9/TWEW9pqJbpV
 6vzdMy3AK/aPIXreVMJ7cIHnnaZuy2B1fZWz182lWSl1GwH+I+lizKVbEVVteThYQMPa89ISFTm
 uq19G+AcrIVOXI/XGkg==
X-Proofpoint-ORIG-GUID: m7N0mb38G_VC13ppoe31Xcmism7b8o7C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX/SkRFCMbEklD
 SSHJpIIFpeYbdE7DCy4SuS2XVTc5hKUnXFDebWu9M0DyicSw65rBx+mPpNe/5eO+FNz3QgV/QxS
 Aye5Xdgozcz7B58oztqaR6hxyKQ1x2g=
X-Proofpoint-GUID: m7N0mb38G_VC13ppoe31Xcmism7b8o7C
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb63cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144030_495337_10C348FC 
X-CRM114-Status: GOOD (  13.32  )
X-Spam-Score: -0.9 (/)
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

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
