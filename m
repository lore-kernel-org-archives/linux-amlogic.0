Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE03C64E7C
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 15:14:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30768208FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 15:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30768208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZlClper/G6qp16fQVLQwPuJUX01qrib8v1JZKHM6y28=; b=gBZVTh2tItw5C3favBSUH90jJ
	EsUh0QV+NPqdRhMTNlYLaFoqFeDifZkR8JnI0y2UXrZbLyQUTlgA2VB17K95hHZzeXj+VdnTO6nIN
	borHTwqseDSJxIIRAFlMW1ioMK/2SuFmS330AON1DTIq0o1qI67YGhUCCQNNl0Gbx0VH1LiWT3oVs
	gs0ZX7mmXHNtt2nu7j/OdlkWtYPZIg78xqsHAJyNj2ifgBKKuUJ19Df+XfX2xoIhOSs5yazulLSfi
	97+CAx/fhyDVOucWPvWCQrGto4UlziRO2EhAHkCVDFznB/mwAqdw1nVwRipYbyQzEswLVkQinjMYL
	VOei/O7+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkTq7-00082b-1Z; Wed, 02 Dec 2020 15:14:43 +0000
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkTq3-00081S-K0; Wed, 02 Dec 2020 15:14:40 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id kTpvkF2vwN7XgkTpyktj1V; Wed, 02 Dec 2020 16:14:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1606922075; bh=ueykLDCb0hQH4lDcG1w/8WkuuuVBuvMx5BwvzcpsdSo=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=l0OGNwufxgHhKEZKfYeQ8h7HR+4+Dq/7AE1MtQel6eoevcZ4oS8HPU10WiW7gHH7y
 InGKl9D1mm+xKl5AyxrjIm+sG4c9UrlkqcNg+GSdKKJ4TDbflNA7pVR5PjVq9mLLD5
 QRr6hEIvU/rg3GR710opAtfMW7G1MJL7usZl9W+GQJpvaM1kTrw2L7TH/tkxZ3bjiu
 82TzvpLKszv9SkRFFhw69YXpDAcRl3mRNJ7xgoCFWK7XSpKSl+rDX+3Ktx8NnRU0Qm
 q3Vg6HBHFi7/3wxcR1VyhWB3uizBt7Dafd4jZ73awZGcXPwIhsEatL2nS5imj8/Wyf
 US9vt0UzwOfVQ==
Subject: Re: [PATCH v3 2/4] media: meson: Add M2M driver for the Amlogic GE2D
 Accelerator Unit
To: Neil Armstrong <narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
 <20201117084440.578540-3-narmstrong@baylibre.com>
 <3ce8d325-9d6d-9327-b019-65aad3fb1e64@xs4all.nl>
 <81cd2c1b-cfc9-0167-0e72-9f47b0887369@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <540b95ef-5815-d400-9214-87667c3b3777@xs4all.nl>
Date: Wed, 2 Dec 2020 16:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <81cd2c1b-cfc9-0167-0e72-9f47b0887369@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfM1UTrabwKVYI0PKqptLiQZMzq8cjf0fI/VmLxBbpPj4BVN1/RMgAETOTQOcA1DxrZQ87i6MNqpG2mfWGR6hDLCjDUEE4a3g9/+4hE4oS/V4gyjI5PCm
 Ro2DSD5C6xy4QDoO9h7FvaUgexpHxIVXZEYpLZVH+mZT0YxRiqldQVX6b3VoSQQjJadjpw1gU0vX/RbtQKMLlBuqI+nZ/lLW4T8BpjwAUXh7aJrX0P+IzmYe
 vCFGTbp5s4ayiEyrZisz5Wub6dExFNp4ZCc6Ewprf2vzfcQHCx4YWMFdEGK+vJM3+4EvYlu/XOxJy6m3OsHNmLs3OciKha0fVJ5OKMTKveG8sYjcuxLzL2q8
 dBEuv8hGGw1wrdsOLWO8lUiNonONdA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_101439_819532_604F1D64 
