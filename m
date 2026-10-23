Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2378606A329
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TNQCqqtb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZV9+gwmO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poibAIZj;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1TaOtLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s/5MtMy7l37f3P6av6DLCIJ6CSi2FG96yFLIC+ILGkQ=; b=TNQCqqtbHTi8vwW0CoytZyZUUP
	BBV0HrfV4ydMj1uY2ZqAxWeP+cpCbqjEF3ZMkWdcP3pzpCpNoq7JTIjLU9Ut0QsjTwQmhNt4Golf1
	X388eU4jwzQxw6sD35OcP68CPw/s3Qc3S7iLtVHVGEqMw3AS9whBSEJ0lJvOAbiibN2DdVDa7Tviv
	DxtXgQ7e6kOriYCUad9v9GP1g8C38TxJJ6NNttkuJY5M0iIhBEtH0flCDblyjcU+9xKqReh6D/Alp
	lCHXtllHb1UuA3UKgpg+mg/tPxoZU+g+2/rJMS9WoopySKPBeM+Nhxeos4487aretxWBvaTea8MYi
	S6tHM4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVp-0000000GPO9-0wnA;
	Fri, 23 Oct 2026 13:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVd-0000000GP9N-3zjM
	for linux-amlogic@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=ZV9+gwmOV12f47P1Yg9Ik5+mlV
	QdO2yuUmVUonw9eaeprme/F7rOUA5ERAD1S7aerpw3sI0lDDlHrn1bHcrrzWWpy+1euh5jG44BIbQ
	n95s4sRsY4IN3EE1Mp/04G531bGLs5z4ztzugxDh1pcNNv96d2FBiWih5ZuwAEbWHz3URtKJMSX9p
	DLYc9r7P5PehoAQEjlzfxED3+sf+pFRFRUXqqR757V0NLy7rLkvMcv5/KrXurxAEU8GfvlTkt5nRw
	GC8thjQ8sPuhNziI/eRMF7iZBwWowy76pDqM5kU3gWi2GANqz2MLfvHqGLX4pYM0B2ykMmJyZItv+
	mVG/Yheg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVa-00000009j36-3v1Y
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAARXL3550434
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=poibAIZjMsIdwMDV
	XD0Nb6ZGIrSar5g+ftoe7oeKR4r/ureliRS+fwtmnawiJ124haBPlC8VnHayoU1N
	P+JeiFeN3xPm7y8+gcXnNENnHMJrr/xtUeyzGXMpTmEdMwTQhyr0d2aI3MmuXaAU
	NBtFKojVwK1FFS92X8KqitmvSbY2xcZfHPhMk16BrldUGmALTTXYs6HaPbP0d7en
	bPpD2ylFczswpJvRbbZv8s/LmSdSc+unVFBJbmR8A67mOlzTdIKgzne428Q+mtmJ
	1LAIpPPnbJm1Xq2ZRL0XDKy9G7vIYgbuRsZidUDN0PR4Pij8xI9FnjlwehYDDLcs
	gNs3Tg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbvw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a3c27c9bso17592126d6.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762832; x=1793367632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=L1TaOtLwKz1MDqpp68CuTgSDA2qUmCd6V/BIHJ9o4P+KoRNhw6yuOytG5QqS9h3HU0
         09FnYMMEcaT/ixuy4Lh8GnWAiwto1nSos1JWSYB40Mr6pW+wy1n0xtuvPudBH/FnEPSW
         taQdHFbpnpva/XlAN12+er2t6DxbHHuR9F6bK4fsRoad06HoTi44kRQowi5jHfIOhUvR
         WzkqaaTZMfRgQpwCBJgr8js/faygsRgYGHSTuetPA85fAI1EZ2BQoljdlCIifLXWzney
         2p6/Tv4J5EDjIPrxlCgRB+jH0QryBudlhwZNP/WvItJwQmjDUgh9CESAqtyy5Lh5aRi0
         8bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762832; x=1793367632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=Sie3IeUAGpjR4LZgtLlqrbCX6q+wwRf55wXQQ9fYOv0I4KoMO43PzglQ42ZYjDobuq
         nFiQ8KnhpniGp3tEmOkeRzwnWGHkH2+mYD5iZp4U8sstGh2fo7wk1N7sSdmQ9Bi/khzp
         UBl69Iwsphh2ciGo0avEJimZi1JBrTGbpInW4w1VfG7xdBzd7rspLSYFTGkg2yazFnx9
         yp051Hm7hPehhWd9+ST+bQDBOwZvtOjr8SJ4lrwycoqulAJlMrlUL9+PI4C2Wa93tT8J
         mmPBPHUqn5HGHfHCLQyv3YF5MhmF93EKhMMm2y+XdS+1QkbNLwstUtClCU/rlIS6Cmga
         KZwg==
