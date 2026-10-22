Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058D60A2626
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jkq8XyW/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Tye8kwt3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uo/c6Wxg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s/5MtMy7l37f3P6av6DLCIJ6CSi2FG96yFLIC+ILGkQ=; b=jkq8XyW/pv0IzeRzplgc3vS3yr
	/KYeGNBZpwp8jj++qtAl9Vx4UXWj4H97JbdnR+XMC0ln2f8W4BWRQ5kXcSNA9/eV6kdB5UN2CMFg4
	apxXyDQ5u2qbGMDM4qbXiRISbHGtZtt4z5PNrRvjKxBL8bInoWJXCKkYNWREUSL6t/2b8vejeJ2ep
	fJlqGh7CYS+aT/vaStBKWPp9Qqt77VZ3RDCCd2UPEkGfAcWznYSqIPwxSxR8OXYBXf77jnVjHV6WV
	T0MrWY+nMnOOTXZgt/nPAskY1faDcJ8Z0xEKVG2e4CaX2hoDIrlL+0NuhSBHQ2SrfIbuwDfpFqqqm
	Js6JsE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqf-0000000EBoM-3dyn;
	Thu, 22 Oct 2026 13:28:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqU-0000000EBZA-1QVH
	for linux-amlogic@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=Tye8kwt34+z2CWo6lcISkpfr7q
	NrBQtWqEX/fGidwhI1LHGvtxnKLWWycGCEGdUXHqH53BsMrWHcfFJyHo/Rr0WylLaUGNwy82mbdh8
	NWGCqbEEbxZOEssf39oskUSb1Fja6sAJzgpDflBX6tPfpeXs1J32pUsw081KaF6LyoVAUeMVJonl2
	lbAxqRfHDWSbIAXNtQFnzKAn5auFjcG55rNCg8GjR3U0udbtmNgr2p0sphOUlJpvp2093Znhj4xGS
	imSyQYVzUPG/h7CviRC/Pua2UxhUVSqKYVd2bpKpuKqilldI811V+m/ksn4hS0oweRhjQrBb0SzPq
	ad5ol5Ug==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqQ-00000007Bis-3Akh
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MChdXA221223
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=lDZZTSrsyHzIsGBU
	PNHByJxzu03sVuEFd7YCa9N4r/dTQMKGmX5g6LTrvGZKfxSVdSkvQnawX0Enj2Zs
	nW8hDHxxVDkC7W8oK0W1IHzhDvyLhFvjbe/s/UmIPaEd4W/t1M2uOgmhipw2JXJQ
	twptPeIl5am4ilbMTLfAM41gLjjifhlKDZadM8+uw/8xXnssNP9BAb+54fS+/KC1
	oem4zKn3O3B57IvTePSecSpKhSbe07Y9FAURIXt2xn0Qu16IASAjB6qBhOACCJ6k
	xqnKWxsW6B575ZHIaEg/r/xyVHw1NaOTQSGgi+OkzIbX3aXI9wYliFoMn7FIobxh
	nKHhCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cbrnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:28:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so354505385a.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675713; x=1793280513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=Uo/c6Wxg9iRM3WErSdn1GJW7IZ4ZAU+w/X1bcc7uVRJDzT2ngjEiQD/rhkfhfFTO/H
         Fy1IYRHKXVQYGTaHpWEX9RK38K36i4CGSolRVdSp1yuhslL+BcC6i/LiFqIDTREACyXq
         /BN/3xfpryaw4MFBAbvfzjlJcQXob2a2G2wG1DdgBmnPyZ2lonYu0jeZ/QDCn/VPMO8a
         6fgvNtv8eNpOFGfZBKoq+6QUPvFZMRvOpOy3NaExHlSs6iT9Owx47xWu2C0yq0eRwlTJ
         8nRxG3h34GpY4dz2Esukv4EzD8GcQIpYuQOlexAUCn8WZIllYEfE+fBInO+zvUijgx/1
         OaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675713; x=1793280513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=swM9uy4+H7y7BloWf7ZkK+8GU6rzRb5vX/U/wWybL4zDEI62NRlpVu0RW0mY/dBUvY
         vETb3GUq7I3aKSy2BRL+sJAimaEQwVvf2SDkojxRJMISd/ZYvyC1qs9de5licsJUdg3O
         D/AoFvSpLy1i2mOkkUOKNfslHaUvDlZx7YBU+/Iac4iLjkn2VbZgThKupaoIOqh9LMZZ
         l0ibNOSKVV3iihUAot+3Yqx9KPZGAA/95WT+OHxQkuJlo8UbpUoF3fhhRIBnCGFQo+Q8
         tf+i+n3W+AvGyfpCOKnJObuu2mi6v1bD+vtPTpI9d7GHQHMSp9qQyLa9fUbSnpbJu6Vk
         oHyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6CD7cXCtNT/c36pi+moyCmQfaXpNxVlXBKqTYYqd5LP2mzvSw4ad7MYNP6mViijNmIxATiOWN3TXz/8yd@lists.infradead.org
