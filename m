Return-Path: <SRS0=t9u8=3N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8FAC35242
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jan 2020 11:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48972075D
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jan 2020 11:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6UaHJTF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qfe6+PLd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C48972075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrirRn74FE0xsPKpBPxuC56ovRj1fgMiPHjGRWsMYV4=; b=i6UaHJTFFfbOw8
	V+RTpE6nfFPc6JOjrob2DVk9c0c6Bs7U6GmJmxp7yKyAdaqjNp4471hlibErIOx01OJbGa31rB/46
	jzvCLLfsL57mWeVPFoPukINWBtHVJJH0Y+EtEdr0UAB7glLsCTz4JxnPc+cDXo1Ea+lSxf80cNVVd
	bXH97d612sbt4d2Uch36J36a0A5U2xR4gVWL6Fw466zO4qRN7bdldaExRNBfEMbPbTd7TfwcQUabb
	vk/RaraIjEjNZMiepuyOkFpeKqXQKspiOUwhfkdJDfv4syTa/m5muO3iynid0sWnYg/KWo3OK+6NB
	/BWi7ZsY8FSzdsudZmPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuwzD-0000Jw-U1; Fri, 24 Jan 2020 11:18:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuwz7-0000Eg-GY
 for linux-amlogic@lists.infradead.org; Fri, 24 Jan 2020 11:18:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id m24so1310440wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Jan 2020 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANMpFHUuJ7AoaEIR0Mfi1Yglq+QTNbfCcaUKdxl54oM=;
 b=qfe6+PLd80Lj9i8WHJ5i/jm5S39Vl4ZarKRjFY+DLcmhl2tYWYIWC8NfPFTLDJ3QMk
 A8VchwGeZaDVrjIeegtr0+RSpk1JwwVi2NVqPdLNcSkBKix2CxRD+cTcwUc6aPWP7Jg6
 KYMTpr7vVH+a7IA03jv7nmKzhXwZJm5nHe/4p0reELPsxBxjkSxSugxwBnI9UzB4k2m9
 9zgxahOSxAER+hf5xAcpxvfC8C5fpZQ6ipZ09a85vXtDYsvKtYeHNY8gSqgGO6FWImEe
 RPMEuMLvZHdQzD4DoZSxJo+yR//AgNNAU+Q6KpVDLQlyIzNE+fnjV5NA69w9mdIcojB1
 CR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANMpFHUuJ7AoaEIR0Mfi1Yglq+QTNbfCcaUKdxl54oM=;
 b=kK8nK4I2zYkE6gSgf+j7j228b+zan38QQBCbLNrKHOCzPm9zW3DdF8mY8F4QO7hMad
 9xHp8QtpDgvaB4JGZstTxYdSEPIMOeyPVhkenvUSpwEkNWPiqOhwsd4hsMwMgsQaEBr3
 p26j0rPmT0mZP0+V8LyRYupY3TWEa5T6TM4dP+FUyf3CsKTibCpKOea7iQclKjoY3uWa
 40qCFT3+dAtHP3HtQIaoIGhj0DX3dhsLT/yb9iajVc1wkidUcv6gMNU9N9ekmcqvVm1H
 Rok42K6zIjE9TjIAs90QZdNfCaM0m+bnQsQzKsA6RhJz4WIabS57oObEANFkkV3D69JF
 lQtw==
X-Gm-Message-State: APjAAAWWt3iv9BRFRClOuw6RieeYCbVS/BnIy4y8wMT73OUjtnRaKiIn
 eKKdG2hKO81uVl3omymysIEBEHsvHuyKfuy5+5fBbQ==
X-Google-Smtp-Source: APXvYqzaopuaYUqr3B668awTBBxMMz+ierAFISQIhE+3j4KVokdIsPwFPjjwv1X/LnQF7rKqW8YZCmf7n53HPoZyd5w=
X-Received: by 2002:a05:600c:108a:: with SMTP id
 e10mr2897384wmd.10.1579864723486; 
 Fri, 24 Jan 2020 03:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20200116133437.2443-1-narmstrong@baylibre.com>
 <20200116133437.2443-5-narmstrong@baylibre.com>
In-Reply-To: <20200116133437.2443-5-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Fri, 24 Jan 2020 12:18:32 +0100
Message-ID: <CAMO6naw79tYi7gbwVcHyTG=T=HTNPErp352ZdFOQqzZTvz=89Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: meson: vdec: add VP9 input support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_031845_711386_908C8492 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 16, 2020 at 2:34 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Maxime Jourdan <mjourdan@baylibre.com>
>
> Amlogic VP9 decoder requires an additional 16-byte payload before every
> frame header.
>
> The source buffer is updated in-place, then given to the Parser FIFO DMA.
>
> The FIFO DMA copies the blocks into the 16MiB parser ring buffer, then parses
> and copies the slice into the decoder "workspace".
>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

[...]

> @@ -186,13 +294,27 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>         int ret;
>         struct vb2_buffer *vb = &vbuf->vb2_buf;
>         struct amvdec_core *core = sess->core;
> +       struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
>         u32 payload_size = vb2_get_plane_payload(vb, 0);
>         dma_addr_t phy = vb2_dma_contig_plane_dma_addr(vb, 0);
> +       u32 num_dst_bufs = 0;
>         u32 offset;
>         u32 pad_size;
>
> -       if (esparser_vififo_get_free_space(sess) < payload_size)
> +       if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
> +               if (codec_ops->num_pending_bufs)
> +                       num_dst_bufs = codec_ops->num_pending_bufs(sess);
> +
> +               num_dst_bufs += v4l2_m2m_num_dst_bufs_ready(sess->m2m_ctx);
> +               if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9)
> +                       num_dst_bufs -= 2;

With the changes that happened in the updated series where one more
ref frame is held by VP9, this should be -= 3 to prevent a shortage of
CAPTURE buffers on the decoder side.

For the future, a good enhancement of the way this is handled could be
to notify new capture buffers to the decoding modules (codec_*.c), so
that they could pause when there is no capture buffer available and
resume on this notification.

> +
> +               if (esparser_vififo_get_free_space(sess) < payload_size ||
> +                   atomic_read(&sess->esparser_queued_bufs) >= num_dst_bufs)
> +                       return -EAGAIN;
> +       } else if (esparser_vififo_get_free_space(sess) < payload_size) {
>                 return -EAGAIN;
> +       }
>
>         v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, vbuf);
>
> @@ -206,7 +328,19 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>         vbuf->field = V4L2_FIELD_NONE;
>         vbuf->sequence = sess->sequence_out++;
>
> -       pad_size = esparser_pad_start_code(core, vb);
> +       if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
> +               payload_size = vp9_update_header(core, vb);
> +
> +               /* If unable to alter buffer to add headers */
> +               if (payload_size == 0) {
> +                       amvdec_remove_ts(sess, vb->timestamp);
> +                       v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +
> +                       return 0;
> +               }
> +       }
> +
> +       pad_size = esparser_pad_start_code(core, vb, payload_size);
>         ret = esparser_write_data(core, phy, payload_size + pad_size);
>
>         if (ret <= 0) {
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
