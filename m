Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9890606A328
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Octm6Cxh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ktqAMAjl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsNOjnzh;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgYoijCQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ICisXo/KvkTUGbKTpoftKGmIM5jc18otTqMrIT9SecA=; b=Octm6CxhsXskiXwUEEd4KN0233
	ZlA7BwWXS5pxTsFvglvCitg74reNuXKF5CmxV0dSZPXUYZV5jXjTn4rQvptLdwsQXxlsiwsKCWJJx
	BIvb332YHJrCOqRX0dDezI35+lKazeu77sG0timk7NbLrhzEQW7aGC0uEL7vnPukOUc1D98H2RbyW
	oO50lWi7crSsOYb8Zl6hz0b9U65GdKiQyjMlNzVnhjj9ICrRkmWNS6BwQC3P4yt2qQQSnKoRY13K5
	fxMQvXE6+tWGCKd1xVSjRHSCoiTlWMrg0WRNw+ZHZp8s8ta9A3v9AtQg8si0WczgZ2/DCJ3HBpPGZ
	3mUa2+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFWG-0000000GPVd-2dGZ;
	Fri, 23 Oct 2026 13:41:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVe-0000000GP9Y-0dGS
	for linux-amlogic@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=ktqAMAjlIVgdXv9TqckzFvD+Qs
	PbSxzIw0DOOKLa9iPHNhBQbAvblldq8zpwDWOhq3Ye+FIVMqZCo3ldBbTdEH+nt9wlOn2Ha02WMzo
	4XTHS1kWKH7Gowz0wwdByjoRdJ7Fq31CTw3Dtml8RiblUcbYIf2v6HAGduY7bR1+CuifhbX7W6VjL
	vAX6WzsYuKESKbw8eaFBUQK2O2XPC4ECPwG9xHnWmBW1B374CwAqJ6MAGR6Hn27jXGWwF1aqP53E7
	fXm05qNIZLQse0TeAS+yf/iqsd+4VU27HeHf38z7f7TbAir5kwa4u0jddb3SJGN/emI3FJlrq1Ohy
	7RGRSDcQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVY-00000009j1f-2lq2
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAlDS3822721
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=LsNOjnzhHmpI0HxE
	nmFuUTzkJLu/98q00u4qb23HjKq+tKafv2HeEDd1K0DYwl5bhWcLfJ5XLnDt+l69
	g36ow5iMAVN6JSCM3ois7y3ThM7GeLbEYuGtLrZzDokC3OeTTRmoeM9CnZVtFV5E
	x/NvEawygVOAv1Hn/4V5VS6TZsopR6z037hKPZ8mk0EWE+1KHScNTEe4JZNeX4Za
	1kE7cmnzFYzTWlYJ967gGvwK73SxrNCmIKAG2EJDmdXVlB/DyW60RPwhvglM+ehd
	/FKzjh01J+Hekscbspq3FMPyhJhEvQczy3xHyDfAiLfEc1bVCkKOpPTl6OBEGyQt
	Z9NXbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0a0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so195177885a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762830; x=1793367630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=KgYoijCQ7QYz8yBufpzKeuZWmWcXsfy9rPSh5YbKBfJUvx6HlOotxdqLSJlMH3juTo
         M0OMEYKRDVb3GCyZY3kLyRusdP4/j+f+lt51rGHs8IYrfix0PAeuGszuFu9fNXrwWn1z
         uuJq+I7e31t3InnkX2SJkWpMU1Kp8xvTDDLDN/1msSjNDCl9lCf3J2pEzrgUuhC42820
         uoD2c+i8EIF99+Xfi6F6BB10tXubPBNJNjc1K5adjxycDfwsbafTaMduY41A9oqiB5R9
         q3fJfWwJJcwWrgbKQS1RNGKOuFUCHQinuDF1lZl2U4Y3nXI/u0Qk3MD++V/lXemubhzp
         jdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762830; x=1793367630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=yoqDwj6k1Dkf5qfzcaIK+/FTZvUj9RtfxDOB2HP99v6gwz2k3rYmmYLlvKySlZkHAH
         Qu+YkpUuNWZJM1LhC24xp/YW3MDWkzGiqiLeydYYVkBFFfpc7hYG/qL0c4vOtsf9IqVJ
         5Bn1dxbdnwtHtdBX+6ACvI3MbJ3rcnjB8rAqvLhjW+VSBkKuf31SO8ZjLzbGE+PjTSUC
         4S96bvtFNwQDQ9p6Dtd4Hbe1J2zeRgeHl4bXVkxOWo4I6y3Va+zzXoKQWu9ZVTSQOzWu
         g0hRAsqFppK8oibW1ZwKcKL6+qQovGYCUZGvr18L7/Bo0v7oMTX+1NJXmz4tUDteZx3v
         IbtA==
