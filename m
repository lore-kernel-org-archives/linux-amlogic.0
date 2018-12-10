Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DF6C5CFFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 11:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 115E220821
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 11:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="erM55iBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 115E220821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuZmfwZ3l3XrqKMsDTw6d14AEAEVH3GR0Bqa/j1fvzg=; b=erM55iBUml5okN
	88Fs30NNPaEuFolECBzOq5IfnQ4ts9d4FRPxZkR50+NPKbWYVih4JvCUgiW3HR2ixS9T5ikc79vRu
	3CTaTenO1WTMVaFs8Z5a84Kx5vTqXY/By2E1aAzFgEEKHXgAJEXglw9lx7/5XUSKbc2EXH2Y/7IWW
	3zbnUFEY0wLi2cyyzlGzOxLOsUQev1msJ1n9ocdwPyfre8+FdEF4coPOvMcXOlgWRmR919xM6MXsW
	KAZiDCtWWaQim4IvDsEjVB1TZzfdegAMq4HPXPopwkDa3Ca+MO0FnayuQgPKdgOV7KSkiXahIJbFf
	KbYbzmPXv2xCv8jqenNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWJtN-00011P-Nj; Mon, 10 Dec 2018 11:38:29 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWJtF-0000sE-Ie; Mon, 10 Dec 2018 11:38:26 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id C1E1D2079D; Mon, 10 Dec 2018 12:38:09 +0100 (CET)
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 by mail.bootlin.com (Postfix) with ESMTPSA id 420D02037D;
 Mon, 10 Dec 2018 12:38:09 +0100 (CET)
Date: Mon, 10 Dec 2018 12:38:09 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20181210123809.5ade45c4@bbrezillon>
In-Reply-To: <823825a3-86fb-9a20-ae29-85cc52d44093@amlogic.com>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
 <20181207102456.1dc67e07@xps13>
 <823825a3-86fb-9a20-ae29-85cc52d44093@amlogic.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_033822_092514_2627010D 
X-CRM114-Status: GOOD (  16.86  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Jian Hu <jian.hu@amlogic.com>, linux-mtd@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 10 Dec 2018 19:23:46 +0800
Liang Yang <liang.yang@amlogic.com> wrote:

> >> +			mtd->ecc_stats.failed++;
> >> +			continue;
> >> +		}
> >> +		mtd->ecc_stats.corrected += ECC_ERR_CNT(*info);
> >> +		bitflips = max_t(u32, bitflips, ECC_ERR_CNT(*info));
> >> +	}  
> > 
> > Are you sure you handle correctly empty pages with bf?
> >   
> if scramble is enable, i would say yes here.
> when scramble is disabled, i am considering how to use the helper 
> nand_check_erased_ecc_chunk, but it seems that i can't get the ecc
> bytes which is caculated by ecc engine.by the way, nfc dma doesn't send 
> out the ecc parity bytes.

Even if the ECC engine is disabled?

> so i would suggest using scramble.
> 

No, please don't force people to use the scrambler.

> >> +
> >> +const void *
> >> +meson_nand_op_get_dma_safe_output_buf(const struct nand_op_instr *instr)
> >> +{
> >> +	if (WARN_ON(instr->type != NAND_OP_DATA_OUT_INSTR))
> >> +		return NULL;
> >> +
> >> +	if (virt_addr_valid(instr->ctx.data.buf.out) &&
> >> +	    !object_is_on_stack(instr->ctx.data.buf.out))  
> > 
> > Can you please create helpers for that? I guess it will help removing
> > these checks once the core will have a DMA-safe approach.
> >   
> I will use below definition:
> #define BUFFER_IS_DMA_SAFE(x)	\
> 	(virt_addr_valid((x)) && (!object_is_on_stack((x))))
> 
> Is it ok?

Please define a function, not a macro.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