X-Gm-Message-State: AFq9FYIl3o1oUNipJBMpqEZoIdxn+370b6R1ZVIr2xmaiv/xEv7apeQC
	pb0zPb4IRot1k5PD9GnK2Nvrmx9zbgCq7S3wdzOP81MMMWf3SMWELMHvFUsKZx4uzbdk9xYhUfS
	yLlKzi9NdIxbFyBaTxz3F5D51NR0yQvRc3o0sZH7XfqF/eNLkf5YO9Mybhg0rcqDuV22UoSP9vQ
	==
X-Gm-Gg: AYBFou0xEHFqLLyXbAuLj3dxBfFMYxeTrg7MWRGVu2sX0fDQRj3+Lg3r0sNBraJ3OPo
	y8UG68rM52KguUd0rAVyc2N6xaOPavkm3qUmhPLbUanaMGHvdwFMtwCwmdkES3KhHK+Uye3X0Ne
	NU13/wPk203IiOIgU3MjQ7lUlKew5o3xPYDKYvEDlaYf11mp5XVC+KnpeY094zJFX1fN9ogUv7x
	QqUzZq+xoNiuRs/AFdWVXGpfO8vaERhQ6LaPrrR6eI9WVw9Lv87hvBlAzMQEdFQx9YJbtEHFlqx
	dicaJdqdqIjUyv1JpoYwuUmsRXrGGBaJ0rzPZTVb5CYf1rnrp4Ng48T/VpmwqKaL9TuJW8y9y6V
	9iDw5MzUDaLdA/uguZuqnW+zDE26yg3jBJ6ubs+orv8iqeIGOOdHLULllwpInOdErykRaQa3ARp
	09uq640JNvsg2M
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905864585a.25.1792675712597;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905861085a.25.1792675712171;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:03 +0300
Subject: [PATCH v6 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9n9zhrOEK/rx5gX2YWvMmc8jjptMWLaOtO8
 lGcaMlPGN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZwAKCRCLPIo+Aiko
 1edwB/9YWfc2EM5dtSwi1Jbu3T4rlHmDDCXXx/nWp1kfXy0H2CCngN1eB6ZYMcxQtWmtadH7jVn
 o1ni7leB3t6qsyNfhfjzVK9bH5DxI8ykunhBwboni1mwzg//NnCAkchdPC0bT/n15WxKQCLyNcm
 Z/qS/EDw2gQ2yLhg3dHrpwM8RPmJ9kVwIvpF7K7Y2gbF5wAGLrBYa0LvtwCVS35/K/RvlHejThf
 6VdCYsYBJHHa9HS8h99g1E0vihe8vNmkSPwrHgdocyqB1rPFA1Xs2dD22Vyh1WLnDJ4N/9m0iag
 EISm7/cQe+/sZsMYSOeTi+FTCVIt+wn8wBzeI+jPBp4Kl2KP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXwXNfa5ZIhZIK
 zd0++9O6UcxWEVQDiwifAmlxq3Urwbg2WxaAQ5rTLd1/USjMdgmJIoJDq+QFhdD4thIk/DQwVYl
 Rm48HpjQX7ezlpGXd6qcyzBwWclRlWI=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada0f81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 17XiVVoVD8qrjr1TWJ7DBGrTmPo64QDy
X-Proofpoint-ORIG-GUID: 17XiVVoVD8qrjr1TWJ7DBGrTmPo64QDy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX5oH3Zkb8gh8b
 h5ynzzHhA5VA6xtB9rIrI5Klkkj6X7zi0Hmyu3cbpR8uWQvrJmr8Gl/2QeZI9PWRNxRW9JUW01S
 RYHjwL1HbSgxFXey3vEkiQdGPfksJXpQV/NT3URHJkrFbu0hCBOG8+B5+cfo9mgFU+/SptHxa3h
 1ToubQnAR/iYEy2VqcfVbSHv3uvrFezkuB8kwbwK4kxFnDphcjLM4TMtCimRUTC2rn8S2JoMhaV
 xs8mtcfzvZjQLnO33tZ5GT9nZlM23OMUCnPVzrOAXuQ6ylWkvIkwKkHF8IdOsCt4lgQi9XFclv0
 aJqx660QFQhS5IIT/wAVdDEKTFoQMeeocxB8V/HYXnSmjGTIoIW1nYhF3XLmL6CmfuJ75RwIqRJ
 Fbzp+263w+d1QqioIqI+nMSkQHe77Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142835_412391_EC0A9D82 
X-CRM114-Status: GOOD (  14.31  )
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
