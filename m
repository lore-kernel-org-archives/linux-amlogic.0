Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F5AC43444
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 13:30:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0445520651
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 13:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGF9sMzK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L6aZMDkn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0445520651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=smHZmJLuTQ9s8tVPDykLZBFM+9t9SfofXu5RaO5kzBA=; b=UGF9sMzK8ekmq0dCjhSNSL+Y/
	0Frg76RBhFSkkh2qkys4JmX0CzkRMsoo4/RDN7sj516E6MjkWcE9RRSJtzlXgPcKXK0H6z9UBu5z5
	7M/+cMEOE6d2nStBkMl8G1JD7pyRs56+97q2js9ZA9yqU14iLh1t2YuT42uCv292D64k6MBw2kTGi
	dKQ9Ygz1Z5RH/lKqb+zaMtk6yOOvzuc5cn+Jm73UUc2UKxBuypZVHeYCzsMv6pOfqgmFfFc4h89pI
	upA3CtznAGUFcj0D0z9EBKA/guoq8fcZIFnQZEBmxH7lRK0ZWepqTBMWjCE83C27cqxfQ5Q9SaX+d
	jc1RqmwSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj2Jx-0000Tm-DQ; Mon, 14 Jan 2019 13:30:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj2Jt-0000Sx-O5
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 13:30:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id y139so8837146wmc.5
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 05:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=m+dqoUTZ553nDWQVkK+5miIXYXnjGts+7dZ1viX+uA0=;
 b=L6aZMDkn0eXQpSur/59udmyHKkaaqYwVzoCYf8j2+nP6g+CvW/03enBcLIM3yUGvP6
 azqss3Nh/1NvgSnfTRVq+l/zdWPpi4pimmTjWfZ26dVPWyHviJrLsma20gQoBhaF7eBl
 bs+yyQ5vTi8wGO89Rdpw4T7wNmAmCQez12XjPP0rgy6aAmqwpHMBAXYyj1GARHOHcIO/
 4+woaaNHLLMcGeB8rVn+QT59stAKLeqPPv2KVsUHelSKJPm8AeB6IDgBgd37D1LGKROf
 zjJBUBAcAurH6t4pccnNOYz0wnFBy8TsXDKFAx6SblfKjndg3cpqXpAd3pYvXBB3ndh/
 Tfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=m+dqoUTZ553nDWQVkK+5miIXYXnjGts+7dZ1viX+uA0=;
 b=eR7pxrLGzR2sOEudSi15KuMWKnIT7263idZwlviaqj/Q79lofDlYAZe0P1efqI7xBm
 EJsRbMdFbRJq0JCQVATHDXN9VL+D8uMtiHdbFqxKStsKyTeDVglFVR889gnLOqefnQhw
 MNgbYRukbrwzVQN7YeoeUZJzKC7AioLKvMn1ryc1c91g8DQWGCti7vYbk2eHqwZXNejH
 IIFRermWkV5dr930VID/VKrmkzbat2Df0hnITIkILQnN58cyeahgjOGIf5HWR5K9rLT3
 ubjIlEP2IuPqsxq7YwmyNDn0b/z7tlmwue937UcsseDxFspnQrCbCtjLuv2fwATBByr0
 Ln1A==
X-Gm-Message-State: AJcUukcETNFfumt1VJZTmdv/B/OEz9mCRmu81Hc/XZP1oKr3572Lhx+g
 mGCbOB90H1sGVSaDQerrLJ++E1e41PhwKqBha8c=
X-Google-Smtp-Source: ALg8bN4g7XhzTK3a7x2ZyBppxsQ2dbnyUnSPT2LvpdX3jVsV/BVKMSu4gDm2frVgSD2pvww/Boqx8g==
X-Received: by 2002:a1c:8b44:: with SMTP id n65mr12332007wmd.104.1547472623560; 
 Mon, 14 Jan 2019 05:30:23 -0800 (PST)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a1sm64329218wrw.76.2019.01.14.05.30.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Jan 2019 05:30:22 -0800 (PST)
References: <1547134822-18498-1-git-send-email-lollivier@baylibre.com>
 <CAFBinCDM4BTx0Ude-M=O6B2bXPE9EdfD=VxZfFzR9Dc=yT+xWQ@mail.gmail.com>
 <7hy37rm0j6.fsf@baylibre.com>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3] arm64: dts: meson: Fix mmc cd-gpios polarity
In-reply-to: <7hy37rm0j6.fsf@baylibre.com>
Date: Mon, 14 Jan 2019 14:30:20 +0100
Message-ID: <861s5fmknn.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_053025_848897_D5585686 
X-CRM114-Status: GOOD (  12.59  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Loys Ollivier <lollivier@baylibre.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hello,

On Fri 11 Jan 2019 at 19:55, Kevin Hilman wrote:

> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
>> Hi,
>>
>> some nit-picks as well as my Tested-by (in case it's not too late) below.
>> thank you for taking care of this!
>>
You're welcome !
>> On Thu, Jan 10, 2019 at 4:40 PM Loys Ollivier <lollivier@baylibre.com> 
>> wrote:
>>>
>>> Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
>>> changed the behavior of "cd-inverted" to follow the device tree bindings
>>> specification.
>>> Lines specifying "cd-inverted" are now "active high".
>> this depends on the polarity from the cd-gpios property. above commit
>> caused cd-inverted to be applied twice (effectively making it a
>> no-op). thus "cd-inverted" only means "active high" if cd-gpios also
>> sets GPIO_ACTIVE_HIGH. if the polarity in cd-gpios is GPIO_ACTIVE_LOW
>> together with "cd-inverted" then the GPIO will be treated as active
>> low.
>>
Hum ok so there's more to it than the commit message. I'll come by with
something clearer for a v4. Thank you for the clarification.
>>> Fix the SD card for meson by setting the cd-gpios as "active low" 
>>> according
>>> to the boards specifications.
>> not only switching to GPIO_ACTIVE_LOW, also dropping "cd-inverted"
>>
Indeed.
>>> Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
>> in my patches for the 32-bit boards I used the commit which added SD
>> card support to the board for the Fixes tag. however, I'm fine with
>> this as well (I just wanted to point out that there's a small
>> difference in our commits).
>>
OK, I treat fixes tags as:
from the introduction (or discovery) of a regression (or bug), the
"Fixes" commit will patch the commit that introduced the regression.
Hence why I tagged the commit from which the platform was not acting
correctly anymore. If that's fine for you it's fine for me as well :) 
>>> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> on my Khadas VIM(1), using Kevin's v5.0/fixes branch:
>> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> I can add this tested-by tag in my v5.0/fixes branch for now, and can
> replace it with a follow up if Loys can update the changelog with your
> suggestions/clarifications.
>
Will do.
> Thanks,
>
> Kevin


-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
