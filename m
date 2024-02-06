Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F65C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKWabAkyt1MSL22OlU9vXq5CI/N1pnPc5s/5vF3fDRA=; b=QJ5PcVe0Dc83tj
	Vh2wheYxT6MA38DTtOa+m4mPKB344lP2S7FqLtCb9gdgH6Uj1pcNV8ChHiqxoyhDRUZpfH5FvYw4K
	bt1MYx7Q215Ize3VSgOSCi1Pv6c8sZfhk+L0jSn637In2ZBHSM1EEOkBxhg+1XCnxRUrYvfKFTWDP
	S635FFemIgE6aNX/9RmNRp9/rLwo3tQbbWjJHEcjdLP+DFKm8Rx6Yl1qMtm4isfoUt3V5+Wa3VxB4
	E/2AEJsIRvhITeHS0v/bF6deqhLpPlLfKAwU7hkmInGs5Mgq8CCL95RCR6PkkRY6Bno7JMyDI08/I
	YM5dxiHiCOGf9gMtuxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIcT-000000070hs-2ehF;
	Tue, 06 Feb 2024 10:24:01 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIcQ-000000070fc-3kTD;
	Tue, 06 Feb 2024 10:24:00 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4169iw9L025133;
	Tue, 6 Feb 2024 04:23:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=v8WU0lB9flpGY7v
	YDfUpKZOIGwF1bC5Mlqhymq+hVuI=; b=Gq4i2HaZBxfaa9D+cEHHCkIim11Aq+L
	PsNfQCWEW/RohMHzj0MnwF9nyXJoQyaQubAxDrlPApglgBXw0Tvtf/px2vdmfLYv
	GSjZyVUaRg/A4TXB1Af6DwIP7K9jOLni5AgK8O8el8CUiAcoiNI36wfWIX7Yx9q2
	+RH3aKAEpHFGg8h+W7RkXMCEL92bLlBaIANFvIFkv6MSF3OqKzKVI/GtcmBt1Aeh
	D0TDVyCkgJ/ydhQx45QDBWNy8Sn9N1sMqxP6Ly0ZgAumPhVzd4GcBPh4MHToFQP3
	wnUaon/CBqLht8YtsL+jDbw4Z9onUqFhuTc/zsVljd2CV0kWe2AGiSA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w1jsnk6h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 04:23:30 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 10:23:28 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 10:23:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9CD37820241;
	Tue,  6 Feb 2024 10:23:28 +0000 (UTC)
Date: Tue, 6 Feb 2024 10:23:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bo Liu <liubo03@inspur.com>
CC: <lee@kernel.org>, <wens@csie.org>, <marek.vasut+renesas@gmail.com>,
        <support.opensource@diasemi.com>, <neil.armstrong@linaro.org>,
        <rf@opensource.cirrus.com>, <mazziesaccount@gmail.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>, <patches@opensource.cirrus.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 10/18] mfd: wolfson: convert to use maple tree register
 cache
Message-ID: <ZcIIn6b+BFR/FRIS@ediswmail9.ad.cirrus.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-11-liubo03@inspur.com>
 <ZcIEFxh76TTXBTiT@ediswmail9.ad.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcIEFxh76TTXBTiT@ediswmail9.ad.cirrus.com>
X-Proofpoint-GUID: VZagnLkW2TlCS_BzEYBGYEssTNO5DPkf
X-Proofpoint-ORIG-GUID: VZagnLkW2TlCS_BzEYBGYEssTNO5DPkf
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_022359_068385_09B53AED 
X-CRM114-Status: UNSURE (   9.39  )
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

On Tue, Feb 06, 2024 at 10:04:07AM +0000, Charles Keepax wrote:
> On Tue, Feb 06, 2024 at 02:13:06AM -0500, Bo Liu wrote:
> >  drivers/mfd/wm5102-tables.c | 2 +-
> >  drivers/mfd/wm5110-tables.c | 2 +-
> >  drivers/mfd/wm8350-regmap.c | 2 +-
> >  drivers/mfd/wm8400-core.c   | 2 +-
> >  drivers/mfd/wm97xx-core.c   | 6 +++---
>
> seems a bit weird not to convert wm8997, wm8998 and cs47l24.
> These are part of the same driver as wm5102 and wm5110.

Nevermind, it seems those parts were already converted.

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
