Return-Path: <SRS0=nS3V=JR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA52DC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 15:13:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123C361354
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 15:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123C361354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8t3/8oJoq7pX4UqJf8n4kUdbHSrwasP9/5kPGtRaoTY=; b=qkCqz93MH7DmJwbBg1sl3D511
	JaE/iYjibSjoATgQEJs+if5GBRARcrwn92AXGjwbsq3hR+eCtKKz+kt8hmClb2C5mwiY2gyfrmwoj
	GK5OysCozf0JU/4iK5zaAfSKxT0e1qA3bnKX6jokjw0zgzG3GvwdhRip8r8Rezns7bKHyEpj4d2sx
	cWzRE0kmnoeZAYhVziSjBonpJwPEtgHVJBNoffEU+jCSE46kLtpLXGWXxtKJbtwAFCAMqWsZpvp57
	HF0mKBcoCYVf5w60RuDpwzKwS3c3TX79nihz4dKsVFHcgCXinqtUQHOd/e/9YiktRdSaRsiU0HTZl
	Ns7w0S7sA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYs4H-00CR7p-4c; Tue, 20 Apr 2021 15:13:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYs4F-00CR7W-Ia; Tue, 20 Apr 2021 15:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=3C0exdyZaQiSGldksQpZfnPH4H6n3fld0R4rJ3LKuto=; b=K0hmQSxATY+O54f4HhQIjknoRx
 5tL986yhWVh7QbObjOavKnavDz4uf6Vss5fROloJwkfoVTu0Qx+cT2lff0XYeeK1squK487LtI+9F
 zqw5tHu3my3ERrWsjV9L1+hjqgU/5gXe88FZfb3e5LpWsDFOh+AD9db26xqDPgmA4T5gvm8248p87
 FUWWYelNW76H8+iwQhbs3keubAzO7iUZc9nBlL7qTuFm+yjdXKtBmweZ6Ja81e1ExgPf+arOKwXJh
 nC1tpPZVvb40Vs0zglTHFq173vgZK79wCPLvFRmvoBrE2IVXu0Omhgx0XOV9Rgx20pfqTqyUpbjIO
 dXnU7Ztg==;
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYs4B-00CE0l-7M; Tue, 20 Apr 2021 15:13:34 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id Ys3vl5TJaXsivYs3ylst79; Tue, 20 Apr 2021 17:13:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1618931603; bh=3C0exdyZaQiSGldksQpZfnPH4H6n3fld0R4rJ3LKuto=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=faFGkgmY+B8OeIIURy0DFsuAbHMupaVe/9aNrM6VvIbe/W57NLoMWWSMESk5QY8Mv
 n6tLBR4pyo0o91lIGrn6sNl2wmwznlxE830j3WOD2ZfPootYrQ6IRQKP/VtAIl1ytH
 tLKU4eu62zu42AMFf8fe6XzdBOyF+afxCtaDmzt/mlWZJJWLnOEY1rUWO4QNtp4Mec
 npKbjyUmVTp0Hp3A15qu/8EDhxNQ5DFdXCP92YdkBt/lBhWs/fAwbLxE/9NyyPADYl
 MdiH7nRqCaGbMTQ/QfFG1OD+JyUnocoiNtNTkk4/9F0bsfYjzjysfhBmP+JidXVYI8
 rRKYhktmGtP0A==
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
To: Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
 <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cbea511c-5d5c-8c59-f91f-fedc8eec1e39@xs4all.nl>
Date: Tue, 20 Apr 2021 17:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfDW8hEuWfrPrGvMc0olaEqO/1NZZ2yQB6WunaYVqq8MMrH5Sc3f2aTH42A3BAjZZ79UDFNJG6FEQbmiNEveAXU3jrDh9BPb7rKQsNBZlxBJ8G9LkTDpz
 qxD/6CMKaS6Mod/qRe9vKOOIJ0qV7CLLV9nRS4hIecITZIXQXzbDAlVTCwWTqHMCorEplxuE+o/YBuut6nfaMaa3Ijr5cKzPw6kVDFlBvZNyPxmRhGZQxrDD
 lbnmm4/1h7S6WfPi9kBv4XRwTHRmUUsfEvn1n1x31yag5ccdCETr3Mu11F844QoH7Hz9pZ9wJL57yz6y41Ka0ZRq+bj2Wspex/50krDYACnhAjPyU5Urmtjo
 +lusK7ss2EGSSUnMMynnA9PjXZfNZZo1Y8DpEMmCV6OVxRhhWm2kwStujrbXHcMLFNrrLNmvGJgJIAnhdi9X54VlwkATGdoQUB7XzhATvxXrj2qFPLhowZCr
 VTzjeVy+XJaKyFVHeN2b+67qyM+FfTCKZWdvDaO7ypk6d4e2gqPC34T4vMA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_081331_448020_D2B93574 
X-CRM114-Status: GOOD (  27.22  )
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

On 16/04/2021 13:38, Neil Armstrong wrote:
> On 16/04/2021 11:58, Laurent Pinchart wrote:
>> Hi Neil,
>>
>> On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
>>> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
>>>
>>> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
>>> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
>>> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
>>> confusion when the DW-HDMI CEC controller can't communicate on the bus.
>>
>> If we can't trust the CEC config bit, would it be better to not use it
>> at all, and instead let each platform glue logic tell whether to enable
>> CEC or not ?
> 
> Actually, the CEC config bit is right, the HW exists and should be functional, but
> this bit doesn't tell if the CEC signal is connected to something.
> 
> This lies in the IP integration, like other bits under the "amlogic,meson-*-dw-hdmi"
> umbrella.
> 
> The first attempt was by Hans using DT, but adding a property in DT for a vendor
> specific compatible doesn't make sense. Another idea would be to describe the
> CEC signal endpoint like we do for video signal, but I think this is out of scope and
> this solution is much simpler and straightforward, and it's more an exception than
> a general use case to solve.

While a DT property might not make sense in this particular case, I still
believe that it is a perfectly valid approach in general: whether or not
the CEC pin is connected is at the hardware level decision, it is not
something that software can detect. If the designer of the board didn't
connect it, then the only place you can define that is in the device tree.

Anyway, for meson I am fine with this solution. At least it prevents creating
a non-functioning cec device. So for this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Neil
> 
>>
>>> Jernej Skrabec (1):
>>>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
>>>     driver
>>>
>>> Neil Armstrong (1):
>>>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
>>>
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>>>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
>>>  include/drm/bridge/dw_hdmi.h              | 2 ++
>>>  3 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
