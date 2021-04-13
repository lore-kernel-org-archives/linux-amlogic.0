Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877ADC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 07:27:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B366054E
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 07:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7B366054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7qdAp4wpdcl/b+8KDA1QLFpU5UIh8svirxz0G2Ri1CA=; b=G2yhOs3eQdLoRXH4rgZ6PYFeJ
	5MJC+N07Y/a8pu4jJLgkyv7VAR4fXxeCrNwysNiBP7TfO1dq71oQteEK2u6/UIDjEoXW4CRzYrYUt
	W8spK8Ii86x0CZXDDoxCn+smN0yhlXd4vdT7ka2zA1rWUieqDFObYqaadSxmo8oqHk3brXkKzEcPD
	pFBpsa+CTNYt+mVkZow6PQhdEBLC+cKiKbZRuGUbO/KlNnOF1Ysk0zlYdKkEbzHRYNydDs5wNRMHJ
	6EKloHcLCdXRUW5gKFg9LRxhdx0JNc7Q78mRS+8Z+Rms6DhgYWwker2KHS7UivIoPHj1CpM9vlg4H
	5FF98E5kQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWDRz-008V6f-MZ; Tue, 13 Apr 2021 07:27:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDRG-008V0j-2H
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 07:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=iuscKYlZrmNNcYDAdFgfUygRIDVn2zQTJzj0tnhaTjE=; b=EaVXjKigwlhQ/DDZF34jmtizJ9
 Q3H9TODAC6hXVwTNgqZZfzSXRyg00c5g9E+ZAXyY3j85GnKIIfGMRtnc3SniI2UpRtsvZxk3/7vl5
 oq4JLNvkEjtMPA0q4vwJBbUHhUDJBOyebWc2UOCALyw0SebDfoYJ7hfSUkwrz14nzeLh5jAEJU/Dk
 PdAL/rxbzO9V9fDiklZ5BEwz3tP1ySbJ+UTx9i7LZZk1gsi7uYFagrl2+W0ZNuB4RfprDJAO0QOPG
 vfBbD763U6oF62BSvBlNrz2TepNOKQG7GPlnFi3SK1oHAD+UWk+MsFPDOX9pdKBY/lgc4H6ofuLiM
 URufD+6g==;
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWDRD-006ncR-Cj
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 07:26:20 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id WDQvlhJsG43ycWDQylbKsA; Tue, 13 Apr 2021 09:26:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1618298774; bh=iuscKYlZrmNNcYDAdFgfUygRIDVn2zQTJzj0tnhaTjE=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=TBgDYf6oNueT4ZNtCBRGqTHa+AeLyqCD19lzLlYmmSfw5j4763vmDLB23cr9Zrhmk
 qSs9/RkWZ8hTzNsee6VK9miMwcxgjiain/ljENcNblcUo8Xrla4KiaeG8upGJqCM6a
 +Hv4O2AKrn3KeaaKXJhtwM3Td87Si5rl6/JxliRAmSjM8WIH1FP2DJzfyg6H4YE4aT
 E5nqdz4y9bZ1XTLVLdRQhsP/D85FbTmaRUEZZ1tFXhu9LwtIUcG6B+T/vy9AwvNkGP
 Nx+oCIVSTHjYc34ZklGDBoU7kQPCd5ZrrS/mAT/xk4uDtc8fvjkx2PShCxDrHCYM5s
 DMV2Qz0XW/xtg==
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
To: Mitali Borkar <mitaliborkar810@gmail.com>, narmstrong@baylibre.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
References: <YHU56OM+C2zY34VP@kali>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl>
Date: Tue, 13 Apr 2021 09:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHU56OM+C2zY34VP@kali>
Content-Language: en-US
X-CMAE-Envelope: MS4xfMACiB/U3iBmeIo8g2sQHaGJfQjsL6GJ7v+M9ptXTdZx5bTSXHAIxK6HgPN5d14hv9IMqKdD7UkDJDWsTPefBdDD+Pk4FTegeqoWcKUT0squpR8jLHt5
 kf8a7+2gQd8//OJJqeur7Rzfkj7GjP8p3rPeDAIq3TsvlNSGDvzd71Ia1SSDNBczzHanGs6Cm3cUXkZ2gpmWuD3g3s8c5ykxphhxahqSCKry+t+N5KyCaquP
 AFzAtQr90Vk7DRNrDj7tRybqimpkkOOismwFRbZZwHOCbTXRal0OtwRdehHUxYCXJtiYuowDAwXFU/QGlJbW0Rgz69B2BQl+pxIv027K7OoJ7Kx58/2FHIRu
 aFVG9byy7VQr3ssoeLqhG23oOrix7EhRvOUuko6z2NZwVkG04XUJB5ih6Oy47e3CIk2hLSej1zCFW1LB5iqE+o1qi587irxJRerd3SXjYtd/mfTgy9xIEiru
 3TIGJTn2Lj08Y0iTOJJouMb+ZTy/O9nNeZTOsQr3+vIjcDIZco8Y/ZJqVhKeyNRSIwOw/8reeoex51YYxujMkj6ZEbWENSzysjMG+Bm9nUJTBnW87Ca78wgr
 emZ9uuHwXJ5TgUTCDclURjY8dtB20VuPnUcduBexg0gYE5eVrFJKqSYQd50H7EX6KE3RyHIeK6ifEX9Z5THD0sI8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_002619_591302_F231302D 
X-CRM114-Status: GOOD (  13.89  )
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

On 13/04/2021 08:27, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function
> appropriately.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> 
> Changes from v1:- Rectified the mistake by declaring u32 as static const
> properly.
> 
>  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index ea86e9e1c447..80141b89a9f6 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_h264 *h264 = sess->priv;
>  	u32 mb_width, mb_height, mb_total;
> -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
> -	static const u32[] canvas4 = { 24, 0 };
> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> +	static const u32 canvas4[] = { 24, 0 };

This is a patch on top of your previous (v1) patch. That won't work
since the v1 is not merged, you need to make a patch against the current
mainline code.

Regards,

	Hans

>  
>  	amvdec_set_canvases(sess, canvas3, canvas4);
>  
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
