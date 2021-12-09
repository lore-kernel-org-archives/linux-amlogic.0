Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F4C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Dec 2021 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HtHZbl5J8ejT0QKxykb9MfqIU8bTrvgRPlxPlGEaZ1o=; b=lO7Y6oKthnVuuScaubaSWMCI/Q
	k3HwLnNwNyzzczuqHinMXasZSRFms5YbapHQKl0V7K1tlGPbRZAULkFAPC1+BRMw70t/hqxEgP7vD
	RoikbsD0WBXcK7TjSUIuFwEfqDBm41GYJflcqIyWjj2pBldtDhK4KWgr3Ev0daJsed/9Af8R+6W2f
	XFVmUQUWdCWUbe0pThmY96kbV9+e/vQVVJpZNfkG2UmsipPEi/Bjdhknv61jPG93UsEALEvwBRnFv
	/vigU7rGdRjxgDqSQ/PIA8X1lYtlbZrRDUYD5jJaQ9vRmPl9i+ngwu9V/vwBlK9mZXp2M9Iu30VMK
	tKWyNhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNg7-00H64o-Am; Thu, 09 Dec 2021 17:57:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNaZ-00H4Qb-Vf
 for linux-amlogic@lists.infradead.org; Thu, 09 Dec 2021 17:52:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4717648wme.4
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Dec 2021 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bd8+kTrTfhFU5QWPnGzZKoBEXJcLIGbK/BR+H+0gbYw=;
 b=XbFa42nnAwDGxO66/HbO3nB2gPzLqX2MOc+1zouWEXl3y62x+JQixZnni2tTWFd1CI
 mFZs+VL2zwSM+nOzrmeBxhvLkGHZZUO24TnH0JAKdpbly1p+jK6L5LOjAaTq7kqR70/q
 dH/ZA0AQho791bypxmO/O605uUfAUi5Mam0+utMXeo2MO9Zr3FJNU8Mb3QX+q7RFD06O
 DfNKHxZ4UU4Cor8daNfV2JclnpukSCkUS0TXtEkM+6bjsBMz8CJpl5Q9x2jJe4KLtejM
 ggJMrX5P1niJ6l+JHs2F/aRrfM8IxpyGzvibQ/im15eeGdFDrxxN8oLO5Odg1QHUWYb2
 YngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Bd8+kTrTfhFU5QWPnGzZKoBEXJcLIGbK/BR+H+0gbYw=;
 b=EJZVuRUUSkbpLzpp/YpOj3ekaaGZE6TSK71m3bYEahwb3UygHPTOJGO4ocC0YXaaRd
 25sbDnV5YDQBchabD3U78LtEe7Oo8KFftH6Av4Xpv31Z9KKMhZCs48fNBe+E4dPBBCde
 Bp9rZgBKwE+kV3kJfl5j38LlFNk8r+7EwKN3352+r2iiIELw9VVnNW8Tk7q6zAvCjXsr
 KcPHEzWcgqj6IylrRhB5y5tt3l5byINGC4U3yuH8XaPlMoPzTLmqZKhgBijgDpHqqUSQ
 wHMtBpCKaSHJkEPvwDMJiZ94pB2FtFI7M6kGwFtDIfG6FHWj4XRTjVyE4YGk84DZGE7Q
 SBzw==
X-Gm-Message-State: AOAM530JZ7lP9jxFhX585wLOB1bLhp9dhwemjEiDt9a8QI6q5aYNf1fx
 0mpWMm5+xL2vze7Wq7AqFP5xbg==
X-Google-Smtp-Source: ABdhPJyMie+a/YOeewKo1Obvu7zuEr3tSxdpZfoN/rSq9A/nErVJDjjw8oiP8Y9G/3nEDK98Fbtfqg==
X-Received: by 2002:a05:600c:3b27:: with SMTP id
 m39mr9397831wms.132.1639072334313; 
 Thu, 09 Dec 2021 09:52:14 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ee1f:92e9:bcbf:be87?
 ([2001:861:44c0:66c0:ee1f:92e9:bcbf:be87])
 by smtp.gmail.com with ESMTPSA id b197sm449999wmb.24.2021.12.09.09.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 09:52:13 -0800 (PST)
Subject: Re: [PATCH] media: meson: vdec: potential dereference of null pointer
To: Hans Verkuil <hverkuil@xs4all.nl>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211209085840.2081024-1-jiasheng@iscas.ac.cn>
 <bfd1801c-9d1e-0574-a237-711d3d5ae755@xs4all.nl>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0c1fadf0-e7ba-fb7a-822d-6787f78faaad@baylibre.com>
Date: Thu, 9 Dec 2021 18:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bfd1801c-9d1e-0574-a237-711d3d5ae755@xs4all.nl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_095216_184396_C49EDA26 
X-CRM114-Status: GOOD (  18.76  )
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

Hi,

On 09/12/2021 12:58, Hans Verkuil wrote:
> On 09/12/2021 09:58, Jiasheng Jiang wrote:
>> he return value of kzalloc() needs to be checked.
>> To avoid use of null pointer in case of the failure of alloc.
>>
>> Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>> ---
>>  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
>> index 7f07a9175815..025885fcfec6 100644
>> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
>> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
>> @@ -234,6 +234,8 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>>  	unsigned long flags;
>>  
>>  	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
>> +	if (!new_ts)
>> +		return;
> 
> While this avoids dereferencing a NULL pointer, this error isn't propagated to the
> caller. And I'm not sure if that's right.
> 
> Neil, what should be done in this case?
> 
> Regards,
> 
> 	Hans
> 
>>  	new_ts->ts = ts;
>>  	new_ts->tc = tc;
>>  	new_ts->offset = offset;
>>
> 

Probably something like this:

===================><=============================
diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index db7022707ff8..df733eff9ac7 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -328,7 +328,11 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)

        offset = esparser_get_offset(sess);

-       amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
+       ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
+       if (ret) {
+               v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+               return ret;
+       }
        dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
                vb->timestamp, payload_size, offset, vbuf->flags);

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..593b2ccbece2 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -227,13 +227,15 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 }
 EXPORT_SYMBOL_GPL(amvdec_set_canvases);

-void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
-                  struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
+int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
+                 struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
 {
        struct amvdec_timestamp *new_ts;
        unsigned long flags;

        new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+       if (!new_ts)
+               return -ENOMEM;
        new_ts->ts = ts;
        new_ts->tc = tc;
        new_ts->offset = offset;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index 88137d15aa3a..4bf3e61d081b 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -56,8 +56,8 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
  * @offset: offset in the VIFIFO where the associated packet was written
  * @flags: the vb2_v4l2_buffer flags
  */
-void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
-                  struct v4l2_timecode tc, u32 offset, u32 flags);
+int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
+                 struct v4l2_timecode tc, u32 offset, u32 flags);
 void amvdec_remove_ts(struct amvdec_session *sess, u64 ts);

 /**

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
