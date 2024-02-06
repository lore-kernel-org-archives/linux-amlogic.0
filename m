Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B3CC4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUXUsnHSHv35fTnI811qnYzQt0jL7vRlgjWHslDyCRM=; b=4rMDjKBisCn8hA
	o9pse8iPtKTXmnosUJMv17IggjF0bcpnipUeobKdG2mAFsJn4Dfl8V067U+i4BV2DNDd+aQ4YFzcC
	P4+M8ZNkrV+HSJz/WTYQsvAvlXSN5wrV9f+cz/oYE2nmfBjxXEXfuKtaoPSigdwhn6XtSk6EfL9KU
	spLZDERzQiqkWj6gsXLQOiQtK2hdmh+lImed5TupU+yg3dy1MKq0k7r2JBwNgq2CET/3+VY0IIEnF
	GZm3qbVt9ln+NSKS37ytKp8njRuBHC94/HBFmyOt5sw+QMcSnwcmOB7b97EpkZRn6P+/cDrJWPoS3
	HVGr3wvwflO+KUwl9ApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIJo-00000006tWZ-2aWX;
	Tue, 06 Feb 2024 10:04:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIJm-00000006tVY-2SuF;
	Tue, 06 Feb 2024 10:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uPUFH7eDTg7/caX3/YYHyrwvuZijGhOyQY2h4OtQApg=; b=W2R9WMrUUmdU1Fp8urauOIRd5C
	kU3eU7WHPh1BqL1s8a4SLKdFQSYopCe7zDKxaMi3c4BxEKXlG5mVZ6gDsnDcV74gXKqUNcwSoXfec
	7gjebj0WzU8VlmO1bdjodovxCfa2fsD+gIEMh/dOUtgGq5m+QkvSqxQ63Dvq3LWZD4E8e0sJ12zgD
	gGH+EjbBD/bABqdhGOI9lpJ+iGnKGoCDp56JumGIlcWosCbjjP1Dwwt1gKBWzEZs7p313KVau6qOu
	jYsjAwgLvepF3XdD63GFcbhpKxpkkfWQA2NYfXxGqqgkC2N4bfuuaXxSG85Wwq8eB677nHM60xOIg
	be8FrgRw==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIJh-0000000CTkA-0CbO;
	Tue, 06 Feb 2024 10:04:41 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4164p8Bf011574;
	Tue, 6 Feb 2024 04:04:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=uPUFH7eDTg7/caX
	3/YYHyrwvuZijGhOyQY2h4OtQApg=; b=PAMHxqr48BmEQnxAFkzb87smOGK99mJ
	Kj4UKHiW81B6PtnP+G8OtT5jp7g8jBfdSuA6983a0MRdn4PRyxz+A2XhmPCR1pb3
	M8OgeVUCqKEllRphB274vk9ZNxXOIoLOLDWVwlIH3SvdqHtsYRliw4DlyUdzTZqo
	DXjEmbUGw9/ihSxp83mCfJEUKMkfChgkVnWPPGKUvUhzz7puvmyRbbSwDdhzN7zo
	Y8/IVP2YA0EsdRYutWzW9I5Zm+YKYGJTGLupwZwnYCzeKH3NjoY5K5ZEDSZV+6Aq
	MVOI0eShWi4M2QEHB//snLM7ErBPHj04SZxU0vtQYu0JAJHXxVUjoWQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2b7uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 04:04:10 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 10:04:08 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 10:04:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 97273820241;
	Tue,  6 Feb 2024 10:04:08 +0000 (UTC)
Date: Tue, 6 Feb 2024 10:04:07 +0000
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
Message-ID: <ZcIEFxh76TTXBTiT@ediswmail9.ad.cirrus.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-11-liubo03@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206071314.8721-11-liubo03@inspur.com>
X-Proofpoint-GUID: ovCDYOzOk03aaOgaUtGd9-ILGLhAAQBp
X-Proofpoint-ORIG-GUID: ovCDYOzOk03aaOgaUtGd9-ILGLhAAQBp
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_100437_788681_FFE64ADC 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Feb 06, 2024 at 02:13:06AM -0500, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>  drivers/mfd/wm5102-tables.c | 2 +-
>  drivers/mfd/wm5110-tables.c | 2 +-
>  drivers/mfd/wm8350-regmap.c | 2 +-
>  drivers/mfd/wm8400-core.c   | 2 +-
>  drivers/mfd/wm97xx-core.c   | 6 +++---
>  5 files changed, 7 insertions(+), 7 deletions(-)

The change looks good, but whilst it won't cause any problems, it
seems a bit weird not to convert wm8997, wm8998 and cs47l24.
These are part of the same driver as wm5102 and wm5110.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
