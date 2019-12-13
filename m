Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D58C43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:26:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4AE82077B
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQJ8t1vH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="AdH5iv0Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4AE82077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDuaQsSnisSQ+ivPhdtMr0STtK2nKCFNNWeMnlxdZIk=; b=KQJ8t1vHXsz40i
	VDvglJb9f5I9Kv2lYtmPGCgypeH4YlKqBYzjA4TSB4lqt/ZM12ZhUOiFKn5usW98pDm+dSue+/AaN
	8Q+pJxiT/RP8MkedYP/jO/CpumyxnwdgUOQ1+kCG/vX5yR92kbfVbBpnHBm5irl2T44sCeQ4Wkx5a
	NfXI+2xyBxcG5Khnef6XLOuDdAQd7ljwPuThQDm1yQ/OMn+xJWkCtVz6TgCuz9vwt6SBc9OYwH5T/
	hqUZvR05jbdpi+O0R1Dgv1L/ATyP0EYB4VbHCyWyarQRWS/iXv8zwQugewKdsnGN/N/E0uJn7tUhL
	Q0cjq5pcDfyd6Qm3XxwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifkt5-00043r-2n; Fri, 13 Dec 2019 13:21:43 +0000
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifksz-00041a-6C; Fri, 13 Dec 2019 13:21:41 +0000
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
 by smtp-cloud9.xs4all.net with ESMTPA
 id fksoihjoeGyJwfkspi1ER9; Fri, 13 Dec 2019 14:21:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1576243289; bh=7EgWnmlezgqj/BVCt+K0pvVbA4FXbio5mhVaiZ5dfQs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=AdH5iv0YH+McIOrsn1DAaopGdWufZ29ioADupUDcGxWk1oLktScwdR5k9bi0JYjtg
 OEJK6H7Fs4R+OjlFrPBN4D0PRNP5Wlu8iyhe2rW2cTOe9a5r07vHBWpV+1CiGFxEit
 FDmKC4Ad2ub/oF4hqHsgOFOlZVxT1VPQmEfUvBA6OpYc84sg2ABsUu5DDgjqrLAGqi
 9P++BEXVdoVvRdzUPw/lz2ko24IEbZDeawl3d5bm1HVwMbvP/QFwC/h3KjwxcDEXKd
 dGTRPc7vl+n5+2qN5eSI/APzP226yXtfpxo8ojhRe2fG1eTM4qjmXWj6nUZtNOy5S3
 GnxofjNCHZf+w==
Subject: Re: [PATCH v3 2/4] media: vicodec: use v4l2-mem2mem draining, stopped
 and next-buf-is-last states handling
To: Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
 hans.verkuil@cisco.com
References: <20191209122028.13714-1-narmstrong@baylibre.com>
 <20191209122028.13714-3-narmstrong@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0eb52de8-97a9-40cf-a926-262b1ecdc3e9@xs4all.nl>
Date: Fri, 13 Dec 2019 14:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191209122028.13714-3-narmstrong@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCTmMw6UMTjLOJUPkCDlqks83iiillHmwdMzsgRBSoe9Hv36xB2m2JCtI2vE2e4HNUGyqznMLbJoF3O9tW1gv12rxYmLfCQHCIdKdX/s71xthDM0vOuU
 HptJYccltFJSVGvxkzTfO99gMJZGZHBu5Vaz88vywlnqQyIHp7vUCxeCldEda8taB9ZWImjzwda5M8IGmaVSwhVj/RtSopo8exf74kxYjqitarmaTOAGUEXy
 vrzJ4cE+GJJJMmriatdi6aScio5XLtqjkI02MJ3d+f/ClZOULw85BjGx+ORfwXifQSucKlUlhu/xQzwlpjCEAGZXUUFdP4dUcUqtZXKVCsKq6dC7S9BG2fib
 U2B6nyFsPBXuSCSUEXYE6U+PLxXEOBxttOov6+KYCDYkbns0RFk6rnSCz50+rb1qFMCepkIn8mY+WPW+tp+kCXYaMTbI7Wndg8mxwSJ5BgIxf+ZL3TiWviKE
 mphrMYzQ/VJUOTuejb9Z9e5J+hETayO1cXafObf1FnWicRf6w1sQNFZY5t2uDbKz4tzh1UjYQ+YeTUf1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_052139_093348_C47AFE4B 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/9/19 1:20 PM, Neil Armstrong wrote:
> Use the previously introduced v4l2-mem2mem core APIs to handle the drainig,
> stopped and next-buf-is-last states.
> 
> With these changes, the v4l2-compliance still passes with the following
> commands :
> # v4l2-ctl --stream-mmap --stream-out-mmap --stream-to-hdr out.comp --stream-from in.yuv
>>>>> <><><><><><><><><><><><><><><><>< 15.53 fps
>  15.53 fps
>> <><><><><><><><><><><><>< 13.99 fps
>  13.99 fps
>> <><><><><><><><><><><>< 13.52 fps
>  13.52 fps
>> <><><><><><><><><><><><>< 13.41 fps
>  13.41 fps
>> <><><><><><><><><><><><>< 13.21 fps
>  13.21 fps
>> <><><><><><><><><><><>< 13.09 fps
>  13.09 fps
>> <><><><><><><
> STOP ENCODER
> <<<
> EOS EVENT
> 
> # v4l2-compliance --stream-from in.yuv -s
> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
> [...]
> Total for vicodec device /dev/video0: 50, Succeeded: 50, Failed: 0, Warnings: 0
> 
> The full output is available at [1]
> 
> # v4l2-compliance -d1 --stream-from-hdr out.comp -s
> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
> [...]
> Total for vicodec device /dev/video1: 50, Succeeded: 50, Failed: 0, Warnings: 0
> 
> The full output is available at [2]
> 
> No functional changes should be noticed.

Ah, unfortunately there *are* functional changes.

There is a (much) more extensive test that is done in the test-media script.

In v4l-utils, go to contrib/test. Now run (as root): test-media vicodec

This test now fails on some tests for the stateful decoder:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
                fail: v4l2-test-buffers.cpp(943): ret == 0
                fail: v4l2-test-buffers.cpp(1353): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test MMAP (select): FAIL
                fail: v4l2-test-buffers.cpp(951): ret == 0
                fail: v4l2-test-buffers.cpp(1353): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test MMAP (epoll): FAIL
                fail: v4l2-test-buffers.cpp(943): ret == 0
                fail: v4l2-test-buffers.cpp(1607): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test USERPTR (select): FAIL
                fail: v4l2-test-buffers.cpp(943): ret == 0
                fail: v4l2-test-buffers.cpp(1761): captureBufs(node, node_m2m_cap, q, m2m_q, frame_count, pollmode, capture_count)
        test DMABUF (select): FAIL

I also see this:

cmp: EOF on /tmp/tmp.7KAXKAIkVZ/raw.yu12.1280.24 after byte 23500800, in line 1

which shouldn't be there either.

I can recommend the test-media script: it can test all the virtual drivers and it is
part of the daily build to check for regressions.

Regards,

	Hans

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
