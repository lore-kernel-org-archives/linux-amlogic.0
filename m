Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97934606A31E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J+OqAZAR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OD9t8pJy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y14TJ8rP;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ7GVeSC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s/5MtMy7l37f3P6av6DLCIJ6CSi2FG96yFLIC+ILGkQ=; b=J+OqAZARXU/beK8hdiORhW8PIS
	LJ2yqEcIy1umDqh9ghMqzeMTzQKdoWHFMmh47eWtpf5XGEG1QdVaCch+PlE1oLg/56HaR3Qc0LWEv
	mvlik8UrFyjf7Jvsn4Z4+EpbxyolkJsx3Y529d0djtyTQEtb3SC8mzxHYIX9IixbEfPQ90MqBTxoN
	X40kbzj4XLs531s+r7WitOIWy13MwKckCeya8YJp+EOlgbw+JIDmBX9GgCsRQrSaFd1M688DYB+Qs
	ylZJte9guPoE8W+q3UY0ZwIPT0+FW8JpI3jJULyml6trbqHlwEeBHAxn2QChpYlfAs7RMSKemPok3
	/T0MTd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkL-0000000HGXU-0wwN;
	Sat, 24 Oct 2026 00:36:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkB-0000000HGP8-3Y95
	for linux-amlogic@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=OD9t8pJyVv0uhpq3LxnpzM8fHn
	lQqUdxrEMLjjSwafuZODy17o8i7XTAJ1z2jRMqMjmNdfC9QMuSXWbma1zFlmFFFczaHRq3upHLJXq
	eC2ChQoHpEfkYfHYqgJ8t1Ju+DVRjZMYJE+RUv4JuxytCjes/MYqhQe3X0suq8iaTKKfjyHoUcpsR
	xEqgYi22ovJ14tUKg+Ob5ZucweoBiYwsGv/CQxhBX6n1+NIbJ94sc5Zf5NgU67WIoTuHmu2B73FbY
	pGXjMRseP/MpIgtTJ9HOmOu8g3gKjUh5FkQIbuxD270hiip8GP1c8do7Qx6sjibRzOTn4o4hDCY9v
	tv6D+1vQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk5-0000000AvPL-0ShF
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvKNc2963832
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=Y14TJ8rPPToVsOWN
	sBACVXmoasoTJ1BEh5WlrsTucN8+1iRREOVjNrczmobmXxX5oiHYgEGzAQr1iMyM
	u5Nmjq7B2l7gEH3SnQGc/rouMMU5Q23+5/UE0ZDYEwq/XfSNGVYHXWOKX+fISFHO
	6W211gF2HF2lAK6Bq48wtp/cS0JAVlUuak8V7GJ2ouXGjS5/uyLvqZWVgdu3UfhZ
	a0uyVvXiWUfsftHz14XyjlthFB505NTFdrw0dmbMhYjclSTC9VC2Gkk/5RUisOde
	/VquLCadl8Ru2Bli0RFKlPMToXYWy2PjslbH4K3u9hm5C8dQrp7Lv9DEDD3Xhi1r
	oNfPaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc9hr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:36:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso250261185a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802171; x=1793406971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=VZ7GVeSCU2xC7zjWuUOirGT2n4OQ0ZoY/+xTr1D9ScqlynB0Q3ctkCu+dfFmfwz4SZ
         gITzFdqiba3R2JiPHeyPXmoWfCzhqrbXiSsyG3Q4lsxqGEQvzAmQcfBPaUewb0YDUNc8
         Fpe8RnMV1WIspTzyJZAIBdRy/yOcUJNeJkfJtQMIrNNXJAHqZ+3FYM2X/8zHoHPJvObn
         NejY+vAbm6YuVx3JGbUAiPe3G6s028grZa82pNG6DoeOqdTF4mU7CKF3M4mlwk67HtPY
         eFe09jng2/NJPWhsFN12/L+faY8lZTVumAWwUuwal89AeXbiVAOJDofzQBTzXU7en1Nr
         chJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802171; x=1793406971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=dt5xioSdL1m81QOL0bmHcVnT/7s0w+wGcLEsy4/k2MJO3j8rFKrgMSblyo4WfBM6lK
         KLN0I3hCGss0dCQWG3TihF8mXSrYI8+0JPJAT8xE/4o4qgAY2cnZUuV0oneVKaUUl6t5
         pCQ03Cz0Um62pYmChULmt4w7CXRL5x9RnGrCoOJV88nsjJ1SQ8TUPmjp6JMvh3eLq9M7
         D/gbChpjSgVF/0RmJAFA21p7avisrTngjTOmTqiLc691Qe0brsP+LJ3/cnmsYYN2dzIK
         f56loS3mVxktuuvRXNmuiWVrZ+lfLiE7Akekm9zvLwMlHH/suKwuNRoL1FdSexwIatW5
         0baw==