X-Forwarded-Encrypted: i=1; AKwUvBwSR3lkWlI952m+DYvui7PoebeRvDzAr5mzeX12M8KaG/HS7vZLjxKI7WJkp80XJ6AtXhpnAWv6FTbE7v2j@lists.infradead.org
X-Gm-Message-State: AFq9FYK3JG/pKYMfIWqBrE5Ac7tmLrOyayihcdyIPE1aQqJUQ10CVAPm
	dM3XzDVi0aLnlXrlfJnPgSwVukVR9RSBNfOuvos4LVEoXP3b1TZoMaxzlEwZHbzTv9qS8MkUrCj
	VPSSO/RnYZHZZK1Bw/EpTBI7IdqXsqvh26yeSwzndweAHFDNKuOpFEVPvEVH8vIHcSGdHkt7+CQ
	==
X-Gm-Gg: AYBFou1/droqsSNpWwMN1LNZDMNiH4Vc71k2Cy0i6xZdFYQ9smhvTe0l5UX09Bq16Wu
	VtN1UvF4ZrPvfPUdt9olob1+a4mvV23scWLmXDPCfd1vIWZvth8KVFWBmZtZ3XS48wa3SYxsby6
	qnmRHvkIMjhQkSgzf7ERmp2NzCMT2cgMTrXHh0vlC6UptsRZIERkWoVZ0Gnbcn7KQSPuNzJiHUF
	HaSiehWNvF7vHsf3K3ofGT+azyuktLFJqOOY0J+l7Tgej8wOmIRCRLIW4dGRdtwnmM/jCaAEETQ
	hJ485emhVHK3Ye/wtZky5Njke+IHHfHOPU4oHYb2yOuM+bHZbQGZwR8GPafSr3YY68LFUbdSfyG
	ik/h6o9xf/qmOQv9Nb+06BOupMy2rZ7f3w6xry+OjHC9Rb6DwHtXMieY5zWaoPmhpekGDjNJq9P
	DVZa+c7Lu6zKlX
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421697185a.23.1792762829642;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421689885a.23.1792762829034;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:47 +0300
Subject: [PATCH v7 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
 USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-hpd-irq-events-v7-7-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD1bcqfARXRbU99XE94wZup/nUa58ME0mMv2ZOe59d4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OrDd0EyJ1jWpTktyh/YviRqeZnCe3IPoq/M
 O+YMt54/c6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqwAKCRCLPIo+Aiko
 1WJYB/40Z6evC5Ipq89yGzct7EekA+0duvkUZtm+g1ylN/ggbSzRNf3+1Vp1XjESsa7DpGJXjuQ
 1TE1gkvjp/LWB7CdZVfNXQ4VJwKQO7S3AMHr4xZ2n2jz26QfE1hWqucZwG/W/hmjd9ONC3cAxNf
 RGqMtZxdKdoG3Wgh5qr2rwYcetHNF3gAlKltgufERllw2nCIHO4M8ozozvoAR3wUHvqxyrk7r9D
 L+d/94J20rCRatmubWZkT85Lvjcn3o/DjkXGgBtxEaK+0RGRy0vSEaPZtJ9iJ6PLKtwHzDQy1mt
 2uo3JmQCl+lhoF7eF4BhjoxoqqIqJ8kLhgE/1jN4110PGmDH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5ENAAb5zS5bfx_kbQubStkNW-OscCgOC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXy+L+p1tGJuBo
 DRlKxP46/6NNNBTrHvVSQkYrLzjKsMsQZgAZ0zoziuVwDTMQZid1OWZE78BlAFwQbEsrMzq6Npw
 suQtLiHgsOOHwt3Qgst/ey0ZGCi7RAs=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb63ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5ENAAb5zS5bfx_kbQubStkNW-OscCgOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXz3Y4cqyus5oO
 EasrY8C8MfpCrJdzg11jsOqDM2SeP/NvRyVwxT8n6LoHvr1J9q6TC6wkXrNItFJQqgxte45zJOR
 boKBqB4S6JS7ikecp63Jl7zfGAR+Mz3Rw6VvAimpsWm8ensdhwb1CBAGwUucxMbNqJKM7gtzzIk
 Jgz6XZNSDCeBouD6IADOeAEBkcB4rIjyiHBtlcov6hJ7eUDrUglBTkgj7hLsGZwylgOjZYLvS1E
 0r6FbbOk9vcbgCA7ktZVXBdCLY+H3f1YTVAYNkzRj09RVRcT4gHqV9jNLGLaeQ1CdUxIv2iRcO4
 u/4YMx38aoD0UdLRN9CJQS3+2eRkU2OSuy8NV7GthMXQhP29mRanILyq7fe5dQ26ebd8sypK136
 CJ/8X2tR9gn3W2ODTOgaUC91rDoIWldjIMx8CslXjw5aKwffKa3T40UMLRgia74doB73LnssRXs
 dz6S3ZIeRY1SDcRnBuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144033_171015_7ABF03A6 
X-CRM114-Status: GOOD (  15.05  )
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..771c8b0744ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD)
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
