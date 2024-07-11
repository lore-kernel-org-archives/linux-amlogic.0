Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16286C3DA47
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhO8Pv3ikMA/koO5CP1CYGU0VH/aN/mo3ZLz2j+g71E=; b=PF6q7TERyJU+Ed
	QadzIHlop/hAROInHxJeLfv5P+eOvfugGj1JQ8HGYScu148+dluZFN7WAf8rmZoZs56JSPVBZgyYr
	T6VlJe9JJZELNGzqr1r1BZeS2vxHwpM51QobxZ2SOJW/fteFOkchnj9rHCxfU6TnyQIDo0LEPUck9
	LP5xc7/XL85RoIl1/bSTHTdWkXIsJI8whloV5qKKT1frn3eEhdw7deEixVXh4zDl8ZReHOewE5T6O
	7oFsC68bX3XJIwM0iYQfYbfJs7BAjoBqMz0IMgU5aczp+oI5nZDc/MRYQhdwnBtCU9cAlco+dvPbo
	YfdYLQqoSwIsFWXIbm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpMX-0000000DENq-0HN1;
	Thu, 11 Jul 2024 08:41:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpMT-0000000DEN9-3ZKK
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 08:41:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52e9a920e73so673090e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jul 2024 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720687268; x=1721292068; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F4hJMe1Yb9yi4VSSBc6ZDJo7fdcuCbEK9DIjftRMu7s=;
        b=sUubCdhQuY3wME7geYDqp+5ORPQBi2HJUnM5F2/2GUFRWb2kChSepCc/7zjwAIi4j8
         iM4sPLg/B1D9x0+UrBP4X9JwEekjVv+baOOK/msJOyLCJKYVPrUQ89dEGuPjqlL8X2PX
         4sCIrYfxxkC1Lq0SIs3TCnNojcoR/FFdDBbJ3O4MmnsiC58p/5g+uvVNvtS2EBYnzufW
         o/Ipq+VgGCxkFrSbDTgKZnnS13wuGfuBH1ja8r6x2eiAEBZFmAy77hZodx8GW4hFJkyI
         snw+5z9rvMCeYv8nbqlDl/tRZIuncLF50cbD+YJsBDoirA+Hu/sn69I/Oh1ciIKYYbjD
         FI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687268; x=1721292068;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4hJMe1Yb9yi4VSSBc6ZDJo7fdcuCbEK9DIjftRMu7s=;
        b=QaE2WlQZOZOBnsH8/2BT/hitNUn3tu+VFnzK92xyDNk0mPUxurMD0NsgQsalbXakDB
         1EWmU9AEqaSYv8uLcVADKb20ckzSE1TIZK63Lpe8FwVHkvPlSoDVw046QNHTZFWHSe2J
         HjzGlwcR2h8BHFDvnLaIk/rhvGDe5Rd6p5zosBxvacB3BmA1rwc82FFDh6dDgISIMgFB
         bhed8zHXEWVGRqoLKqa2flkbz7//VojJDNYlUpjvergmsLg7389GABEUlrk74mvCYOxi
         a54NgkzYOVSHMd7+X+bOCRC7kKcg4CRNkePM7EZUUEAieTTTLRqaKTov40xuDPnPC/bH
         fAMA==
X-Forwarded-Encrypted: i=1; AJvYcCVFowGriGepJBtVouauSo4hckFUxVnMZM3agNgrTVQpGLEyRrWJGnsGk3/dvUL33+zJDp5hzU1D8XF1ONnxZ8ZKn8K2Oj+iL5h5vPu+YgPKdVI=
X-Gm-Message-State: AOJu0YzUKmVg1ylD/MJyOjI1OMz1tuNtK0Tie2p7rXiuKOPn6sLIMenp
	6fk9ctWznaoEzW5MoeGaWzx71WvijYXIKAA0dK3MGZBEODAFsqSJ7qoM2gp02nk=
X-Google-Smtp-Source: AGHT+IEJO/nqHAjigZAZduBXhYWRYVbv9hRi6m8XTEKnVPN3/RPTQHv6P0+rtwA6HcT8K1XGWUuONA==
X-Received: by 2002:ac2:5f6d:0:b0:52d:b182:9664 with SMTP id 2adb3069b0e04-52eb99d7698mr3637237e87.69.1720687267614;
        Thu, 11 Jul 2024 01:41:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a9e9:c71a:10d8:7f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427272c4371sm73269515e9.22.2024.07.11.01.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:41:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Jan Dakinevich
 <jan.dakinevich@salutedevices.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/8] reset: amlogic: add reset status support
In-Reply-To: <c34a2d1613da179a27123be95eaf4ddf.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 10 Jul 2024 15:40:16 -0700")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-6-jbrunet@baylibre.com>
	<c34a2d1613da179a27123be95eaf4ddf.sboyd@kernel.org>
Date: Thu, 11 Jul 2024 10:41:06 +0200
Message-ID: <1jzfqogw2l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_014109_910864_95F4AE9E 
X-CRM114-Status: GOOD (  14.99  )
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

On Wed 10 Jul 2024 at 15:40, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-07-10 09:25:14)
>> Add a callback to check the status of the level reset, as done in
>> the reset driver of the audio clock controller.
>
> Why? Presumably so that this driver has equivalent functionality to the
> reset code in the audio clk controller?

I thought the description was saying so. I'll be more explicit in v2

>
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index 3e0447366ba6..65ba9190cb53 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
>> @@ -69,6 +69,23 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>>                                   BIT(bit), assert ? BIT(bit) : 0);
>>  }
>>  
>> +static int meson_reset_status(struct reset_controller_dev *rcdev,
>> +                             unsigned long id)
>> +{
>> +       struct meson_reset *data =
>> +               container_of(rcdev, struct meson_reset, rcdev);
>
> Nitpick: One line.
>
>> +       unsigned int val, offset, bit;
>> +
>> +       meson_reset_offset_and_bit(data, id, &offset, &bit);
>> +       offset += data->param->level_offset;
>> +
>> +       regmap_read(data->map, offset, &val);
>> +       val = !!(BIT(bit) & val);
>> +
>> +
>
> Nitpick: Drop the extra newline?
>
>> +       return val ^ data->param->level_low_reset;
>> +}
>> +
>>  static int meson_reset_assert(struct reset_controller_dev *rcdev,
>>                               unsigned long id)

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
