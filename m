Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B505C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tKafWayhUFeXdPieDmhGfPNTAdZJgOOrfJuavMdLtw=; b=uQuo3YrUPb8fgq
	0bytOMOMghSdFZ0m3CFt0+LN+6MqWGDBlywcVr7lN+x8A/w61dTOSZoyRTZQM7t0aw1Q839DuHyts
	4ewkEvtfmx8Cn944l0imAmg/cae5FTZelv02uVeDqf5dTVHqC6wy9GUzAf6uIXlJUBoh0CWrO7kzz
	U0Iu+YIxNoxIcwZs60v8A0UkbDoqd6/RgDaoxXPj14G3qlwoUJCAieeicktJMOMVM9idEq3JDyY/Z
	lZxzOnRXpyh35ZnsqoBEFh2n5d/jmSzZ/+Zu1QtEPL0uJegwmtEeEKW2XrOvqg0JmYlyW+ljOgZcX
	LtU4olsxmg7Fn4tWm81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJBz-00000007BjI-3lOb;
	Tue, 06 Feb 2024 11:00:43 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIET-00000006qzR-3dkF;
	Tue, 06 Feb 2024 09:59:16 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4166xSAC022910;
	Tue, 6 Feb 2024 03:58:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=v5p55IOITpqmhF7
	sZSnOxfOy/BsQIdVVFm5xhqj7f9s=; b=CN8aUZeqvFd31h49unpgQ89je93VaRH
	rrRbjFcRdvJI7Wgt+s6nVW5BCmZk3kbVOwu/CNVLRLufi+5MpG0xYDqxTb+6FGR1
	o9Z5Tgj1grqrrtHgHitQltAZFv+FlcF78BNTWogNQGy0jcjoRvRBTMp+qYGKcyKV
	XNDICT/OwcoiEoN5lqMTQvkzBMfp+afdgbGJ3JbvaGKz8NqjjJWipW4mj1Jxnuzl
	zV/KdBSpOsXYlEhP/chL66QeINs8nWkqGzvCzBvxVMGhAB+swBUB0wHEydjeg+4f
	DUmUgJYKr9SezvgEgFSr8PTmX+JsuzS5ZkVX/kvEhcim+tQrksQp1zg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2b7fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 03:58:53 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 09:58:51 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 09:58:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id E135E820241;
	Tue,  6 Feb 2024 09:58:50 +0000 (UTC)
Date: Tue, 6 Feb 2024 09:58:49 +0000
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
Subject: Re: [PATCH 09/18] mfd: lochnagar-i2c: convert to use maple tree
 register cache
Message-ID: <ZcIC2V/hM8nnekJr@ediswmail9.ad.cirrus.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-10-liubo03@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206071314.8721-10-liubo03@inspur.com>
X-Proofpoint-GUID: VCnUsQ6Tbcxl1dxM9nGNsPvgd74iHvZt
X-Proofpoint-ORIG-GUID: VCnUsQ6Tbcxl1dxM9nGNsPvgd74iHvZt
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_015914_129387_7D5B13F9 
X-CRM114-Status: UNSURE (   8.18  )
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

On Tue, Feb 06, 2024 at 02:13:05AM -0500, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
