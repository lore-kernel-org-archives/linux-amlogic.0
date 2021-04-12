Return-Path: <SRS0=YxYw=JJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7A3C4363C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 09:18:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E7C6102A
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 09:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E7C6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qayaDn3X9dwcVpBoBvDTlDcGnYov78fyrO7P0pIr1Qs=; b=p+GWjcRUwTs/vl4Ps7uRQ/RoD
	cBqhCziDLq4MR2GjXm9bFhOopL3teqf00+FugStOjw6s5MLlSTWqFp+R3k6reGUpqI53xoXfXu200
	kfLt9UAfjk8E/Z3Cg4d/okCvxMvjxTH36uinFf9wn4nwdwzpXnNeWMkrKUYxoI/Qwl0Ya63d/9ifS
	i8yvE5BS8Xd4K4Sa5S3XpJ1GlmLH4s8q77k7a9pz4Rgw3xXkv9SfXjP+MkG54dlVC9uLBW6MHYWSN
	r35aiMOpZeQsLmRtF7TxhEk0oepfWObShBsnG3JH4tKSw3jcHF6dKjL/LrrAEl8BpqpVW1cIn9ujF
	pKyWZKD2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVshe-006FTc-PZ; Mon, 12 Apr 2021 09:17:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVshZ-006FRs-KY
 for linux-amlogic@desiato.infradead.org; Mon, 12 Apr 2021 09:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Q1WZNfMjfd81Sw0tEZCD6aKfvpmjF/TsYGs4OFIOV90=; b=zo1ozG+2sHP5UHHk6k065UA9GY
 cv83W72htad83NGSDpLaPbAHXIPs1dhOv2Q2qIoUSOsMEgCK3aCvaxXvAOvvXFEKiMxres0DCPVZV
 VrLuLO1ZWOpj2e/TnTZXfrlcHUbyXjf5AO/ijC5LC/A0TA1dDLFHshkgWqmI+4JpVRb5ra2+nYM5A
 6Be1XJpX5S4fM0GbjG0NNjYBu7s6A6sSKvU0Px3WEvzKwm8Y90YLSeWg4xO3Wty0IvC+Zp7oQS9j7
 f68nJPcVW7DJqYYPm0jIBLRKzQ1P7qYO4C9mezzg0YdJFQ/VS1iFn7R8s/4Hg5trOSnD7vyxMbH6A
 j20AtqRg==;
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVshW-0062fX-9L
 for linux-amlogic@lists.infradead.org; Mon, 12 Apr 2021 09:17:48 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id Vsh9l4ds1MxedVshClcWf2; Mon, 12 Apr 2021 11:17:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1618219057; bh=Q1WZNfMjfd81Sw0tEZCD6aKfvpmjF/TsYGs4OFIOV90=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=o+/G/vwvsxmiN6f9yPpXnexKz/biPXZQl/+q892dF7qwphl7qU7rMSNrkay5sYpmY
 EiBXWrQ4kCGqRas76lMzhtLD84rQmBkKsY6jzbxOP8D43FEKi634GKRzFDUpp3Rnv9
 v7l53TByppykUspP8DbzfNCTVzS+RSY70u2AKjW39vL4uqzY8b1nMYi13rfLAYGpFD
 /vrSaVeIVi1j525TMHSY5pwjlNVrkiQunNBXLcrALw0J8AbD80AeYRjCvEU6pUO7/g
 EnGxIn8SR6pfEWuI+k9aads8Cqqr5VgDgStsbvRBxNwfdiBcLyL0cGg7/Ep3UeMOup
 sLwdMicOoo1jQ==
Subject: Re: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
To: Mitali Borkar <mitaliborkar810@gmail.com>, narmstrong@baylibre.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
References: <YHIDufKhTEeuxyl5@kali>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>
Date: Mon, 12 Apr 2021 11:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHIDufKhTEeuxyl5@kali>
Content-Language: en-US
X-CMAE-Envelope: MS4xfBXMnifIVjZ62y0VHvnBJNSP+hYxNbiNOZUfNetfEJgBcv5GMZ7getv0zN6yKyIx13mzQ7aTrYqwCmTTMLYyK7NQCiI56Mim4l4qN7U1OJEtPirTxTaG
 wAIJSK62f+3rEUKw6xbtNv93Z77fl7qctwlLxqDe/ABpVE3pcRpcNdMFZovtEeo+aq1rBpa/w26EwT0OhPBPZA4A8uyyVCN6U4t7nCy69kzZHrjV88ZyihYT
 nTWyeUBWznOsD99N+Dn/DWVtt+XGQ59EpzKaYyLvnG5kGOSdNGVCL4nZprNPI0dqkoZZQ+sVfCgFiaPDHfsipka8aV8WLWoP8V1WIlkZ8Ab62W7YsVYaQ3iO
 ansPPfKTP4dfu8bD+NIMZb6vWnjsNYwWo4faIFL1SSjvcpDCu/m82sq5S2aA0a2n/2G9W/t6z3cIkeyVMXyr/drugGue6ygTa3dtYumausj7yBx2EhGaj9LG
 EbX73dVXhEcsdkUwsESaJjcVx4quNChI25SjjPB3ol3wmWm6RbfO8xs6Zht/yWosh3ksT4xs9eE7f2tQ3uYfGa8XgXlY4iSeYdVzPpARdpFkuVXzsxTWaxX7
 hcsVUTO77rgfsjK0ekHUKUwzthrqK00iSKv2LEGjkA/6/YVG1NDn9tMCPbJVjKFqtgm5eKjBGTFcbJhOiVYIIUR2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_021746_487837_32D2BCD4 
X-CRM114-Status: GOOD (  17.43  )
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

On 10/04/2021 21:59, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function and
> replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
> This indicates the value of canvas indexes will remain constant throughout execution.
> Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
> u32 reg_name as it will contain data/registry bases to write static
> const indexes declared above and will keep track of of contiguos
> registers after each reg_base.
> This makes code look better, neater. It improves readability.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--

Also change drivers/staging/media/meson/vdec/codec_h264.c.

It's a nice improvement, so let's do this for both callers of amvdec_set_canvases().

Regards,

	Hans

>  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
>  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 21e93a13356c..861d8584f22f 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_mpeg12 *mpeg12;
>  	int ret;
> +	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
> +	static const u32 canvas2[] = { 8, 0 }
>  
>  	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
>  	if (!mpeg12)
> @@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>  		goto free_mpeg12;
>  	}
>  
> -	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> -				  (u32[]){ 8, 0 });
> +	ret = amvdec_set_canvases(sess, canvas1, canvas2);
>  	if (ret)
>  		goto free_workspace;
>  
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index 7f07a9175815..df5c27266c44 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
>  }
>  
>  int amvdec_set_canvases(struct amvdec_session *sess,
> -			u32 reg_base[], u32 reg_num[])
> +			const u32 reg_base[], const u32 reg_num[])
>  {
>  	struct v4l2_m2m_buffer *buf;
>  	u32 pixfmt = sess->pixfmt_cap;
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
> index cfaed52ab526..ace8897c34fe 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> @@ -17,7 +17,7 @@
>   * @reg_num: number of contiguous registers after each reg_base (including it)
>   */
>  int amvdec_set_canvases(struct amvdec_session *sess,
> -			u32 reg_base[], u32 reg_num[]);
> +			const u32 reg_base[], const u32 reg_num[]);
>  
>  /* Helpers to read/write to the various IPs (DOS, PARSER) */
>  u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
