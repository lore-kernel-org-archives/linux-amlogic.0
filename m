Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3848C60A4AD6
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y2nkz6gv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EB6cXTqP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dc+eivA+;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFUfXueH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PW9fTb7VoT2KKi8mw8o70Pd8qIEIW4j7WkcD9jDR4K0=; b=y2nkz6gvyBVJSi6NhPKq28ImNs
	FYMJ8i28xxRIb6PQZKCJQna5lZScuaFOmfHAxCnKijUNt4VXiaBXpleKFIC+D0jDxYYSjf6eHuOFU
	hjOFbiJCWrjDS4r0DJS9VmpfPhTa57gNeexc+gTizTVcsFsP4ClW+lkSy2q4AboBHI1KHypt1a2Fg
	eT+KKTFdQtQKwfRn9vBSIVOj9Ha5F9L3W27E+JGQJC+PgrMEhIvIky5nymre4ch/GmpeIC2Pu/GZn
	IedP/5+89WOhAzgbMs8R46yDeRc67QnjvISiMln1ZJVJv6scyF/Ss1o4c4f+bPfuMKzoPr6heZ87j
	oJwmnSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqe-0000000EBlt-3LQx;
	Thu, 22 Oct 2026 13:28:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqS-0000000EBVS-2YE2
	for linux-amlogic@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=; b=EB6cXTqPs+AamojT9pwunATpfw
	vImVC5gJn/FsPOWxoDG9AtIUZ04UG3kc5QwevsFXvWIRVDF33aT9gteP9JniRuhdUGyjtty4WNO7m
	gTbfY3IVNke08jKnvavIPSKoM65l1bKui3vfe/W4MTHiLwu5CqqZy8leZJej58NR8WOba9jOtt3g/
	QMZx0ntqiQkHotoo6cGHb7e2H66G0+MBUsQrvGh1/F5KTbhjnbva4/vupPvbaWzQljxukvlimFrDX
	oSdRAk3Bc4ix9AkPHe5K1jSg3/4P9rMFd+nIHWtZStSeNpIMHodmHNPtl472DSI8l73tvixaRFyPa
	p8yAQdLw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqN-00000007Bhe-17sS
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MCPr8o3807647
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=; b=Dc+eivA+pgTCnNFS
	6pVZLbl1NJnTyKBqT6sSNMddhGpD0Dc7mqO9LK94GtJFXhwm/ybn6vNC7ItTEyKM
	7yKHHE+qDLLfPGzjXOTdXST7YuSckfkZRY6i0mmnKD6HqchOer3iP0vm7x+kkeQP
	mpfMiVrSJAz4Y6s8UF4jM2C7dZ3tSMEUL4YTa+UkAvHgqNgyC7eTLODjpJ28+vWJ
	PkPJwnaTBeo8PvFpOR10A5hbLotVucaFV6/tqcqeLj01L7sfZFIRG6xGZvxgaW81
	Vx/1g70Y7Ip+4ExijYT7TyqrwO8dDUiR88XdFfL1qfHpyvfIJP25gEiiCtBNOdo1
	WSN1jA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93auqkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:28:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so413655385a.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675707; x=1793280507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=MFUfXueHHe3PeFKW6rZiqdTUsWqrPOSTx73zb23vCb1P8nsgHNnmGhxHyJkGyx3/MT
         E8FIkPFpOQYBvvOjr44UGbPbQ2s3eocJCi2yE5FfxpjNJ7PJoNzIL8IWKsOOANOyrbxF
         rnKdvguhbeIjOik173xLjGKQUepJ3FcvjeO6vG3HfMIih9YEgmKWRpEHvV695eckrBeQ
         U5MWBeB1nQKl2YB7SBcxgwq1XVsWAYzkC8oGfuaL1wc/fb3WCGh1+FWiX4gDrKNrGWih
         q/wvK5sWB1x6j48gv/6hGgMjYqJnxNkYCPmoNFUIoE2/ODvryMxhWQ9+1cegfUN1HmXy
         8qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675707; x=1793280507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=09jVXjBwNEyxBhmGVSpXCNvn96xpRrAMJr9b6+OSQkyTfRWVJi2It67yOiFfvFMc22
         tHvFjtzroggdYecL16He0ljLNh+gkKLdMEhf/IfeTqETo2pPaRKicKSDLYTzpBTgro7f
         YguNT4WqCvUFP0CfP+jx0jqMph95eWRfsbQXQMlW847at4Td1CYzByH+PqncVKB1mC+W
         J1xdKe+Q5Y5RhHbTpZMSOsbK9x4vN9u/bkO8FTHYq6AJsOnJ5xOk9R8zxtOOzLF7xfWh
         nIk4+npwGc3cYPxxc5M6GAFmTZbUIIhNDpnoNKRO0ZKQ9qMOxs65u+spF5uE5PkJQAuW
         efLw==
