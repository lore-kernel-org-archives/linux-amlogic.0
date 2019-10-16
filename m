Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701DBFA3728
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 12:21:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F567205F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 12:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJ/fqQSs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F567205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMTBl4JqAiEWfeqnnF+MZiCr+AV+68uyN005Rnq6x3k=; b=rJ/fqQSsGFaYPu
	bOuVBc/UZCQ5LQzc6zDWlzElZhLE9m8uIzNOLkAadknHl8otIigRn2+uA3f9O7qIQW3g9Tyv7uYIX
	CT6MzVS6gK1V+Jx0lgYAc+HxwThL8HhULGqh4FBR5/CQHlrRZvnV5FXA34iyVLe3KyRVe+VKRmoc8
	hnxpKe0RFT4tRx80I/5tJowZ4wwJLvaA+Al0++htMbqBs+7uRVUFX/s1f9Ok5SMbPaZwrjAjBuI21
	UdpfDbEmsp1AuBf14CmsX/MTLwYkHUi+bVTljqV/o3bJeGTSj23jcTVSpmjuOSH3v9XSOyZAol7vL
	Tpl6+WrXYadrtBOFro/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKiJB-0002w6-7A; Wed, 16 Oct 2019 12:21:41 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKiJ8-0002vG-Ce
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 12:21:40 +0000
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id KiIuiHSeVPduvKiIxiquC1; Wed, 16 Oct 2019 14:21:31 +0200
Subject: Re: [PATCH] staging: meson: add space to fix check warning
To: Jules Irenge <jbi.octave@gmail.com>, outreachy-kernel@googlegroups.com
References: <20191015223433.18784-1-jbi.octave@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f855f544-e546-eb3d-6346-242eb3435e35@xs4all.nl>
Date: Wed, 16 Oct 2019 14:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015223433.18784-1-jbi.octave@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHsIZxW8/J7+DHm0y77EjQKA9TDKkipmz/iz2ou5vQkcABiVz0wD2N9hiUJUO5Qx9SjJqf18AoTsRI0bf0iJGgCmY6wDtzHNVBgUWcNqB6OL1/cbZbOP
 DcGNv3faNnW4Gs0IsWlHmeVwyzNThU2fpY4N6Tno5jU8R7clio/iJfTcV7LTojz1sYlUCTtj2MquZ805HHw5+UV2xeistkVER1JR/xWjYQi+KmQ6Xr7vElI5
 7xtYGyBG0DrC9jb4mcLXDjHZ24GlAZXssVO7m+nBFiWzh/9AGGUvgGV/Gs4htWUjbaYqXUXzN+Sz7R8jUywUtD/wBgQjptycUy0ZxzK/7dwbBLFTbsIenyvq
 7f+S9k/uBvl/Znh9Cy9icsI1A/bjqgDGdL4gN3xRlbcv1RKWDTFLxPbd+11BFJ8ddLjjz0T5JQM0rdUmirDgeXTyfunyBwIuze2Cf4VgMom1O4YGu8iW14uu
 ftTg44AK0vfCQvdp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_052138_591144_C9D965F9 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: mjourdan@baylibre.com, devel@driverdev.osuosl.org,
 gregkh@linuxfoundation.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/16/19 12:34 AM, Jules Irenge wrote:
> Fix "alignment should mactch open parenthesis" check.
> Issue detected by checkpatch tool
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 48869cc3d973..21e93a13356c 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>  	}
>  
>  	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> -					(u32[]){ 8, 0 });

This is clearly intended to be aligned with the (u32[]) prefix for readability.

So this is one checkpatch issue where I prefer to keep the original.

Regards,

	Hans

> +				  (u32[]){ 8, 0 });
>  	if (ret)
>  		goto free_workspace;
>  
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
