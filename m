Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A95C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 12:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B24FC20879
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 12:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y3UxSrgs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uZkhceZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B24FC20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vk2cv84I2zS2hCWYLhZdKh/DS8T2n9GN6N905EWxQ+8=; b=Y3UxSrgsFJ6Ej2IxcND+t0Gnd
	2JnwmamuMtbbbMdFKuigF/EnHA92oy9pJaw+J+Sn3pcV9wL3EAWE45Bafwk3Env9kN7T/UqjHRTzw
	k4SeAZe90aNMhNdA42318LGzk5GhOJVBrO1fIlLUqJD77s+1g0/3qPP4YbuJNvn1bViA/QLq/u9SM
	k13jczfhrBbB5x0lNbrcSKS6TNlxse8/JZU7YQKRSi2JB4907DYNkw5rvUamcDLnbasJ5o9lyZH4B
	YoRTp1YOckoFdJrGbD4KB6jWZdLCV6UxbE4bHF6DxEq2ZfD0xekjjfSJlxmHsNfzseX2pNHku6ZV9
	wW3fajcmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghZv1-0000Bv-Ti; Thu, 10 Jan 2019 12:58:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghZuy-0000AU-0u
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 12:58:42 +0000
Received: by mail-wr1-x441.google.com with SMTP id c14so11334433wrr.0
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 04:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Ghyg2fTNZ6AJK2z+KTbcv4WJQiMtAvnC4S83tmSQRP4=;
 b=uZkhceZfR2py7d6JlA3P0T64RdjXetk+fy7ZlrB/rXbQM1ZqBQslgfCLQDudjuyZIQ
 NzgwTpP32zvzf0WLV4rOKvjxVBOtNL/r90R2A8QMQq92fZCAMeRijpyu+xUh5Qfo4D0m
 SHtucDgiaiGLhMnmexlAvsHqfmORbsxOMsBu215v575BibZeuIIq8QDzZmZPjQ2XWfbn
 tvggYsbWc+98qiQ9alJ/h8qhSqxA2+ygUNcqFKYg24mb9BfoVPkkuNKO+KMjvGy5RK4F
 GK/LDtZozttRlbdiWmhw0swd1IngtGQdbKx/FJw2V9iEBsCwpvxiU9VR86Qc0NcEfDmY
 ViTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Ghyg2fTNZ6AJK2z+KTbcv4WJQiMtAvnC4S83tmSQRP4=;
 b=lrihzSVtKFCMlIeqtV+T7+ZFBQLegsM9Y5KvZct0Pf0TFZGoHwbWavxKI3FDUDMnFU
 6lBdBT9mN7loR612+6Aq3+f7To57qp2m9U4snldrd8e2As9cLjs5Qk0pu/xFWl4DtLq2
 GIq7Sj8NalJCki0dgc3m2d/v0QXg5kkoStaNBpp+tXCkExHGcnwTsfKbQkKS/R4yWUZ5
 u6EZRml/cugkOJsW7UelYCKlIcXw3GGPQBNyOy+DQqY8mXVc3KPxU/fTVtlaorRwAWhb
 Ulodw4OgR27V36wbUBRJd590nDL3Nw6aWbktglp2oZHhNqofriGGDDisA1ZWYRqbH5gi
 cdVA==
X-Gm-Message-State: AJcUukdrhS3KerPHVwLoYowuXqQkove7SWsG/kI/e9sRUDZoUY6TxVAv
 PVFRYBIWxfV7reAVs834o+/LQA==
X-Google-Smtp-Source: ALg8bN7ZvUqgP30iZI3R3hJE7O5uNU4561ChgR0QgZwSUBjUeUDw23zKFoy1+ebR3rzZufclLCwtsA==
X-Received: by 2002:adf:a58a:: with SMTP id g10mr9030831wrc.3.1547125118267;
 Thu, 10 Jan 2019 04:58:38 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:f5ef])
 by smtp.gmail.com with ESMTPSA id v16sm49800567wrs.75.2019.01.10.04.58.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 04:58:37 -0800 (PST)
References: <1547042198-17601-1-git-send-email-lollivier@baylibre.com>
 <CACRpkdbhVB7-Y9EBhBC6GAxqFt8zujS2QJ4CzGDJnDMDjj2Ptg@mail.gmail.com>
 <CAFBinCBf+yJu4z1JYNdH7B4h07-U_0ckysV_=nC65nd5ByOCvA@mail.gmail.com>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] arm64: dts: meson: Fix mmc cd-gpio polarity
In-reply-to: <CAFBinCBf+yJu4z1JYNdH7B4h07-U_0ckysV_=nC65nd5ByOCvA@mail.gmail.com>
Date: Thu, 10 Jan 2019 13:58:35 +0100
Message-ID: <861s5ku0sk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_045840_141273_5F5000D6 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Loys Ollivier <lollivier@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Wed 09 Jan 2019 at 22:14, Martin Blumenstingl wrote:

> Hi,
>
> On Wed, Jan 9, 2019 at 7:31 PM Linus Walleij <linus.walleij@linaro.org> 
> wrote:
>>
>> Hi Ollivier!
>>
>> On Wed, Jan 9, 2019 at 2:56 PM Loys Ollivier <lollivier@baylibre.com> 
>> wrote:
>>
>> > Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
>> > changed the behavior of "cd-inverted" to follow the device tree bindings
>> > specification.
>> > Lines specifying "cd-inverted" are now "acitve high".
> there's a typo in the description - it should be "active"
>
Thanks I'll fix it.
>> >
>> > Fix the SD card for meson by setting the cd-gpio as "active low" 
>> > according
>> > to the boards specifications.
>> >
>> > Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
>> > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> >
>> > v2: fix more occurences, also in other meson boards.
>>
>> This is a good change in itself since it gets rid of some occasions
>> of the dreaded "cd-inverted" property. I think Martin Blumenstingl
>> already sent patches like these though (I might be confused).
> I sent patches for the 32-bit Amlogic SoCs
> my TODO-list is now a bit longer, I'll test this series on my Khadas
> VIM, VIM2 and Libretech CC during the weekend
>
I have seen Martin's patch for the arm boards.
This adresses arm64 boards.
Tested on libretech-cc.

>> But we should keep the old device trees working as well.
>> Can you test if Martins patch:
>> https://marc.info/?l=linux-mmc&m=154637189021211&w=2
>>
>> Also makes your boards work?
> feedback on that patch is appreciated
>
Answered to the patch mail directly. Tested on libretech-cc, it works.
Fixing the meson boards DT for future release would still be valid imho.

>
> Regards
> Martin

Best,
Loys
-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
