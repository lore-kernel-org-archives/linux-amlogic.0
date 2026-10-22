Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46860A262F
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UVXBO68v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AcdbpqMD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huq6+EdL;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpYkHZTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ws0USur868OH6c+pBzl0ShEWmAiIwq+ZBdfhRBIJlQ8=; b=UVXBO68vqpgoyTQOVrYJ/EI3WB
	2QxtcblnuLeJMdTJV5DrJhyHBcKv2idJt0C91QWZlBSc437p6JaWAV7Ec3MVHODkmfGkqDfw5JFUb
	E1fUlVTIkKOlXbV3S0g+oWtfz2UnnB/5/a/P3sDwsPLnb4Xobmr5nlZ/D88JOGkVVvcog9KhxVkoH
	wh0XKC9GfgU1lBpk78bR6iSL/oylt3+BMtEq/W3HvGPqNaQgB2yFzUaV0TgUqH0qLOyqAitcbMErk
	TvzPRy5M2O1XSM1ewSThuo1sqKMKJ1XGgkl183qA0kIY8sWSsoJPHl0eMaKPcyh8Uk4EqjVmOWaZv
	3AnPbInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqg-0000000EBpd-1pN2;
	Thu, 22 Oct 2026 13:28:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqV-0000000EBbu-3svy
	for linux-amlogic@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=AcdbpqMD1SCTzp4DrHowH14iVV
	Q1frPmVQ0il7T/1z41bWB/PcaLpLgnwyn/JqB5dFYItO0e1cdWogyh+ofWAIp6iBUHcwod7FGPnjY
	Yt8skDLr98s4i/7r/iujY2m+aFvwJXzQnerz82lhWmg7AyjR94un0MM9uK38rQbirQn9bxb/NdwWw
	AVATvX6Z+1CBXEY8RAnLfvNZ/N97Gs5rq152pRH1iJYmeuwlRndo0PRE7EKsIS7ohjWkspyQgTYR2
	MRb2zRPoBWOaHx4nx0q9zg1VGi/Ra8TW2f6NEHifRIJD6FMpOBhlCW5rEcKNgEXHi6Y9m9SugPqaY
	U9qv4ZJw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqS-00000007BkR-2Jjl
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0XvC3923220
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=huq6+EdLHIG2IKh9
	fq+pBx8cZXxAlw6MNLQsBsBq/skklFtFTkH9mSCKnIther6jO1a/HCONVvYjnXN2
	QaDCt6zjurulTvzpcbiYaCRzfYZvR4c1oCAyDzlgxAPTxrJtmDUH2olZjhE0ztaT
	V6TNw4uaZ2X3NoG8Qp5GL6OFRwhDGX+7Z7cqCx/WnzXwzLURb4i7N2oPXwzAmGZg
	E4j7rsqN+RkR7XbGOp/uhX4utIY8PH1+EJ5AY8tegI2Q3Knpq+Leq6P/5u6+b1RX
	VdNA7E5J1CPiPvBlJK+4LT9ybakIaQavIzrJIYYj/wYjlKKRvoggcIiE3kj/agu4
	izt4BA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bkqu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:28:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so318097185a.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675714; x=1793280514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=UpYkHZTFxfVRGQmHZSRuFJsoFnKFPI4fmPHzNM2MIcVuoaXjdREeLPASYH9yLfWT0+
         eb0VR2VM1ltD+9O1duMag4dX4tNvAd8Vwdym7wxG0crmADa0/HDqI/tVlK4qwmaJ0D/R
         f1lRI5AEqM+MMxYz0sC+inRFOdAPaEmWhDGgbvJptr4QL6rvhZ6TVRFOTlZOeUeXZOy8
         T8aJWTIQfkukTST2LRHSMOcK9mVkgAB4dI1JwBX/X44SHhEhLX7sxEveZUjGFqGC1LoX
         Ok1a4iAJkI66fkqN/QHEgoa4II9mFBfPWofZuoP+BkP7/g8fpcO4x0Be9QCTPClZ4xXt
         zQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675714; x=1793280514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=F3r45xaD3Hjig63pIv55tTvzwARZNr9zUkFgNLEMmPJCTenzDDxKTzgNHPzg3Rt2oF
         oUQQ2VoRYwD2+o4OPNDheKBm2Ut5FPifaPTc4SAr2/UiS30DhUS8enHuWUKniK2+LANw
         psvDmwXtfOwhhexWGFVi8Y217EQ2GWIAjcXms6baP5dpceHhocI4mEzmDCGqWrgRhwM5
         Ks93+5rvgukL/g+hRLq/RJoKqMOydnITGYNugVZYBE7YRYuNJ43uRkwm1xxe8Eduy3uO
         qlOBT94BaW/w6/CDeaPmgN6oHYkVZ4vwjw7Txpql5PF/rwffc8NvDAAqigOw7UWyUmq2
         ewgw==
