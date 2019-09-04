Return-Path: <SRS0=DSrP=W7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D03C3A5A7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 08:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C08CB22CEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 08:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BEH2XHzG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3Xt1vFW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C08CB22CEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5DbMLX9IR3Xnuh6WOggmEO5g/HoL5BpFrK49BH/Oww=; b=BEH2XHzGoQvWVB
	BVCZl0rugS/eZkiiKhP4qV1Uel47nRp6EMGRgQ8fKD1J7jlLqDXFCOmoU3saWHBUoPD0L/7z0HqJr
	Ipc5OI+0Zje8x7HiLZRZkgcSmcm/j3beUasWQANG+erR6gqTlCIA+04gmPcNNlW/ZF2Wa3oCEoVMH
	HSh2TOUA/f7bzlz5uR6BmjDb8EUgY1cYwgnZyS/6piAsWqvbBT1B64tZnZkSmlBBGMJYh/6J6IY/m
	6mzU8NndbAgQQlsljwlM/kXKKp/c1R9ytzPeHrG3IFn9Qh0otPFMkzIamhmIDetWp9xm+/IjIL+DA
	eGCZa5Gdr3dilMKXnTqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5Qux-00034L-Ik; Wed, 04 Sep 2019 08:45:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Quu-00033q-EZ; Wed, 04 Sep 2019 08:45:29 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81A8A22CEA;
 Wed,  4 Sep 2019 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567586728;
 bh=ReJN7nfBuAkxDGWCkNioWGAoCEhadI8k72Wr8vLuB04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3Xt1vFW/wLgQGkDEIy6pqv/t0kVUwS6A3oiUXXAYWBOsZHrhociWsvB2liN1QZHu
 +SSN7vWvBsPVq82ASvqxK10UF/FXwJaiuidUdpOlfaeNy50XOGVJC+DRhY7DTioILy
 jS6HbwoS0Jhjv1c7g1DMdZWsb7tvNRYs2pda0vpw=
Date: Wed, 4 Sep 2019 10:45:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Austin Kim <austindh.kim@gmail.com>
Subject: Re: [PATCH] media: meson: Add NULL check after the call to kmalloc()
Message-ID: <20190904084525.GB4925@kroah.com>
References: <20190904082232.GA171180@LGEARND20B15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904082232.GA171180@LGEARND20B15>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_014528_512522_EF0CB6E6 
X-CRM114-Status: GOOD (  13.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mjourdan@baylibre.com, devel@driverdev.osuosl.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 04, 2019 at 05:22:32PM +0900, Austin Kim wrote:
> If the kmalloc() return NULL, the NULL pointer dereference will occur.
> 	new_ts->ts = ts;
> 
> Add exception check after the call to kmalloc() is made.
> 
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/vdec_helpers.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index f16948b..e7e56d5 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -206,6 +206,10 @@ void amvdec_add_ts_reorder(struct amvdec_session *sess, u64 ts, u32 offset)
>  	unsigned long flags;
>  
>  	new_ts = kmalloc(sizeof(*new_ts), GFP_KERNEL);
> +	if (!new_ts) {
> +		dev_err(sess->core->dev, "Failed to kmalloc()\n");

Did you run this through checkpatch?  I think it will say that this line
is not ok.

> +		return;

Shouldn't you return an -ENOMEM error somehow?

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
