Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B47C02180
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2025 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxlDZzdAL3IMnAoN41FpyXBHxWYPfAJ1P3Wmnl5P8VA=; b=bTUKIb1XW5E8TU
	gLu9UDc5z+7YIFKmyRO+n0hiPyiMhTaf4aLoHxVydE7ol0fxW1Q7TOBoPh6+5U4URO60CI42R9wgC
	Hv/kowE0WvJysSMHWOhaf4FMveAplBSPn0hx0m3u6dazW8kGQ3wrKaeTsrNGxOxYm3ak0s4Kcu1Op
	suOKlH84F+/S9J51jUkqBIgG1R+mo9NlA7kkSHcocsEUoI9CVEA0JrdY6+i4lyKYmARzyns9JMJMl
	d6s9ODI9VpiW9LN6UOeDuAB/voHwvkTIGW+QPndUM3gLphxTJuJ5o35YVkSaJ30QXPsSsXt+4r7BI
	Y105azo7ZSmY3nyUZKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLCX-00000005N2x-050E;
	Mon, 13 Jan 2025 14:13:57 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLCU-00000005N1k-1lg6
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jan 2025 14:13:56 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4LGLl006799;
	Mon, 13 Jan 2025 08:13:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sxKP20kTZx2Twn4The
	0jLwSDqQ55EkIQadozko+gFHQ=; b=S8VistAB18IFLaCC65dlgTbBBom1c4r5uk
	2J6zTTqCjSX1ZOUSwp5ceKrqJ5U1zFUgzz0tTJO9RT02o8TFfPfOWWiU9s+IORTZ
	HoIqNnAHsMP9nFf46fXnPuRTUXht5ewOoTQ3cSQCHi4juZIYby/FvWP7C0Wjm2wA
	jUNXvZRu2IISlmiZ7cDNODsGPRS0S1YaiEBh35xtM514lphcnYzRuqI1zCwO9TjX
	0X/3CH8t2p02Llf4REQ7sPYZz5YNX2wlWqUtbL6JAZovcgdu5MDE88vY9uS7YDK7
	RPFGRu+mtWVZaBZB7B2X+kD1+SDW/b0AygOyJhicmC/zkh/388Ww==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 443px4hxyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:13:42 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 13 Jan
 2025 14:13:39 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 13 Jan 2025 14:13:39 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D3D5782026C;
	Mon, 13 Jan 2025 14:13:39 +0000 (UTC)
Date: Mon, 13 Jan 2025 14:13:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-sound@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <s.nawrocki@samsung.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-kernel@vger.kernel.org>, <jbrunet@baylibre.com>
Subject: Re: [RFC v2 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it
 internally
Message-ID: <Z4UfkpbDUiJZm2b2@opensource.cirrus.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
 <20250110210730.705613-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110210730.705613-2-martin.blumenstingl@googlemail.com>
X-Proofpoint-ORIG-GUID: wMOCrEd8y3OIs-67QofQm6ABfXXcjNbn
X-Proofpoint-GUID: wMOCrEd8y3OIs-67QofQm6ABfXXcjNbn
X-Authority-Analysis: v=2.4 cv=XdhzzJ55 c=1 sm=1 tr=0 ts=67851f96 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=w1d2syhTAAAA:8 a=0EpnaMWjD1AAUn5LxXYA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_061354_474173_2647E525 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 10, 2025 at 10:07:29PM +0100, Martin Blumenstingl wrote:
> Add a new snd_soc_dai_prepare() which can be used (in an upcoming patch)
> by soc-dapm.c. Use this new function internally in
> snd_soc_pcm_dai_prepare() to avoid duplicating code.
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