X-Forwarded-Encrypted: i=1; AKwUvByyLHsu/ZzLzUgo4gGXbmhsaVSJLsxMBDXNX4lPUmbkXJyKMPR8ZFIZqYXb1ArHzr8CdPJw06BfLnwa6OWB@lists.infradead.org
X-Gm-Message-State: AFq9FYKJkZZGitQqnwcxQynqzlHS+gptu1McZ45tx5EpoHMCE72FieJT
	0S7gfHwKHbgGPxc3MoSJkKZjfMUthsj5f1WxMDies3htqJZENh0334sMZC8T4xc6eNTh3pxRjsz
	m4Jd8f6rPR+8y3kBvRPeXm1kIPk7lH1lPxTi6cWNVbu2SMljYATSlFP5kOkBmQ4AlRYUGj+A7ug
	==
X-Gm-Gg: AYBFou02AyCfuaW6jmFf5x+XptyLaT0nhvC7KKYfTpPzYh9/PeYnD4Og2BSOf0aQV4p
	92UmFHbVjxnSn1MoRb/jGUHXbxCQ8qWgkoKcU3Nr/KtpcYooQB908N/7bO1ZDmgBvPJyK4Jz1HX
	v90fpsC1s2kl4WXu2MgXPgyJpNRwGvEqS5KdzC+oxm/mpKu/R3slnS0ffOcDiWTj8eLYrl3EAIa
	wfHbBHI/HTH3H8t6GevUJ88RFWmDPWa+6sifdbBmBApDaK5h3W05/x17QeaFAcSgVY3N0SAuBV2
	wNk6pbe9JIB6FlauOFvRDfaqk468vHu4lfi4V+9Giv4tceAA8IPuZ3MFioT3XWZRIvOEX+O3wbU
	eZ5fGtsa9/fs8o8fB7PpTLHlyvRluXiHtxko4ACnzMGTsnXplKy+tYg3CIX6u8Moc0exEQc5JL7
	0licsjHtTGm9jb
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426443585a.35.1792762831909;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426438285a.35.1792762831367;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:48 +0300
Subject: [PATCH v7 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-hpd-irq-events-v7-8-57a3aea3f09e@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OscK9ARrM0xnQy9PIe02PuQJWITjFRTOxcw
 EIXvBeXIeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrAAKCRCLPIo+Aiko
 1SVnB/9eqhMlFfXEGL7sx5uXnIsBFG4ztodN0vHA/44YV7W7G1OooLgbsvOvIpeBP0kk5e5Xhco
 j1tEinkSJoggU0cxwS2Xc9lfcqEmcMxaUo+LdMPd6j4UyQPiOiKsO5lJfHqCDXACMtfwP3c5K77
 YVat0zINwIdZaWq981pjrXiShkMmW7ZQGmd8rt3No0CePmXgOdV+xTS/b79D3wsbb6tiSGUOg/3
 A9g26pbXGiiAGGY1vEM01YKIFcpTtym6NCRX66BMn4aN7mb99cUWHM4OWQDs4doSiyeDmJrMeKF
 MVvCWf8Tx3Bz7WNIMfMzZpHZlXLooV/h/qxj6hCGoxZBslSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Sqed9os6lJpUeekBPjNTDAM0tA9JSMif
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXyDcFs3Gn/y17
 1lHDZCzasdYI+cEWMppoo/mXrz19kHw+oos30NebIpcRJFiQ7DNLymrQJj/lP3o57r8GIT56st+
 2JWWmmOdrIgWzMtWlpSx4i/0zNvPv6g=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb63d1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX6wt6GxJqW83O
 bU7gszLDEtmVmU9HsworLNrpYcdAIzis4K1SwCPIxVCAL4uSunM4U8NjX8kqBrFMTZfQztet3OG
 cahPwnQSZAbITfVQyZL3hW5lbIEpsuHiwF6E4y416DOEHruKAbX2diRJEYGByIlPBgao2cQITw+
 y8BjKSp04T2dur09BJPYuACdhXdUCVerdhflv1CG5KBGhOJB8I5Hr3BKEBruIyl/o7j3jqMDmLY
 b/iD+yHs9hdIzbqlzFmAqAJaouhpVWAqbW4jnPRyYV8LcQt2gBMnW9m+1QdyUxfIMZrz+wuiYif
 T9ArZimtDAvt6h6V0e6fXj4gRPPww0BFpa1N6gU/nbLsk8QaFJrYcgl9CShte55IhPXDPzOuJAg
 ksyS0djN0c3A6VvT4D/2aXuUMAChDh550ILf8PfBbtWDH4x3Rm63hx+vyXQtrSffZGuomIDtUY/
 IRueIC80DJY6re3sJQw==
X-Proofpoint-ORIG-GUID: Sqed9os6lJpUeekBPjNTDAM0tA9JSMif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144035_329504_7F7502EF 
X-CRM114-Status: GOOD (  14.02  )
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
index 13c434f8d03a..c463b23c99d3 100644
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
