Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CF6FF885A
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2026 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24KhPM2KFmwuPsOdqHchswbHZAkdcAPzrb/L+ssU/lw=; b=Oaj54ZWy+JAq2w
	2WaWC1imv2eEO2zEX2V0e32i765/IIQRRoPA8EHqvSYPvAGfiVAmhD5xYX5zeNWK58+vqEbnnf7e4
	q7YTZ5TtWoHYyd6Fq3+XMCsT2dD+LUoClmYnKGqUFccuhIF2FXtQ7GZmtI4x9xIDAOKhLKO2wD9+Z
	Dhfv4rHZOLscNmPsJZvXGqaJUJgG8yO54gKEcMlcx61aF45v+j4qwAIYFZBOzmiVYs+nx1vBUN/d9
	h8AfHFfC6fZqy/vtoguAfDQq8a4DlBUT/euGaXV5Y0qIHeXbLIsV/27C+axwiZw7C8nEuVKHzb9qa
	N4jmGbY83VO6dv2IlNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoZb-0000000ChzG-14d4;
	Mon, 04 May 2026 08:22:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoZX-0000000Chyd-0Bzx
	for linux-amlogic@lists.infradead.org;
	Mon, 04 May 2026 08:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C83C1441DC;
	Mon,  4 May 2026 08:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04988C2BCB9;
	Mon,  4 May 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777882953;
	bh=z7gV2Oq5UMFy5eEaIsIUP6LHbMBxzGLX91H0C7I+3iU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=sUB+1/F8PDC2dZc1AGZLVUTSBt0Ckqel+jRJY2/3GpPIB6rmz8lEFoQHkYHiL7Xdi
	 l8ORvUHf7Qwie7kRyZFbJYU/pWsw94kdZSu9f7PueLzS/CbnRGyFCWgEnCBL33Kirq
	 9LIwnQU7j6CKe+hrDXeOFadEvPWZRMEnGb7USk4xUm6syfLatyIL/cZxHBAys1Jpbm
	 Oh5sJdCWY1AUPv4++6EinWCRRGr0VmBUD6X+aW5h6E/sSlxzwVwEtdMQ0W4IBBBck/
	 jXqW6vs06bhJR3VTPJX1TLRaHUdmkBspqYeMY5RMlxO6+hwhiVV1svwL8lMJSttOqS
	 g8bZqHu80OOlg==
Message-ID: <d3c50ea8-234c-4565-b8b5-1aa9f0492330@kernel.org>
Date: Mon, 4 May 2026 10:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] staging: media: meson: fix typo in codec files
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>,
 neil.armstrong@linaro.org, mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260429151858.28761-1-mahamaryamjavaid@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260429151858.28761-1-mahamaryamjavaid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_012235_461624_8941FB62 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Maha,

On 29/04/2026 17:18, Maha Maryam Javaid wrote:
> Fix spelling mistake: substracted -> subtracted

Please combine this patch and the other meson typo patch in a single patch.

There is no point in splitting them up.

Regards,

	Hans

> 
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 76e9ca7191ab..ab4374e3b2ef 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -12,7 +12,7 @@
>  #include "vdec_helpers.h"
>  
>  #define SIZE_WORKSPACE		SZ_128K
> -/* Offset substracted by the firmware from the workspace paddr */
> +/* Offset subtracted by the firmware from the workspace paddr */
>  #define WORKSPACE_OFFSET	(5 * SZ_1K)
>  
>  /* map firmware registers to known MPEG1/2 functions */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
