Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D4EC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arOakihhx8Bk3GY+sg3DiQPwSRmj4z/UYGrWgNO1hlk=; b=t8KdyXe8rz89mb
	L0WkaCcHhnLcjwy+S7sARq2FttcB6teCQvD134dNzmRb4knIrNH4AGSjAcHL1AYWlA8nfj4rdjx0p
	pnEsK5dxfq6ccEOb+Jr0N1KPbLB6ccijF+MVPxdI7pom8t6awKDun0jCw9hJ7O81nLT0LQtAgJFM9
	wx0Hx7RzcEI8lhcBCroAY8OGARoP5BFd3sVuAUU90rw/deW6Wt9q0FAQd3br6xyy8HeNjZAgnG4CQ
	eTBEBn/1F+4kZRjeQ5HBeeQBt8rse+RQyAGCPwGeX/1WHlGVVJw2+LwgYpqVDN6NJiTM9ZV6E7Xj7
	1cNfsers8wUVPqxM0+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pecVd-00CdYL-30;
	Tue, 21 Mar 2023 13:58:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pecVa-00CdWr-2T;
	Tue, 21 Mar 2023 13:58:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 956CAB816A4;
	Tue, 21 Mar 2023 13:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAEAC433EF;
	Tue, 21 Mar 2023 13:58:32 +0000 (UTC)
Message-ID: <1a323f49-20e4-46dd-12ac-d991cd257330@xs4all.nl>
Date: Tue, 21 Mar 2023 14:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: meson: vdec: esparser: check parsing state with
 hardware write pointer
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Dan Carpenter <error27@gmail.com>
References: <20230123094300.2816812-1-christianshewitt@gmail.com>
 <Y8536BzbbghJt0G2@kadam>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Y8536BzbbghJt0G2@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_065839_089671_F95D6D0E 
X-CRM114-Status: GOOD (  29.82  )
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

Hi Christian,

On 23/01/2023 13:04, Dan Carpenter wrote:
> On Mon, Jan 23, 2023 at 09:43:00AM +0000, Christian Hewitt wrote:
>> From: Neil Armstrong <narmstrong@baylibre.com>
>>
>> Also check the hardware write pointer to check if ES Parser has stalled.
>>
> 
> Presumably this is something which has happens in real life?  Say a user
> has this hardware and is wondering if this patch fixes their bug, what
> does this bug look like to them?
> 
> Please add a Fixes tag.

I'm marking this as Changes Requested in patchwork.

Dan has good comments, and in general, if something is 'weird', then
it needs to be commented carefully.

Regards,

	Hans

> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>  drivers/staging/media/meson/vdec/esparser.c | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
>> index df5956c6141d..41b705f999b2 100644
>> --- a/drivers/staging/media/meson/vdec/esparser.c
>> +++ b/drivers/staging/media/meson/vdec/esparser.c
>> @@ -300,6 +300,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>>  	u32 num_dst_bufs = 0;
>>  	u32 offset;
>>  	u32 pad_size;
>> +	u32 wp, wp2;
>>  
>>  	/*
>>  	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
>> @@ -354,15 +355,21 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>>  	}
>>  
>>  	pad_size = esparser_pad_start_code(core, vb, payload_size);
>> +	wp = amvdec_read_parser(core, PARSER_VIDEO_WP);
>>  	ret = esparser_write_data(core, phy, payload_size + pad_size);
>> +	wp2 = amvdec_read_parser(core, PARSER_VIDEO_WP);
>>  
> 
> Why is check not done inside the esparser_write_data() function?  It
> really feels like doing a write where nothing happens should be a bug
> for both callers...
> 
> The esparser_write_data() function returns > 0 on success, 0 on timeout
> (I guess timeout is an error-ish) and negative if the user presses
> CTR-C.  There are no comments to explain the unusual returns.  Could we
> clean this up so it just returns negatives on error and zero on success
> or if not then let's add a comment explaining what's going on?
> 
>>  	if (ret <= 0) {
>> -		dev_warn(core->dev, "esparser: input parsing error\n");
>> -		amvdec_remove_ts(sess, vb->timestamp);
>> -		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>>  		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
>>  
>> -		return 0;
>> +		if (ret < 0 || wp2 == wp) {
> 
> So in this patch if there is a timeout but something was written then
> that's kind of a success path?
> 
> regards,
> dan carpenter
> 
>> +			dev_err(core->dev, "esparser: input parsing error ret %d (%x <=> %x)\n",
>> +				ret, wp, wp2);
>> +			amvdec_remove_ts(sess, vb->timestamp);
>> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +
>> +			return 0;
>> +		}
>>  	}
>>  
>>  	atomic_inc(&sess->esparser_queued_bufs);
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