X-Forwarded-Encrypted: i=1; AKwUvBwq/5ZGmyQONmscwW9fBv+PgITkeY6PALHlmEvGwK4ISQtyzxduxPxf6AUHIkVBFD+J3Clb+a8kLsXFRyrA@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/XLkhKvNtVr3JZ21Dv6MC/q39hxQB9RKhQyDuV+OOlMhCjuVg
	UtAJRf9iUXNOG9NYsUM7umgIPXv9qJ7edqNaziRvzrNpOELRZfqh7fLYFHa6JOv5ypETydMYHk7
	f7MsVuw9751JW7Up3D3Nq5QJxSBbcJKjg3JGVXQwQoYOFeNDJ64UQt6WL5801wrJqvH0biSbDUQ
	==
X-Gm-Gg: AYBFou2S1SHT7ZIGQF2dQFNAB3V5sIvweyt/6WULCAZwmejZV0NNZdGqX/m6y+S9GuW
	0Kn/dllE3kdBdQGW2HZFOIfozMcTFynzVFgShvKCG+gs3JBLfe36mAFRP4fnMtJCmFpPEz1rj5r
	USDTbZtgntPUmMT3kYXmU9BSXeAIqVm15jFVs+K04PW5UXhSA/QWpixcsW5Og+O+gFCtyuQpnn3
	F5B9Z6NuGwFQBWNAuGugcn3BBWBoUtxTgQ334PV+Wd45MShsYeN9vcsYQAZlcgIKgeFmQy7uEGp
	RpLcT2A9iTpfyyz8wJwi3+mk09yV1VFIY0KVu2IMcLMNbjZVYo3TrB7prgNQZWNjLm49U/73x3i
	ulCxtyT7p8nLmTTPYIKs0SJvPHiytidbQSxvPhZtDWR9ONhs/nFrIIG95AHk60G+me7FdMDdVeo
	4qg3zwJNgNuxAN
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860585985a.4.1792675714478;
        Thu, 22 Oct 2026 06:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860577785a.4.1792675713861;
        Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:04 +0300
Subject: [PATCH v6 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-hpd-irq-events-v6-9-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9oUOGyoZ/Lo9msFFhzc2wcKn57bx/TRaPi0
 NP7H+uDIseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPaAAKCRCLPIo+Aiko
 1Qn/CACG1K4eJynq5qB7lVOT6butQGOdb0Uhg1y7eGfXBUIIGj1DRv6ecFzKRRK0bqqp6pcC5ci
 EIrQitRmOJrdtYWSEpurrdG1g8G+KPLJUhVNQEysupJKk1UtdeTjjfLKzFo0433HZaIXhfDpj3N
 K3momphg+N2wrPSqKOypSco4Z/DK1vaIXXYy+0UWhUxrrYMXstFcdV6IsFrEXkcVoNcdL9pxLls
 IJxAjrrVY16uL/yTOwggUx66Zvog/fgGXfehXKJwmzjWKCAkhWW369L1wPJ5HGNAbqCPvQESo/X
 5Wj+blNVgBLSYe62VO2WdSqoGusXFkACUWYMezRkF7KbPzw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX0GELPS3MoIU4
 tFd5DPru8YHQ06kofMrs/vZDbQQ5UQITJo/s0QbFrl7cBXGIQjKRSuMgeNlFAVQpoEj3Mwe8l+0
 WBu/J9eadmvjLoG8chVvg9QrGFOqquHb+NLT/+oJr2sNwlNePMBEkIbtDi/Xa3koDeOjxlAzdcl
 9YH+SdgoTqZuS63KobJl1KhUfaAFH+/xgZIBmA8pxmDI6Q8C2aNIjszNszPpXvnz4n4Mwf4ZBun
 BhHj3hrz3RW9dprKZt5GjoI7Q04bd8mlW51OdBtKeghsmQ6dQb+i8VBlFz0m6e2reFlTwWfiWmR
 GkwNHHAnO8qBPmEyljyTpF8Pnw4+EqcB6XHH0tQNGAb+GT2uu9+YsMU1PyJuGTsbxIJeOBf2A1v
 IU7VCwOgeOsdkJ/jDGaVW4dcJJisTA==
X-Proofpoint-GUID: OMYmc3CYEV9O0S_y6tvLhgpvhFRvnwUv
X-Proofpoint-ORIG-GUID: OMYmc3CYEV9O0S_y6tvLhgpvhFRvnwUv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX04Dm5uAv4AfA
 gs5Mt4C/EbJAChfiN8fMdFvljQwIjqhJ2noeqxAi8ycUEzahrKqgQMYcDvtc3VnTKq0IVcoPT0i
 EOQZ8iCUJKBiGZm1OtyXouRALpEijZo=
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ada0f83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142836_988117_445CAB0B 
X-CRM114-Status: GOOD (  13.24  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
