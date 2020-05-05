Return-Path: <SRS0=U5JB=6T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD44DC47254
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 15:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C80D20661
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 15:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGS9aori";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vgkcg/8O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C80D20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCIIyv/FMKkBTnBaVT9Mu6OhMbQDNJ2sipxHV0/8kJY=; b=MGS9aoriV2Pbcw
	brVuCmYr+ze+0STpxrzQctf8sp2qYQPVNY+SkWLqsEqM5Fehusgxfdu1uzeE2Fbhj1gMhfM48ySj/
	s8pvFROsyOEQqCz+9yKmCHJreZlwhj9w73R+J4KRJbNKta2/PxrR/vamFgYXHkY1NliAbolg/8SNK
	3bZsXOSC3wuZyW12XDr/gwc+PvTA+WouJDqIic1D/fudnA0JjoMzFhSRUGXtdkUF2bAnE4KsRUdV+
	Ak37nP415OtfKMgzZ4MUslKjOU9KWZ3dKra1x9llxoadmUw9kfKys6c0Iu44PySaxPiwrXiMtyU3d
	kghlvB/9P8KC6nuIt/bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVzLN-00016s-Ed; Tue, 05 May 2020 15:18:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVzLK-00016B-9U; Tue, 05 May 2020 15:18:47 +0000
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA10420661;
 Tue,  5 May 2020 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588691925;
 bh=Qb+bFTrIW/turrfytG4Xj+vuZ0yQCBJTHqIHLSzr85Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vgkcg/8OufOHNA/2a7yMDXATx+PzttSLb25/eJdAKF635garePY8s8lLNraw1LRv6
 VXNNiWfiOPCm7i6BI2TzgXY3EDcLnB6o/GKh+xT4o5gbbPmo4irXC6kU8wvHp0jtZL
 SiRllWraLVhN0ZoS77AmMUO3RZWimOB35NegYes4=
Date: Tue, 5 May 2020 17:18:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] media: meson: vdec: fix another case of VP9 buffer
 shortage
Message-ID: <20200505171840.48d89ccc@coco.lan>
In-Reply-To: <20200428125036.9401-3-narmstrong@baylibre.com>
References: <20200428125036.9401-1-narmstrong@baylibre.com>
 <20200428125036.9401-3-narmstrong@baylibre.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_081846_344355_D1FAE801 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-kernel@vger.kernel.org,
 hverkuil-cisco@xs4all.nl, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Em Tue, 28 Apr 2020 14:50:35 +0200
Neil Armstrong <narmstrong@baylibre.com> escreveu:

> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> - Redo the logic where VP9 gets fresh CAPTURE buffers. The previous code
>   could lead to a hardlock.
> - Reserve 4 margin buffers instead of 3, as apparently there are corner
>   cases where 3 is not enough.
> 
> Fixes: e9a3eb4819ca ("media: meson: vdec: add VP9 input support")
> Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

> +static struct vb2_v4l2_buffer *get_free_vbuf(struct amvdec_session *sess)
> +{
> +	struct codec_vp9 *vp9 = sess->priv;
> +	struct vb2_v4l2_buffer *vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
> +	struct vb2_v4l2_buffer *vbuf2;
> +
> +	if (!vbuf)
> +		return NULL;
> +
> +	if (!codec_vp9_get_frame_by_idx(vp9, vbuf->vb2_buf.index))
> +		return vbuf;
> +
> +	vbuf2 = get_free_vbuf(sess);

Huh!!!!

Never use recursive functions inside the Kernel! Kernel stack is too
limited.

Also, even if Kernel stack would be unlimited, the above logic
would endlessly be calling get_free_vbuf(sess).

Thanks,
Mauro

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