X-CRM114-Status: GOOD (  25.34  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 02/12/2020 15:56, Neil Armstrong wrote:
> Hi Hans,
> 
> On 02/12/2020 13:40, Hans Verkuil wrote:
>> On 17/11/2020 09:44, Neil Armstrong wrote:
>>> The GE2D is a 2D accelerator with various features like configurable blitter
>>> with alpha blending, frame rotation, scaling, format conversion and colorspace
>>> conversion.
>>>
>>> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
>>> - 0, 90, 180, 270deg rotation
>>> - horizontal/vertical flipping
>>> - source cropping
>>> - destination compositing
>>> - 32bit/24bit/16bit format conversion
>>>
>>> This adds the support for the GE2D version found in the AXG SoCs Family.
>>>
>>> The missing features are:
>>> - Source scaling
>>> - Colorspace conversion
>>> - Advanced alpha blending & blitting options
>>>
>>> Is passes v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit time_t
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  drivers/media/platform/Kconfig                |   13 +
>>>  drivers/media/platform/Makefile               |    2 +
>>>  drivers/media/platform/meson/ge2d/Makefile    |    3 +
>>>  drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
>>>  drivers/media/platform/meson/ge2d/ge2d.c      | 1091 +++++++++++++++++
>>>  5 files changed, 1469 insertions(+)
>>>  create mode 100644 drivers/media/platform/meson/ge2d/Makefile
>>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
>>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
>>>
> 
> [...]
> 
>>> +
>>> +#define DEFAULT_WIDTH	100
>>> +#define DEFAULT_HEIGHT	100
>>
>> That's a weird default value. I would expect to see some multiple of 8 here.
> 
> Sure, whatever the HW is quite flexible, I took 100x100 from the other 2D accelerator drivers actually.
> 
> [...]
> 
>>> +
>>> +static void ge2d_stop_streaming(struct vb2_queue *vq)
>>> +{
>>> +	struct ge2d_ctx *ctx = vb2_get_drv_priv(vq);
>>> +	struct vb2_v4l2_buffer *vbuf;
>>> +
>>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
>>> +		ctx->streamon_out = false;
>>> +	else
>>> +		ctx->streamon_cap = false;
>>
>> Do you need streamon_out/cap? Can't you use vb2_start_streaming_called() instead?
> 
> Indeed, I'll switch to vb2_start_streaming_called & co.
> 
> [...]
> 
>>> +
>>> +static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
>>> +{
>>> +	const struct ge2d_fmt *fmt = find_fmt(f);
>>> +
>>> +	f->fmt.pix.field = V4L2_FIELD_NONE;
>>> +	f->fmt.pix.pixelformat = fmt->fourcc;
>>> +
>>> +	if (f->fmt.pix.width > MAX_WIDTH)
>>> +		f->fmt.pix.width = MAX_WIDTH;
>>> +	if (f->fmt.pix.height > MAX_HEIGHT)
>>> +		f->fmt.pix.height = MAX_HEIGHT;
>>> +
>>> +	if (f->fmt.pix.width < 0)
>>> +		f->fmt.pix.width = 0;
>>> +	if (f->fmt.pix.height < 0)
>>> +		f->fmt.pix.height = 0;
>>
>> width and height are unsigned, so this check is not needed.
> 
> Ok
> 
> [...]
> 
>>> +
>>> +static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +	struct ge2d_ctx *ctx = container_of(ctrl->handler, struct ge2d_ctx,
>>> +					   ctrl_handler);
>>> +	struct v4l2_pix_format fmt;
>>> +	struct vb2_queue *vq;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&ctx->ge2d->ctrl_lock, flags);
>>> +	switch (ctrl->id) {
>>> +	case V4L2_CID_HFLIP:
>>> +		ctx->hflip = ctrl->val;
>>> +		break;
>>> +	case V4L2_CID_VFLIP:
>>> +		ctx->vflip = ctrl->val;
>>> +		break;
>>> +	case V4L2_CID_ROTATE:
>>> +		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>>> +		if (vb2_is_busy(vq))
>>> +			return -EBUSY;
>>
>> This doesn't call spin_unlock_irqrestore()!
>>
>> Do you need the spinlock at all? This function is already called with a mutex
>> for ctrl->handler held. It's unusual to see a spinlock here.
> 
> Is device_run also called with ctrl->handler held ?
> 
> The spinlock is used to protect against concurrent re-config & run.

Ah, I see. I think it would help to add some more comments.

BTW, do you need to save the irq state? This function definitely can't
be called from interrupt context, and I suspect that's also true of the
other place where this spinlock is used.

> 
> [...]
> 
>>> +
>>> +	platform_set_drvdata(pdev, ge2d);
>>> +	ge2d->m2m_dev = v4l2_m2m_init(&ge2d_m2m_ops);
>>> +	if (IS_ERR(ge2d->m2m_dev)) {
>>> +		v4l2_err(&ge2d->v4l2_dev, "Failed to init mem2mem device\n");
>>> +		ret = PTR_ERR(ge2d->m2m_dev);
>>> +		goto unreg_video_dev;
>>
>> This should be goto rel_vdev.
>>
>>> +	}
>>> +
>>> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>>> +	if (ret) {
>>> +		v4l2_err(&ge2d->v4l2_dev, "Failed to register video device\n");
>>> +		goto rel_vdev;
>>> +	}
>>> +
>>> +	v4l2_info(&ge2d->v4l2_dev, "Registered %s as /dev/%s\n",
>>> +		  vfd->name, video_device_node_name(vfd));
>>> +
>>> +	return 0;
>>> +
>>> +rel_vdev:
>>> +	video_device_release(vfd);
>>> +unreg_video_dev:
>>> +	video_unregister_device(ge2d->vfd);
>>
>> This makes no sense. If video_register_device() fails, then you
>> call video_device_release(vfd), not video_unregister_device().
>>
>> Just drop these two lines.
> 
> ok
> 
>>
>>> +unreg_v4l2_dev:
>>> +	v4l2_device_unregister(&ge2d->v4l2_dev);
>>> +disable_clks:
>>> +	clk_disable_unprepare(ge2d->clk);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int ge2d_remove(struct platform_device *pdev)
>>> +{
>>> +	struct meson_ge2d *ge2d = platform_get_drvdata(pdev);
>>> +
>>> +	v4l2_m2m_release(ge2d->m2m_dev);
>>> +	video_unregister_device(ge2d->vfd);
>>> +	v4l2_device_unregister(&ge2d->v4l2_dev);
>>> +
>>> +	clk_disable_unprepare(ge2d->clk);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct of_device_id meson_ge2d_match[] = {
>>> +	{
>>> +		.compatible = "amlogic,axg-ge2d",
>>> +	},
>>> +	{},
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, meson_ge2d_match);
>>> +
>>> +static struct platform_driver ge2d_drv = {
>>> +	.probe = ge2d_probe,
>>> +	.remove = ge2d_remove,
>>> +	.driver = {
>>> +		.name = "meson-ge2d",
>>> +		.of_match_table = meson_ge2d_match,
>>> +	},
>>> +};
>>> +
>>> +module_platform_driver(ge2d_drv);
>>> +
>>> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>>> +MODULE_DESCRIPTION("Amlogic 2D Graphic Acceleration Unit");
>>> +MODULE_LICENSE("GPL");
>>>
>>
>> Regards,
>>
>> 	Hans
>>
> 
> Thanks,
> Neil
> 

Regards,

	Hans

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
