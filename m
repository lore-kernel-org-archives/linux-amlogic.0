Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F94CC02180
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2025 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7t0xU/CocFemfr30dkYWJ9l2X4SSaZM4sWQ6BEs1DA=; b=eq/ZBO+4Tg3ASA
	v8kD5zFnPRN8YMbxORJX3J3Xz8coymQg7iZORqyoa54CgKdY2z3oYUtwXljlPRkIdGPA4bPOf/+nj
	w46nhbtcdrM2sPcSlZoitZYu2Znk8zjK7lmOn1LdVCm+jgWKHGYr2AIpZeDQn8v4hMN3e6QkM96iW
	q3KYhXy+hDPF5AEHWSQdxCzny5DTpAad8Z7QXVyh8LmNHvXZ27MJmYSQPdu4+iJnxBOOihPBgoqbY
	nKMcui0bFrQko5zfghSP8dSNiYKHxdTFKr/oC6qpoCnLll/S8cGG52HmQlPu6MQNF8VYtSu7tElSb
	GUHg0M4hkV6U9wJSd7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLDT-00000005NCr-1k8z;
	Mon, 13 Jan 2025 14:14:55 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLDR-00000005NCU-00qn
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jan 2025 14:14:54 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7nWuB009306;
	Mon, 13 Jan 2025 08:14:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=s5+S3Igr3bD9UKouNB
	zaZMvaeNzzgiFttOLq1s6xKK4=; b=loUXUuyvELIQ8Vg0FNyToxxP5Fyx5OzIiE
	Tjg4dEBJPCgGsOw6TzbTCMBayQAa4yMS/HregzF5JFNtX3iiC0VYmLPQU5iO3fBO
	FPq9MBiSWTzEpuVTRwpRH+fEOnho130mnJ6bsRoSp4PDpGp5aIyx4DlmOxBc37TN
	xv8PeC61xAfDCkZlXpYL32tTmBlVaVor2Jk4OwL8/MpEUc5Kt4ZkC8f7bzGK10L1
	AIVYktoeViSiwddib7sXgQnL3dNgzrqHatdrNG5auB6Ukb5Du2lWks1RMCPcbwP/
	K9tU9vVug8atPVh39vzwS+9nVTX7mDtutDehboTQXX3BF/emY7Gg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 443nxma3gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:14:48 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 13 Jan
 2025 14:14:46 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 13 Jan 2025 14:14:46 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D75D582026C;
	Mon, 13 Jan 2025 14:14:46 +0000 (UTC)
Date: Mon, 13 Jan 2025 14:14:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-sound@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <s.nawrocki@samsung.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-kernel@vger.kernel.org>, <jbrunet@baylibre.com>
Subject: Re: [RFC v2 2/2] ASoC: dapm: add support for preparing streams
Message-ID: <Z4Uf1XmwYH3TIcAO@opensource.cirrus.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
 <20250110210730.705613-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110210730.705613-3-martin.blumenstingl@googlemail.com>
X-Proofpoint-GUID: DtdltIgpv8wATfusjxXe9REr1nX2Q2_3
X-Authority-Analysis: v=2.4 cv=Q6Eo452a c=1 sm=1 tr=0 ts=67851fd8 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=w1d2syhTAAAA:8 a=hQzeRV6ZXms_Ih6WJlsA:9
 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: DtdltIgpv8wATfusjxXe9REr1nX2Q2_3
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_061453_159402_76C92859 
X-CRM114-Status: GOOD (  15.05  )
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

On Fri, Jan 10, 2025 at 10:07:30PM +0100, Martin Blumenstingl wrote:
> Codec driver can implement .hw_params and/or .prepare from struct
> snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
> callback has been called.
> 
> On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
> (sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
> codec output because further digital routing is required after the
> backend. The new DRM HDMI (audio) codec framework (which internally
> uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
> of the hdmi-codec to be called. Implement calls to
> snd_soc_dai_prepare() so the .prepare callback is called. In this
> case the mandatory part is the call to prepare the sink (which is
> the hdmi-codec on those platforms). Also call snd_soc_dai_prepare()
> for the source to stay consistent with the rest of the code (even
> though it's not strictly necessary to make the DRM HDMI codec
> framework work on Amlogic Meson8/8b/8m2).
> 
> For platforms or sound cards without a codec-to-codec link with
> additional parameters (which applies to most hardware) this changes
> nothing as the .prepare callback is already called via
> snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
> dpcm_be_dai_prepare()) on those.
> 
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