X-Forwarded-Encrypted: i=1; AKwUvBwCT8ZwCSb5o6V7JVYvryMDQjm+g2kZ5FPp6ezfTy29tZlHB+Ss2cnrhJ8IPe7oLl8bMBh/dzXPOHgvcHvS@lists.infradead.org
X-Gm-Message-State: AFq9FYJVukElIT9TBLVTPCmuxJO5Ov67XvS+bVsL4y1rJLHd/NQN3B0V
	NtIYqykGFIqFEhC+YqQxr9FAKN/KPIEUNE0L9tclBPYJUF/1jqvXG+VLGx+veV/bKn5ydewaBh3
	xcyaqsXp/7UzgTfRjXNWrcghN5CAK1GWX95474E7Z9fRtELRaTgbVQ231+BMkxocC4rRb1lbc7A
	==
X-Gm-Gg: AYBFou2568NCw3oqvUqaHu/77PDRzHWPpBwYiyfAKT8BzXZ1qiJ6l5PIpunpuwua65I
	6mJbxFjeMYYHXkbVwr7yqUQiO36yvyUf6TfSw1u+VUqsZc0ofyNNRYkIQpgkhGm65ExIpUIbvzH
	ykvqvBGGfNmH58woTjlJ8rtilCSEfdstNjZ9tzEbUjy+CCEw+VJZ2gPzQxlA40CxAoVFQin5YA/
	aH0NQg7s+QFpo56eWrwK1B+J+K+dj+Gz+XsUiSprufONr4dcaCM8ZtHsHwd/C4h8jtymHaez0m2
	PPF35CyRQ4oVhaOtjSw0saNH7lIO33/9ASK24xYrGrnSAdQs4Tp1uHGE88uYx2KyXNsOFUlXpve
	rujLGLu1FmpOnjjfqRj5N1JMGcDJS/+9tLpoRDPzr0K0v3GtzZx0t/VL7YkqCcXZhiy5yj1mXab
	7ehmimJBd3awW5
X-Received: by 2002:a05:620a:45a2:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f5803fa9dmr909487085a.83.1792675705461;
        Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f5803fa9dmr909480185a.83.1792675704780;
        Thu, 22 Oct 2026 06:28:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:59 +0300
Subject: [PATCH v6 4/9] drm/bridge: pass extra events to the HPD callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-hpd-irq-events-v6-4-337ea3ddaa62@oss.qualcomm.com>
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
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8438;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TKKw/H3SXfDs3PoOXuNmfA50Zj1t8JLh5+PJ27RzJ3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9l4MGN3+pOxp2wWkk8jSBOcIdcisazLhG+c
 8y9sv79MiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZQAKCRCLPIo+Aiko
 1XJ2B/4+vL/dxLSshuFXSsXPFtrDWqWXVr/EKb/pzizx0rqVug4K/foeUZ1orqKfbh4RFqYNpPU
 FLkHabaJJy0246JZUiGqd5gYPrDU/FAsmd2H2TW1mnMKnp1nFzewurWPrZohH5/2WJ9WJEcPVlw
 HM4533qMiJQhy36NLUvFvu9tUvYSJOhmyTj/Krj0f3327BCe7pE1bDBBugOQlJn12CgMAz0I7Gd
 0b11C89GUdey2f+MK/rhvU1h10xJlOi/lUtEVs0A8UAlR73xnYR9Y9S48gCtpsamr2Bg8b2Mnn/
 HhLXomeadRSNx/KpffF4B7D7NBCc2ex3V2kDBiZBw7CvNaEF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX5eHDs59U9UoI
 XS0UOTLbJYGvGasOsg0x9ah9+ZPJ6HHpDcycwBAarFs0Z8hKyxJHu9rtkoYwCL9xmKOwf/AM+vh
 hJeq1zimiOFRaBRDZmqHZjZJZICYQ2/d7pEtd6FAKC8fWlYO17rT4XcjXjJLjTfLevUEBCHuvIB
 JcmXIJ2+6YvYboJFx2oQvXysQLZaOWFdRWGy8IA6Deq17oVMN79p2hLKIjqyPFNOzA+C9rO0bpO
 LGZ0D/ZADMssYDgUfqui33TRy1ZMbAJo53sFFC0RaWHS1Rp0hie6CP984K0EpeVdGaNaNCv/Her
 nUQqHmi+ZcvhLfJnyKajpC+rS+KLkZTrWUZ7ZcSr9QNfowOSt2HNwtZziKvXh3+5XyTtFQXPgfI
 pYF/tfssEG9DtgtoKP6vNGhf500FwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX8mg9bq1JA9PE
 9vXOR9Df0o7752Nx+1yLjxYEclQHQgl+JcYbkC/Fw07lCL90UKYqee1VKttLPs7N7XpmBlfLjzk
 /MWAKtBMLSpcqmTCMfsLTV0f2AO/dYU=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada0f7b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KfJoKOGgR5IJitVib78A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: wKM8lQSXhoGFMKhhQynsGjSWsC6hKvIY
X-Proofpoint-ORIG-GUID: wKM8lQSXhoGFMKhhQynsGjSWsC6hKvIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142833_972521_A98138DE 
X-CRM114-Status: GOOD (  19.97  )
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

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
 7 files changed, 47 insertions(+), 18 deletions(-)

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
index 1b0a1a00d8eb..4ade63306653 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -172,9 +172,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
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
index e7f9e6d58927..2bc54131e58b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1553,7 +1553,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1611,25 +1612,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c542ba6ce7d3..a21f9355594c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6382ef5f1ea2..c839a6993a83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1208,7 +1208,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1517,11 +1518,30 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
