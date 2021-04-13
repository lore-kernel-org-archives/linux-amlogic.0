Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54C8C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 15:10:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E12613B3
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 15:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E12613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hps/5FaWLpKGzLMOfgKpfVSN0ehNa6PN/UWuprhheZ0=; b=XcNdfcs99Uhe5GA4B7KMoh0Ka
	Yyby3mydKTTM8mSqyLfSV1lM5aBi6f1/TMaF7O/nABw2hHtFaLWp/56WHl2dSi+BLzENp8gDH38u+
	cb+tPuCs7nFnqucF+z0O3eygY9Gt0MZVbXqwGsrKhR3x7Lp2472+2Fv+mNPIY5x8Ff4hetQmqPcwL
	sQ/H0YoTEPtEBUsOFK88Tsdlxn5Q5oI4EPkaYRfHwzRzdOv5Uc0u9JLBP/9E9awleGEyj3K1qNw7y
	HY/LHxB0dFCrZ+5IHH9UmzkryPKGg3zPKEz2x/2/gheekNflPAkSD6QNKD7hDci+dXX017F+G2SCh
	WlXhClynw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWKgW-009bQ7-Hw; Tue, 13 Apr 2021 15:10:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKgL-009bOa-FF
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 15:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=APSrpDri2gHEYWyjG8TbwYgAolOfNqXeXdzok49rhQM=; b=yaquIVXP7+rvqOt0FXiEZJ0Z4m
 PoPMQNm0GSvkjysI5UqvXOOguEmdCJLwLL1BFMlhpXCRqkE9r8hcraUAb0y4oErH6l90cF1a+Blkb
 uBKxHW2zN76H+uL0l0R8nGg/LDKw4zQikWgRnu5sbdF4EHVmp68tHiumeVxCWutryI6YkiMQQq0+o
 FS/M0u+wetQZ6u6m7yb/d3aMDTKlReAiADwP+NmSuO43ie6s5Dg+/caWTlSxiIhMd2MQpv7a74TTp
 Zx+DA1o/4WRUGjkOIQbiPHIyxZmOaCEXhTv95xK1j4ltJ3/+6EERAL7BoYumd6cJHBHbhwiPV8OpS
 tMunPggQ==;
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKgI-0078A2-Pl
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 15:10:24 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id WKg5lFlIKMxedWKg8lj9kz; Tue, 13 Apr 2021 17:10:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1618326617; bh=APSrpDri2gHEYWyjG8TbwYgAolOfNqXeXdzok49rhQM=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=DUMMkDg3NE0JepjNZ6wA6SkSGRf5FFUN6K9xFcejyHDe4QtZZHwZGeDeUDxKASkgM
 YnXde8OKmHqkYDVv0eni6NwWsAyP0s7tXZtpCsbNeX+kFZAVencNtv9RUDEYqc0Mk1
 C8DAFYh4mW86MIU1gajAETC0p2WS6C7a6+Afv0B7sxxsk2K4sqQYobr64jyEavX/6t
 WBfiVclE+eQthhTYjkK1v6cw6ixkwTuqG6xyaFde5VCyTWb1g7P4agJpDOXulAWyI6
 1bR7PRI/KGvnkyVgzoiUGQmUnQ1toVefAQw+5+z1y8J8y29w2581Y3/H89hOKLVzhV
 8b4gaPORGGJKQ==
Subject: Re: [PATCH v3] staging: media: meson: vdec: declare u32 as static
 const
To: Mitali Borkar <mitaliborkar810@gmail.com>, narmstrong@baylibre.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
References: <YHWmiBYAbOUw5YrY@kali>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a7162f8a-e706-c144-c355-7e2a130c453d@xs4all.nl>
Date: Tue, 13 Apr 2021 17:10:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHWmiBYAbOUw5YrY@kali>
Content-Language: en-US
X-CMAE-Envelope: MS4xfOp7iwyIYwwEGU6SZLgtanc/6jZz3y+gJlF5rx1w3QIiBopfW+X08QRP5Q3HsQMW4Oi6IwSkpRk4fHgoShiyLN0l6YZtbwDMvSRK8CbjBM1fMSdDMKv7
 SKoWodaiijQpgUekfb4A/mi5fvm+KScYddjHWQ6PBb3c3cR+Lp3jrymUDSg2hdEHWRRIpG49cUwLGVU5TwPpXx6mn2f8OllcYxs/pXZKJP5P552gJ6W0S2nc
 6VnbQul+cFr2w4p5cV85iBKhtzNMXtDZSFAxG2j11Qe4RNeGCLOYu3BfooODMlB/jkfZx+0F4amJGmk3vESY26uvt+keLZ6i+wgGr0lW/r0UvxLLSX9AoP/Z
 Clp2QhI+8W01vyQ+2dEn+1Wj7v1g9VsOYppMwZBScmzzv111S3OwJ7ik4vGnkZDkrHYH6u54hSghA4RO0LTPQMabuolnJh1X/XI+9sfznWdeEKMcz3jl3MJc
 5nfW4UL4XTcjcJktxog8gbj81l/tb4yOfsKwsNhx0PyP/9qab6bTfmHDdU4O0DJGVYACb2RwFIoh1UX0NnzOJWubRlDNlesanw0UpfDsAKaBYEyJ6lafvldt
 X4cC46z1S6rU19UA+hPpOTcZq5PLMhdvP0J7Jw4McF6umGlH9LXQQuw/RKJ7+NcX0UJ5YuhvRTcIwnTRxBMV1QQi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_081022_995182_943EB600 
X-CRM114-Status: GOOD (  13.99  )
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

On 13/04/2021 16:11, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function and
> replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
> This indicates the value of canvas indexes will remain constant throughout execution.

checkpatch.pl output:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9:
This indicates the value of canvas indexes will remain constant throughout execution.

Regards,

	Hans

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> Changes from v2:- Rebased this patch and made changes against mainline code
> Changes from v1:- Rectified mistake by declaring u32 as static const
> properly as static const u32 canvas'x'[]
> 
>  drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index c61128fc4bb9..80141b89a9f6 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_h264 *h264 = sess->priv;
>  	u32 mb_width, mb_height, mb_total;
> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> +	static const u32 canvas4[] = { 24, 0 };
>  
> -	amvdec_set_canvases(sess,
> -			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
> -			    (u32[]){ 24, 0 });
> +	amvdec_set_canvases(sess, canvas3, canvas4);
>  
>  	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
>  		h264->max_refs, sess->num_dst_bufs);
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
