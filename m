Return-Path: <SRS0=/mSf=SR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45ADC10F0E
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2019 06:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D8E20825
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2019 06:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9SxqbWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D8E20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C+WF32Sq6aYV9a0ZdM85VExJ90Py2LDe/ow4/NodxBs=; b=R9SxqbWkMGVxhIwIkbb2rzm+i
	xeF1oKROSVnulUmUKpFSH4JR6+maTJAlmryOQ8K3wkBSa2DpbmJYD7suzAKXaE+SOln834qZHyqR0
	3eH52a01omQupsO5p21qEbhU1FxlVm4Tm7zlaeQ7QA/fCt/OpQ4quUVOt68nM5FuFMqE2dzbBpfd6
	+Njp0z2ESh0e5lx58K4VLPdUIaAhJ5fNcSSqrh0Ns/cNC4glkZ+Do5fCk4LLgjRHJoQuid2PyqrMj
	fZjqzozLazzJAmu7yuBdixzzzsH41wp2SQ/9NOGdsm9dyDu0r1fraUcts4iIIUcHezWfHvZGq8iPc
	Xx9qWhUDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFuiC-0005tO-7U; Mon, 15 Apr 2019 06:03:24 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFuhu-0005XD-Ut; Mon, 15 Apr 2019 06:03:08 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 15 Apr
 2019 14:01:13 +0800
Subject: Re: [PATCH 1/4] mtd: rawnand: meson: use struct_size macro
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-amlogic@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <miquel.raynal@bootlin.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
 <20190411220056.19109-2-martin.blumenstingl@googlemail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <effed7e2-114d-75c3-186e-7f53b96f210d@amlogic.com>
Date: Mon, 15 Apr 2019 14:01:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411220056.19109-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_230306_996628_A8235B92 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Martin and Miquel,

On 2019/4/12 6:00, Martin Blumenstingl wrote:
> Use the recently introduced struct_size macro instead of open-coding
> it's logic.
> No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index cb0b03e36a35..c1a6af57dab5 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1242,8 +1242,7 @@ meson_nfc_nand_chip_init(struct device *dev,
>   		return -EINVAL;
>   	}
>   
> -	meson_chip = devm_kzalloc(dev,
> -				  sizeof(*meson_chip) + (nsels * sizeof(u8)),
> +	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
>   				  GFP_KERNEL);
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   	if (!meson_chip)
>   		return -ENOMEM;
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