X-Forwarded-Encrypted: i=1; AKwUvBwrrtZgzKlw4pSzh7EC5tHSffCI3xeqYrHn8OZC5CFpyU53zMwXS94qfDtQSPD599LKcTQgvjKTBIhuodDS@lists.infradead.org
X-Gm-Message-State: AFq9FYJYiaFrMvjjaQkY/lH5byxjWnceoex6iPFc20tklU6WBr+8qEks
	biJzbvGUmzNPSUS5mfRL4qnypRuuQxD5GnE56n/J41fwf46XnUOu+zpn3Q01T2FIhdeJtyLF5mZ
	Z8F/HCHOMuRW9R9NGacfNZ6jEEqcIas/zHWLZ/AAqB/X5vx0eizCZMeRKhClMlHHajnqg7548Ag
	==
X-Gm-Gg: AYBFou0VgPzl7k90euawU3aIRzxLWVSuZNL9ER1Qelmc11vpKBbR+ZgEA5LbREafF0o
	m9iSwQUO/s1XVdK7RQTPZXT5rTVCToLnID/u7mpDacTBTVoCMSdjzxW8UgYeLcf7yrWIAJs8Ijr
	3pKQI+UYM4Pgn3B2+ak6Rp6PyYXTK21cQ+KBFK5uM7u1nf3msUhRflGKi3HFR/dEuCm1XF8Nij1
	o+jGp6CvZIQvwEeIZQqwR40UgIi2Zy8HZQTXXk3GGeSvA5LCoYfRFPCBlMby9hktOvwE6lB1V9p
	DC/4Kwa65dJ/8lwAOfJniJKUNfE9arFCtQ8qkkhectOpEwnz8NgWxuA9QZa06iiuV+11EkLfrVH
	Cpe7IQ+ild309/j9bQHFVn0mUrsz0ziXO56UD7MVfUf38N7T/loQvnz8Vy8XiZIHQ7m2FPwZrwz
	VWgT9OQF/YKv8c
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id af79cd13be357-940ef92acd1mr116217585a.58.1792802170908;
        Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id af79cd13be357-940ef92acd1mr116214485a.58.1792802170444;
        Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:24 +0300
Subject: [PATCH v8 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9btvyFFnqxLn4beuyZo1X0kPkzxT7j+V+WX3wPT+pKeT
 63zd1PsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEMprY/zt1hWckG0xdONPL
 Z4HYo4JG+c0LTsazGwSXB27eVK1/9LVac+vheX7Tem0dWZwOtG+6t0xbSqdF6d2X1sKZ/Amhk8/
 0dJ+MtVES2CfvLHK4ZLXWvR97hDoFdjh75+zr6Xx7PKvhlZjVSa1jYtYf8t+cY+K7kJVi0GZo4/
 GyvP/hoZdb1nVNjXbazZJ4XWun5mYxn+4sxd1i207MkZ4uEGnY9zRlpWON3CNz1Tn2mub5kkIlA
 o43lQRXPf4kK18/OX7r2Tvz1Fo44l2aMs/t1rHi+jY7PC3KQOT4xIiNk1LqeTZYbo/iEkvxenuw
 9vZhBqnHvLdO8a1UV4h5WZP/IWeV5vHwc5dC7jRK5ewHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX3x07AEDeKGxj
 uXfRfWOvXJt1KxxlW9pYIoIEQBrA2mRkTh26jcrQdCO0lTCjkmR5fFVeF/j/QvQudBIMbn+Q0kF
 w0qWb8iVJWXLluUfrIkvC//lXMmMH+M8pW2pxHo/lEpzBXyV8XgNYL9UHHTb0kLVHQsSLiH7bZe
 3PV6JgnL6WzmMysAf2whaShYDWYQaPGBlReYTbVjeg8NDx+lnqZHYuYDXX9SH2tkackEw9H7+Ao
 t5D0H4SXm98x0st27jz0RbHdDIZJBdFOHj89YRKsGZeVegecIccp1iMxIEWFytcJNglZmYkEich
 QT0y9VQ0GKcIzKKuvpzCGctjKifVWDLESoXTGpjDhbPmG27BMjDkCg9rZ/UsrKpt1D+ymYYNIWN
 P0gItfx6z0Vq2/9AcJuZgm6o59UVI+yGk928qrF/8isDTrpFNkPoYXX4jZqC1nsvN6h65L17BAt
 q1etbt2EZwZvpYd3CFA==
X-Proofpoint-GUID: 9FsYB8gzDoksJ87BzgnoHGf6LfSxVkns
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adbfd7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9FsYB8gzDoksJ87BzgnoHGf6LfSxVkns
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX06rFs9DWBhrD
 A+b/8Q2mGiZPiuzFWarZzNER9jjB2lj4ACucMejOOlno/qx6QrEhBX4HHuZJjfjF+Jbz+G0/Lzx
 iSyhiI/zY4kfpLuyHOemwXHcyglzpRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013615_428101_60E5D87A 
X-CRM114-Status: GOOD (  14.01  )
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
